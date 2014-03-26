CREATE TABLE [edfi].[LeaveEvent] (
    [StaffUSI]                 BIGINT          NOT NULL,
    [EventDate]                DATE            NOT NULL,
    [LeaveEventCategoryTypeId] INT             NOT NULL,
    [LeaveEventReason]         NVARCHAR (40)   NULL,
    [HoursOnLeave]             DECIMAL (18, 2) NULL,
    [SubstituteAssigned]       BIT             NULL,
    CONSTRAINT [PK_LeaveEvent] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [EventDate] ASC, [LeaveEventCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_LeaveEvent_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]),
    CONSTRAINT [FK_LeaveEventCategoryType_LeaveEvent] FOREIGN KEY ([LeaveEventCategoryTypeId]) REFERENCES [edfi].[LeaveEventCategoryType] ([LeaveEventCategoryTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This event entity represents the recording of the dates of staff leave (e.g., sick leave, personal time, vacation, etc.).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LeaveEvent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LeaveEvent', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date for this leave event.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LeaveEvent', @level2type = N'COLUMN', @level2name = N'EventDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code describing the type of leave taken, for example:
Sick
Personal
Vacation
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LeaveEvent', @level2type = N'COLUMN', @level2name = N'LeaveEventCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expanded reason for the staff leave.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LeaveEvent', @level2type = N'COLUMN', @level2name = N'LeaveEventReason';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The hours the staff was absent, if not the entire working day.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LeaveEvent', @level2type = N'COLUMN', @level2name = N'HoursOnLeave';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of whether a substitute was assigned during the period of staff leave.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LeaveEvent', @level2type = N'COLUMN', @level2name = N'SubstituteAssigned';

