CREATE TABLE [edfi].[EducationOrganizationTelephone] (
    [EducationOrganizationId]          INT           NOT NULL,
    [InstitutionTelephoneNumberTypeId] INT           NOT NULL,
    [TelephoneNumber]                  NVARCHAR (24) NOT NULL,
    CONSTRAINT [PK_EducationOrganizationTelephone] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [InstitutionTelephoneNumberTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationOrganizationTelephone_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_EducationOrganizationTelephone_InstitutionTelephoneNumberType] FOREIGN KEY ([InstitutionTelephoneNumberTypeId]) REFERENCES [edfi].[InstitutionTelephoneNumberType] ([InstitutionTelephoneNumberTypeId])
);

