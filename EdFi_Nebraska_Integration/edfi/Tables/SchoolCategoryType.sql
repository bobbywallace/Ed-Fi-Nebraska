CREATE TABLE [edfi].[SchoolCategoryType] (
    [SchoolCategoryTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]            NVARCHAR (30)  NOT NULL,
    [Description]          NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKSchoolCategoryType] PRIMARY KEY NONCLUSTERED ([SchoolCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UISchoolCategoryTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

