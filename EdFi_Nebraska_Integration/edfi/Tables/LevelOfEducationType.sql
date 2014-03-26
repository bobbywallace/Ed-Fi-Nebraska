CREATE TABLE [edfi].[LevelOfEducationType] (
    [LevelOfEducationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]              NVARCHAR (20)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKLevelOfEducationType] PRIMARY KEY NONCLUSTERED ([LevelOfEducationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UILevelOfEducationTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

