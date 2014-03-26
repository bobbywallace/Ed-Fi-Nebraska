CREATE TABLE [edfi].[EducationOrganization] (
    [EducationOrganizationId] INT           NOT NULL,
    [StateOrganizationId]     NVARCHAR (60) NOT NULL,
    [NameOfInstitution]       NVARCHAR (75) NOT NULL,
    [ShortNameOfInstitution]  NVARCHAR (60) NULL,
    [WebSite]                 NVARCHAR (80) NULL,
    [OperationalStatusTypeId] INT           NULL,
    [Nomenclature]            NVARCHAR (35) NULL,
    CONSTRAINT [PKEducationOrganization] PRIMARY KEY NONCLUSTERED ([EducationOrganizationId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationOrganization_OperationalStatusType] FOREIGN KEY ([OperationalStatusTypeId]) REFERENCES [edfi].[OperationalStatusType] ([OperationalStatusTypeId])
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents any public or private institution, organization, or agency that provides instructional or support services to students or staff at any level. 
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganization';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganization', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier assigned to an education agency by the State Education Agency (SEA).  Also known as the State LEP ID.
NEDM: IdentificationCode, LEA Identifier (State)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganization', @level2type = N'COLUMN', @level2name = N'StateOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The full, legally accepted name of the institution.
NEDM: Name of Institution
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganization', @level2type = N'COLUMN', @level2name = N'NameOfInstitution';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A short name for the institution.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganization', @level2type = N'COLUMN', @level2name = N'ShortNameOfInstitution';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The public web site address (URL) for the educational organization.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganization', @level2type = N'COLUMN', @level2name = N'WebSite';

