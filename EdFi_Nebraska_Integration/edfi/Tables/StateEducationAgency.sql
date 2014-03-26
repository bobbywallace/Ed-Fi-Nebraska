CREATE TABLE [edfi].[StateEducationAgency] (
    [StateEducationAgencyId] INT NOT NULL,
    CONSTRAINT [PK_StateEducationAgency] PRIMARY KEY CLUSTERED ([StateEducationAgencyId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StateEducationAgency_EducationOrganization] FOREIGN KEY ([StateEducationAgencyId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
);

