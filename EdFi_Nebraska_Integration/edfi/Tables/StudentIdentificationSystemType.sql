CREATE TABLE [edfi].[StudentIdentificationSystemType] (
    [StudentIdentificationSystemTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                         NVARCHAR (50)  NOT NULL,
    [Description]                       NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_StudentIdentificationSystemType] PRIMARY KEY CLUSTERED ([StudentIdentificationSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

