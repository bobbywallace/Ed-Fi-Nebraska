
CREATE PROCEDURE [util].[EdFiPopulationAnalysis] (
	@IntegrationTempKeyword nvarchar(255) = 'Temp',
	@StagingKeyword nvarchar(255) = ''
)
AS
BEGIN

	SET NOCOUNT ON

	-----------------------------------
	-- Prep steps
	-----------------------------------

	DECLARE @EdFiPopulationId int
	DECLARE @SQLCommand nvarchar(4000), @RecordCount int, @MostRecentDate date
	DECLARE @PriorSQLCommand nvarchar(4000), @PriorRecordCount int, @PriorMostRecentDate date
	DECLARE @PriorDatabaseName nvarchar(255)
	DECLARE @EdFiPopulation TABLE (EdFiPopulationId int primary key, TableSchema nvarchar(255), TableName nvarchar(255))
	
	SELECT @PriorDatabaseName = REPLACE(DB_NAME(), @IntegrationTempKeyword, @StagingKeyword)
	IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = @PriorDatabaseName)
		SELECT @PriorDatabaseName = DB_NAME()
	
	TRUNCATE TABLE util.EdFiPopulation
	
	IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'StudentSectionAttendanceEvent')
		SELECT 
			@SQLCommand		 = 'SELECT @MostRecentDate = MAX(EventDate) FROM edfi.StudentSectionAttendanceEvent WITH (NOLOCK)',
			@PriorSQLCommand = 'SELECT @PriorMostRecentDate = MAX(EventDate) FROM [' + @PriorDatabaseName + '].edfi.StudentSectionAttendanceEvent WITH (NOLOCK)'
	ELSE
		SELECT 
			@SQLCommand		 = 'SELECT @MostRecentDate = MAX(EventDate) FROM edfi.AttendanceEvent WITH (NOLOCK)',
			@PriorSQLCommand = 'SELECT @PriorMostRecentDate = MAX(EventDate) FROM [' + @PriorDatabaseName + '].edfi.AttendanceEvent WITH (NOLOCK)'
	
	EXEC sp_executesql @SQLCommand, N'@MostRecentDate date output',  @MostRecentDate output
	EXEC sp_executesql @PriorSQLCommand, N'@PriorMostRecentDate date output', @PriorMostRecentDate output

	INSERT INTO util.EdFiPopulation(TableSchema, TableName, MostRecentDate, PriorMostRecentDate, DatabaseName, PriorDatabaseName)
	SELECT TABLE_SCHEMA, TABLE_NAME, @MostRecentDate, @PriorMostRecentDate, DB_NAME(), @PriorDatabaseName
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME NOT LIKE '%Type'
	AND TABLE_NAME NOT IN ('EdFiException', 'sysssislog')
	AND TABLE_TYPE = 'BASE TABLE'
	AND TABLE_SCHEMA = 'edfi'
	ORDER BY TABLE_NAME

	INSERT INTO @EdFiPopulation
	SELECT EdFiPopulationId, TableSchema, TableName 
	FROM util.EdFiPopulation


	-----------------------------------
	-- Loop through each table and select count(1)
	-----------------------------------

	WHILE EXISTS (SELECT 1 FROM @EdFiPopulation)
	BEGIN
		SELECT TOP 1 
			@EdFiPopulationId = EdFiPopulationId,
			@SQLCommand = 'SELECT @RecordCount = COUNT(1) FROM [' + TableSchema + '].[' + TableName + '] WITH (NOLOCK)',
			@PriorSQLCommand	= 'SELECT @PriorRecordCount = COUNT(1) FROM [' + @PriorDatabaseName + '].[' + TableSchema + '].[' + TableName + '] WITH (NOLOCK)',
			@RecordCount = 0,
			@PriorRecordCount = 0
		FROM @EdFiPopulation
		ORDER BY EdFiPopulationId

		BEGIN TRY
		EXEC sp_executesql @SQLCommand, N'@RecordCount int output',  @RecordCount output
		EXEC sp_executesql @PriorSQLCommand, N'@PriorRecordCount int output',  @PriorRecordCount output
		END TRY
		BEGIN CATCH
			-- Ignore error
		END CATCH
		
		UPDATE util.EdFiPopulation
		SET 
			RecordCount = @RecordCount,
			PriorRecordCount = @PriorRecordCount
		WHERE EdFiPopulationId = @EdFiPopulationId
		
		DELETE @EdFiPopulation
		WHERE EdFiPopulationId = @EdFiPopulationId
	END


	-----------------------------------
	-- Add summary to Comment
	-----------------------------------

	UPDATE util.EdFiPopulation
	SET PercentChanged = CAST(ISNULL((RecordCount - PriorRecordCount)*100.00/NULLIF(PriorRecordCount, 0), 0) as decimal(10,2))

	UPDATE util.EdFiPopulation
	SET Comment = 
		CASE
			WHEN PriorRecordCount = 0 AND RecordCount = 0 THEN '8 - No data'
			WHEN PriorRecordCount = 0 AND RecordCount > 0 THEN '4 - No prior data'
			WHEN PriorRecordCount > 0 AND RecordCount = 0 THEN '3 - No current data'
			WHEN RecordCount = PriorRecordCount AND RecordCount <> 0 THEN '7 - No change'		
			WHEN PercentChanged < -10 THEN '1 - Decreased by more than 10%'	
			WHEN PercentChanged BETWEEN -10 AND 0 THEN '5 - Decreased'		
			WHEN PercentChanged BETWEEN 0 AND 10 THEN '6 - Increased'
			WHEN PercentChanged > 10 THEN '2 - Increased by more than 10%'
			ELSE '0 - Unknown'
		END

	SET NOCOUNT OFF

END
