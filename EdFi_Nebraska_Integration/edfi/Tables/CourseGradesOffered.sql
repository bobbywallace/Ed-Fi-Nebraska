CREATE TABLE [edfi].[CourseGradesOffered] (
    [EducationOrganizationId] INT           NOT NULL,
    [IdentityCourseCode]      NVARCHAR (20) NOT NULL,
    [GradesOfferedTypeId]     INT           NOT NULL,
    CONSTRAINT [PK_CourseGradesOffered] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [IdentityCourseCode] ASC, [GradesOfferedTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CourseGradesOffered_Course] FOREIGN KEY ([EducationOrganizationId], [IdentityCourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [IdentityCourseCode]),
    CONSTRAINT [FK_CourseGradesOffered_GradeLevelType] FOREIGN KEY ([GradesOfferedTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseGradesOffered', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';

