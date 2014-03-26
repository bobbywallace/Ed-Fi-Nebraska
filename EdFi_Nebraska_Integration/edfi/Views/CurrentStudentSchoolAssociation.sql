
CREATE VIEW edfi.CurrentStudentSchoolAssociation
AS
 SELECT *
FROM         edfi.StudentSchoolAssociation SSA
WHERE     (ExitWithdrawDate IS NULL)
   or (SSA.ExitWithdrawDate >= (select MAX(CD.Date) from edfi.CalendarDate CD 
     where  SSA.SchoolId = CD.EducationOrganizationId
     and CD.CalendarEventTypeId = 1 ) ) 
