CREATE TABLE [edfi].[StudentProgramParticipations] (
    [StudentUSI]    BIGINT        NOT NULL,
    [ProgramTypeId] INT           NOT NULL,
    [BeginDate]     DATETIME      NULL,
    [EndDate]       DATETIME      NULL,
    [DesignatedBy]  NVARCHAR (60) NULL,
    CONSTRAINT [PK_StudentProgramParticipations] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [ProgramTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentProgramParticipations_ProgramType] FOREIGN KEY ([ProgramTypeId]) REFERENCES [edfi].[ProgramType] ([ProgramTypeId]),
    CONSTRAINT [FK_StudentProgramParticipations_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);

