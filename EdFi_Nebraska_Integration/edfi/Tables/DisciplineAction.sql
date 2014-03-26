CREATE TABLE [edfi].[DisciplineAction] (
    [StudentUSI]                                   BIGINT        NOT NULL,
    [SchoolId]                                     INT           NOT NULL,
    [IncidentIdentifier]                           NVARCHAR (20) NOT NULL,
    [DisciplineActionIdentifier]                   NVARCHAR (20) NOT NULL,
    [DisciplineDate]                               DATE          NOT NULL,
    [DisciplineActionLength]                       INT           NULL,
    [ActualDisciplineActionLength]                 INT           NULL,
    [DisciplineActionLengthDifferenceReasonTypeId] INT           NULL,
    [ResponsibilitySchoolId]                       INT           NOT NULL,
    [AssignmentSchoolId]                           INT           NULL,
    CONSTRAINT [PK_DisciplineAction] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC, [DisciplineActionIdentifier] ASC, [DisciplineDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_DisciplineAction_DisciplineActionLengthDifferenceReasonType] FOREIGN KEY ([DisciplineActionLengthDifferenceReasonTypeId]) REFERENCES [edfi].[DisciplineActionLengthDifferenceReasonType] ([DisciplineActionLengthDifferenceReasonTypeId]),
    CONSTRAINT [FK_DisciplineAction_DisciplineIncident] FOREIGN KEY ([SchoolId], [IncidentIdentifier]) REFERENCES [edfi].[DisciplineIncident] ([SchoolId], [IncidentIdentifier]),
    CONSTRAINT [FK_DisciplineAction_School] FOREIGN KEY ([AssignmentSchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_DisciplineAction_School2] FOREIGN KEY ([ResponsibilitySchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_DisciplineAction_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This event entity represents actions taken by an education organization after a disruptive event that is recorded as a discipline incident.
NEDM: Discipline Action
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier assigned by the education organization to the discipline action.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'DisciplineActionIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the discipline action.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'DisciplineDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of time for the Discipline Action (e.g. removal, detention), if applicable.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'DisciplineActionLength';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of time for the Discipline Action (e.g. removal, detention), if applicable.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'ActualDisciplineActionLength';

