CREATE TABLE [edfi].[AssessmentFamily] (
    [AssessmentFamilyTitle]          NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]          INT           NULL,
    [AssessedGradeLevelTypeId]       INT           NULL,
    [Version]                        INT           NULL,
    [AssessmentCategoryTypeId]       INT           NULL,
    [LowestAssessedGradeLevelTypeId] INT           NULL,
    [ContentStandardTypeId]          INT           NULL,
    [RevisionDate]                   DATE          NULL,
    [Nomenclature]                   NVARCHAR (35) NULL,
    [ParentAssessmentFamilyTitle]    NVARCHAR (60) NULL,
    CONSTRAINT [PK_AssessmentFamily] PRIMARY KEY CLUSTERED ([AssessmentFamilyTitle] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AssessmentFamily_AcademicSubjectType] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_AssessmentFamily_AssessmentCategoryType] FOREIGN KEY ([AssessmentCategoryTypeId]) REFERENCES [edfi].[AssessmentCategoryType] ([AssessmentCategoryTypeId]),
    CONSTRAINT [FK_AssessmentFamily_AssessmentFamily] FOREIGN KEY ([ParentAssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle]),
    CONSTRAINT [FK_AssessmentFamily_ContentStandardType] FOREIGN KEY ([ContentStandardTypeId]) REFERENCES [edfi].[ContentStandardType] ([ContentStandardTypeId]),
    CONSTRAINT [FK_AssessmentFamily_GradeLevelType] FOREIGN KEY ([AssessedGradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_AssessmentFamily_GradeLevelType1] FOREIGN KEY ([LowestAssessedGradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId])
);

