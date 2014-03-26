
CREATE PROCEDURE [util].[EdFiSanityCheck] (
	@EdFiSanityScript nvarchar(max) 
) AS
BEGIN

	SET NOCOUNT ON

	-----------------------------------
	-- Prep steps
	-----------------------------------

	EXEC util.DashboardAssociation

	DECLARE @SQLCommand nvarchar(4000)
	DECLARE @FileContent TABLE (FileContentId int identity(1, 1) primary key, Content nvarchar(MAX))
	DECLARE @EdFiSanityId int, @EndLine int, @InterChangeName nvarchar(255), @ExpectedResult nvarchar(255), @Description nvarchar(MAX), @Script nvarchar(MAX)
	DECLARE @Operator char(2), @ExpectedNumber float
	DECLARE @ActualResult TABLE (ActualResult nvarchar(MAX))

	TRUNCATE TABLE util.EdFiSanity
	
	-----------------------------------
	-- Import the script file to a table
	-----------------------------------

	INSERT INTO @FileContent(Content)
	SELECT REPLACE(Token, CHAR(13), '')
	FROM util.Split(@EdFiSanityScript, CHAR(10))
	ORDER BY Id	
				
	IF (SELECT COUNT(1) FROM @FileContent WHERE LEN(LTRIM(RTRIM(Content))) > 0) = 0
	BEGIN
		INSERT INTO util.EdFiSanity
		SELECT 0, 0, '', 'Failed', 'Make sure that the EdFiSanity.txt file exists', '', '', '', '', NULL, 1, 1
	END


	INSERT INTO util.EdFiSanity(BeginLine)
	SELECT FileContentId
	FROM @FileContent
	WHERE Content LIKE '--%Interchange:%'

	UPDATE a
	SET EndLine = ISNULL(b.BeginLine - 1, (SELECT MAX(FileContentId) FROM @FileContent))
	FROM 
		util.EdFiSanity a LEFT OUTER JOIN
		util.EdFiSanity b
			ON a.EdFiSanityId = b.EdFiSanityId - 1

	
	-----------------------------------
	-- Parse the script file
	-----------------------------------

	WHILE EXISTS (SELECT 1 FROM util.EdFiSanity WHERE ParserCompletionFlag = 0)
	BEGIN
		SELECT 
			@EdFiSanityId = EdFiSanityId,
			@EndLine = -1,
			@InterChangeName = '',
			@ExpectedResult = '',
			@Description = '',
			@Script = '',
			@Operator = '',
			@ExpectedNumber = NULL
		FROM util.EdFiSanity 
		WHERE ParserCompletionFlag = 0
		ORDER BY EdFiSanityId
		
		SELECT 
			@InterChangeName	= MAX(LTRIM(RTRIM(REPLACE(CASE WHEN b.Content LIKE '-- Interchange:%' THEN b.Content END, '-- Interchange:', '')))),
			@ExpectedResult		= MAX(LTRIM(RTRIM(REPLACE(CASE WHEN b.Content LIKE '-- ExpectedResult:%' THEN b.Content END, '-- ExpectedResult:', '')))),
			@Description		= MAX(LTRIM(RTRIM(REPLACE(CASE WHEN b.Content LIKE '-- Description:%' THEN b.Content END, '-- Description:', ''))))
		FROM 
			util.EdFiSanity a INNER JOIN
			@FileContent b
				ON b.FileContentId BETWEEN a.BeginLine AND a.EndLine
		WHERE a.EdFiSanityId = @EdFiSanityId
		GROUP BY a.EdFiSanityId

		SELECT @Script = @Script + ' ' + ISNULL(b.Content, '')
		FROM 
			util.EdFiSanity a INNER JOIN
			@FileContent b
				ON b.FileContentId BETWEEN a.BeginLine AND a.EndLine
		WHERE b.Content NOT LIKE '%--%'
		AND a.EdFiSanityId = @EdFiSanityId

		-- @ExpectedNumber will remain NULL if the expected result is not number
		BEGIN TRY
			IF LEFT(LTRIM(@ExpectedResult), 1) IN ('<', '>')
				SELECT @ExpectedNumber = CAST(REPLACE(REPLACE(REPLACE(@ExpectedResult, '<', ''), '>', ''), '=', '') as float)
		END TRY
		BEGIN CATCH
		END CATCH

		UPDATE util.EdFiSanity
		SET	
			ParserCompletionFlag = 1,
			InterChangeName = @InterChangeName,
			ExpectedResult = @ExpectedResult,
			[Description] = @Description,
			Script = @Script,
			ExpectedNumber = @ExpectedNumber,
			Operator = REPLACE(REPLACE(@ExpectedResult, CAST(@ExpectedNumber as varchar), ''), ' ', '')
		WHERE EdFiSanityId = @EdFiSanityId

	END



	-----------------------------------
	-- Loop through the EdFiSanity and execute the query
	-----------------------------------

	WHILE EXISTS (SELECT 1 FROM util.EdFiSanity WHERE ExecCompletionFlag = 0)
	BEGIN
		SELECT 
			@EdFiSanityId = EdFiSanityId,
			@Script = Script
		FROM util.EdFiSanity 
		WHERE ExecCompletionFlag = 0
		ORDER BY EdFiSanityId
		
		DELETE @ActualResult

		BEGIN TRY
			INSERT INTO @ActualResult(ActualResult)
			EXEC sp_executesql @Script
		END TRY
		BEGIN CATCH
			INSERT INTO @ActualResult(ActualResult)
			SELECT 'Error: ' + ERROR_MESSAGE()
		END CATCH

		UPDATE util.EdFiSanity
		SET 
			ExecCompletionFlag = 1,
			ActualResult = (SELECT MAX(ActualResult) FROM @ActualResult)
		WHERE EdFiSanityId = @EdFiSanityId

	END



	-----------------------------------
	-- Evaluation (Passed/Failed)
	-----------------------------------

	-- Evaluation for numeric results
	UPDATE util.EdFiSanity
	SET ScriptResult =
		CASE Operator
			WHEN '>'  THEN CASE WHEN CAST(ActualResult as float) >  ExpectedNumber THEN 'Passed' ELSE 'Failed' END
			WHEN '<'  THEN CASE WHEN CAST(ActualResult as float) <  ExpectedNumber THEN 'Passed' ELSE 'Failed' END
			WHEN '>=' THEN CASE WHEN CAST(ActualResult as float) >= ExpectedNumber THEN 'Passed' ELSE 'Failed' END
			WHEN '<=' THEN CASE WHEN CAST(ActualResult as float) <= ExpectedNumber THEN 'Passed' ELSE 'Failed' END
		END
	WHERE ExpectedNumber IS NOT NULL

	-- Evaluation for empty results	
	UPDATE util.EdFiSanity
	SET ScriptResult = CASE WHEN ActualResult = '' THEN 'Passed' ELSE 'Failed' END
	FROM util.EdFiSanity
	WHERE ExpectedResult IN ('<empty>', '')

	-- This evaluates everything else
	UPDATE util.EdFiSanity
	SET ScriptResult = CASE WHEN ActualResult = ExpectedResult THEN 'Passed' ELSE 'Failed' END
	FROM util.EdFiSanity
	WHERE ScriptResult IS NULL


	-- Remove synonym to objects in the Dashboard database
	EXEC util.DashboardAssociation 0		

	SET NOCOUNT OFF

END
