
CREATE PROCEDURE [util].[EdFiExceptionEnhancement] (
	@TimeoutInSeconds int = 2147483647
) AS
BEGIN

	SET NOCOUNT ON

	DECLARE @SQL nvarchar(MAX), @ErrorMessage nvarchar(MAX)
	DECLARE @EdFiExceptionId int, @TableName nvarchar(255), @ComponentName nvarchar(255), @ColumnNameList nvarchar(4000), @ColumnValueList nvarchar(4000)
	DECLARE @LookupCondition nvarchar(4000)
	DECLARE @LookupUnionTag nvarchar(4000), @LookupConditionAND nvarchar(4000), @LookupConditionOR nvarchar(4000)
	DECLARE @StartTime datetime = GETDATE()
	DECLARE @LookupErrorCode int = -1071607778


	-----------------------------------
	-- Handle cases where the Destination component that writes to the EdFiException table is not mapped properly
	-----------------------------------

	-- If ErrorCode is not mapped in the Destination component, we will need to fix the package.
	-- In the meantime, deduce the ErrorCode from ErrorDescription if possible.
	UPDATE edfi.EdFiException
	SET ErrorCode = CASE WHEN ErrorDescription LIKE 'Row yielded no match during lookup%' THEN @LookupErrorCode ELSE 0 END
	WHERE ErrorCode IS NULL
	AND ErrorDescription IS NOT NULL

	UPDATE edfi.EdFiException
	SET ErrorMessage = 'At least one of these column is null: TableName, ColumnNameList, ColumnValueList, and ErrorCode. Please check the Destination component that writes to the edfi.EdFiException table.'
	WHERE ErrorCode IS NULL
	OR TableName + ColumnNameList + ColumnValueList IS NULL


	-----------------------------------
	-- Lookup exceptions
	-----------------------------------
	
	-- Hardcode ErrorMessage for lookup exceptions
	UPDATE edfi.EdFiException
	SET ErrorMessage = 'No match during lookup'
	WHERE ErrorCode = @LookupErrorCode

	-- Replace ExceptionLevel for lookup for Staff and Student
	UPDATE edfi.EdFiException
	SET ExceptionLevel = 'EntityNotFound'
	WHERE TableName IN ('edfi.Staff', 'edfi.Student')
	AND ErrorCode = @LookupErrorCode


	-----------------------------------
	-- Run insert statements to capture error messages for non Lookup exceptions
	-----------------------------------

	DECLARE @EdFiExceptionTable TABLE (
		EdFiExceptionId			int,
		TableName				nvarchar(255),
		ColumnNameList			nvarchar(4000),
		ColumnValueList			nvarchar(4000)
	)

	INSERT INTO @EdFiExceptionTable
	SELECT EdFiExceptionId, TableName, ColumnNameList, ColumnValueList
	FROM edfi.EdFiException
	WHERE ErrorCode <> @LookupErrorCode
	AND ErrorMessage IS NULL

	WHILE EXISTS (SELECT 1 FROM @EdFiExceptionTable) AND DATEDIFF(SECOND, @StartTime, GETDATE()) < @TimeoutInSeconds
	BEGIN
		SELECT TOP 1 
			@EdFiExceptionId = EdFiExceptionId,
			@TableName = TableName,
			@ColumnNameList = ColumnNameList,
			@ColumnValueList = ColumnValueList
		FROM @EdFiExceptionTable

		SELECT @SQL = 'INSERT INTO ' + @TableName + '(' + @ColumnNameList + ') SELECT ' + @ColumnValueList

		-----------------------------------
		-- Run the insert statement in a TRY block to trap the error. Roll back if it goes through.
		-----------------------------------
		BEGIN TRANSACTION
		BEGIN TRY
			SELECT @ErrorMessage = 'No Error'
			EXEC sp_executesql @SQL
		END TRY
		BEGIN CATCH
			SELECT @ErrorMessage = ERROR_MESSAGE()
		END CATCH
		ROLLBACK


		-----------------------------------
		-- Remove row-specific information so that ErrorMessage remains generic
		-----------------------------------
		IF @ErrorMessage LIKE '%The duplicate key value is%'
			SELECT @ErrorMessage = RTRIM(LEFT(@ErrorMessage, CHARINDEX(' The duplicate key value is', @ErrorMessage)))

		IF @ErrorMessage LIKE '%The conversion of the varchar value % overflowed an int column%'
			SELECT @ErrorMessage = 'The conversion of the varchar value overflowed an int column'


		-----------------------------------
		-- final
		-----------------------------------
		UPDATE edfi.EdFiException
		SET ErrorMessage = @ErrorMessage
		WHERE EdFiExceptionId = @EdFiExceptionId
		
		DELETE @EdFiExceptionTable
		WHERE EdFiExceptionId = @EdFiExceptionId
	END
	

	-----------------------------------
	-- Populate LookupCondition from ColumnNameList and ColumnValueList for Lookup exceptions
	-----------------------------------

	UPDATE edfi.EdFiException
	SET LookupCondition = ColumnNameList + CASE ColumnValueList WHEN 'NULL' THEN ' IS ' ELSE '=' END  + ColumnValueList
	WHERE ErrorCode = @LookupErrorCode
	AND ColumnNameList NOT LIKE '%,%'

	DECLARE @LookupExceptionTable TABLE (
		EdFiExceptionId			int,
		ComponentName			nvarchar(255),
		ColumnNameList			nvarchar(4000),
		ColumnValueList			nvarchar(4000)
	)

	INSERT INTO @LookupExceptionTable
	SELECT EdFiExceptionId, ComponentName, ColumnNameList, ColumnValueList
	FROM edfi.EdFiException
	WHERE ErrorCode = @LookupErrorCode
	AND LookupCondition IS NULL

	DECLARE @LookupConditionClause TABLE(ColumnName nvarchar(255), ConditionClause nvarchar(4000))

	WHILE EXISTS (SELECT 1 FROM @LookupExceptionTable) AND DATEDIFF(SECOND, @StartTime, GETDATE()) < @TimeoutInSeconds
	BEGIN
		SELECT TOP 1 
			@EdFiExceptionId = EdFiExceptionId,
			@ComponentName = ComponentName,
			@ColumnNameList = ColumnNameList,
			@ColumnValueList = ColumnValueList,
			@LookupCondition = '',
			@LookupUnionTag = '',
			@LookupConditionAND = '',
			@LookupConditionOR = ''
		FROM @LookupExceptionTable
		
		DELETE @LookupConditionClause
		INSERT INTO @LookupConditionClause(ColumnName, ConditionClause)
		SELECT a.ColumnName, a.ColumnName + CASE b.ColumnValue WHEN 'NULL' THEN ' IS ' ELSE '=' END + b.ColumnValue as ConditionClause
		FROM 
			(SELECT Id, Token as ColumnName FROM util.Split((SELECT ColumnNameList FROM edfi.EdFiException WHERE EdFiExceptionId = @EdFiExceptionId), ',')) a INNER JOIN
			(SELECT Id, Token as ColumnValue FROM util.Split((SELECT ColumnValueList FROM edfi.EdFiException WHERE EdFiExceptionId = @EdFiExceptionId), ',')) b
				ON a.Id = b.Id

		IF @ComponentName NOT LIKE '%@LookupUnion%'
		BEGIN
			SELECT @LookupCondition = @LookupCondition + ConditionClause + ' AND '
			FROM @LookupConditionClause

			SELECT @LookupCondition = LEFT(@LookupCondition, NULLIF(LEN(@LookupCondition), 0) - 4)		-- remove trailing AND
		END
		ELSE BEGIN
			SELECT @LookupUnionTag = (SELECT TOP 1 Token FROM util.Split(@ComponentName, ' ') WHERE Token LIKE '%@LookupUnion%')			

			SELECT 
				@LookupConditionOR  = @LookupConditionOR  + CASE WHEN b.ColumnName IS NULL THEN + a.ConditionClause + ' OR ' ELSE '' END,
				@LookupConditionAND = @LookupConditionAND + CASE WHEN b.ColumnName IS NOT NULL THEN + a.ConditionClause + ' AND ' ELSE '' END
			FROM 
				@LookupConditionClause a LEFT OUTER JOIN
				(SELECT Token as ColumnName FROM util.Split(@LookupUnionTag, '-') WHERE Token <> '@LookupUnion') b
					ON a.ColumnName = b.ColumnName

			SELECT @LookupConditionOR  = LEFT(@LookupConditionOR,  NULLIF(LEN(@LookupConditionOR), 0)  - 3)		-- remove trailing OR
			SELECT @LookupConditionAND = LEFT(@LookupConditionAND, NULLIF(LEN(@LookupConditionAND), 0) - 4)		-- remove trailing AND
			SELECT @LookupCondition = ISNULL(@LookupConditionAND + ' AND ', '') + ISNULL(NULLIF('(' + @LookupConditionOR + ')', '()'), '')

		END

		UPDATE edfi.EdFiException
		SET LookupCondition = ISNULL(@LookupCondition, '')
		WHERE EdFiExceptionId = @EdFiExceptionId
		
		DELETE @LookupExceptionTable
		WHERE EdFiExceptionId = @EdFiExceptionId
	END
	
	UPDATE edfi.EdFiException
	SET LookupCondition = ''
	WHERE LookupCondition IS NULL
	
	SET NOCOUNT OFF
END
