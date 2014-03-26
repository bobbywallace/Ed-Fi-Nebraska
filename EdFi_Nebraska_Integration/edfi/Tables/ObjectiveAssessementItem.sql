CREATE TABLE [edfi].[ObjectiveAssessementItem] (
    [ObjectiveItem]                  INT           NOT NULL,
    [AssessmentTitle]                NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]          INT           NOT NULL,
    [AssessedGradeLevelTypeId]       INT           NOT NULL,
    [Version]                        INT           NOT NULL,
    [AssessmentItem]                 INT           NOT NULL,
    [ParentObjectiveItem]            INT           NULL,
    [ParentAssessmentTitle]          NVARCHAR (60) NULL,
    [ParentAcademicSubjectTypeId]    INT           NULL,
    [ParentAssessedGradeLevelTypeId] INT           NULL,
    [ParentVersion]                  INT           NULL,
    [ParentAssessmentItem]           INT           NULL,
    CONSTRAINT [PK_ObjectiveAssessementItem] PRIMARY KEY CLUSTERED ([ObjectiveItem] ASC, [AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [Version] ASC, [AssessmentItem] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ObjectiveAssessementItem_AssessmentItem] FOREIGN KEY ([AssessmentItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]) REFERENCES [edfi].[AssessmentItem] ([AssesmentItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]),
    CONSTRAINT [FK_ObjectiveAssessementItem_ObjectiveAssessementItem] FOREIGN KEY ([ParentObjectiveItem], [ParentAssessmentTitle], [ParentAcademicSubjectTypeId], [ParentAssessedGradeLevelTypeId], [ParentVersion], [ParentAssessmentItem]) REFERENCES [edfi].[ObjectiveAssessementItem] ([ObjectiveItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version], [AssessmentItem]),
    CONSTRAINT [FK_ObjectiveAssessementItem_ObjectiveAssessment] FOREIGN KEY ([ObjectiveItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]) REFERENCES [edfi].[ObjectiveAssessment] ([ObjectiveItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessementItem', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessementItem', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessementItem', @level2type = N'COLUMN', @level2name = N'AssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessementItem', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessementItem', @level2type = N'COLUMN', @level2name = N'ParentAssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessementItem', @level2type = N'COLUMN', @level2name = N'ParentAcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessementItem', @level2type = N'COLUMN', @level2name = N'ParentAssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessementItem', @level2type = N'COLUMN', @level2name = N'ParentVersion';

