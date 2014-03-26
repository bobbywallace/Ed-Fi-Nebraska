CREATE TABLE [edfi].[ContentStandardType] (
    [ContentStandardTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (40)  NOT NULL,
    [Description]           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKContentStandardType] PRIMARY KEY NONCLUSTERED ([ContentStandardTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIContentStandardTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

