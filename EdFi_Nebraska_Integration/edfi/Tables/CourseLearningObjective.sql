CREATE TABLE [edfi].[CourseLearningObjective] (
    [EducationOrganizationId]   INT           NOT NULL,
    [IdentityCourseCode]        NVARCHAR (20) NOT NULL,
    [Objective]                 NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]     INT           NOT NULL,
    [ObjectiveGradeLevelTypeId] INT           NOT NULL,
    CONSTRAINT [PK_CourseLearningObjective] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [IdentityCourseCode] ASC, [Objective] ASC, [AcademicSubjectTypeId] ASC, [ObjectiveGradeLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CourseLearningObjective_Course] FOREIGN KEY ([EducationOrganizationId], [IdentityCourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [IdentityCourseCode]),
    CONSTRAINT [FK_CourseLearningObjective_LearningObjective] FOREIGN KEY ([Objective], [AcademicSubjectTypeId], [ObjectiveGradeLevelTypeId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectTypeId], [ObjectiveGradeLevelTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseLearningObjective', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The designated title of the learning objective.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseLearningObjective', @level2type = N'COLUMN', @level2name = N'Objective';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseLearningObjective', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level for which the learning objective is targeted,
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseLearningObjective', @level2type = N'COLUMN', @level2name = N'ObjectiveGradeLevelTypeId';

