CREATE TABLE [edfi].[TeacherSectionAssociation] (
    [StaffUSI]                    BIGINT        NOT NULL,
    [SchoolId]                    INT           NOT NULL,
    [ClassPeriodName]             NVARCHAR (20) NOT NULL,
    [ClassroomIdentificationCode] NVARCHAR (20) NOT NULL,
    [LocalCourseCode]             NVARCHAR (20) NOT NULL,
    [TermTypeId]                  INT           NOT NULL,
    [SchoolYear]                  SMALLINT      NOT NULL,
    [ClassroomPositionTypeId]     INT           NOT NULL,
    [BeginDate]                   DATE          NULL,
    [EndDate]                     DATE          NULL,
    [HighlyQualifiedTeacher]      BIT           NULL,
    CONSTRAINT [PK_TeacherSectionAssociation] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [TermTypeId] ASC, [SchoolYear] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ClassroomPositionType_TeacherSectionAssociation] FOREIGN KEY ([ClassroomPositionTypeId]) REFERENCES [edfi].[ClassroomPositionType] ([ClassroomPositionTypeId]),
    CONSTRAINT [FK_TeacherSectionAssociation_Section] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear]),
    CONSTRAINT [FK_TeacherSectionAssociation_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
CREATE NONCLUSTERED INDEX [IX_TeacherSectionAssociation_StudentRecord]
    ON [edfi].[TeacherSectionAssociation]([ClassroomIdentificationCode] ASC, [SchoolId] ASC, [TermTypeId] ASC, [ClassPeriodName] ASC, [LocalCourseCode] ASC, [StaffUSI] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association indicates the class sections to which a teacher is assigned to.
NEDM: Teacher Section Assignment
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the term in which the section is offered (e.g., First semester, Second semester, Year long, summer school)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of position the staff member holds in the specific class/section; for example:
Teacher of Record, Assistant Teacher, Support Teacher, Substitute Teacher...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'ClassroomPositionTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of a teacher''s assignment to the section.  If blank, defaults to the first day of the first grading period for the section.

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the last day of a teacher''s assignment to the section.
NEDM: Ending Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of whether a teacher is classified as highly qualified for his/her assignment according to state definition.  This attribute indicates the teacher is highly qualified for this section being taught.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TeacherSectionAssociation', @level2type = N'COLUMN', @level2name = N'HighlyQualifiedTeacher';

