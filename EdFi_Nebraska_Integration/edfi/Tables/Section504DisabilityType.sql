CREATE TABLE [edfi].[Section504DisabilityType] (
    [Section504DisabilityTypeId] INT            NOT NULL,
    [CodeValue]                  NVARCHAR (20)  NOT NULL,
    [Description]                NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Section504DisabilityType] PRIMARY KEY CLUSTERED ([Section504DisabilityTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

