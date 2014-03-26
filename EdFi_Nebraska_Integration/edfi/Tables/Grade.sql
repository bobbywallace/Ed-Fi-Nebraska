CREATE TABLE [edfi].[Grade] (
    [StudentUSI]                      BIGINT        NOT NULL,
    [SchoolId]                        INT           NOT NULL,
    [ClassPeriodName]                 NVARCHAR (20) NOT NULL,
    [ClassroomIdentificationCode]     NVARCHAR (20) NOT NULL,
    [LocalCourseCode]                 NVARCHAR (20) NOT NULL,
    [TermTypeId]                      INT           NOT NULL,
    [SchoolYear]                      SMALLINT      NOT NULL,
    [GradingPeriodTypeId]             INT           NOT NULL,
    [GradingPeriodBeginDate]          DATE          NOT NULL,
    [GradeTypeId]                     INT           NOT NULL,
    [LetterGradeEarned]               NVARCHAR (20) NULL,
    [NumericGradeEarned]              INT           NULL,
    [DiagnosticStatement]             TEXT          NULL,
    [PerformanceBaseConversionTypeId] INT           NULL,
    CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [GradingPeriodTypeId] ASC, [GradingPeriodBeginDate] ASC, [GradeTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Grade_GradeType] FOREIGN KEY ([GradeTypeId]) REFERENCES [edfi].[GradeType] ([GradeTypeId]),
    CONSTRAINT [FK_Grade_GradingPeriod] FOREIGN KEY ([SchoolId], [GradingPeriodTypeId], [GradingPeriodBeginDate]) REFERENCES [edfi].[GradingPeriod] ([EducationOrganizationId], [GradingPeriodTypeId], [BeginDate]),
    CONSTRAINT [FK_Grade_PerformanceBaseType] FOREIGN KEY ([PerformanceBaseConversionTypeId]) REFERENCES [edfi].[PerformanceBaseType] ([PerformanceBaseTypeId]),
    CONSTRAINT [FK_Grade_Section] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear]) REFERENCES [edfi].[Section] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear]),
    CONSTRAINT [FK_Grade_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This educational entity represents an overall score or assessment tied to a course over a period of time (i.e., the grading period).  Student grades are usually a compilation of marks and other scores.  The model supports letter and/or numeric grades plus and and optional end-of-grading period assessment score.
NEDM: Grade Earned
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the term in which the section is offered (e.g., First semester, Second semester, Year long, summer school)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the grading period during the school year in which the grade is offered (e.g., 1st cycle, 1st semester)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'GradingPeriodTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day, and year of the first day of the grading period.

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'GradingPeriodBeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of grade (e.g., Exam, Final, Grading Period, Progress Report)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'GradeTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A final or interim (grading period) indicator of student performance in a class as submitted by the instructor.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'LetterGradeEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A final or interim (grading period) indicator of student performance in a class as submitted by the instructor.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'NumericGradeEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A statement provided by the teacher that provides information in addition to the grade or assessment score.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Grade', @level2type = N'COLUMN', @level2name = N'DiagnosticStatement';

