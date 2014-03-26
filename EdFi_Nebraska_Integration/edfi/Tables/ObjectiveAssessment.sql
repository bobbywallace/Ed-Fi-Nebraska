CREATE TABLE [edfi].[ObjectiveAssessment] (
    [ObjectiveItem]            INT            NOT NULL,
    [AssessmentTitle]          NVARCHAR (60)  NOT NULL,
    [AcademicSubjectTypeId]    INT            NOT NULL,
    [AssessedGradeLevelTypeId] INT            NOT NULL,
    [Version]                  INT            NOT NULL,
    [IdentificationCode]       NVARCHAR (60)  NOT NULL,
    [MaxRawScore]              INT            NULL,
    [PercentOfAssessment]      DECIMAL (6, 2) NULL,
    [Nomenclature]             NVARCHAR (35)  NULL,
    [LearningStandardId]       NVARCHAR (40)  NULL,
    CONSTRAINT [PK_ObjectiveAssessment] PRIMARY KEY CLUSTERED ([ObjectiveItem] ASC, [AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [Version] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ObjectiveAssessment_Assessment] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]),
    CONSTRAINT [FK_ObjectiveAssessment_LearningStandard] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents subtests that assess specific learning objectives.
NEDM: subtests
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessment', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessment', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. If the test assessment spans a range of grades, then this attribute holds the highest grade assessed.  If only one grade level is assessed, then only this attribute is used. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessment', @level2type = N'COLUMN', @level2name = N'AssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessment', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a space, room, site, building, individual, organization, program, or institution by a school, school system, a state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessment', @level2type = N'COLUMN', @level2name = N'IdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The maximum raw score achievable across all assessment items for the objective that are correct and scored at the maximum.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessment', @level2type = N'COLUMN', @level2name = N'MaxRawScore';

