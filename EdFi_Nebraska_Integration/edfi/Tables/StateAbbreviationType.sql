CREATE TABLE [edfi].[StateAbbreviationType] (
    [StateAbbreviationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (20)  NOT NULL,
    [Description]             NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKStateAbbreviationType] PRIMARY KEY NONCLUSTERED ([StateAbbreviationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIStateAbbreviationTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

