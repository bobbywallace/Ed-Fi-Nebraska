CREATE TABLE [edfi].[OpenStaffPositionAcademicSubjects] (
    [EducationOrganizationId]   INT           NOT NULL,
    [EmploymentStatusTypeId]    INT           NOT NULL,
    [StaffClassificationTypeId] INT           NOT NULL,
    [RequisitionNumber]         NVARCHAR (10) NOT NULL,
    [DatePosted]                DATE          NOT NULL,
    [AcademicSubjectTypeId]     INT           NOT NULL,
    CONSTRAINT [PK_OpenStaffPositionAcademicSubjects] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [EmploymentStatusTypeId] ASC, [StaffClassificationTypeId] ASC, [RequisitionNumber] ASC, [DatePosted] ASC, [AcademicSubjectTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_OpenStaffPositionAcademicSubjects_AcademicSubjectType] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_OpenStaffPositionAcademicSubjects_OpenStaffPosition] FOREIGN KEY ([EducationOrganizationId], [EmploymentStatusTypeId], [StaffClassificationTypeId], [RequisitionNumber], [DatePosted]) REFERENCES [edfi].[OpenStaffPosition] ([EducationOrganizationId], [EmploymentStatusTypeId], [StaffClassificationTypeId], [RequisitionNumber], [DatePosted])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPositionAcademicSubjects', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The desired employment status (e.g., contractual, substitute, permanent employee)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPositionAcademicSubjects', @level2type = N'COLUMN', @level2name = N'EmploymentStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The position''s title or rank (e.g., Counselor, teacher, etc)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPositionAcademicSubjects', @level2type = N'COLUMN', @level2name = N'StaffClassificationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the position was posted.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPositionAcademicSubjects', @level2type = N'COLUMN', @level2name = N'DatePosted';

