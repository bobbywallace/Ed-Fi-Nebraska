CREATE TABLE [edfi].[CalendarEventType] (
    [CalendarEventTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (40)  NOT NULL,
    [Description]         NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCalendarEventType] PRIMARY KEY NONCLUSTERED ([CalendarEventTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICalendarEventTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

