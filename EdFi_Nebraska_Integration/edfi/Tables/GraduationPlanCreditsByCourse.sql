CREATE TABLE [edfi].[GraduationPlanCreditsByCourse] (
    [GraduationPlanTypeId]    INT            NOT NULL,
    [EducationOrganizationId] INT            NOT NULL,
    [IdentityCourseCode]      NVARCHAR (20)  NOT NULL,
    [Credit]                  DECIMAL (9, 2) NOT NULL,
    [CreditTypeId]            INT            NULL,
    [CreditConversion]        DECIMAL (9, 2) NULL,
    [GradeLevelTypeId]        INT            NULL,
    CONSTRAINT [PK_GraduationPlanCreditsByCourse] PRIMARY KEY CLUSTERED ([GraduationPlanTypeId] ASC, [EducationOrganizationId] ASC, [IdentityCourseCode] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_GraduationPlanCreditsByCourse_CreditType] FOREIGN KEY ([CreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId]),
    CONSTRAINT [FK_GraduationPlanCreditsByCourse_GradeLevelType] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_GraduationPlanCreditsByCourse_GraduationPlan] FOREIGN KEY ([GraduationPlanTypeId], [EducationOrganizationId]) REFERENCES [edfi].[GraduationPlan] ([GraduationPlanTypeId], [EducationOrganizationId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanCreditsByCourse', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanCreditsByCourse', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';

