CREATE TABLE [edfi].[Cohort] (
    [EducationOrganizationId] INT             NOT NULL,
    [CohortIdentifier]        NVARCHAR (20)   NOT NULL,
    [CohortDescription]       NVARCHAR (1024) NULL,
    [CohortTypeId]            INT             NOT NULL,
    [CohortScopeTypeId]       INT             NULL,
    [AcademicSubjectTypeId]   INT             NULL,
    CONSTRAINT [PK_Cohort] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [CohortIdentifier] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AcademicSubjectType_Cohort] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_Cohort_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_CohortScopeType_Cohort] FOREIGN KEY ([CohortScopeTypeId]) REFERENCES [edfi].[CohortScopeType] ([CohortScopeTypeId]),
    CONSTRAINT [FK_CohortTypeType_Cohort] FOREIGN KEY ([CohortTypeId]) REFERENCES [edfi].[CohortType] ([CohortTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identification of a named and managed cohort of students for tracking or intervention purposes.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Cohort';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Cohort', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name or ID for the cohort.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Cohort', @level2type = N'COLUMN', @level2name = N'CohortIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of he cohort and its purpose.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Cohort', @level2type = N'COLUMN', @level2name = N'CohortDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of the cohort (academic intervention, attendance intervention, discipline intervention, breakout session, etc.)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Cohort', @level2type = N'COLUMN', @level2name = N'CohortTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The scope of cohort (e.g., campus, district, classroom, etc.)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Cohort', @level2type = N'COLUMN', @level2name = N'CohortScopeTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The subject for an academic intervention (e.g., science, mathematics, etc.)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Cohort', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';

