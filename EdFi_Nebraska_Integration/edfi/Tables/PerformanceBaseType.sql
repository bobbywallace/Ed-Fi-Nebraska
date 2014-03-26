CREATE TABLE [edfi].[PerformanceBaseType] (
    [PerformanceBaseTypeId] INT            NOT NULL,
    [CodeValue]             NVARCHAR (20)  NOT NULL,
    [Description]           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_PerformanceBaseType] PRIMARY KEY CLUSTERED ([PerformanceBaseTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IX_PerformanceBaseTypeCodeValue]
    ON [edfi].[PerformanceBaseType]([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE);

