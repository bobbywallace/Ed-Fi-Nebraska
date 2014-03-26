CREATE TABLE [edfi].[StudentLanguages] (
    [StudentUSI]     BIGINT NOT NULL,
    [LanguageTypeId] INT    NOT NULL,
    CONSTRAINT [PK_StudentLanguages] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [LanguageTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_LanguagesType_StudentLanguages] FOREIGN KEY ([LanguageTypeId]) REFERENCES [edfi].[LanguagesType] ([LanguageTypeId]),
    CONSTRAINT [FK_StudentLanguages_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);

