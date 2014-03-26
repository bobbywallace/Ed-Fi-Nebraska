CREATE TABLE [edfi].[StudentDisciplineIncidentAssociation] (
    [StudentUSI]                     BIGINT        NOT NULL,
    [SchoolId]                       INT           NOT NULL,
    [IncidentIdentifier]             NVARCHAR (20) NOT NULL,
    [StudentParticipationCodeTypeId] INT           NOT NULL,
    CONSTRAINT [PK_StudentDisciplineIncidentAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentDisciplineIncidentAssociation_DisciplineIncident] FOREIGN KEY ([SchoolId], [IncidentIdentifier]) REFERENCES [edfi].[DisciplineIncident] ([SchoolId], [IncidentIdentifier]),
    CONSTRAINT [FK_StudentDisciplineIncidentAssociation_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]),
    CONSTRAINT [FK_StudentParticipationCodeType_StudentDisciplineIncidentAssociation] FOREIGN KEY ([StudentParticipationCodeTypeId]) REFERENCES [edfi].[StudentParticipationCodeType] ([StudentParticipationCodeTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association indicates those students related to a discipline incident who were victims, perpetrators, witnesses, and/or reporters.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The role or type of participation of a student in a discipline incident; for example:
Victim
Perpetrator
Witness
Reporter
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation', @level2type = N'COLUMN', @level2name = N'StudentParticipationCodeTypeId';

