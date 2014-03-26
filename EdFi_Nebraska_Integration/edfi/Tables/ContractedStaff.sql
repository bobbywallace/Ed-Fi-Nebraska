CREATE TABLE [edfi].[ContractedStaff] (
    [StaffUSI]                BIGINT        NOT NULL,
    [EducationOrganizationId] INT           NOT NULL,
    [AccountNumber]           NVARCHAR (50) NOT NULL,
    [FiscalYear]              INT           NOT NULL,
    [AsOfDate]                DATE          NOT NULL,
    [AmountToDate]            MONEY         NOT NULL,
    CONSTRAINT [PK_ContractedStaff] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [EducationOrganizationId] ASC, [AccountNumber] ASC, [FiscalYear] ASC, [AsOfDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ContractedStaff_Account] FOREIGN KEY ([EducationOrganizationId], [AccountNumber], [FiscalYear]) REFERENCES [edfi].[Account] ([EducationOrganizationId], [AccountNumber], [FiscalYear]),
    CONSTRAINT [FK_ContractedStaff_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This financial entity represents the sum of the financal transactions to date for contracted staff. Contracted staff includes "contractors" or "consultants" who perform services for an agreed upon fee, or an employee of a management service contracted to work on site.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ContractedStaff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ContractedStaff', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ContractedStaff', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The financial accounting year.
NEDM: Fiscal Year
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ContractedStaff', @level2type = N'COLUMN', @level2name = N'FiscalYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Current balance (amount paid to contractor) for account for the fiscal year.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ContractedStaff', @level2type = N'COLUMN', @level2name = N'AmountToDate';

