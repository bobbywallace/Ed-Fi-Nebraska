CREATE TABLE [edfi].[CourseRepeatCodeType] (
    [CourseRepeatCodeTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]              NVARCHAR (20)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCourseRepeatCodeType] PRIMARY KEY NONCLUSTERED ([CourseRepeatCodeTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICourseRepeatCodeTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

