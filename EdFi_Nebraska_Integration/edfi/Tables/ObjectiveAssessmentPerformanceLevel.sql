CREATE TABLE [edfi].[ObjectiveAssessmentPerformanceLevel] (
    [ObjectiveItem]                   INT           NOT NULL,
    [AssessmentTitle]                 NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]           INT           NOT NULL,
    [AssessedGradeLevelTypeId]        INT           NOT NULL,
    [Version]                         INT           NOT NULL,
    [PerformanceLevelDescriptorId]    INT           NOT NULL,
    [AssessmentReportingMethodTypeId] INT           NOT NULL,
    [MinimumScore]                    INT           NULL,
    [MaximumScore]                    INT           NULL,
    CONSTRAINT [PK_ObjectiveAssessmentPerformanceLevel] PRIMARY KEY CLUSTERED ([ObjectiveItem] ASC, [AssessmentTitle] ASC, [AcademicSubjectTypeId] ASC, [AssessedGradeLevelTypeId] ASC, [Version] ASC, [PerformanceLevelDescriptorId] ASC, [AssessmentReportingMethodTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ObjectiveAssessmentPerformanceLevel_AssessmentReportingMethodType] FOREIGN KEY ([AssessmentReportingMethodTypeId]) REFERENCES [edfi].[AssessmentReportingMethodType] ([AssessmentReportingMethodTypeId]),
    CONSTRAINT [FK_ObjectiveAssessmentPerformanceLevel_ObjectiveAssessment] FOREIGN KEY ([ObjectiveItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]) REFERENCES [edfi].[ObjectiveAssessment] ([ObjectiveItem], [AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]),
    CONSTRAINT [FK_ObjectiveAssessmentPerformanceLevel_PerformanceLevelDescriptor] FOREIGN KEY ([PerformanceLevelDescriptorId]) REFERENCES [edfi].[PerformanceLevelDescriptor] ([PerformanceLevelDescriptorId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentPerformanceLevel', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentPerformanceLevel', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. If the test assessment spans a range of grades, then this attribute holds the highest grade assessed.  If only one grade level is assessed, then only this attribute is used. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentPerformanceLevel', @level2type = N'COLUMN', @level2name = N'AssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ObjectiveAssessmentPerformanceLevel', @level2type = N'COLUMN', @level2name = N'Version';

