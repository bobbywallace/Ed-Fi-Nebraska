CREATE TABLE [edfi].[TelephoneNumberType] (
    [TelephoneNumberTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (50)  NOT NULL,
    [Description]           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_TelephoneNumberType] PRIMARY KEY CLUSTERED ([TelephoneNumberTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

