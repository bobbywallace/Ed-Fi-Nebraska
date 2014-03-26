CREATE TABLE [edfi].[StaffTelephone] (
    [StaffUSI]                        BIGINT        NOT NULL,
    [TelephoneNumberTypeId]           INT           NOT NULL,
    [PrimaryTelephoneNumberIndicator] BIT           NULL,
    [TelephoneNumber]                 NVARCHAR (24) NOT NULL,
    CONSTRAINT [PK_StaffTelephone] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [TelephoneNumberTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StaffTelephone_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]),
    CONSTRAINT [FK_StaffTelephone_TelephoneNumberType] FOREIGN KEY ([TelephoneNumberTypeId]) REFERENCES [edfi].[TelephoneNumberType] ([TelephoneNumberTypeId])
);

