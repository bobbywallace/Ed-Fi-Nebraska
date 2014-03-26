CREATE TABLE [edfi].[StudentAssessment] (
    [StudentUSI]                      BIGINT        NOT NULL,
    [AssessmentTitle]                 NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]           INT           NOT NULL,
    [AssessedGradeLevelTypeId]        INT           NOT NULL,
    [Version]                         INT           NOT NULL,
    [AdministrationDate]              DATE          NOT NULL,
    [AdministrationEndDate]           DATE          NULL,
    [SerialNumber]                    NVARCHAR (20) NULL,
    [AdministrationLanguageTypeId]    INT           NULL,
    [AdministrationEnvironmentTypeId] INT           NULL,
    [RetestIndicatorTypeId]           INT           NULL,
    [ReasonNotTestedTypeId]           INT           NULL,
    [WhenAssessedGradeLevelTypeId]    INT           NULL,
    CONSTRAINT [PK_StudentAssessment] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [Version] ASC, [AdministrationDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AdministrationEnvironmentType_StudentAssessment] FOREIGN KEY ([AdministrationEnvironmentTypeId]) REFERENCES [edfi].[AdministrationEnvironmentType] ([AdministrationEnvironmentTypeId]),
    CONSTRAINT [FK_ReasonNotTestedType_StudentAssessment] FOREIGN KEY ([ReasonNotTestedTypeId]) REFERENCES [edfi].[ReasonNotTestedType] ([ReasonNotTestedTypeId]),
    CONSTRAINT [FK_RetestIndicatorType_StudentAssessment] FOREIGN KEY ([RetestIndicatorTypeId]) REFERENCES [edfi].[RetestIndicatorType] ([RetestIndicatorTypeId]),
    CONSTRAINT [FK_StudentAssessment_Assessment] FOREIGN KEY ([AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]),
    CONSTRAINT [FK_StudentAssessment_GradeLevelType] FOREIGN KEY ([WhenAssessedGradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_StudentAssessment_LanguagesType] FOREIGN KEY ([AdministrationLanguageTypeId]) REFERENCES [edfi].[LanguagesType] ([LanguageTypeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentAssessment_StudentRecord]
    ON [edfi].[StudentAssessment]([AssessmentTitle] ASC, [Version] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [StudentUSI] ASC, [AdministrationDate] ASC)
    INCLUDE([AdministrationLanguageTypeId]) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the analysis or scoring of a student''s response on an assessment. The analysis results in a value that represents a student''s performance on a set of items on a test.
NEDM: Assessment Score
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. If the test assessment spans a range of grades, then this attribute holds the highest grade assessed.  If only one grade level is assessed, then only this attribute is used. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'AssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month(s), day(s), and year on which an assessment is administered or first day of administration if over multiple days.
NEDM: Assessment Administration Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'AdministrationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Assessment Administration End Date, if administered over multiple days.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'AdministrationEndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique number of the assessment form or answer document.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The language in which an assessment is written and/or administered. 
NEDM: Assessment Administration Language
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'AdministrationLanguageTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The environment in which the test was administered.  For example:
Electronic
Classroom
Testing Center
...
....
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'AdministrationEnvironmentTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator if the test was retaken.  For example:
Primary administration
First retest
Second retest
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'RetestIndicatorTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The primary reason student is not tested. For example:
Absent
Refusal by parent
Refusal by student
Medical waiver
Illness
Disruptive behavior
LEP Exempt
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'ReasonNotTestedTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level of a student when assessed.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessment', @level2type = N'COLUMN', @level2name = N'WhenAssessedGradeLevelTypeId';

