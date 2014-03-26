CREATE TABLE [edfi].[DisciplineActionStaff] (
    [StudentUSI]                 BIGINT        NOT NULL,
    [SchoolId]                   INT           NOT NULL,
    [IncidentIdentifier]         NVARCHAR (20) NOT NULL,
    [DisciplineActionIdentifier] NVARCHAR (20) NOT NULL,
    [DisciplineDate]             DATE          NOT NULL,
    [StaffUSI]                   BIGINT        NOT NULL,
    CONSTRAINT [PK_DisciplineActionStaff] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC, [DisciplineActionIdentifier] ASC, [DisciplineDate] ASC, [StaffUSI] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_DisciplineActionStaff_DisciplineAction] FOREIGN KEY ([StudentUSI], [SchoolId], [IncidentIdentifier], [DisciplineActionIdentifier], [DisciplineDate]) REFERENCES [edfi].[DisciplineAction] ([StudentUSI], [SchoolId], [IncidentIdentifier], [DisciplineActionIdentifier], [DisciplineDate]),
    CONSTRAINT [FK_DisciplineActionStaff_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionStaff', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionStaff', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionStaff', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier assigned by the education organization to the discipline action.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionStaff', @level2type = N'COLUMN', @level2name = N'DisciplineActionIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the discipline action.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionStaff', @level2type = N'COLUMN', @level2name = N'DisciplineDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionStaff', @level2type = N'COLUMN', @level2name = N'StaffUSI';

