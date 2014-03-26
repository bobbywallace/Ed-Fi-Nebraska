CREATE TABLE [edfi].[Session] (
    [EducationOrganizationId] INT           NOT NULL,
    [TermTypeId]              INT           NOT NULL,
    [SchoolYear]              SMALLINT      NOT NULL,
    [SessionName]             NVARCHAR (20) NOT NULL,
    [BeginDate]               DATE          NOT NULL,
    [EndDate]                 DATE          NOT NULL,
    [TotalInstructionalDays]  INT           NOT NULL,
    CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [TermTypeId] ASC, [SchoolYear] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Session_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_Session_SchoolYearType] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear]),
    CONSTRAINT [FK_Session_TermType] FOREIGN KEY ([TermTypeId]) REFERENCES [edfi].[TermType] ([TermTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A calendar of days made available to instruct students.  The school calendar could be organized by semester, or by school year plus summer school.
NEDM: School Year
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Session';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Session', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Session', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).
NEDM: Session Type
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Session', @level2type = N'COLUMN', @level2name = N'SessionName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The statrt date for the academic week.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Session', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the last day of the instruction for the school year.
NEDM: Last Day of Class for Students
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Session', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of instructional days in the school calendar.
NEDM: Total Days in Session
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Session', @level2type = N'COLUMN', @level2name = N'TotalInstructionalDays';

