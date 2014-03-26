CREATE TABLE [edfi].[RetestIndicatorType] (
    [RetestIndicatorTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (20)  NOT NULL,
    [Description]           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKRetestIndicatorType] PRIMARY KEY NONCLUSTERED ([RetestIndicatorTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIRetestIndicatorTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

