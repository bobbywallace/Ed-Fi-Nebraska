CREATE TABLE [edfi].[Assessment] (
    [AssessmentTitle]                NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]          INT           NOT NULL,
    [AssessedGradeLevelTypeId]       INT           NOT NULL,
    [Version]                        INT           NOT NULL,
    [AssessmentCategoryTypeId]       INT           NOT NULL,
    [LowestAssessedGradeLevelTypeId] INT           NULL,
    [ContentStandardTypeId]          INT           NULL,
    [AssessmentForm]                 NVARCHAR (60) NULL,
    [RevisionDate]                   DATE          NULL,
    [MaxRawScore]                    INT           NULL,
    [Nomenclature]                   NVARCHAR (35) NULL,
    [AssessmentPeriodDescriptorId]   INT           NULL,
    CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED ([AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [Version] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AcademicSubjectType_Assessment] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_Assessment_AssessmentCategoryType] FOREIGN KEY ([AssessmentCategoryTypeId]) REFERENCES [edfi].[AssessmentCategoryType] ([AssessmentCategoryTypeId]),
    CONSTRAINT [FK_Assessment_AssessmentPeriodDescriptor] FOREIGN KEY ([AssessmentPeriodDescriptorId]) REFERENCES [edfi].[AssessmentPeriodDescriptor] ([AssessmentPeriodDescriptorId]),
    CONSTRAINT [FK_Assessment_ContentStandardType] FOREIGN KEY ([ContentStandardTypeId]) REFERENCES [edfi].[ContentStandardType] ([ContentStandardTypeId]),
    CONSTRAINT [FK_Assessment_GradeLevelType] FOREIGN KEY ([AssessedGradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A tool, instrument, process, or exhibition composed of a systematic sampling of behavior for measuring a student''s competence, knowledge, skills or behavior. An assessment can be used to measure differences in individuals or groups and changes in performance from one occasion to the next.
NEDM: Test Assessment
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. If the test assessment spans a range of grades, then this attribute holds the highest grade assessed.  If only one grade level is assessed, then only this attribute is used. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'AssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The category of an assessment based on format and content. For example:
Achievement test
ACT
Advanced placement test
Alternate assessment/grade-level standards
Attitudinal test
Benchmark test
Cognitive and perceptual skills test
SAT
TAKS

...
NEDM: Assessment Type
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'AssessmentCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the test assessment spans a range of grades, then this attribute holds the lowest grade assessed.  If only one grade level is assessed, then this attribute is omitted. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'LowestAssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication as to whether an assessment conforms to a standard. For example:
Local standard
Statewide standard
Regional standard
Association standard
School standard
...
NEDM: Assessment Content Standard
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'ContentStandardTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year that the conceptual design for the assessment was most recently revised substantially.
NEDM: Date Of Assessment Revision
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'RevisionDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The maximum raw score achievable across all assessment items that are correct and scored at the maximum.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = N'MaxRawScore';

