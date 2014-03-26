CREATE TABLE [edfi].[PerformanceLevelDescriptor] (
    [PerformanceLevelDescriptorId]    INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (20)   NULL,
    [Description]                     NVARCHAR (1024) NOT NULL,
    [PerformanceBaseConversionTypeId] INT             NULL,
    CONSTRAINT [PK_PerformanceLevelDescriptor] PRIMARY KEY CLUSTERED ([PerformanceLevelDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_PerformanceLevelDescriptor_PerformanceBaseType] FOREIGN KEY ([PerformanceBaseConversionTypeId]) REFERENCES [edfi].[PerformanceBaseType] ([PerformanceBaseTypeId])
);

