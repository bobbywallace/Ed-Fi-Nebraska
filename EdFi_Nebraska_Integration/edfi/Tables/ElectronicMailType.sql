CREATE TABLE [edfi].[ElectronicMailType] (
    [ElectronicMailTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]            NVARCHAR (20)  NOT NULL,
    [Description]          NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_ElectronicMailType] PRIMARY KEY CLUSTERED ([ElectronicMailTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

