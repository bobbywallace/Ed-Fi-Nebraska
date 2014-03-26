CREATE TABLE [edfi].[EducationOrganizationCategoryType] (
    [EducationOrganizationCategoryTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [OrganizationCategory]                NVARCHAR (30)  NOT NULL,
    [Description]                         NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKOrganizationCategoryType] PRIMARY KEY NONCLUSTERED ([EducationOrganizationCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIOrganizationCategoryTypeCodeValue] UNIQUE NONCLUSTERED ([OrganizationCategory] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

