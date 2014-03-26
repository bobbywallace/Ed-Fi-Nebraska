CREATE TABLE [edfi].[Course] (
    [EducationOrganizationId]      INT            NOT NULL,
    [IdentityCourseCode]           NVARCHAR (20)  NOT NULL,
    [CourseTitle]                  NVARCHAR (60)  NOT NULL,
    [NumberOfParts]                INT            NOT NULL,
    [CourseLevelTypeId]            INT            NULL,
    [SubjectAreaTypeId]            INT            NULL,
    [CourseDescription]            NVARCHAR (20)  NULL,
    [DateCourseAdopted]            DATE           NULL,
    [HighSchoolCourseRequirement]  BIT            NULL,
    [CourseGPAApplicabilityTypeId] INT            NULL,
    [CourseDefinedByTypeId]        INT            NULL,
    [MinimumAvailableCreditTypeId] INT            NULL,
    [MinimumAvailableCredit]       DECIMAL (9, 2) NULL,
    [MaximumAvailableCreditTypeId] INT            NULL,
    [MaximumAvailableCredit]       DECIMAL (9, 2) NULL,
    [CareerPathwayTypeId]          INT            NULL,
    [CompetencyLevelDescriptorId]  INT            NULL,
    CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [IdentityCourseCode] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AcademicSubjectType_Course] FOREIGN KEY ([SubjectAreaTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_Course_CompetencyLevelDescriptor] FOREIGN KEY ([CompetencyLevelDescriptorId]) REFERENCES [edfi].[CompetencyLevelDescriptor] ([CompetencyLevelDescriptorId]),
    CONSTRAINT [FK_Course_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_CourseGPAApplicabilityType_Course] FOREIGN KEY ([CourseGPAApplicabilityTypeId]) REFERENCES [edfi].[CourseGPAApplicabilityType] ([CourseGPAApplicabilityTypeId]),
    CONSTRAINT [FK_CourseLevelType_Course] FOREIGN KEY ([CourseLevelTypeId]) REFERENCES [edfi].[CourseLevelType] ([CourseLevelTypeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Course_IdentyCrseCdEdOrgIdSubjAreaTypeId]
    ON [edfi].[Course]([IdentityCourseCode] ASC, [EducationOrganizationId] ASC, [SubjectAreaTypeId] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This educational entity represents the organization of subject matter and related learning experiences provided for the instruction of students on a regular or systematic basis. 
NEDM: Course', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The descriptive name given to a course of study offered in a school or other institution or organization. In departmentalized classes at the elementary, secondary, and postsecondary levels (and for staff development activities), this refers to the name by which a course is identified (e.g., American History, English III). For elementary and other non-departmentalized classes, it refers to any portion of the instruction for which a grade or report is assigned (e.g., reading, composition, spelling, and language arts).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'CourseTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of parts identified for a course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'NumberOfParts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The course''s level of rigor
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'CourseLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The intended major subject area of the course.
NEDM: Secondary Course Subject Area
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'SubjectAreaTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A description of the content standards and goals covered in the course. Reference may be made to state or national content standards.
NEDM: Course Description
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'CourseDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the district adopted the course.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'DateCourseAdopted';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication that this course credit is required for a high school diploma.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'HighSchoolCourseRequirement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indicator of whether or not this course being described is included in the computation of the student&rsquo;s Grade Point Average, and if so, if it weighted differently from regular courses.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Course', @level2type = N'COLUMN', @level2name = N'CourseGPAApplicabilityTypeId';

