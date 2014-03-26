CREATE TABLE [edfi].[CourseOffering] (
    [SchoolId]           INT           NOT NULL,
    [TermTypeId]         INT           NOT NULL,
    [SchoolYear]         SMALLINT      NOT NULL,
    [LocalCourseCode]    NVARCHAR (20) NOT NULL,
    [LocalCourseTitle]   NVARCHAR (60) NULL,
    [IdentityCourseCode] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_CourseOffering] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [LocalCourseCode] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CourseOffering_Course] FOREIGN KEY ([SchoolId], [IdentityCourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [IdentityCourseCode]),
    CONSTRAINT [FK_CourseOffering_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_CourseOffering_Session] FOREIGN KEY ([SchoolId], [TermTypeId], [SchoolYear]) REFERENCES [edfi].[Session] ([EducationOrganizationId], [TermTypeId], [SchoolYear])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseOffering', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseOffering', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseOffering', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseOffering', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';

