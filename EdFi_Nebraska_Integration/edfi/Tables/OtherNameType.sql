CREATE TABLE [edfi].[OtherNameType] (
    [OtherNameTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]       NVARCHAR (50)  NOT NULL,
    [Description]     NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_OtherNameType] PRIMARY KEY CLUSTERED ([OtherNameTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

