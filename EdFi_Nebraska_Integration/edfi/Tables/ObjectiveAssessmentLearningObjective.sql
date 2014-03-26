CREATE TABLE [edfi].[ObjectiveAssessmentLearningObjective] (
    [ObjectiveItem]            INT           NOT NULL,
    [AssessmentTitle]          NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]    INT           NOT NULL,
    [AssessedGradeLevelTypeId] INT           NOT NULL,
    [Version]                  INT           NOT NULL,
    [Objective]                NVARCHAR (60) NOT NULL,
    CONSTRAINT [PK_LearningObjectiveAssessment] PRIMARY KEY CLUSTERED ([ObjectiveItem] ASC, [AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [Version] ASC, [Objective] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_LearningObjectiveAssessment_LearningObjective] FOREIGN KEY ([Objective], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectTypeId], [ObjectiveGradeLevelTypeId]),
    CONSTRAINT [FK_LearningObjectiveAssessment_ObjectiveAssessment] FOREIGN KEY ([ObjectiveItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]) REFERENCES [edfi].[ObjectiveAssessment] ([ObjectiveItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentLearningObjective', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentLearningObjective', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. If the test assessment spans a range of grades, then this attribute holds the highest grade assessed.  If only one grade level is assessed, then only this attribute is used. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentLearningObjective', @level2type = N'COLUMN', @level2name = N'AssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentLearningObjective', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The designated title of the learning objective.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentLearningObjective', @level2type = N'COLUMN', @level2name = N'Objective';

