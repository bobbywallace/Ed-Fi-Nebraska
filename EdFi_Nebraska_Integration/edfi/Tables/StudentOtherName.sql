CREATE TABLE [edfi].[StudentOtherName] (
    [StudentUSI]                 BIGINT        NOT NULL,
    [OtherNameTypeId]            INT           NOT NULL,
    [PersonalTitlePrefixTypeId]  INT           NULL,
    [FirstName]                  NVARCHAR (75) NOT NULL,
    [MiddleName]                 NVARCHAR (75) NULL,
    [LastSurname]                NVARCHAR (75) NOT NULL,
    [GenerationCodeSuffixTypeId] INT           NULL,
    CONSTRAINT [PK_StudentOtherName] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [OtherNameTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentOtherName_GenerationCodeSuffixType] FOREIGN KEY ([GenerationCodeSuffixTypeId]) REFERENCES [edfi].[GenerationCodeSuffixType] ([GenerationCodeSuffixTypeId]),
    CONSTRAINT [FK_StudentOtherName_OtherNameType] FOREIGN KEY ([OtherNameTypeId]) REFERENCES [edfi].[OtherNameType] ([OtherNameTypeId]),
    CONSTRAINT [FK_StudentOtherName_PersonalTitlePrefixType] FOREIGN KEY ([PersonalTitlePrefixTypeId]) REFERENCES [edfi].[PersonalTitlePrefixType] ([PersonalTitlePrefixTypeId]),
    CONSTRAINT [FK_StudentOtherName_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A prefix used to denote the title, degree, position or seniority of the person.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentOtherName', @level2type = N'COLUMN', @level2name = N'PersonalTitlePrefixTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.
NEDM: First Name
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentOtherName', @level2type = N'COLUMN', @level2name = N'FirstName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.
NEDM: Middle Name
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentOtherName', @level2type = N'COLUMN', @level2name = N'MiddleName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name borne in common by members of a family.
NEDM: Last Name/Surname
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentOtherName', @level2type = N'COLUMN', @level2name = N'LastSurname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).
NEDM: Generation Code / Suffix
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentOtherName', @level2type = N'COLUMN', @level2name = N'GenerationCodeSuffixTypeId';

