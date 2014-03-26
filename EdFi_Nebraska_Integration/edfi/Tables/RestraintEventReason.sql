CREATE TABLE [edfi].[RestraintEventReason] (
    [StudentUSI]                  BIGINT        NOT NULL,
    [SchoolId]                    INT           NOT NULL,
    [RestraintEventIdentifier]    NVARCHAR (20) NOT NULL,
    [EventDate]                   DATE          NOT NULL,
    [RestraintEventReasonsTypeId] INT           NOT NULL,
    CONSTRAINT [PK_RestraintEventReason] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [RestraintEventIdentifier] ASC, [EventDate] ASC, [RestraintEventReasonsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RestraintEventReason_RestraintEvent] FOREIGN KEY ([StudentUSI], [SchoolId], [RestraintEventIdentifier], [EventDate]) REFERENCES [edfi].[RestraintEvent] ([StudentUSI], [SchoolId], [RestraintEventIdentifier], [EventDate]),
    CONSTRAINT [FK_RestraintEventReasonsType_RestraintEventRestraintEventReasons] FOREIGN KEY ([RestraintEventReasonsTypeId]) REFERENCES [edfi].[RestraintEventReasonsType] ([RestraintEventReasonsTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventReason', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventReason', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a restraint event by a school, school system, a state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventReason', @level2type = N'COLUMN', @level2name = N'RestraintEventIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the resteraint event.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEventReason', @level2type = N'COLUMN', @level2name = N'EventDate';

