CREATE TABLE [edfi].[StudentCharacteristicsType] (
    [StudentCharacteristicsTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                    NVARCHAR (20)  NOT NULL,
    [Description]                  NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKStudentCharacteristicsType] PRIMARY KEY NONCLUSTERED ([StudentCharacteristicsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIStudentCharacteristicsTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

