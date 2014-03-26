CREATE TABLE [edfi].[ReportCard] (
    [StudentUSI]               BIGINT          NOT NULL,
    [EducationOrganizationId]  INT             NOT NULL,
    [GradingPeriodTypeId]      INT             NOT NULL,
    [GradingPeriodBeginDate]   DATE            NOT NULL,
    [GPAGivenGradingPeriod]    DECIMAL (18, 4) NOT NULL,
    [GPACumulative]            DECIMAL (18, 4) NOT NULL,
    [NumberOfDaysAbsent]       DECIMAL (18, 4) NULL,
    [NumberOfDaysInAttendance] DECIMAL (18, 4) NULL,
    [NumberOfDaysTardy]        INT             NULL,
    CONSTRAINT [PK_ReportCard] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [EducationOrganizationId] ASC, [GradingPeriodTypeId] ASC, [GradingPeriodBeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ReportCard_GradingPeriod] FOREIGN KEY ([EducationOrganizationId], [GradingPeriodTypeId], [GradingPeriodBeginDate]) REFERENCES [edfi].[GradingPeriod] ([EducationOrganizationId], [GradingPeriodTypeId], [BeginDate]),
    CONSTRAINT [FK_ReportCard_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This educational entity represents the collecton of student grades for courses taken during a grading period.
NEDM: Report Card
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the grading period during the school year in which the grade is offered (e.g., 1st cycle, 1st semester)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'GradingPeriodTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day, and year of the first day of the grading period.

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'GradingPeriodBeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A measure of average performance in all courses taken by an individual for the current grading period.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'GPAGivenGradingPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A measure of cumulative average performance in all courses taken by an individual from the beginning of the school year through the current grading period.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'GPACumulative';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of days an individual is absent when school is in session during a given reporting period. 
NEDM: Number of Days Absent
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'NumberOfDaysAbsent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of days an individual is present when school is in session during a given reporting period. 
NEDM: Number Of Days in Attendance
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'NumberOfDaysInAttendance';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The numbre of days an individual is tardy during a given reporting period.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReportCard', @level2type = N'COLUMN', @level2name = N'NumberOfDaysTardy';

