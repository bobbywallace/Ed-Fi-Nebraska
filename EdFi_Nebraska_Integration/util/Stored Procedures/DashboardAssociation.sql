
CREATE PROCEDURE [util].[DashboardAssociation] (
	@AssociationFlag bit = 1
) AS
BEGIN

	SET NOCOUNT ON

	-----------------------------------
	-- Prep steps
	-----------------------------------

	DECLARE @DashboardDatabaseName nvarchar(255)
	DECLARE @DashboardSchemaTableId int, @TableSchema nvarchar(255), @TableName nvarchar(255)
	DECLARE @SQLCommand nvarchar(4000)

	TRUNCATE TABLE util.DashboardSchemaTable

	SELECT @DashboardDatabaseName = REPLACE(DB_NAME(), 'EdFi', 'Dashboard')

	-----------------------------------
	-- Create synonym for tables in the DashboardIntegration database
	-----------------------------------

	IF EXISTS (SELECT 1 FROM sys.databases WHERE name = @DashboardDatabaseName) AND @AssociationFlag = 1
	BEGIN
		IF SCHEMA_ID('domain') IS NULL
			EXEC ('CREATE SCHEMA domain authorization dbo')

		IF SCHEMA_ID('metric') IS NULL
			EXEC ('CREATE SCHEMA metric authorization dbo')

		SELECT @SQLCommand = 'INSERT INTO util.DashboardSchemaTable(TableSchema, TableName) ' +
		'SELECT TABLE_SCHEMA, TABLE_NAME ' +
		'FROM ' + @DashboardDatabaseName + '.INFORMATION_SCHEMA.TABLES ' +
		'WHERE TABLE_SCHEMA IN (''domain'', ''metric'') ' +
		'AND TABLE_TYPE = ''BASE TABLE'''
		EXEC sp_executesql @SQLCommand

		WHILE EXISTS (SELECT 1 FROM util.DashboardSchemaTable)
		BEGIN
			SELECT 
				@DashboardSchemaTableId = DashboardSchemaTableId,
				@TableSchema = TableSchema,
				@TableName = TableName
			FROM util.DashboardSchemaTable
			ORDER BY DashboardSchemaTableId
			
			SELECT @SQLCommand = 'IF OBJECT_ID(''[' + @TableSchema + '].[' + @TableName + ']'', ''SN'') IS NOT NULL DROP SYNONYM [' + @TableSchema + '].[' + @TableName + ']'
			EXEC sp_executesql @SQLCommand

			SELECT @SQLCommand = 'CREATE SYNONYM [' + @TableSchema + '].[' + @TableName + '] FOR ' + @DashboardDatabaseName + '.[' + @TableSchema + '].[' + @TableName + ']'
			IF @DashboardDatabaseName <> DB_NAME()
				EXEC sp_executesql @SQLCommand
			
			DELETE util.DashboardSchemaTable
			WHERE DashboardSchemaTableId = @DashboardSchemaTableId
		END
	END


	-----------------------------------
	-- Drop synonym for tables in the DashboardIntegration database
	-----------------------------------

	ELSE BEGIN

		INSERT INTO util.DashboardSchemaTable(TableSchema, TableName)
		SELECT SCHEMA_NAME(schema_id), [name]
		FROM sys.all_objects
		WHERE type = 'sn'
		AND SCHEMA_NAME(schema_id) IN ('domain', 'metric')		

		WHILE EXISTS (SELECT 1 FROM util.DashboardSchemaTable)
		BEGIN
			SELECT 
				@DashboardSchemaTableId = DashboardSchemaTableId,
				@TableSchema = TableSchema,
				@TableName = TableName
			FROM util.DashboardSchemaTable
			ORDER BY DashboardSchemaTableId
			
			SELECT @SQLCommand = 'IF OBJECT_ID(''[' + @TableSchema + '].[' + @TableName + ']'', ''SN'') IS NOT NULL DROP SYNONYM [' + @TableSchema + '].[' + @TableName + ']'
			EXEC sp_executesql @SQLCommand
			
			DELETE util.DashboardSchemaTable
			WHERE DashboardSchemaTableId = @DashboardSchemaTableId
		END

		IF SCHEMA_ID('domain') IS NOT NULL
		BEGIN TRY
			EXEC ('DROP SCHEMA domain')
		END TRY
		BEGIN CATCH
			-- Ignore error
		END CATCH

		IF SCHEMA_ID('metric') IS NOT NULL
		BEGIN TRY
			EXEC ('DROP SCHEMA metric')
		END TRY
		BEGIN CATCH
			-- Ignore error
		END CATCH
	END
	
	SET NOCOUNT OFF

END
