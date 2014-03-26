CREATE TABLE [edfi].[SchoolGradesOffered] (
    [SchoolId]            INT NOT NULL,
    [GradesOfferedTypeId] INT NOT NULL,
    CONSTRAINT [PK_SchoolGradesOffered] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [GradesOfferedTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_SchoolGradesOffered_GradeLevelType] FOREIGN KEY ([GradesOfferedTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_SchoolGradesOffered_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
);

