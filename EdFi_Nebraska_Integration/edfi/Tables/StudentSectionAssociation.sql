CREATE TABLE [edfi].[StudentSectionAssociation] (
    [StudentUSI]                  BIGINT        NOT NULL,
    [SchoolId]                    INT           NOT NULL,
    [ClassPeriodName]             NVARCHAR (20) NOT NULL,
    [ClassroomIdentificationCode] NVARCHAR (20) NOT NULL,
    [LocalCourseCode]             NVARCHAR (20) NOT NULL,
    [TermTypeId]                  INT           NOT NULL,
    [SchoolYear]                  SMALLINT      NOT NULL,
    [BeginDate]                   DATE          NOT NULL,
    [EndDate]                     DATE          NULL,
    [HomeroomIndicator]           BIT           NULL,
    [RepeatIdentifierTypeId]      INT           NULL,
    CONSTRAINT [PK_StudentSectionAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RepeatIdentifierType_StudentSectionAssociation] FOREIGN KEY ([RepeatIdentifierTypeId]) REFERENCES [edfi].[RepeatIdentifierType] ([RepeatIdentifierTypeId]),
    CONSTRAINT [FK_StudentSectionAssociation_Section] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear]),
    CONSTRAINT [FK_StudentSectionAssociation_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentSectionAssociationSDate]
    ON [edfi].[StudentSectionAssociation]([BeginDate] ASC, [EndDate] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_StudentSectionAssociationEDate]
    ON [edfi].[StudentSectionAssociation]([EndDate] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association indicates the course sections a student is assigned to.
NEDM: Student Section Assignment
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the term in which the section is offered (e.g., First semester, Second semester, Year long, summer school)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the student''s entry or assignment to the section.  If blank, default is the start date of the first grading period.
NEDM: EntryDate
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day, and year of the withdrawal or exit of the student from the section.
NEDM: Exit/Withdraw Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator that the class is the student''s designated homeroom used for daily attendance reporting.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'HomeroomIndicator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication as to whether a student has previously taken a given course.
NEDM: Repeat Identifier
Repeated, counted in grade point average
Repeated, not counted in grade point average
Not repeated
Other
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSectionAssociation', @level2type = N'COLUMN', @level2name = N'RepeatIdentifierTypeId';

