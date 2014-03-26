CREATE TABLE [edfi].[CohortProgram] (
    [EducationOrganizationId] INT           NOT NULL,
    [CohortIdentifier]        NVARCHAR (20) NOT NULL,
    [ProgramTypeId]           INT           NOT NULL,
    CONSTRAINT [PK_CohortProgram] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [CohortIdentifier] ASC, [ProgramTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CohortProgram_Cohort] FOREIGN KEY ([EducationOrganizationId], [CohortIdentifier]) REFERENCES [edfi].[Cohort] ([EducationOrganizationId], [CohortIdentifier]),
    CONSTRAINT [FK_CohortProgram_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CohortProgram', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name or ID for the cohort.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CohortProgram', @level2type = N'COLUMN', @level2name = N'CohortIdentifier';

