
CREATE VIEW [edfi].[MinMaxDate]
AS
 SELECT   a.SchoolId,
			ISNULL(MAX(CAST(a.EventDate as datetime)), '9999/1/1') as MaxDate,
			ISNULL(MIN(CAST(b.BeginDate as datetime)), '1900/1/1') as MinDate
FROM edfi.AttendanceEvent a
		 Join edfi.Session b
		 On a. SchoolId = b.EducationOrganizationId
		Group By  a.SchoolId
