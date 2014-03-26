CREATE TABLE [edfi].[StudentCohortAssociation] (
    [StudentUSI]              BIGINT        NOT NULL,
    [EducationOrganizationId] INT           NOT NULL,
    [CohortIdentifier]        NVARCHAR (20) NOT NULL,
    [BeginDate]               DATE          NOT NULL,
    [EndDate]                 DATE          NULL,
    CONSTRAINT [PK_StudentCohortAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [EducationOrganizationId] ASC, [CohortIdentifier] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentCohortAssociation_Cohort] FOREIGN KEY ([EducationOrganizationId], [CohortIdentifier]) REFERENCES [edfi].[Cohort] ([EducationOrganizationId], [CohortIdentifier]),
    CONSTRAINT [FK_StudentCohortAssociation_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCohortAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCohortAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCohortAssociation', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name or ID for the cohort.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCohortAssociation', @level2type = N'COLUMN', @level2name = N'CohortIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The start date for assignment to this cohort.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCohortAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The end date for assignment to this cohort.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCohortAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';

