CREATE TABLE [edfi].[DiplomaLevelType] (
    [DiplomaLevelTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (20)  NOT NULL,
    [Description]        NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKDiplomaLevelType] PRIMARY KEY NONCLUSTERED ([DiplomaLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIDiplomaLevelTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

