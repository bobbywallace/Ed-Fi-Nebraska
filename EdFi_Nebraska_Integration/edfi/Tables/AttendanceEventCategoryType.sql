﻿CREATE TABLE [edfi].[AttendanceEventCategoryType] (
    [AttendanceEventCategoryTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                     NVARCHAR (20)  NOT NULL,
    [Description]                   NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAttendanceEventCategoryType] PRIMARY KEY NONCLUSTERED ([AttendanceEventCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAttendanceEventCategoryTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

