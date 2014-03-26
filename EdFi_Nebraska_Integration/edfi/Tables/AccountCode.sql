CREATE TABLE [edfi].[AccountCode] (
    [EducationOrganizationId] INT           NOT NULL,
    [AccountNumber]           NVARCHAR (50) NOT NULL,
    [FiscalYear]              INT           NOT NULL,
    [AccountCodeDescriptorId] INT           NOT NULL,
    CONSTRAINT [PK_AccountCode] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [AccountNumber] ASC, [FiscalYear] ASC, [AccountCodeDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AccountCode_Account] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear]),
    CONSTRAINT [FK_AccountCode_AccountCodeDescriptor] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[AccountCodeDescriptor] ([AccountCodeDescriptorId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountCode', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The financial accounting year.
NEDM: Fiscal Year
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountCode', @level2type = N'COLUMN', @level2name = N'FiscalYear';

