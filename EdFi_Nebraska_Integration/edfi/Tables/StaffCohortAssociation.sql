CREATE TABLE [edfi].[StaffCohortAssociation] (
    [StaffUSI]                BIGINT        NOT NULL,
    [EducationOrganizationId] INT           NOT NULL,
    [CohortIdentifier]        NVARCHAR (20) NOT NULL,
    [BeginDate]               DATE          NOT NULL,
    [EndDate]                 DATE          NULL,
    [StudentRecordAccess]     BIT           NULL,
    CONSTRAINT [PK_StaffCohortAssociation] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [EducationOrganizationId] ASC, [CohortIdentifier] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StaffCohortAssociation_Cohort] FOREIGN KEY ([EducationOrganizationId], [CohortIdentifier]) REFERENCES [edfi].[Cohort] ([EducationOrganizationId], [CohortIdentifier]),
    CONSTRAINT [FK_StaffCohortAssociation_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffCohortAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffCohortAssociation', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffCohortAssociation', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name or ID for the cohort.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffCohortAssociation', @level2type = N'COLUMN', @level2name = N'CohortIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The start date the staff was associated with the cohort.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffCohortAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The end date of the staff association with the cohort.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffCohortAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of whether the staff has access to the student records of the cohort per district interpretation of FERPA and other privacy laws, regulations and policies.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffCohortAssociation', @level2type = N'COLUMN', @level2name = N'StudentRecordAccess';

