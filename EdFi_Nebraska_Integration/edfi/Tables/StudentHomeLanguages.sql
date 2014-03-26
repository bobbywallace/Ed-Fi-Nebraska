CREATE TABLE [edfi].[StudentHomeLanguages] (
    [StudentUSI]     BIGINT NOT NULL,
    [LanguageTypeId] INT    NOT NULL,
    CONSTRAINT [PK_StudentHomeLanguages] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [LanguageTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentHomeLanguages_LanguagesType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [edfi].[LanguagesType] ([LanguageTypeId]),
    CONSTRAINT [FK_StudentHomeLanguages_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);

