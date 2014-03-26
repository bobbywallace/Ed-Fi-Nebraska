CREATE TABLE [edfi].[AssessmentFamilyAssociation] (
    [AssessmentFamilyTitle]              NVARCHAR (60) NOT NULL,
    [AssessmentTitle]                    NVARCHAR (60) NOT NULL,
    [AssessmentAcademicSubjectTypeId]    INT           NOT NULL,
    [AssessmentAssessedGradeLevelTypeId] INT           NOT NULL,
    [AssessmentVersion]                  INT           NOT NULL,
    CONSTRAINT [PK_AssessmentFamilyAssociation] PRIMARY KEY CLUSTERED ([AssessmentFamilyTitle] ASC, [AssessmentTitle] ASC, [AssessmentAcademicSubjectTypeId] ASC, [AssessmentAssessedGradeLevelTypeId] ASC, [AssessmentVersion] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AssessmentFamilyAssociation_Assessment] FOREIGN KEY ([AssessmentTitle], [AssessmentAcademicSubjectTypeId], [AssessmentAssessedGradeLevelTypeId], [AssessmentVersion]) REFERENCES [edfi].[Assessment] ([AssessmentTitle], [AcademicSubjectTypeId], [AssessedGradeLevelTypeId], [Version]),
    CONSTRAINT [FK_AssessmentFamilyAssociation_AssessmentFamily] FOREIGN KEY ([AssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title or name of the assessment.
NEDM: Assessment Title
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentFamilyAssociation', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
NEDM: Assessment Content, Academic Subject
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentFamilyAssociation', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The typical grade level for which an assessment is designed. If the test assessment spans a range of grades, then this attribute holds the highest grade assessed.  If only one grade level is assessed, then only this attribute is used. For example:
Adult
Prekindergarten
First grade
Second grade
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentFamilyAssociation', @level2type = N'COLUMN', @level2name = N'AssessmentAssessedGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version identifier for the test assessment.
NEDM: Assessment Version
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AssessmentFamilyAssociation', @level2type = N'COLUMN', @level2name = N'AssessmentVersion';

