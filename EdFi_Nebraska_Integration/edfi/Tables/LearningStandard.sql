CREATE TABLE [edfi].[LearningStandard] (
    [LearningStandardId]    NVARCHAR (40)   NOT NULL,
    [Description]           NVARCHAR (1024) NOT NULL,
    [ContentStandardTypeId] INT             NULL,
    [GradeLevelTypeId]      INT             NOT NULL,
    [SubjectAreaTypeId]     INT             NOT NULL,
    [CourseTitle]           NVARCHAR (60)   NULL,
    CONSTRAINT [PK_LearningStandard] PRIMARY KEY CLUSTERED ([LearningStandardId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_LearningStandard_AcademicSubjectType] FOREIGN KEY ([SubjectAreaTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_LearningStandard_ContentStandardType] FOREIGN KEY ([ContentStandardTypeId]) REFERENCES [edfi].[ContentStandardType] ([ContentStandardTypeId]),
    CONSTRAINT [FK_LearningStandard_GradeLevelType] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId])
);

