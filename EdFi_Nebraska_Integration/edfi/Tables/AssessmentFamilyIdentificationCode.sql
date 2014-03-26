CREATE TABLE [edfi].[AssessmentFamilyIdentificationCode] (
    [AssessmentFamilyTitle]                NVARCHAR (60) NOT NULL,
    [AssessmentIdentificationSystemTypeId] INT           NOT NULL,
    [AssigningOrganizationCode]            NVARCHAR (60) NULL,
    [IdentificationCode]                   NVARCHAR (60) NOT NULL,
    CONSTRAINT [PK_AssessmentFamilyIdentificationCode] PRIMARY KEY CLUSTERED ([AssessmentFamilyTitle] ASC, [AssessmentIdentificationSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AssessmentFamilyIdentificationCode_AssessmentFamily] FOREIGN KEY ([AssessmentFamilyTitle]) REFERENCES [edfi].[AssessmentFamily] ([AssessmentFamilyTitle]),
    CONSTRAINT [FK_AssessmentFamilyIdentificationCode_AssessmentIdentificationSystemType] FOREIGN KEY ([AssessmentIdentificationSystemTypeId]) REFERENCES [edfi].[AssessmentIdentificationSystemType] ([AssessmentIdentificationSystemTypeId])
);

