
CREATE PROCEDURE [util].[EdFiReportPersistence] (
	@TeamCityBuildId int
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @ServerName nvarchar(255), @DatabaseName nvarchar(255)
	SELECT @ServerName = @@SERVERNAME, @DatabaseName = DB_NAME()

	IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'TSDS_LoadReport')
	BEGIN
		-----------------------------------
		-- Persist the data
		-----------------------------------

		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiException' AND TABLE_SCHEMA = 'edfi')
			INSERT INTO TSDS_LoadReport.util.EdFiExceptionHistory (ServerName, DatabaseName, TeamCityBuildId, EdFiExceptionId, TableName, ColumnNameList, ColumnValueList, ErrorMessage, IdentifierCondition, LookupCondition, ExceptionLevel, StartTime, PackageName, TaskName, ComponentName, ErrorCode, ErrorDescription, ErrorColumn, ErrorColumnName)
			SELECT @ServerName, @DatabaseName, @TeamCityBuildId, EdFiExceptionId, TableName, ColumnNameList, ColumnValueList, ErrorMessage, IdentifierCondition, LookupCondition, ExceptionLevel, StartTime, PackageName, TaskName, ComponentName, ErrorCode, ErrorDescription, ErrorColumn, ErrorColumnName
			FROM edfi.EdFiException WITH (NOLOCK)
		
		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiPopulation' AND TABLE_SCHEMA = 'util')
			INSERT INTO TSDS_LoadReport.util.EdFiPopulationHistory (ServerName, DatabaseName, TeamCityBuildId, EdFiPopulationId, TableSchema, TableName, RecordCount, PriorRecordCount, PercentChanged, MostRecentDate, PriorMostRecentDate, Comment)
			SELECT @ServerName, @DatabaseName, @TeamCityBuildId, EdFiPopulationId, TableSchema, TableName, RecordCount, PriorRecordCount, PercentChanged, MostRecentDate, PriorMostRecentDate, Comment
			FROM util.EdFiPopulation WITH (NOLOCK)
		
		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'QAResults' AND TABLE_SCHEMA = 'util')
			INSERT INTO TSDS_LoadReport.util.QAResultsHistory (ServerName, DatabaseName, TeamCityBuildId, QAResultsId, ScriptFileName, ScriptResult, NumberOfDiscrepancies, Comment, ResultFileName, CreateDateTime)
			SELECT @ServerName, @DatabaseName, @TeamCityBuildId, QAResultsId, ScriptFileName, ScriptResult, NumberOfDiscrepancies, Comment, ResultFileName, CreateDateTime
			FROM util.QAResults WITH (NOLOCK)

		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiSanity' AND TABLE_SCHEMA = 'util')
			INSERT INTO TSDS_LoadReport.util.EdFiSanityHistory (ServerName, DatabaseName, TeamCityBuildId, EdFiSanityId, BeginLine, EndLine, InterChangeName, ScriptResult, ExpectedResult, ActualResult, Description, Script, ParserCompletionFlag, ExecCompletionFlag)
			SELECT @ServerName, @DatabaseName, @TeamCityBuildId, EdFiSanityId, BeginLine, EndLine, InterChangeName, ScriptResult, ExpectedResult, ActualResult, Description, Script, ParserCompletionFlag, ExecCompletionFlag
			FROM util.EdFiSanity WITH (NOLOCK)

		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TeamCityStatistic' AND TABLE_SCHEMA = 'util')
			INSERT INTO TSDS_LoadReport.util.TeamCityStatisticHistory (ServerName, DatabaseName, TeamCityBuildId, TeamCityStatisticId, StatisticKey, StatisticValue)
			SELECT @ServerName, @DatabaseName, @TeamCityBuildId, TeamCityStatisticId, StatisticKey, StatisticValue
			FROM util.TeamCityStatistic WITH (NOLOCK)
	END

	SET NOCOUNT OFF

END
