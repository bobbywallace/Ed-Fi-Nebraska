CREATE TABLE [edfi].[SeparationReasonType] (
    [SeparationReasonTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]              NVARCHAR (50)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKSeparationReasonType] PRIMARY KEY NONCLUSTERED ([SeparationReasonTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UISeparationReasonTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

