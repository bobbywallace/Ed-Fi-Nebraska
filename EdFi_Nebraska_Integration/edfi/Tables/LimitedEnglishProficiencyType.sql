CREATE TABLE [edfi].[LimitedEnglishProficiencyType] (
    [LimitedEnglishProficiencyTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (20)  NOT NULL,
    [Description]                     NVARCHAR (400) NOT NULL,
    CONSTRAINT [PKLimitedEnglishProficiencyType] PRIMARY KEY NONCLUSTERED ([LimitedEnglishProficiencyTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UILimitedEnglishProficiencyTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

