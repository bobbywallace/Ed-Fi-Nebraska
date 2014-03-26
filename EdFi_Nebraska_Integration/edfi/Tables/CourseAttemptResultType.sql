CREATE TABLE [edfi].[CourseAttemptResultType] (
    [CourseAttemptResultTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                 NVARCHAR (20)  NOT NULL,
    [Description]               NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCourseAttemptResultType] PRIMARY KEY NONCLUSTERED ([CourseAttemptResultTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICourseAttemptResultTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

