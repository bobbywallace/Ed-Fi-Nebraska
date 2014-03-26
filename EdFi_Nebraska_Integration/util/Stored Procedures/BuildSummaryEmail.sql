
CREATE PROCEDURE [util].[BuildSummaryEmail] (
	@RecipientEmailAddress nvarchar(255),
	@ServerName nvarchar(255) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @ServerNameInSubjectLine nvarchar(255)
	SELECT @ServerNameInSubjectLine = ISNULL(@ServerName, @@SERVERNAME)

	IF OBJECT_ID('tempdb..#BuildSummary') IS NOT NULL
		DROP TABLE #BuildSummary
	CREATE TABLE #BuildSummary (
		BuildSummaryId					int identity(1,1) primary key,
		ServerName						nvarchar(255),
		DistrictName					nvarchar(255),
		TeamCityBuildTypeId				nvarchar(255),
		TeamCityBuildId					bigint,
		TeamCityBuildNumber				nvarchar(255),
		BuildStatus						nvarchar(255),
		BuildFinishTime					datetime,
		ElapsedMinutes					int,
		ElapsedStatus					nvarchar(255),
		EdFiExceptionErrors				nvarchar(255),
		EdFiExceptionWarnings			nvarchar(255),
		EdFiExceptionEntityNotFounds	nvarchar(255),
		EdFiExceptionMaxErrorRate		nvarchar(255),
		FailedQAScripts					nvarchar(255),
		FailedSanityCheck				nvarchar(255)
	)


	-----------------------------------
	-- Collect data
	-----------------------------------
	
	INSERT INTO #BuildSummary(TeamCityBuildTypeId, TeamCityBuildId, TeamCityBuildNumber, BuildStatus, BuildFinishTime, ElapsedMinutes)
	SELECT TeamCityBuildTypeId, TeamCityBuildId, TeamCityBuildNumber, BuildStatus, BuildFinishTime, DATEDIFF(minute, BuildFinishTime, GETDATE()) 
	FROM (
		SELECT 
			build_type_id as TeamCityBuildTypeId, 
			build_id as TeamCityBuildId, 
			build_number as TeamCityBuildNumber, 
			status_text as BuildStatus,
			-- add -5 during daylight saving time or -6 otherwise
			DATEADD(hour, -6, DATEADD(second, build_finish_time_server/1000, '1970/1/1')) as BuildFinishTime,
			ROW_NUMBER() OVER (PARTITION BY build_type_id ORDER BY build_finish_time_server DESC) as ranking
		FROM TeamCity.dbo.history a WITH (NOLOCK)
		WHERE DATEADD(hour, -5, DATEADD(second, build_finish_time_server/1000, '1970/1/1')) > GETDATE() - 7
		AND EXISTS (
			SELECT 1 
			FROM EdFi_LoadReport.util.TeamCityStatisticHistory b WITH (NOLOCK)
			WHERE a.build_id = b.TeamCityBuildId
		) 
	) temp
	WHERE ranking = 1


	IF OBJECT_ID('tempdb..#TeamCityStatisticHistoryPivot') IS NOT NULL
		DROP TABLE #TeamCityStatisticHistoryPivot
	SELECT
		TeamCityBuildId,
		MIN(ServerName) as ServerName,
		MIN(DatabaseName) as DistrictName,
		MIN(CASE WHEN StatisticKey = 'EdFiExceptionErrors' THEN StatisticValue END) as EdFiExceptionErrors,
		MIN(CASE WHEN StatisticKey = 'EdFiExceptionWarnings' THEN StatisticValue END) as EdFiExceptionWarnings,
		MIN(CASE WHEN StatisticKey = 'EdFiExceptionEntityNotFounds' THEN StatisticValue END) as EdFiExceptionEntityNotFounds,
		MIN(CASE WHEN StatisticKey = 'EdFiExceptionMaxErrorRate' THEN StatisticValue END) as EdFiExceptionMaxErrorRate,
		MIN(CASE WHEN StatisticKey = 'FailedQAScripts' THEN StatisticValue END) as FailedQAScripts,
		MIN(CASE WHEN StatisticKey = 'FailedSanityCheck' THEN StatisticValue END) as FailedSanityCheck
	INTO #TeamCityStatisticHistoryPivot
	FROM EdFi_LoadReport.util.TeamCityStatisticHistory a WITH (NOLOCK)
	WHERE EXISTS (
		SELECT 1
		FROM #BuildSummary b WITH (NOLOCK)
		WHERE a.TeamCityBuildId = b.TeamCityBuildId
	)
	GROUP BY TeamCityBuildId


	UPDATE a
	SET
		ServerName					= b.ServerName,
		DistrictName				= b.DistrictName,
		EdFiExceptionErrors			= b.EdFiExceptionErrors,
		EdFiExceptionWarnings		= b.EdFiExceptionWarnings,
		EdFiExceptionEntityNotFounds= b.EdFiExceptionEntityNotFounds,
		EdFiExceptionMaxErrorRate	= b.EdFiExceptionMaxErrorRate,
		FailedQAScripts				= b.FailedQAScripts,
		FailedSanityCheck			= b.FailedSanityCheck
	FROM
		#BuildSummary a WITH (NOLOCK) INNER JOIN
		#TeamCityStatisticHistoryPivot b
			ON a.TeamCityBuildId = b.TeamCityBuildId
	
	UPDATE #BuildSummary
	SET 
		DistrictName = (SELECT ISNULL(temp.list.value('.', 'varchar(MAX)'), '') FROM (SELECT Token FROM util.Split(DistrictName, '_') WHERE Id IN (2, 5) ORDER BY Id FOR XML PATH(''), TYPE ) as temp(list)),
		ElapsedStatus = CASE 
			WHEN ElapsedMinutes BETWEEN 0 AND (60*24 - 1)		THEN 'Last 24 hours'
			WHEN ElapsedMinutes BETWEEN 60*24 AND (60*48 - 1)	THEN 'One day ago'
			ELSE CAST(ElapsedMinutes/(60*24) as nvarchar) + ' days ago'
		END

	-----------------------------------
	-- Email
	-----------------------------------
	
	DECLARE @HTML nvarchar(MAX), @Subject nvarchar(1000), @DosCommand nvarchar(4000)
	
	SELECT DISTINCT @Subject = 'Build Summary: ' + @ServerNameInSubjectLine + ' (' + CAST(MONTH(GETDATE()) as varchar) + '/' + CAST(DAY(GETDATE()) as varchar) + ')'
	
	SELECT @HTML = '<table border=''1'' cellpadding=''3'' cellspacing=''0''><tr><th rowspan=''2'' valign=''top''>District Name</th><th rowspan=''2'' valign=''top''>Build#</th><th rowspan=''2'' valign=''top''>Status</th><th rowspan=''2'' valign=''top''>Elapsed</th><th rowspan=''2'' valign=''top''>Build Date</th><th rowspan=''2'' valign=''top''>Finished</th><th colspan=''3''>EdFi Exception</th><th colspan=''2''>Failed Scripts</th></tr>'
	SELECT @HTML = @HTML + '<tr><th># Error</th><th># Warning</th><th># Entity</th><th>QA Script</th><th>Sanity Check</th></tr>'
	SELECT @HTML = @HTML + '<tr>' +
		'<td>' + DistrictName + '</td>' +
		'<td><a href=''http://' + ServerName + ':8080/viewLog.html?tab=buildLog&buildTypeId=' + TeamCityBuildTypeId + '&buildId=' + CAST(TeamCityBuildId as varchar) + '''>' + TeamCityBuildNumber + '</a></td>' +
		'<td>' + CASE WHEN BuildStatus LIKE '%Failure%' THEN '<font color=''red''>' + BuildStatus + '</font>' ELSE BuildStatus END + '</td>' +
		'<td>' + ElapsedStatus + '</td>' +
		'<td>' + CAST(CAST(BuildFinishTime as date) as nvarchar) + '</td>' +
		'<td align=''right''>' + RIGHT(CONVERT(nvarchar(25), BuildFinishTime, 100), 7) + '</td>' +
		'<td align=''right''>' + REPLACE(CONVERT(nvarchar, CAST(ISNULL(EdFiExceptionErrors, 0) as money), 1), '.00', '') + '</td>' +
		'<td align=''right''>' + REPLACE(CONVERT(nvarchar, CAST(ISNULL(EdFiExceptionWarnings, 0) as money), 1), '.00', '') + '</td>' +
		'<td align=''right''>' + REPLACE(CONVERT(nvarchar, CAST(ISNULL(EdFiExceptionEntityNotFounds, 0) as money), 1), '.00', '') + '</td>' +
		'<td align=''right''>' + REPLACE(CONVERT(nvarchar, CAST(ISNULL(FailedQAScripts, 0) as money), 1), '.00', '') + '</td>' +
		'<td align=''right''>' + REPLACE(CONVERT(nvarchar, CAST(ISNULL(FailedSanityCheck, 0) as money), 1), '.00', '') + '</td>' +
		'</tr>'
	FROM #BuildSummary
	ORDER BY DistrictName
	SELECT @HTML = @HTML + '</table><br><br>'	
	SELECT @HTML = @HTML + 'This report includes the latest build status for districts that have been built in the last 7 days.'	
	
	EXEC msdb.dbo.sp_send_dbmail 
		@profile_name = 'DLP Notification',
		@body_format = 'HTML',
		@recipients = @RecipientEmailAddress,
		@body = @HTML,
		@subject = @Subject


	SET NOCOUNT OFF	
END
