CREATE TABLE [edfi].[StaffIdentificationSystemType] (
    [StaffIdentificationSystemTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (50)  NOT NULL,
    [Description]                     NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_StaffIdentificationSystemType] PRIMARY KEY CLUSTERED ([StaffIdentificationSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

