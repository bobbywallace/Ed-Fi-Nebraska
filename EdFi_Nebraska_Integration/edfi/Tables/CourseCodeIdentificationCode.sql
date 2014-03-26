CREATE TABLE [edfi].[CourseCodeIdentificationCode] (
    [EducationOrganizationId]   INT           NOT NULL,
    [IdentityCourseCode]        NVARCHAR (20) NOT NULL,
    [CourseCodeSystemTypeId]    INT           NOT NULL,
    [AssigningOrganizationCode] NVARCHAR (60) NULL,
    [IdentificationCode]        NVARCHAR (60) NOT NULL,
    CONSTRAINT [PK_CourseCodeIdentificationCode] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [IdentityCourseCode] ASC, [CourseCodeSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CourseCodeIdentificationCode_Course] FOREIGN KEY ([EducationOrganizationId], [IdentityCourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [IdentityCourseCode]),
    CONSTRAINT [FK_CourseCodeIdentificationCode_CourseCodeSystemType] FOREIGN KEY ([CourseCodeSystemTypeId]) REFERENCES [edfi].[CourseCodeSystemType] ([CourseCodeSystemTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseCodeIdentificationCode', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';

