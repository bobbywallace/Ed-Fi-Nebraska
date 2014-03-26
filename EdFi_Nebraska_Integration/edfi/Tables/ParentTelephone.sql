CREATE TABLE [edfi].[ParentTelephone] (
    [ParentUSI]                       BIGINT        NOT NULL,
    [TelephoneNumberTypeId]           INT           NOT NULL,
    [PrimaryTelephoneNumberIndicator] BIT           NULL,
    [TelephoneNumber]                 NVARCHAR (24) NOT NULL,
    CONSTRAINT [PK_ParentTelephone] PRIMARY KEY CLUSTERED ([ParentUSI] ASC, [TelephoneNumberTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ParentTelephone_Parent] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI]),
    CONSTRAINT [FK_ParentTelephone_TelephoneNumberType] FOREIGN KEY ([TelephoneNumberTypeId]) REFERENCES [edfi].[TelephoneNumberType] ([TelephoneNumberTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parent Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ParentTelephone', @level2type = N'COLUMN', @level2name = N'ParentUSI';

