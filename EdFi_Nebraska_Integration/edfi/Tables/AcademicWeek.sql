CREATE TABLE [edfi].[AcademicWeek] (
    [EducationOrganizationId] INT           NOT NULL,
    [TermTypeId]              INT           NOT NULL,
    [SchoolYear]              SMALLINT      NOT NULL,
    [WeekIdentifer]           NVARCHAR (80) NOT NULL,
    [BeginDate]               DATE          NOT NULL,
    [EndDate]                 DATE          NOT NULL,
    [TotalInstructionalDays]  INT           NOT NULL,
    CONSTRAINT [PK_AcademicWeek] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [WeekIdentifer] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AcademicWeek_CalendarBeginDate] FOREIGN KEY ([EducationOrganizationId], [BeginDate]) REFERENCES [edfi].[CalendarDate] ([EducationOrganizationId], [Date]),
    CONSTRAINT [FK_AcademicWeek_CalendarEndDate] FOREIGN KEY ([EducationOrganizationId], [EndDate]) REFERENCES [edfi].[CalendarDate] ([EducationOrganizationId], [Date]),
    CONSTRAINT [FK_AcademicWeek_Session] FOREIGN KEY ([EducationOrganizationId], [TermTypeId], [SchoolYear]) REFERENCES [edfi].[Session] ([EducationOrganizationId], [TermTypeId], [SchoolYear])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entitiy represents the academic weeks for a school year, optionally captured to support analyses.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicWeek';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicWeek', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicWeek', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The campus label for the week.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicWeek', @level2type = N'COLUMN', @level2name = N'WeekIdentifer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The statrt date for the academic week.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicWeek', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The end date for the academic week.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicWeek', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total instructional days during the academic week.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicWeek', @level2type = N'COLUMN', @level2name = N'TotalInstructionalDays';

