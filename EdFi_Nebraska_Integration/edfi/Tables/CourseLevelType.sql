CREATE TABLE [edfi].[CourseLevelType] (
    [CourseLevelTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]         NVARCHAR (20)  NOT NULL,
    [Description]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCourseLevelType] PRIMARY KEY NONCLUSTERED ([CourseLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICourseLevelTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

