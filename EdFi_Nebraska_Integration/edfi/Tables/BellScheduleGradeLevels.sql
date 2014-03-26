CREATE TABLE [edfi].[BellScheduleGradeLevels] (
    [SchoolId]         INT           NOT NULL,
    [ClassPeriodName]  NVARCHAR (20) NOT NULL,
    [WeekNumber]       INT           NOT NULL,
    [TermTypeId]       INT           NOT NULL,
    [SchoolYear]       SMALLINT      NOT NULL,
    [BellScheduleName] NVARCHAR (60) NOT NULL,
    [GradeLevelTypeId] INT           NOT NULL,
    CONSTRAINT [PK_BellScheduleGradeLevels] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [ClassPeriodName] ASC, [WeekNumber] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [BellScheduleName] ASC, [GradeLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BellScheduleGradeLevels_BellSchedule] FOREIGN KEY ([SchoolId], [ClassPeriodName], [WeekNumber], [TermTypeId], [SchoolYear], [BellScheduleName]) REFERENCES [edfi].[BellSchedule] ([SchoolId], [ClassPeriodName], [WeekNumber], [TermTypeId], [SchoolYear], [BellScheduleName]),
    CONSTRAINT [FK_BellScheduleGradeLevels_GradeLevelType] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BellScheduleGradeLevels', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The week number (out of the number of weeks in the cycle) for this meeting time.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BellScheduleGradeLevels', @level2type = N'COLUMN', @level2name = N'WeekNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BellScheduleGradeLevels', @level2type = N'COLUMN', @level2name = N'SchoolYear';

