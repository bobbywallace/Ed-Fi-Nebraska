CREATE TABLE [edfi].[EducationOrgIdentificationCode] (
    [EducationOrganizationId]                INT           NOT NULL,
    [EducationOrgIdentificationSystemTypeId] INT           NOT NULL,
    [EducationOrgIdentificationCode]         NVARCHAR (60) NOT NULL,
    CONSTRAINT [PK_EducationOrgIdentificationCode] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [EducationOrgIdentificationSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationOrgIdentificationCode_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_EducationOrgIdentificationCode_EducationOrgIdentificationSystemType] FOREIGN KEY ([EducationOrgIdentificationSystemTypeId]) REFERENCES [edfi].[EducationOrgIdentificationSystemType] ([EducationOrgIdentificationSystemTypeId])
);

