CREATE TABLE [edfi].[PersonalTitlePrefixType] (
    [PersonalTitlePrefixTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                 NVARCHAR (20)  NOT NULL,
    [Description]               NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_PersonalTitlePrefixType] PRIMARY KEY CLUSTERED ([PersonalTitlePrefixTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

