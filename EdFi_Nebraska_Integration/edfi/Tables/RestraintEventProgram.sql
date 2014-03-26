CREATE TABLE [edfi].[RestraintEventProgram] (
    [StudentUSI]               BIGINT        NOT NULL,
    [SchoolId]                 INT           NOT NULL,
    [RestraintEventIdentifier] NVARCHAR (20) NOT NULL,
    [EventDate]                DATE          NOT NULL,
    [ProgramTypeId]            INT           NOT NULL,
    [BeginDate]                DATE          NOT NULL,
    CONSTRAINT [PK_RestraintEventProgram] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [RestraintEventIdentifier] ASC, [EventDate] ASC, [ProgramTypeId] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RestraintEventProgram_RestraintEvent] FOREIGN KEY ([StudentUSI], [SchoolId], [RestraintEventIdentifier], [EventDate]) REFERENCES [edfi].[RestraintEvent] ([StudentUSI], [SchoolId], [RestraintEventIdentifier], [EventDate]),
    CONSTRAINT [FK_RestraintEventProgram_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [ProgramTypeId], [SchoolId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventProgram', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventProgram', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a restraint event by a school, school system, a state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventProgram', @level2type = N'COLUMN', @level2name = N'RestraintEventIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the resteraint event.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventProgram', @level2type = N'COLUMN', @level2name = N'EventDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student first received services.
NEDM: Beginning Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventProgram', @level2type = N'COLUMN', @level2name = N'BeginDate';

