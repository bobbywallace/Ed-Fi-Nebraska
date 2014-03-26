CREATE TABLE [edfi].[AttendanceEvent] (
    [StudentUSI]                    BIGINT        NOT NULL,
    [SchoolId]                      INT           NOT NULL,
    [ClassPeriodName]               NVARCHAR (20) NOT NULL,
    [ClassroomIdentificationCode]   NVARCHAR (20) NOT NULL,
    [LocalCourseCode]               NVARCHAR (20) NOT NULL,
    [TermTypeId]                    INT           NOT NULL,
    [SchoolYear]                    SMALLINT      NOT NULL,
    [EventDate]                     DATE          NOT NULL,
    [AttendanceEventCategoryTypeId] INT           NOT NULL,
    [AttendanceEventTypeId]         INT           NULL,
    [AttendanceEventReason]         NVARCHAR (40) NULL,
    [EducationalEnvironmentTypeId]  INT           NULL,
    CONSTRAINT [PK_AttendanceEvent] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [EventDate] ASC, [AttendanceEventCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AttendanceEvent_Section] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear]),
    CONSTRAINT [FK_AttendanceEvent_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]),
    CONSTRAINT [FK_AttendanceEventCategoryType_AttendanceEvent] FOREIGN KEY ([AttendanceEventCategoryTypeId]) REFERENCES [edfi].[AttendanceEventCategoryType] ([AttendanceEventCategoryTypeId]),
    CONSTRAINT [FK_AttendanceEventTypeType_AttendanceEvent] FOREIGN KEY ([AttendanceEventTypeId]) REFERENCES [edfi].[AttendanceEventType] ([AttendanceEventTypeId]),
    CONSTRAINT [FK_EducationalEnvironmentType_AttendanceEvent] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_AttendanceEvent]
    ON [edfi].[AttendanceEvent]([SchoolId] ASC, [EventDate] DESC) WITH (DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_AttendanceEvent_EventDate]
    ON [edfi].[AttendanceEvent]([EventDate] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This event entity represents the recording of whether a student is in attendance for a class or in attendance to receive or participate in program services.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the term in which the section is offered (e.g., First semester, Second semester, Year long, summer school)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date for this attendance event.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'EventDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code describing the type of the attendance event.
present
Unexcused absence
Excused absence
Tardy
NEDM: Attendance Event Category
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'AttendanceEventCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of the attendance event, for example daily attendance, class section attendance, program attendance.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'AttendanceEventTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The reason for the absence or tardy.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'AttendanceEventReason';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The setting in which a child receives education and related services.  This is only used in the AttendanceEvent if different from that in the related Section.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEvent', @level2type = N'COLUMN', @level2name = N'EducationalEnvironmentTypeId';

