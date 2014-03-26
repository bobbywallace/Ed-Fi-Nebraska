CREATE TABLE [edfi].[OperationalStatusType] (
    [OperationalStatusTypeId] INT            NOT NULL,
    [CodeValue]               NVARCHAR (50)  NOT NULL,
    [Description]             NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_OperationalStatusType] PRIMARY KEY CLUSTERED ([OperationalStatusTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

