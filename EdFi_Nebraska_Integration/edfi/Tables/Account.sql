CREATE TABLE [edfi].[Account] (
    [EducationOrganizationId] INT           NOT NULL,
    [AccountNumber]           NVARCHAR (50) NOT NULL,
    [FiscalYear]              INT           NOT NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [AccountNumber] ASC, [FiscalYear] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Account_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This financial entity represents a funding source combined with its purpose and type of transaction.  It provides a formal record of the debits and credits relating to the specific account.
NEDM: Financial Account
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Account', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The financial accounting year.
NEDM: Fiscal Year
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Account', @level2type = N'COLUMN', @level2name = N'FiscalYear';

