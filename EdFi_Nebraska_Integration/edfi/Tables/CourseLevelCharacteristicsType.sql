CREATE TABLE [edfi].[CourseLevelCharacteristicsType] (
    [CourseLevelCharacteristicsTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                        NVARCHAR (40)  NOT NULL,
    [Description]                      NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCourseLevelCharacteristicsType] PRIMARY KEY NONCLUSTERED ([CourseLevelCharacteristicsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICourseLevelCharacteristicsTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

