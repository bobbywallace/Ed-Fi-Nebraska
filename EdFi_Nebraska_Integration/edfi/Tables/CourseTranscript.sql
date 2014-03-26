CREATE TABLE [edfi].[CourseTranscript] (
    [StudentUSI]                BIGINT         NOT NULL,
    [SchoolYear]                SMALLINT       NOT NULL,
    [TermTypeId]                INT            NOT NULL,
    [EducationOrganizationId]   INT            NOT NULL,
    [IdentityCourseCode]        NVARCHAR (20)  NOT NULL,
    [CourseAttemptResultTypeId] INT            NOT NULL,
    [AttemptedCreditTypeId]     INT            NULL,
    [CreditsAttempted]          DECIMAL (9, 2) NULL,
    [EarnedCreditTypeId]        INT            NULL,
    [CreditsEarned]             DECIMAL (9, 2) NOT NULL,
    [GradeLevelWhenTakenTypeId] INT            NULL,
    [MethodCreditEarnedTypeId]  INT            NULL,
    [FinalLetterGrade]          NVARCHAR (20)  NULL,
    [FinalNumericGrade]         INT            NULL,
    [CourseRepeatCodeTypeId]    INT            NULL,
    CONSTRAINT [PK_CourseTranscript] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolYear] ASC, [TermTypeId] ASC, [EducationOrganizationId] ASC, [IdentityCourseCode] ASC, [CourseAttemptResultTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CourseAttemptResultType_CourseTranscript] FOREIGN KEY ([CourseAttemptResultTypeId]) REFERENCES [edfi].[CourseAttemptResultType] ([CourseAttemptResultTypeId]),
    CONSTRAINT [FK_CourseRepeatCodeType_CourseTranscript] FOREIGN KEY ([CourseRepeatCodeTypeId]) REFERENCES [edfi].[CourseRepeatCodeType] ([CourseRepeatCodeTypeId]),
    CONSTRAINT [FK_CourseTranscript_CreditType] FOREIGN KEY ([AttemptedCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId]),
    CONSTRAINT [FK_CourseTranscript_GradeLevelType] FOREIGN KEY ([GradeLevelWhenTakenTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_MethodCreditEarnedType_CourseTranscript] FOREIGN KEY ([MethodCreditEarnedTypeId]) REFERENCES [edfi].[MethodCreditEarnedType] ([MethodCreditEarnedTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The final record of a student''s performance in their courses.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The "as of" school year the student academic record.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The result from the student''s attempt to take the course, for example:
Pass
Fail
Incomplete
Withdrawn
Expelled
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'CourseAttemptResultTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of credits attempted for a course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'CreditsAttempted';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of credits awarded or earned for the course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'CreditsEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student''s grade level at time of course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'GradeLevelWhenTakenTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The method the credits were earned, for example:  Classroom, Examination, Transfer
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'MethodCreditEarnedTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The final letter grade earned for the course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'FinalLetterGrade';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The final numeric grade earned for the course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'FinalNumericGrade';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates that an academic course has been repeated by a student and how that repeat is to be computed in the student''s academic grade average.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseTranscript', @level2type = N'COLUMN', @level2name = N'CourseRepeatCodeTypeId';

