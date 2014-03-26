CREATE TABLE [edfi].[MeetingTime] (
    [SchoolId]                 INT           NOT NULL,
    [ClassPeriodName]          NVARCHAR (20) NOT NULL,
    [WeekNumber]               INT           NOT NULL,
    [AlternateDayName]         NVARCHAR (20) NULL,
    [StartTime]                TIME (7)      NOT NULL,
    [EndTime]                  TIME (7)      NOT NULL,
    [OfficialAttendancePeriod] BIT           NULL,
    CONSTRAINT [PK_MeetingTime] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [ClassPeriodName] ASC, [WeekNumber] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_MeetingTime_ClassPeriod] FOREIGN KEY ([SchoolId], [ClassPeriodName]) REFERENCES [edfi].[ClassPeriod] ([SchoolId], [ClassPeriodName])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Record for a meeting time for a class period.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTime', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The week number (out of the number of weeks in the cycle) for this meeting time.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTime', @level2type = N'COLUMN', @level2name = N'WeekNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An alternate name for the day (e.g., Red, Blue)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTime', @level2type = N'COLUMN', @level2name = N'AlternateDayName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the time of day the class begins
NEDM: Class Beginning Time
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTime', @level2type = N'COLUMN', @level2name = N'StartTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the time of day the class ends.
NEDM: Class Ending Time
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTime', @level2type = N'COLUMN', @level2name = N'EndTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of whether this meeting time is used for official daily attendance.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTime', @level2type = N'COLUMN', @level2name = N'OfficialAttendancePeriod';

