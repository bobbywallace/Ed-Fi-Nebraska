
CREATE VIEW [edfi].[CurrentStaffEducationOrgEmploymentAssociation]
AS
SELECT *
FROM	edfi.StaffEducationOrgEmploymentAssociation SSA
WHERE	(EndDate IS NULL)
	or (SSA.EndDate >= (select MAX(CD.Date) 
						from edfi.CalendarDate CD 
						where SSA.EducationOrganizationId = CD.EducationOrganizationId)
		) 
	or (SSA.EndDate >= (select MAX(Att.EventDate) 
						from edfi.AttendanceEvent Att)
		)
    or (SSA.EndDate >= CURRENT_TIMESTAMP)
