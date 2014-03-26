CREATE TABLE [edfi].[SeparationType] (
    [SeparationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (25)  NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKSeparationType] PRIMARY KEY NONCLUSTERED ([SeparationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UISeparationTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

