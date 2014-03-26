CREATE TABLE [edfi].[StudentRace] (
    [StudentUSI] BIGINT NOT NULL,
    [RaceTypeId] INT    NOT NULL,
    CONSTRAINT [PK_StudentRace] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [RaceTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RaceType_StudentRace] FOREIGN KEY ([RaceTypeId]) REFERENCES [edfi].[RaceType] ([RaceTypeId]),
    CONSTRAINT [FK_StudentRace_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);

