CREATE TABLE [edfi].[DisciplineIncident] (
    [SchoolId]                  INT           NOT NULL,
    [IncidentIdentifier]        NVARCHAR (20) NOT NULL,
    [IncidentDate]              DATE          NOT NULL,
    [IncidentTime]              TIME (7)      NULL,
    [IncidentLocationTypeId]    INT           NOT NULL,
    [ReporterDescriptionTypeId] INT           NULL,
    [ReporterName]              NVARCHAR (75) NULL,
    [ReportedToLawEnforcement]  BIT           NULL,
    [CaseNumber]                NVARCHAR (20) NULL,
    [StaffUSI]                  BIGINT        NULL,
    CONSTRAINT [PK_DisciplineIncident] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [IncidentIdentifier] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_DisciplineIncident_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_DisciplineIncident_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]),
    CONSTRAINT [FK_IncidentLocationType_DisciplineIncident] FOREIGN KEY ([IncidentLocationTypeId]) REFERENCES [edfi].[IncidentLocationType] ([IncidentLocationTypeId]),
    CONSTRAINT [FK_ReporterDescriptionType_DisciplineIncident] FOREIGN KEY ([ReporterDescriptionTypeId]) REFERENCES [edfi].[ReporterDescriptionType] ([ReporterDescriptionTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This event entity represents an occurrence of an infraction ranging from a minor problem behavior that disrupts the orderly functioning of a school or classroom (such as tardiness) to a criminal act that results in the involvement of a law enforcement official (such as robbery). A single event (e.g., a fight) is one incident regardless of how many perpetrators or victims are involved.  Discipline incidents are events classified as warranting discipline action.
NEDM: Discipline Incident
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the incident occurred. 
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the time of day the incident took place.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies where the incident occurred and whether or not it occurred on campus, for example:
On campus
Administrative offices area
Cafeteria area
Classroom
Hallway or stairs
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentLocationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Information on the type of individual who reported the incident. When known and/or if useful, use a more specific option code (e.g., "Counselor" rather than "Professional Staff"); for example:Student
Parent/guardian
Law enforcement officer
Nonschool personnel
Representative of visiting school
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'ReporterDescriptionTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the reporter of the incident by name.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'ReporterName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of whether the incident was reported to law enforcement.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'ReportedToLawEnforcement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The case number assigned to the incident by law enforcement or other organization.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'CaseNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'StaffUSI';

