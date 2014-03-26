CREATE TABLE [edfi].[StudentTitleIPartAProgramAssociation] (
    [StudentUSI]                   BIGINT NOT NULL,
    [ProgramTypeId]                INT    NOT NULL,
    [EducationOrganizationId]      INT    NOT NULL,
    [BeginDate]                    DATE   NOT NULL,
    [TitleIPartAParticipantTypeId] INT    NOT NULL,
    CONSTRAINT [PK_StudentTitleIPartAProgramAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [ProgramTypeId] ASC, [EducationOrganizationId] ASC, [BeginDate] ASC, [TitleIPartAParticipantTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentTitleIPartAProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate]),
    CONSTRAINT [FK_TitleIPartAParticipantType_StudentTitleIPartAProgramAssociation] FOREIGN KEY ([TitleIPartAParticipantTypeId]) REFERENCES [edfi].[TitleIPartAParticipantType] ([TitleIPartAParticipantTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the Title I Part A program(s) that a student participates in or receives services from.  The association is an extension of the StudentProgramAssociation particular for Title I part A programs.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentTitleIPartAProgramAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student first received services.
NEDM: Beginning Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentTitleIPartAProgramAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the type of Title I program, if any, in which the student is participating and served:
Public Targeted Assistance Program
Public Schoolwide Program
Private school student participating
Local Neglected Program
NEDM: Title I Participlant
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentTitleIPartAProgramAssociation', @level2type = N'COLUMN', @level2name = N'TitleIPartAParticipantTypeId';

