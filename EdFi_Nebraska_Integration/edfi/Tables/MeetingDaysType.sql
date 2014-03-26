CREATE TABLE [edfi].[MeetingDaysType] (
    [MeetingDaysTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]         NVARCHAR (20)  NOT NULL,
    [Description]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKMeetingDaysType] PRIMARY KEY NONCLUSTERED ([MeetingDaysTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIMeetingDaysTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

