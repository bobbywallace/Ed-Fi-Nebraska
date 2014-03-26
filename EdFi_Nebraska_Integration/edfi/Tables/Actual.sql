CREATE TABLE [edfi].[Actual] (
    [EducationOrganizationId] INT           NOT NULL,
    [AccountNumber]           NVARCHAR (50) NOT NULL,
    [FiscalYear]              INT           NOT NULL,
    [AsOfDate]                DATE          NOT NULL,
    [AmountToDate]            MONEY         NOT NULL,
    CONSTRAINT [PK_Actual] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [AccountNumber] ASC, [FiscalYear] ASC, [AsOfDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Actual_Account] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This financial entity represents the sum of the financal transactions to date relating to a specific account.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Actual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Actual', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The financial accounting year.
NEDM: Fiscal Year
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Actual', @level2type = N'COLUMN', @level2name = N'FiscalYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Current balance for the account.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Actual', @level2type = N'COLUMN', @level2name = N'AmountToDate';

