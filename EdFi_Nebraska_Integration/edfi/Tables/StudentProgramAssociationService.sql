CREATE TABLE [edfi].[StudentProgramAssociationService] (
    [StudentUSI]              BIGINT NOT NULL,
    [ProgramTypeId]           INT    NOT NULL,
    [EducationOrganizationId] INT    NOT NULL,
    [BeginDate]               DATE   NOT NULL,
    [ServiceDescriptorId]     INT    NOT NULL,
    CONSTRAINT [PK_StudentProgramAssociationService] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [ProgramTypeId] ASC, [EducationOrganizationId] ASC, [BeginDate] ASC, [ServiceDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentProgramAssociationService_ServiceDescriptor] FOREIGN KEY ([ServiceDescriptorId]) REFERENCES [edfi].[ServiceDescriptor] ([ServiceDescriptorId]),
    CONSTRAINT [FK_StudentProgramAssociationService_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the supplemental program(s) that a student participates in or receives services from.  The association is an extension of the StudentProgramAssociation particular for supplemental services.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociationService';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student first received services.
NEDM: Beginning Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentProgramAssociationService', @level2type = N'COLUMN', @level2name = N'BeginDate';

