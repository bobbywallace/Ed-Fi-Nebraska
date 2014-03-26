CREATE TABLE [edfi].[AssessmentItem] (
    [AssesmentItem]            INT           NOT NULL,
    [AssessmentTitle]          NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]    INT           NOT NULL,
    [AssessedGradeLevelTypeId] INT           NOT NULL,
    [Version]                  INT           NOT NULL,
    [IdentificationCode]       NVARCHAR (60) NOT NULL,
    [ItemCategoryTypeId]       INT           NOT NULL,
    [MaxRawScore]              INT           NOT NULL,
    [CorrectResponse]          NVARCHAR (20) NOT NULL,
    [LearningStandardId]       NVARCHAR (40) NULL,
    [Nomenclature]             NVARCHAR (35) NULL,
    CONSTRAINT [PK_AssessmentItem] PRIMARY KEY CLUSTERED ([AssesmentItem] ASC, [AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [Version] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AssessmentItem_Assessment] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]),
    CONSTRAINT [FK_AssessmentItem_LearningStandard] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId]),
    CONSTRAINT [FK_ItemCategoryType_AssessmentItem] FOREIGN KEY ([ItemCategoryTypeId]) REFERENCES [edfi].[ItemCategoryType] ([ItemCategoryTypeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_AssessmentItem_Item]
    ON [edfi].[AssessmentItem]([Version] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [IdentificationCode] ASC, [AssessmentTitle] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_AssessmentItem]
    ON [edfi].[AssessmentItem]([LearningStandardId] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'One of many single measures that make up an assessment. 
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentItem';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentItem', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentItem', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. If the test assessment spans a range of grades, then this attribute holds the highest grade assessed.  If only one grade level is assessed, then only this attribute is used. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentItem', @level2type = N'COLUMN', @level2name = N'AssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentItem', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Category or type of the assessment item.  For example:
Multiple choice
Analytic
Prose
....

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentItem', @level2type = N'COLUMN', @level2name = N'ItemCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The maximum raw score achievable is all assessment items are correct and scored at the maximum.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentItem', @level2type = N'COLUMN', @level2name = N'MaxRawScore';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The correct response for the assessment item.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentItem', @level2type = N'COLUMN', @level2name = N'CorrectResponse';

