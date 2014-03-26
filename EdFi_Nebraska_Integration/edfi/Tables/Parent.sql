CREATE TABLE [edfi].[Parent] (
    [ParentUSI]                             BIGINT        NOT NULL,
    [PersonalTitlePrefixTypeId]             INT           NULL,
    [FirstName]                             NVARCHAR (75) NOT NULL,
    [MiddleName]                            NVARCHAR (75) NULL,
    [LastSurname]                           NVARCHAR (75) NOT NULL,
    [GenerationCodeSuffixTypeId]            INT           NULL,
    [MaidenName]                            NVARCHAR (35) NULL,
    [PersonalInformationVerificationTypeId] INT           NULL,
    [SexTypeId]                             INT           NULL,
    [LoginId]                               NVARCHAR (60) NULL,
    CONSTRAINT [PKParent] PRIMARY KEY NONCLUSTERED ([ParentUSI] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Parent_GenerationCodeSuffixType] FOREIGN KEY ([GenerationCodeSuffixTypeId]) REFERENCES [edfi].[GenerationCodeSuffixType] ([GenerationCodeSuffixTypeId]),
    CONSTRAINT [FK_Parent_PersonalInformationVerificationType] FOREIGN KEY ([PersonalInformationVerificationTypeId]) REFERENCES [edfi].[PersonalInformationVerificationType] ([PersonalInformationVerificationTypeId]),
    CONSTRAINT [FK_Parent_PersonalTitlePrefixType] FOREIGN KEY ([PersonalTitlePrefixTypeId]) REFERENCES [edfi].[PersonalTitlePrefixType] ([PersonalTitlePrefixTypeId]),
    CONSTRAINT [FK_SexType_Parent] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId])
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents a parent or guardian of a student, such as mother, father, or caretaker.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parent Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent', @level2type = N'COLUMN', @level2name = N'ParentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.
NEDM: First Name
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent', @level2type = N'COLUMN', @level2name = N'FirstName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.
NEDM: Middle Name
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent', @level2type = N'COLUMN', @level2name = N'MiddleName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name borne in common by members of a family.
NEDM: Last Name/Surname
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent', @level2type = N'COLUMN', @level2name = N'LastSurname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).
NEDM: Generation Code / Suffix
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent', @level2type = N'COLUMN', @level2name = N'GenerationCodeSuffixTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The person''s maiden name, if applicable.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent', @level2type = N'COLUMN', @level2name = N'MaidenName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The evidence presented to verify one''s personal identity; for example: drivers license, passport, birth certificate, etc.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent', @level2type = N'COLUMN', @level2name = N'PersonalInformationVerificationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A person''s gender.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Parent', @level2type = N'COLUMN', @level2name = N'SexTypeId';

