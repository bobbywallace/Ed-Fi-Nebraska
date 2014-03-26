CREATE TABLE [edfi].[TeacherSchoolAssociationAcademicSubjects] (
    [StaffUSI]                BIGINT NOT NULL,
    [ProgramAssignmentTypeId] INT    NOT NULL,
    [SchoolId]                INT    NOT NULL,
    [AcademicSubjectTypeId]   INT    NOT NULL,
    CONSTRAINT [PK_TeacherSchoolAssociationAcademicSubjects] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [ProgramAssignmentTypeId] ASC, [SchoolId] ASC, [AcademicSubjectTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_TeacherSchoolAssociationAcademicSubjects_AcademicSubjectType] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_TeacherSchoolAssociationAcademicSubjects_TeacherSchoolAssociation] FOREIGN KEY ([StaffUSI], [ProgramAssignmentTypeId], [SchoolId]) REFERENCES [edfi].[TeacherSchoolAssociation] ([StaffUSI], [ProgramAssignmentTypeId], [SchoolId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociationAcademicSubjects', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the program for which the individual is assigned; for example:
Regular education
Title I-Academic
Title I-Non-Academic
Special Education
Bilingual/English as a Second Language
NEDM: Program Assignment

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociationAcademicSubjects', @level2type = N'COLUMN', @level2name = N'ProgramAssignmentTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociationAcademicSubjects', @level2type = N'COLUMN', @level2name = N'SchoolId';

