CREATE TABLE [edfi].[Section] (
    [SchoolId]                     INT             NOT NULL,
    [ClassPeriodName]              NVARCHAR (20)   NOT NULL,
    [ClassroomIdentificationCode]  NVARCHAR (20)   NOT NULL,
    [LocalCourseCode]              NVARCHAR (20)   NOT NULL,
    [TermTypeId]                   INT             NOT NULL,
    [SchoolYear]                   SMALLINT        NOT NULL,
    [UniqueSectionCode]            NVARCHAR (30)   NOT NULL,
    [SequenceOfCourse]             INT             NOT NULL,
    [EducationalEnvironmentTypeId] INT             NULL,
    [MediumOfInstructionTypeId]    INT             NULL,
    [PopulationServedTypeId]       INT             NULL,
    [AvailableCreditTypeId]        INT             NULL,
    [AvailableCredit]              DECIMAL (18, 4) NULL,
    CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [TermTypeId] ASC, [SchoolYear] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationalEnvironmentType_Section] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId]),
    CONSTRAINT [FK_MediumOfInstructionType_Section] FOREIGN KEY ([MediumOfInstructionTypeId]) REFERENCES [edfi].[MediumOfInstructionType] ([MediumOfInstructionTypeId]),
    CONSTRAINT [FK_PopulationServedType_Section] FOREIGN KEY ([PopulationServedTypeId]) REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId]),
    CONSTRAINT [FK_Section_ClassPeriod] FOREIGN KEY ([SchoolId], [ClassPeriodName]) REFERENCES [edfi].[ClassPeriod] ([SchoolId], [ClassPeriodName]),
    CONSTRAINT [FK_Section_CourseOffering] FOREIGN KEY ([SchoolId], [TermTypeId], [SchoolYear], [LocalCourseCode]) REFERENCES [edfi].[CourseOffering] ([SchoolId], [TermTypeId], [SchoolYear], [LocalCourseCode]),
    CONSTRAINT [FK_Section_CreditType] FOREIGN KEY ([AvailableCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId]),
    CONSTRAINT [FK_Section_Location] FOREIGN KEY ([SchoolId], [ClassroomIdentificationCode]) REFERENCES [edfi].[Location] ([SchoolId], [ClassroomIdentificationCode]),
    CONSTRAINT [FK_Section_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_Section_Session] FOREIGN KEY ([SchoolId], [TermTypeId], [SchoolYear]) REFERENCES [edfi].[Session] ([EducationOrganizationId], [TermTypeId], [SchoolYear])
);


GO
CREATE NONCLUSTERED INDEX [IX_Section_LocalCourseCode]
    ON [edfi].[Section]([LocalCourseCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This educational entity represents a setting in which organized instruction of course content is provided to one or more students for a given period of time.  A course may be offered to more than one class/section. Instruction, provided by one or more teachers or other staff members, may be delivered in person or via a different medium. 
NEDM: Section
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the term in which the section is offered (e.g., First semester, Second semester, Year long, summer school)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for the section, that is defined for a campus by the classroom, the subjects taught, and the instructors that are assigned.
NEDM: Unique Course Code
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'UniqueSectionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When a section is part of a sequence of parts for a course, the number if the sequence.  If the course has only onle part, the value of this section attribute should be 1.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'SequenceOfCourse';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The setting in which a child receives education and related services; for example:
Center-based instruction
Home-based instruction
Hospital class
Mainstream
Residential care and treatment facility
....

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'EducationalEnvironmentTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The media through which teachers provide instruction to students and students and teachers communicate about instructional matters; for example:
Technology-based instruction in classroom
Correspondence instruction
Face-to-face instruction
Virtual/On-line Distance learning
Center-based instruction
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'MediumOfInstructionTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The population for which the course was designed; for example:
Bilingual students
Remedial education students
Gifted and talented students
Career and Technical Education students
Special education students
....
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'PopulationServedTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of credits or units of value awarded for the completion of a course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'AvailableCreditTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Credits or units of value awarded for the completion of a course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Section', @level2type = N'COLUMN', @level2name = N'AvailableCredit';

