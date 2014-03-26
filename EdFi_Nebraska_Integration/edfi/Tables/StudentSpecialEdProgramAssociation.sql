CREATE TABLE [edfi].[StudentSpecialEdProgramAssociation] (
    [StudentUSI]                   BIGINT         NOT NULL,
    [ProgramTypeId]                INT            NOT NULL,
    [EducationOrganizationId]      INT            NOT NULL,
    [BeginDate]                    DATE           NOT NULL,
    [IdeaEligibilityTypeId]        INT            NOT NULL,
    [EducationalEnvironmentTypeId] INT            NOT NULL,
    [MultiplyDisabled]             BIT            NULL,
    [MedicallyFragile]             BIT            NULL,
    [SpecialEducationHoursPerWeek] DECIMAL (5, 2) NULL,
    [LastEvaluationDate]           DATE           NULL,
    [IEPReviewDate]                DATE           NULL,
    [IEPBeginDate]                 DATE           NULL,
    [IEPEndDate]                   DATE           NULL,
    CONSTRAINT [PK_StudentSpecialEdProgramAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [ProgramTypeId] ASC, [EducationOrganizationId] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationalEnvironmentType_StudentSpecialEdProgramAssociation] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId]),
    CONSTRAINT [FK_IdeaEligibilityType_StudentSpecialEdProgramAssociation] FOREIGN KEY ([IdeaEligibilityTypeId]) REFERENCES [edfi].[IdeaEligibilityType] ([IdeaEligibilityTypeId]),
    CONSTRAINT [FK_StudentSpecialEdProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the special education program(s) that a student participates in or receives services from.  The association is an extension of the StudentProgramAssociation particular for special education programs.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEdProgramAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student first received services.
NEDM: Beginning Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEdProgramAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of the eligibility of the student to receive special education services according to the Individuals with Disabilities Education Act (IDEA).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEdProgramAssociation', @level2type = N'COLUMN', @level2name = N'IdeaEligibilityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The setting in which a child receives special education and related services.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEdProgramAssociation', @level2type = N'COLUMN', @level2name = N'EducationalEnvironmentTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether the student receiving special education and related services has been designated as multiply disabled by the admission, review, and dismissal committee. [See 19 TAC Â§89.1040(c)(6).]
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEdProgramAssociation', @level2type = N'COLUMN', @level2name = N'MultiplyDisabled';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether the student receiving special education and related services is:
1) in the age range of birth to 22 years, and
2) has a serious, ongoing illness or a chronic condition that has lasted or is anticipated to last at least 12 or more months or has required at least one month of hospitalization, and that requires daily, ongoing medical treatments and monitoring by appropriately trained personnel which may include parents or other family members, and
3) requires the routine use of medical device or of assistive technology to compensate for the loss of usefulness of a body function needed to participate in activities of daily living, and
4) lives with ongoing threat to his or her continued well-being.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSpecialEdProgramAssociation', @level2type = N'COLUMN', @level2name = N'MedicallyFragile';

