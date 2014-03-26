CREATE TABLE [edfi].[AccountCodeDescriptor] (
    [AccountCodeDescriptorId] INT             IDENTITY (1, 1) NOT NULL,
    [EducationOrganizationId] INT             NOT NULL,
    [AccountCodeType]         NVARCHAR (20)   NOT NULL,
    [CodeValue]               NVARCHAR (20)   NOT NULL,
    [Description]             NVARCHAR (1024) NOT NULL,
    [ShortDescription]        NVARCHAR (50)   NULL,
    [BeginDate]               DATE            NULL,
    [EndDate]                 DATE            NULL,
    CONSTRAINT [PK_AccountCodeDescriptor] PRIMARY KEY CLUSTERED ([AccountCodeDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AccountCodeDescriptor_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountCodeDescriptor', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';

