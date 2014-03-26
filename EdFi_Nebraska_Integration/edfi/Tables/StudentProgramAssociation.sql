CREATE TABLE [edfi].[StudentProgramAssociation] (
    [StudentUSI]              BIGINT NOT NULL,
    [ProgramTypeId]           INT    NOT NULL,
    [EducationOrganizationId] INT    NOT NULL,
    [BeginDate]               DATE   NOT NULL,
    [EndDate]                 DATE   NULL,
    [ReasonExitedTypeId]      INT    NULL,
    CONSTRAINT [PK_StudentProgramAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [ProgramTypeId] ASC, [EducationOrganizationId] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ReasonExitedType_StudentProgramAssociation] FOREIGN KEY ([ReasonExitedTypeId]) REFERENCES [edfi].[ReasonExitedType] ([ReasonExitedTypeId]),
    CONSTRAINT [FK_StudentProgramAssociation_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId]),
    CONSTRAINT [FK_StudentProgramAssociation_ProgramType] FOREIGN KEY ([ProgramTypeId]) REFERENCES [edfi].[ProgramType] ([ProgramTypeId]),
    CONSTRAINT [FK_StudentProgramAssociation_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the program(s) that a student participates in or is served by.
NEDM: ServedByProgram
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student first received services.
NEDM: Beginning Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student exited the program or stopped receiving services.
NEDM: Ending Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The reason the child left the program within a school or district.
NEDM: Reason Exited
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociation', @level2type = N'COLUMN', @level2name = N'ReasonExitedTypeId';

