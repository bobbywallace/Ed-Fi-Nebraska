CREATE TABLE [edfi].[GraduationPlanCreditsBySubject] (
    [GraduationPlanTypeId]    INT            NOT NULL,
    [EducationOrganizationId] INT            NOT NULL,
    [SubjectAreaTypeId]       INT            NOT NULL,
    [Credit]                  DECIMAL (9, 2) NOT NULL,
    [CreditTypeId]            INT            NULL,
    [CreditConversion]        DECIMAL (9, 2) NULL,
    CONSTRAINT [PK_GraduationPlanCreditsBySubject] PRIMARY KEY CLUSTERED ([GraduationPlanTypeId] ASC, [EducationOrganizationId] ASC, [SubjectAreaTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_GraduationPlanCreditsBySubject_AcademicSubjectType] FOREIGN KEY ([SubjectAreaTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_GraduationPlanCreditsBySubject_CreditType] FOREIGN KEY ([CreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId]),
    CONSTRAINT [FK_GraduationPlanCreditsBySubject_GraduationPlan] FOREIGN KEY ([GraduationPlanTypeId], [EducationOrganizationId]) REFERENCES [edfi].[GraduationPlan] ([GraduationPlanTypeId], [EducationOrganizationId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanCreditsBySubject', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';

