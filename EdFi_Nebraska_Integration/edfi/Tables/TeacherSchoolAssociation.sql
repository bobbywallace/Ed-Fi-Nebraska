CREATE TABLE [edfi].[TeacherSchoolAssociation] (
    [StaffUSI]                BIGINT NOT NULL,
    [ProgramAssignmentTypeId] INT    NOT NULL,
    [SchoolId]                INT    NOT NULL,
    CONSTRAINT [PK_TeacherSchoolAssociation] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [ProgramAssignmentTypeId] ASC, [SchoolId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ProgramAssignmentType_TeacherSchoolAssociation] FOREIGN KEY ([ProgramAssignmentTypeId]) REFERENCES [edfi].[ProgramAssignmentType] ([ProgramAssignmentTypeId]),
    CONSTRAINT [FK_TeacherSchoolAssociation_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_TeacherSchoolAssociation_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association indicates the school(s) to which a teacher provides instructional services to.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociation', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the program for which the individual is assigned; for example:
Regular education
Title I-Academic
Title I-Non-Academic
Special Education
Bilingual/English as a Second Language
NEDM: Program Assignment

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociation', @level2type = N'COLUMN', @level2name = N'ProgramAssignmentTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSchoolAssociation', @level2type = N'COLUMN', @level2name = N'SchoolId';

