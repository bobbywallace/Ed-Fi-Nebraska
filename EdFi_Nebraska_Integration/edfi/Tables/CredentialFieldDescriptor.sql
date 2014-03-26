CREATE TABLE [edfi].[CredentialFieldDescriptor] (
    [CredentialFieldDescriptorId] INT             IDENTITY (1, 1) NOT NULL,
    [EducationOrganizationId]     INT             NOT NULL,
    [CodeValue]                   NVARCHAR (20)   NULL,
    [Description]                 NVARCHAR (1024) NOT NULL,
    [AcademicSubjectTypeId]       INT             NULL,
    CONSTRAINT [PK_CredentialFieldDescriptor] PRIMARY KEY CLUSTERED ([CredentialFieldDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AcademicSubjectType_CredentialFieldDescriptor] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId])
);

