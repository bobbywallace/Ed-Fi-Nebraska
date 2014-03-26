CREATE TABLE [edfi].[CompetencyLevelDescriptor] (
    [CompetencyLevelDescriptorId]     INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (20)   NOT NULL,
    [Description]                     NVARCHAR (1024) NULL,
    [PerformanceBaseConversionTypeId] INT             NULL,
    CONSTRAINT [PK_CompetencyLevelDescriptor] PRIMARY KEY CLUSTERED ([CompetencyLevelDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CompetencyLevelDescriptor_PerformanceBaseType] FOREIGN KEY ([PerformanceBaseConversionTypeId]) REFERENCES [edfi].[PerformanceBaseType] ([PerformanceBaseTypeId])
);

