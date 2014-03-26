CREATE TABLE [edfi].[AssessmentFamilyAssessmentPeriod] (
    [AssessmentFamilyTitle]        NVARCHAR (60) NOT NULL,
    [AssessmentPeriodDescriptorId] INT           NOT NULL,
    CONSTRAINT [PK_AssessmentFamilyAssessmentPeriod] PRIMARY KEY CLUSTERED ([AssessmentFamilyTitle] ASC, [AssessmentPeriodDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AssessmentFamilyAssessmentPeriod_AssessmentFamily] FOREIGN KEY ([AssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle]),
    CONSTRAINT [FK_AssessmentFamilyAssessmentPeriod_AssessmentPeriodDescriptor] FOREIGN KEY ([AssessmentPeriodDescriptorId]) REFERENCES [edfi].[AssessmentPeriodDescriptor] ([AssessmentPeriodDescriptorId])
);

