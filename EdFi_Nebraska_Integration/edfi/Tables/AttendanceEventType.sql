CREATE TABLE [edfi].[AttendanceEventType] (
    [AttendanceEventTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (30)  NOT NULL,
    [Description]           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAttendanceEventType] PRIMARY KEY NONCLUSTERED ([AttendanceEventTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAttendanceEventTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

