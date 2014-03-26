CREATE TABLE [edfi].[AcademicSubjectType] (
    [AcademicSubjectTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (50)  NOT NULL,
    [Description]           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAcademicSubjectType] PRIMARY KEY NONCLUSTERED ([AcademicSubjectTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAcademicSubjectTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

