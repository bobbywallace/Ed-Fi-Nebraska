CREATE TABLE [edfi].[LocalEducationAgency] (
    [LocalEducationAgencyId]       INT NOT NULL,
    [LEACategoryTypeId]            INT NOT NULL,
    [CharterStatusTypeId]          INT NULL,
    [EducationServiceCenterId]     INT NULL,
    [StateEducationAgencyId]       INT NULL,
    [ParentLocalEducationAgencyId] INT NULL,
    CONSTRAINT [PKLocalEducationAgency] PRIMARY KEY NONCLUSTERED ([LocalEducationAgencyId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CharterStatusType_LocalEducationAgency] FOREIGN KEY ([CharterStatusTypeId]) REFERENCES [edfi].[CharterStatusType] ([CharterStatusTypeId]),
    CONSTRAINT [FK_LEACategoryType_LocalEducationAgency] FOREIGN KEY ([LEACategoryTypeId]) REFERENCES [edfi].[LEACategoryType] ([LEACategoryTypeId]),
    CONSTRAINT [FK_LocalEducationAgency_EducationOrganization] FOREIGN KEY ([LocalEducationAgencyId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_LocalEducationAgency_EducationServiceCenter] FOREIGN KEY ([EducationServiceCenterId]) REFERENCES [edfi].[EducationServiceCenter] ([EducationServiceCenterId]),
    CONSTRAINT [FK_LocalEducationAgency_StateEducationAgency] FOREIGN KEY ([StateEducationAgencyId]) REFERENCES [edfi].[StateEducationAgency] ([StateEducationAgencyId])
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents an administrative unit at the local level which exists primarily to operate schools or to contract for educational services.  It includes school districts, charter schools, charter management organizations, or other local administrative organizations.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'LocalEducationAgency Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'LocalEducationAgencyId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The category of LEA/district (e.g.,  Independent or Charter)

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'LEACategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A school or agency providing free public elementary or secondary education to eligible students under a specific charter granted by the state legislature or other appropriate authority and designated by such authority to be a charter school.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgency', @level2type = N'COLUMN', @level2name = N'CharterStatusTypeId';

