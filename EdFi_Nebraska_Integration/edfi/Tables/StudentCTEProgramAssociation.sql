CREATE TABLE [edfi].[StudentCTEProgramAssociation] (
    [StudentUSI]                    BIGINT         NOT NULL,
    [ProgramTypeId]                 INT            NOT NULL,
    [EducationOrganizationId]       INT            NOT NULL,
    [BeginDate]                     DATE           NOT NULL,
    [CareerPathwayTypeId]           INT            NOT NULL,
    [CIPCode]                       NVARCHAR (120) NULL,
    [PrimaryCTEProgramIndicator]    BIT            NULL,
    [CTEProgramCompletionIndicator] BIT            NULL,
    CONSTRAINT [PK_StudentCTEProgramAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [ProgramTypeId] ASC, [EducationOrganizationId] ASC, [BeginDate] ASC, [CareerPathwayTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CareerPathwayType_StudentCTEProgramAssociation] FOREIGN KEY ([CareerPathwayTypeId]) REFERENCES [edfi].[CareerPathwayType] ([CareerPathwayTypeId]),
    CONSTRAINT [FK_StudentCTEProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate]) REFERENCES [edfi].[StudentProgramAssociation] ([StudentUSI], [ProgramTypeId], [EducationOrganizationId], [BeginDate])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the career and technical education (CTE) program that a student participates in.  The association is an extension of the StudentProgramAssociation particular for CTE programs.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student first received services.
NEDM: Beginning Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The career cluster representing the career path of the Vocational/Career Tech concentrator.
NEDM: Career Cluster

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCTEProgramAssociation', @level2type = N'COLUMN', @level2name = N'CareerPathwayTypeId';

