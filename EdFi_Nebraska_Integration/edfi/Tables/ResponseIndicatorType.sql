CREATE TABLE [edfi].[ResponseIndicatorType] (
    [ResponseIndicatorTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (20)  NOT NULL,
    [Description]             NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKResponseIndicatorType] PRIMARY KEY NONCLUSTERED ([ResponseIndicatorTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIResponseIndicatorTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

