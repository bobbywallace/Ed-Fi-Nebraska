CREATE TABLE [edfi].[TeacherSchoolAssociationInstructionalGradeLevels] (
    [StaffUSI]                      BIGINT NOT NULL,
    [ProgramAssignmentTypeId]       INT    NOT NULL,
    [SchoolId]                      INT    NOT NULL,
    [InstructionalGradeLevelTypeId] INT    NOT NULL,
    CONSTRAINT [PK_TeacherSchoolAssociationInstructionalGradeLevels] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [ProgramAssignmentTypeId] ASC, [SchoolId] ASC, [InstructionalGradeLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_TeacherSchoolAssociationInstructionalGradeLevels_GradeLevelType] FOREIGN KEY ([InstructionalGradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_TeacherSchoolAssociationInstructionalGradeLevels_TeacherSchoolAssociation] FOREIGN KEY ([StaffUSI], [ProgramAssignmentTypeId], [SchoolId]) REFERENCES [edfi].[TeacherSchoolAssociation] ([StaffUSI], [ProgramAssignmentTypeId], [SchoolId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociationInstructionalGradeLevels', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the program for which the individual is assigned; for example:
Regular education
Title I-Academic
Title I-Non-Academic
Special Education
Bilingual/English as a Second Language
NEDM: Program Assignment

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociationInstructionalGradeLevels', @level2type = N'COLUMN', @level2name = N'ProgramAssignmentTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociationInstructionalGradeLevels', @level2type = N'COLUMN', @level2name = N'SchoolId';

