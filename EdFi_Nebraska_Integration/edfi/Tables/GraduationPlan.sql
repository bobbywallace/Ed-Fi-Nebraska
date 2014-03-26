CREATE TABLE [edfi].[GraduationPlan] (
    [GraduationPlanTypeId]                 INT            NOT NULL,
    [EducationOrganizationId]              INT            NOT NULL,
    [IndividualPlan]                       BIT            NULL,
    [TotalCreditsRequired]                 DECIMAL (9, 2) NULL,
    [TotalCreditsRequiredCreditTypeId]     INT            NULL,
    [TotalCreditsRequiredCreditConversion] DECIMAL (9, 2) NULL,
    CONSTRAINT [PK_GraduationPlan] PRIMARY KEY CLUSTERED ([GraduationPlanTypeId] ASC, [EducationOrganizationId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_GraduationPlan_CreditType] FOREIGN KEY ([TotalCreditsRequiredCreditTypeId]) REFERENCES [edfi].[CreditType] ([CreditTypeId]),
    CONSTRAINT [FK_GraduationPlan_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_GraduationPlan_GraduationPlanType] FOREIGN KEY ([GraduationPlanTypeId]) REFERENCES [edfi].[GraduationPlanType] ([GraduationPlanTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlan', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';

