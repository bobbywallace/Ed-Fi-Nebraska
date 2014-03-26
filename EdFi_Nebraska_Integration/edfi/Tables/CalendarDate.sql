CREATE TABLE [edfi].[CalendarDate] (
    [EducationOrganizationId] INT  NOT NULL,
    [Date]                    DATE NOT NULL,
    [CalendarEventTypeId]     INT  NOT NULL,
    CONSTRAINT [PK_CalendarDate_1] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [Date] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day, and year of the first day of the grading period.

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CalendarDate', @level2type = N'COLUMN', @level2name = N'Date';

