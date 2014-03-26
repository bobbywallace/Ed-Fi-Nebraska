CREATE TABLE [edfi].[CourseLearningStandard] (
    [EducationOrganizationId] INT           NOT NULL,
    [IdentityCourseCode]      NVARCHAR (20) NOT NULL,
    [LearningStandardId]      NVARCHAR (40) NOT NULL,
    CONSTRAINT [PK_CourseLearningStandard] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [IdentityCourseCode] ASC, [LearningStandardId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CourseLearningStandard_Course] FOREIGN KEY ([EducationOrganizationId], [IdentityCourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [IdentityCourseCode]),
    CONSTRAINT [FK_CourseLearningStandard_LearningStandard] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseLearningStandard', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';

