CREATE TABLE [edfi].[ReporterDescriptionType] (
    [ReporterDescriptionTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                 NVARCHAR (20)  NOT NULL,
    [Description]               NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKReporterDescriptionType] PRIMARY KEY NONCLUSTERED ([ReporterDescriptionTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIReporterDescriptionTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

