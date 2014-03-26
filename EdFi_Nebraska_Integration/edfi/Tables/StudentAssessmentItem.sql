CREATE TABLE [edfi].[StudentAssessmentItem] (
    [StudentUSI]                 BIGINT        NOT NULL,
    [AssesmentItem]              INT           NOT NULL,
    [AssessmentTitle]            NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]      INT           NOT NULL,
    [AssessedGradeLevelTypeId]   INT           NOT NULL,
    [Version]                    INT           NOT NULL,
    [AdministrationDate]         DATE          NOT NULL,
    [AssessmentResponse]         NVARCHAR (20) NULL,
    [ResponseIndicatorTypeId]    INT           NULL,
    [AssessmentItemResultTypeId] INT           NOT NULL,
    [RawScoreResult]             INT           NULL,
    CONSTRAINT [PK_StudentAssessmentItem] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [AssesmentItem] ASC, [AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [Version] ASC, [AdministrationDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AssessmentItemResultType_StudentAssessmentItem] FOREIGN KEY ([AssessmentItemResultTypeId]) REFERENCES [edfi].[AssessmentItemResultType] ([AssessmentItemResultTypeId]),
    CONSTRAINT [FK_ResponseIndicatorType_StudentAssessmentItem] FOREIGN KEY ([ResponseIndicatorTypeId]) REFERENCES [edfi].[ResponseIndicatorType] ([ResponseIndicatorTypeId]),
    CONSTRAINT [FK_StudentAssessmentItem_AssessmentItem] FOREIGN KEY ([AssesmentItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]) REFERENCES [edfi].[AssessmentItem] ([AssesmentItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]),
    CONSTRAINT [FK_StudentAssessmentItem_StudentAssessment] FOREIGN KEY ([StudentUSI], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version], [AdministrationDate]) REFERENCES [edfi].[StudentAssessment] ([StudentUSI], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version], [AdministrationDate])
);


GO
CREATE NONCLUSTERED INDEX [IX_AssessmentItem_SubjType]
    ON [edfi].[StudentAssessmentItem]([AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This represents the student''s response to an assessment item and the item-level scores such as correct, incorrect, or met standard. 
NEDM: Assessment Score
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. If the test assessment spans a range of grades, then this attribute holds the highest grade assessed.  If only one grade level is assessed, then only this attribute is used. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'AssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month(s), day(s), and year on which an assessment is administered or first day of administration if over multiple days.
NEDM: Assessment Administration Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'AdministrationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A student''s response to a stimulus on a test.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'AssessmentResponse';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of the response.  For example:
Nonscorable response
Ineffective response
Effective response
Partial response
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'ResponseIndicatorTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The analyzed result of a student''s response to an assessment item.. For example:
Correct
Incorrect
Met standard
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'AssessmentItemResultTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A meaningful raw score of the performance of an individual on a test assessment item.
NEDM: Score Results
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAssessmentItem', @level2type = N'COLUMN', @level2name = N'RawScoreResult';

