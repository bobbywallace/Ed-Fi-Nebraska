CREATE TABLE [edfi].[LanguagesType] (
    [LanguageTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]      NVARCHAR (20)  NOT NULL,
    [Description]    NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKLanguagesType] PRIMARY KEY NONCLUSTERED ([LanguageTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UILanguagesTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

