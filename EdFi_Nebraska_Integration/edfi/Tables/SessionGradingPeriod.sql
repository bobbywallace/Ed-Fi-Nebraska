CREATE TABLE [edfi].[SessionGradingPeriod] (
    [EducationOrganizationId] INT      NOT NULL,
    [TermTypeId]              INT      NOT NULL,
    [SchoolYear]              SMALLINT NOT NULL,
    [GradingPeriodTypeId]     INT      NOT NULL,
    [GradingPeriodBeginDate]  DATE     NOT NULL,
    CONSTRAINT [PK_SessionGradingPeriod] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [GradingPeriodTypeId] ASC, [GradingPeriodBeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_SessionGradingPeriod_GradingPeriod] FOREIGN KEY ([EducationOrganizationId], [GradingPeriodTypeId], [GradingPeriodBeginDate]) REFERENCES [edfi].[GradingPeriod] ([EducationOrganizationId], [GradingPeriodTypeId], [BeginDate]),
    CONSTRAINT [FK_SessionGradingPeriod_Session] FOREIGN KEY ([EducationOrganizationId], [TermTypeId], [SchoolYear]) REFERENCES [edfi].[Session] ([EducationOrganizationId], [TermTypeId], [SchoolYear])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SessionGradingPeriod', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SessionGradingPeriod', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the grading period during the school year in which the grade is offered (e.g., 1st cycle, 1st semester)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SessionGradingPeriod', @level2type = N'COLUMN', @level2name = N'GradingPeriodTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day, and year of the first day of the grading period.

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SessionGradingPeriod', @level2type = N'COLUMN', @level2name = N'GradingPeriodBeginDate';

