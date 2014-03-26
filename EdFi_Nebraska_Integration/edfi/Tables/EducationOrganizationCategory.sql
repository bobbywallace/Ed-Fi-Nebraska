CREATE TABLE [edfi].[EducationOrganizationCategory] (
    [EducationOrganizationId]             INT NOT NULL,
    [EducationOrganizationCategoryTypeId] INT NOT NULL,
    CONSTRAINT [PK_EducationOrganizationCategory] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [EducationOrganizationCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationOrganizationCategory_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_EducationOrganizationCategory_EducationOrganizationCategoryType] FOREIGN KEY ([EducationOrganizationCategoryTypeId]) REFERENCES [edfi].[EducationOrganizationCategoryType] ([EducationOrganizationCategoryTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The classification of the education agency within the geographic boundaries of a state according to the level of administrative and operational control granted by the state.
NEDM: Agency Type
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationCategory', @level2type = N'COLUMN', @level2name = N'EducationOrganizationCategoryTypeId';

