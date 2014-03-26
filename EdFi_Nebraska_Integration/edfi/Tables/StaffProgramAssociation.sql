CREATE TABLE [edfi].[StaffProgramAssociation] (
    [EducationOrganizationId] INT    NOT NULL,
    [ProgramTypeId]           INT    NOT NULL,
    [StaffUSI]                BIGINT NOT NULL,
    [BeginDate]               DATE   NOT NULL,
    [EndDate]                 DATE   NULL,
    [StudentRecordAccess]     BIT    NULL,
    CONSTRAINT [PK_StaffProgramAssociation] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [ProgramTypeId] ASC, [StaffUSI] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StaffProgramAssociation_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramTypeId]) REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramTypeId]),
    CONSTRAINT [FK_StaffProgramAssociation_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffProgramAssociation', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student first received services.
NEDM: Beginning Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffProgramAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student exited the program or stopped receiving services.
NEDM: Ending Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffProgramAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';

