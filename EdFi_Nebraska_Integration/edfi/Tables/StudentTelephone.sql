CREATE TABLE [edfi].[StudentTelephone] (
    [StudentUSI]                      BIGINT        NOT NULL,
    [TelephoneNumberTypeId]           INT           NOT NULL,
    [PrimaryTelephoneNumberIndicator] BIT           NULL,
    [TelephoneNumber]                 NVARCHAR (24) NOT NULL,
    CONSTRAINT [PK_StudentTelephone] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [TelephoneNumberTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentTelephone_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]),
    CONSTRAINT [FK_StudentTelephone_TelephoneNumberType] FOREIGN KEY ([TelephoneNumberTypeId]) REFERENCES [edfi].[TelephoneNumberType] ([TelephoneNumberTypeId])
);

