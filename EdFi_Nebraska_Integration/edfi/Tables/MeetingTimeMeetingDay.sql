CREATE TABLE [edfi].[MeetingTimeMeetingDay] (
    [SchoolId]          INT           NOT NULL,
    [ClassPeriodName]   NVARCHAR (20) NOT NULL,
    [WeekNumber]        INT           NOT NULL,
    [MeetingDaysTypeId] INT           NOT NULL,
    CONSTRAINT [PK_MeetingTimeMeetingDay] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [ClassPeriodName] ASC, [WeekNumber] ASC, [MeetingDaysTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_MeetingTimeMeetingDay_MeetingDaysType] FOREIGN KEY ([MeetingDaysTypeId]) REFERENCES [edfi].[MeetingDaysType] ([MeetingDaysTypeId]),
    CONSTRAINT [FK_MeetingTimeMeetingDay_MeetingTime] FOREIGN KEY ([SchoolId], [ClassPeriodName], [WeekNumber]) REFERENCES [edfi].[MeetingTime] ([SchoolId], [ClassPeriodName], [WeekNumber])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTimeMeetingDay', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The week number (out of the number of weeks in the cycle) for this meeting time.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'MeetingTimeMeetingDay', @level2type = N'COLUMN', @level2name = N'WeekNumber';

