CREATE TABLE [edfi].[StudentGradebookEntry] (
    [StudentUSI]                  BIGINT          NOT NULL,
    [SchoolId]                    INT             NOT NULL,
    [ClassPeriodName]             NVARCHAR (20)   NOT NULL,
    [ClassroomIdentificationCode] NVARCHAR (20)   NOT NULL,
    [LocalCourseCode]             NVARCHAR (20)   NOT NULL,
    [TermTypeId]                  INT             NOT NULL,
    [SchoolYear]                  SMALLINT        NOT NULL,
    [BeginDate]                   DATE            NOT NULL,
    [GradebookEntryType]          NVARCHAR (60)   NOT NULL,
    [DateAssigned]                DATE            NOT NULL,
    [DateFullfilled]              DATE            NULL,
    [LetterGradeEarned]           NVARCHAR (20)   NULL,
    [NumericGradeEarned]          INT             NULL,
    [CompetencyLevelDescriptorId] INT             NULL,
    [DiagnosticStatement]         NVARCHAR (1024) NULL,
    CONSTRAINT [PK_StudentGradebookEntry] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [BeginDate] ASC, [GradebookEntryType] ASC, [DateAssigned] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentGradebookEntry_StudentSectionAssociation] FOREIGN KEY ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [BeginDate]) REFERENCES [edfi].[StudentSectionAssociation] ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [BeginDate])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentGradebookEntry', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentGradebookEntry', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentGradebookEntry', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentGradebookEntry', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentGradebookEntry', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the term in which the section is offered (e.g., First semester, Second semester, Year long, summer school)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentGradebookEntry', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentGradebookEntry', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the student''s entry or assignment to the section.  If blank, default is the start date of the first grading period.
NEDM: EntryDate
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentGradebookEntry', @level2type = N'COLUMN', @level2name = N'BeginDate';

