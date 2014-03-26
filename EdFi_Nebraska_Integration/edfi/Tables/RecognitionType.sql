CREATE TABLE [edfi].[RecognitionType] (
    [RecognitionTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]         NVARCHAR (20)  NOT NULL,
    [Description]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_RecognitionType] PRIMARY KEY CLUSTERED ([RecognitionTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

