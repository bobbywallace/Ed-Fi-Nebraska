CREATE TABLE [edfi].[AdditionalCredit] (
    [StudentUSI]                BIGINT         NOT NULL,
    [SchoolYear]                SMALLINT       NOT NULL,
    [TermTypeId]                INT            NOT NULL,
    [EducationOrganizationId]   INT            NOT NULL,
    [IdentityCourseCode]        NVARCHAR (20)  NOT NULL,
    [CourseAttemptResultTypeId] INT            NOT NULL,
    [CreditTypeId]              INT            NOT NULL,
    [CreditsEarned]             DECIMAL (9, 2) NOT NULL,
    CONSTRAINT [PK_AdditionalCredit] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolYear] ASC, [TermTypeId] ASC, [EducationOrganizationId] ASC, [IdentityCourseCode] ASC, [CourseAttemptResultTypeId] ASC, [CreditTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AdditionalCredit_CourseTranscript] FOREIGN KEY ([StudentUSI], [SchoolYear], [TermTypeId], [EducationOrganizationId], [IdentityCourseCode], [CourseAttemptResultTypeId]) REFERENCES [edfi].[CourseTranscript] ([StudentUSI], [SchoolYear], [TermTypeId], [EducationOrganizationId], [IdentityCourseCode], [CourseAttemptResultTypeId]),
    CONSTRAINT [FK_AdditionalCredit_CreditType] FOREIGN KEY ([CreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdditionalCredit', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The "as of" school year the student academic record.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdditionalCredit', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdditionalCredit', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdditionalCredit', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The result from the student''s attempt to take the course, for example:
Pass
Fail
Incomplete
Withdrawn
Expelled
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdditionalCredit', @level2type = N'COLUMN', @level2name = N'CourseAttemptResultTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of credits awarded or earned for the course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdditionalCredit', @level2type = N'COLUMN', @level2name = N'CreditTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of credits awarded or earned for the course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdditionalCredit', @level2type = N'COLUMN', @level2name = N'CreditsEarned';

