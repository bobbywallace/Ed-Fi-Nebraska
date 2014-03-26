
-- OutputOption: EdFiException, EdFiPopulation, EdFiSanityCheck, TeamCityStatistic
CREATE PROCEDURE [util].[TeamCityIntegration] (
	@OutputOption nvarchar(255)
)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @OutputTable TABLE (
		OutputId		int identity(1,1) primary key,
		OutputOption	nvarchar(255) not null,
		OutputIndex		nvarchar(3) default '', 
		OutputText		nvarchar(MAX)
	)

	-----------------------------------
	-- Export the main report and top 100 records for each EdFiException group
	-----------------------------------

	IF @OutputOption = 'EdFiException'
	BEGIN
		DELETE @OutputTable

		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiException' AND TABLE_SCHEMA = 'edfi')
		BEGIN
			DECLARE @EdFiExceptionTable TABLE (
				EdFiExceptionTableId	int identity(1,1) primary key,
				ExceptionLevel			nvarchar(20), 
				ErrorMessage			nvarchar(MAX), 
				TableName				nvarchar(255), 
				PackageName				nvarchar(255),
				RecordCount				int,
				CompletionFlag			bit
			)
			
			INSERT INTO @EdFiExceptionTable
			SELECT ExceptionLevel, ErrorMessage, TableName, PackageName, COUNT(1) as RecordCount, 0 as CompletionFlag
			FROM edfi.EdFiException WITH (NOLOCK)
			GROUP BY ExceptionLevel, ErrorMessage, TableName, PackageName
			ORDER BY MIN(StartTime)

			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '<html><body>'
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '<h3>EdFiException Summary</h3><table border="1" cellpadding="3" cellspacing="0"><tr><th>Package Name</th><th>Table Name</th><th>Exception Level</th><th>Error Message</th><th>Record Count</th></tr>'

			INSERT INTO @OutputTable(OutputOption, OutputText)
			SELECT @OutputOption, '<tr>' +
				'<td>' + ISNULL(PackageName, 'Unknown') + '</td>' +
				'<td>' + ISNULL(TableName, 'Unknown') + '</td>' +
				'<td>' + ISNULL(ExceptionLevel, 'Unknown') + '</td>' +
				'<td><a href = "EdFiException' + CAST(EdFiExceptionTableId as nvarchar) + '.html">' + ISNULL(ErrorMessage, 'Unknown') + '</a></td>' +
				'<td align="right">' + REPLACE(CONVERT(nvarchar, CAST(RecordCount as money), 1), '.00', '') + '</td>' +
				'</tr>'
			FROM @EdFiExceptionTable
			ORDER BY ExceptionLevel, RecordCount DESC

			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '</table><br/><br/><br/>'
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '</body></html>'


			DECLARE @EdFiExceptionTableId int, @ExceptionLevel nvarchar(20), @ErrorMessage nvarchar(MAX), @TableName nvarchar(255), @PackageName nvarchar(255), @RecordCount int
			WHILE EXISTS (SELECT 1 FROM @EdFiExceptionTable WHERE CompletionFlag = 0)
			BEGIN
				SELECT
					@EdFiExceptionTableId = EdFiExceptionTableId,
					@ExceptionLevel = ISNULL(ExceptionLevel, 'Unknown'),
					@ErrorMessage = ISNULL(ErrorMessage, 'Unknown'),
					@TableName = ISNULL(TableName, 'Unknown'),
					@PackageName = ISNULL(PackageName, 'Unknown'),
					@RecordCount = RecordCount
				FROM @EdFiExceptionTable
				WHERE CompletionFlag = 0
				ORDER BY EdFiExceptionTableId
				
				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText) SELECT @OutputOption, @EdFiExceptionTableId, '<html><body>'
				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText) SELECT @OutputOption, @EdFiExceptionTableId, '<h3>EdFiException Sample' + CASE WHEN @RecordCount > 100 THEN ' (top 100 records)' ELSE '' END + '</h3>'			
				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText) SELECT @OutputOption, @EdFiExceptionTableId, '<b>ErrorMessage:</b> ' + @ErrorMessage + '<br>'
				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText) SELECT @OutputOption, @EdFiExceptionTableId, '<b>TableName:</b> ' + @TableName + '<br>'
				
				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText)
				SELECT TOP 1 @OutputOption, @EdFiExceptionTableId, '<b>ColumnNameList:</b> ' + ISNULL(ColumnNameList, 'Unknown') + '<br><br>'
				FROM edfi.EdFiException WITH (NOLOCK)
				WHERE ExceptionLevel = @ExceptionLevel
				AND ErrorMessage = @ErrorMessage
				AND TableName = @TableName
				AND PackageName = @PackageName

				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText) SELECT @OutputOption, @EdFiExceptionTableId, '<table border="1" cellpadding="3" cellspacing="0"><tr><th>ColumnValueList</th><th>IdentifierCondition</th><th>LookupCondition</th></tr>'

				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText)
				SELECT TOP 100 @OutputOption, @EdFiExceptionTableId, '<tr>' +
					'<td>' + ISNULL(ColumnValueList, 'Unknown') + '</td>' +
					'<td>' + ISNULL(NULLIF(IdentifierCondition, ''), '&nbsp;') + '</td>' +
					'<td>' + ISNULL(NULLIF(LookupCondition, ''), '&nbsp;') + '</td>' +
					'</tr>'
				FROM edfi.EdFiException WITH (NOLOCK)
				WHERE ExceptionLevel = @ExceptionLevel
				AND ErrorMessage = @ErrorMessage
				AND TableName = @TableName
				AND PackageName = @PackageName

				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText) SELECT @OutputOption, @EdFiExceptionTableId, '</table>'
				INSERT INTO @OutputTable(OutputOption, OutputIndex, OutputText) SELECT @OutputOption, @EdFiExceptionTableId, '</body></html>'
			
				UPDATE @EdFiExceptionTable 
				SET CompletionFlag = 1
				WHERE EdFiExceptionTableId = @EdFiExceptionTableId
			END
		END		
	END


	-----------------------------------
	-- Reports for EdFiPopulation
	-----------------------------------

	IF @OutputOption = 'EdFiPopulation'	
	BEGIN
		DELETE @OutputTable

		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiPopulation' AND TABLE_SCHEMA = 'util')
		BEGIN
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '<html><body>'
			
			INSERT INTO @OutputTable(OutputOption, OutputText)
			SELECT @OutputOption, '<table border="1" cellpadding="3" cellspacing="0">' + 
				'<tr><th>Environment</th><th>Database Name</th><th>Max Attendance Date</th></tr>' +
				'<tr><td>New Build</td><td>' + ISNULL((SELECT TOP 1 DatabaseName FROM util.EdFiPopulation), 'Unknown') + '</td><td>' + ISNULL(CAST((SELECT TOP 1 MostRecentDate FROM util.EdFiPopulation WITH (NOLOCK)) as varchar), 'Unknown') + '</td></tr>' +
				'<tr><td>Referenced Build</td><td>' + ISNULL((SELECT TOP 1 PriorDatabaseName FROM util.EdFiPopulation), 'Unknown') + '</td><td>' + ISNULL(CAST((SELECT TOP 1 PriorMostRecentDate FROM util.EdFiPopulation WITH (NOLOCK)) as varchar), 'Unknown') + '</td></tr>' +
				'</table><br>'

			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '<h3>EdFi Population Summary</h3><table border="1" cellpadding="3" cellspacing="0"><tr><th>Schema</th><th>Table Name</th><th>Record Count</th><th>Prior Count</th><th>Percent Changed</th><th>Comment</th></tr>'

			INSERT INTO @OutputTable(OutputOption, OutputText)
			SELECT @OutputOption, '<tr>' +
				'<td>' + TableSchema + '</td>' +
				'<td>' + TableName + '</td>' +
				'<td align="right">' + REPLACE(CONVERT(nvarchar, CAST(RecordCount as money), 1), '.00', '') + '</td>' +
				'<td align="right">' + REPLACE(CONVERT(nvarchar, CAST(PriorRecordCount as money), 1), '.00', '') + '</td>' +
				'<td align="right">' + CAST(PercentChanged as varchar) + '%</td>' +
				'<td>' + CASE WHEN LEFT(Comment, 1) IN (1, 2) THEN '<font color="red">' + Comment + '</font>' ELSE Comment END + '</td>' +
				'</tr>'
			FROM util.EdFiPopulation WITH (NOLOCK)
			ORDER BY Comment, TableSchema, TableName
			
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '</table><br/><br/><br/>'
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '</body></html>'
		END
	END


	-----------------------------------
	-- Reports for EdFiSanityCheck
	-----------------------------------

	IF @OutputOption = 'EdFiSanityCheck'
	BEGIN
		DELETE @OutputTable
		
		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiSanity' AND TABLE_SCHEMA = 'util')
		BEGIN
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '<html><body>'
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, 'Number of scripts: ' + CAST(ISNULL((SELECT COUNT(1) FROM util.EdFiSanity WITH (NOLOCK)), 0) as nvarchar) + '<br><br>'
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '<table border="1" cellpadding="3" cellspacing="0"><tr><th>InterChange</th><th>Description</th><th>Result</th><th>Expected Result</th><th>Actual Result</th><th>Script</th></tr>'

			INSERT INTO @OutputTable(OutputOption, OutputText)
			SELECT @OutputOption, '<tr>' + 
				'<td valign="top">' + InterChangeName + '</td>' +
				'<td valign="top">' + [Description] + '</td>' +
				'<td valign="top">' + CASE ScriptResult WHEN 'Failed' THEN '<font color="red">' + ScriptResult + '</font>' ELSE ScriptResult END + '</td>' +
				'<td valign="top" width="200">' + ISNULL(NULLIF(ExpectedResult, ''), '&nbsp;') + '</td>' + 
				'<td valign="top" width="200">' + ISNULL(NULLIF(ActualResult, ''), '&nbsp;') + '</td>' + 
				'<td valign="top"><font size="-2">' + Script + '</font></td>' +
				'</tr>'
			FROM util.EdFiSanity WITH (NOLOCK)
			ORDER BY InterchangeName, ScriptResult

			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '</table><br/><br/><br/>'
			INSERT INTO @OutputTable(OutputOption, OutputText) SELECT @OutputOption, '</body></html>'
		END
	END


	-----------------------------------
	-- Publish stats to TeamCity
	-----------------------------------
	
	IF @OutputOption = 'TeamCityStatistic'
	BEGIN
		DELETE @OutputTable
		
		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'QAResults' AND TABLE_SCHEMA = 'util')
			INSERT INTO util.TeamCityStatistic(StatisticKey, StatisticValue)
			SELECT 'FailedQAScripts', CAST(COUNT(1) as nvarchar) FROM util.QAResults WITH (NOLOCK) WHERE ScriptResult = 'Failed'
		
		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiSanity' AND TABLE_SCHEMA = 'util')
			INSERT INTO util.TeamCityStatistic(StatisticKey, StatisticValue)
			SELECT 'FailedSanityCheck', CAST(COUNT(1) as nvarchar) FROM util.EdFiSanity WITH (NOLOCK) WHERE ScriptResult = 'Failed'

		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiException' AND TABLE_SCHEMA = 'edfi')
		BEGIN
			INSERT INTO util.TeamCityStatistic(StatisticKey, StatisticValue)
			SELECT 'EdFiExceptionErrors', CAST(COUNT(1) as nvarchar) FROM edfi.EdFiException WITH (NOLOCK) WHERE ExceptionLevel = 'Error'

			INSERT INTO util.TeamCityStatistic(StatisticKey, StatisticValue)
			SELECT 'EdFiExceptionWarnings', CAST(COUNT(1) as nvarchar) FROM edfi.EdFiException WITH (NOLOCK) WHERE ExceptionLevel = 'Warning'

			INSERT INTO util.TeamCityStatistic(StatisticKey, StatisticValue)
			SELECT 'EdFiExceptionEntityNotFounds', CAST(COUNT(1) as nvarchar) FROM edfi.EdFiException WITH (NOLOCK) WHERE ExceptionLevel = 'EntityNotFound'
		END

		IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiException' AND TABLE_SCHEMA = 'edfi')
		AND EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EdFiPopulation' AND TABLE_SCHEMA = 'util')
			INSERT INTO util.TeamCityStatistic(StatisticKey, StatisticValue)
			SELECT 'EdFiExceptionMaxErrorRate', CAST(MAX(CAST(ErrorRate as decimal(10, 2))) as nvarchar)
			FROM (
				SELECT a.TableName, ISNULL(COUNT(1)*100.00/NULLIF(b.RecordCount, 0), 100) as ErrorRate
				FROM 
					edfi.EdFiException a WITH (NOLOCK) LEFT OUTER JOIN
					util.EdFiPopulation b WITH (NOLOCK)
						ON a.TableName = b.TableSchema + '.' + b.TableName
				WHERE a.ErrorCode <> -1071607778
				AND a.ErrorMessage NOT LIKE '%Cannot insert duplicate key in object%'
				GROUP BY a.TableName, b.RecordCount
			) as temp

			
		DELETE @OutputTable
		
		INSERT INTO @OutputTable(OutputOption, OutputText)
		SELECT @OutputOption, '##teamcity[buildStatisticValue key=''' + StatisticKey + ''' value=''' + ISNULL(StatisticValue, 0) + ''']'
		FROM util.TeamCityStatistic
	END



	-----------------------------------
	-- Print out reports 
	-----------------------------------

	IF @OutputOption <> 'TeamCityStatistic'
	BEGIN
		-- (Powershell will save the content in the second column in the filename specified in the first column)
		SELECT DISTINCT
			'FileName=' + b.OutputOption + ISNULL(b.OutputIndex, '') + '.html',
			STUFF(
			(
				SELECT CHAR(13) + CHAR(10) + a.OutputText  as [text()]
				FROM @OutputTable a
				WHERE a.OutputOption = b.OutputOption
				AND a.OutputIndex = b.OutputIndex
				ORDER BY a.OutputId
			FOR XML PATH (''), TYPE
			).value('text()[1]', 'nvarchar(MAX)'), 1, 1, '')
		FROM @OutputTable b
	END
	ELSE
	BEGIN
		-- (Powershell will simply Out-Host the data to build log)
		SELECT OutputText
		FROM @OutputTable
	END
	
	SET NOCOUNT OFF

END
