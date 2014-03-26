
CREATE VIEW [edfi].[SchoolList]
AS
 SELECT DISTINCT b.LocalEducationAgencyId, a.SchoolId
FROM 
	edfi.Grade a INNER JOIN
	edfi.School b
		ON a.SchoolId = b.SchoolId
