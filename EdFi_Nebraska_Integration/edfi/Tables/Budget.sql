CREATE TABLE [edfi].[Budget] (
    [EducationOrganizationId] INT           NOT NULL,
    [AccountNumber]           NVARCHAR (50) NOT NULL,
    [FiscalYear]              INT           NOT NULL,
    [AsOfDate]                DATE          NOT NULL,
    [Amount]                  MONEY         NOT NULL,
    CONSTRAINT [PK_Budget] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [AccountNumber] ASC, [FiscalYear] ASC, [AsOfDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Budget_Account] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This financial entity represents the amount of monies allocated to be spent or received by an education organization as related to a specific account.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Budget';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Budget', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The financial accounting year.
NEDM: Fiscal Year
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Budget', @level2type = N'COLUMN', @level2name = N'FiscalYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Amount budgeted for the account for this fiscal year.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Budget', @level2type = N'COLUMN', @level2name = N'Amount';

