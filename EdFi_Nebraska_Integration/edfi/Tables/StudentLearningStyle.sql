CREATE TABLE [edfi].[StudentLearningStyle] (
    [StudentUSI]       BIGINT NOT NULL,
    [VisualLearning]   INT    NOT NULL,
    [AuditoryLearning] INT    NOT NULL,
    [TactileLearning]  INT    NOT NULL,
    CONSTRAINT [PK_StudentLearningStyle] PRIMARY KEY CLUSTERED ([StudentUSI] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentLearningStyle_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);

