CREATE TABLE [edfi].[GenerationCodeSuffixType] (
    [GenerationCodeSuffixTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                  NVARCHAR (20)  NOT NULL,
    [Description]                NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKGenerationCodeSuffixType] PRIMARY KEY NONCLUSTERED ([GenerationCodeSuffixTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIGenerationCodeSuffixTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

