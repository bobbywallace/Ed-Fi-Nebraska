CREATE TABLE [edfi].[GradingPeriod] (
    [EducationOrganizationId] INT  NOT NULL,
    [GradingPeriodTypeId]     INT  NOT NULL,
    [BeginDate]               DATE NOT NULL,
    [EndDate]                 DATE NOT NULL,
    [TotalInstructionalDays]  INT  NOT NULL,
    CONSTRAINT [PK_GradingPeriod] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [GradingPeriodTypeId] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_GradingPeriod_CalendarBeginDate] FOREIGN KEY ([EducationOrganizationId], [BeginDate]) REFERENCES [edfi].[CalendarDate] ([EducationOrganizationId], [Date]),
    CONSTRAINT [FK_GradingPeriod_CalendarEndDate] FOREIGN KEY ([EducationOrganizationId], [EndDate]) REFERENCES [edfi].[CalendarDate] ([EducationOrganizationId], [Date]),
    CONSTRAINT [FK_GradingPeriodType_GradingPeriod] FOREIGN KEY ([GradingPeriodTypeId]) REFERENCES [edfi].[GradingPeriodType] ([GradingPeriodTypeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_GradingPeriodBeginDateLKP]
    ON [edfi].[GradingPeriod]([EducationOrganizationId] ASC, [GradingPeriodTypeId] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents the time span for which grades are reported.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriod', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the grading period during the school year in which the grade is offered (e.g., 1st cycle, 1st semester)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriod', @level2type = N'COLUMN', @level2name = N'GradingPeriodTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day, and year of the first day of the grading period.

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriod', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day, and year of the last day of the grading period.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriod', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total days available for educational instruction during the grading period.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriod', @level2type = N'COLUMN', @level2name = N'TotalInstructionalDays';

