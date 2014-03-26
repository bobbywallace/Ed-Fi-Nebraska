CREATE TABLE [edfi].[School] (
    [SchoolId]                                 INT NOT NULL,
    [LocalEducationAgencyId]                   INT NULL,
    [SchoolTypeId]                             INT NULL,
    [CharterStatusTypeId]                      INT NULL,
    [TitleIPartASchoolDesignationTypeId]       INT NULL,
    [MagnetSpecialProgramEmphasisSchoolTypeId] INT NULL,
    [AdministrativeFundingControlTypeId]       INT NULL,
    CONSTRAINT [PKSchool] PRIMARY KEY NONCLUSTERED ([SchoolId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AdministrativeFundingControlType_School] FOREIGN KEY ([AdministrativeFundingControlTypeId]) REFERENCES [edfi].[AdministrativeFundingControlType] ([AdministrativeFundingControlTypeId]),
    CONSTRAINT [FK_CharterStatusType_School] FOREIGN KEY ([CharterStatusTypeId]) REFERENCES [edfi].[CharterStatusType] ([CharterStatusTypeId]),
    CONSTRAINT [FK_MagnetSpecialProgramEmphasisSchoolType_School] FOREIGN KEY ([MagnetSpecialProgramEmphasisSchoolTypeId]) REFERENCES [edfi].[MagnetSpecialProgramEmphasisSchoolType] ([MagnetSpecialProgramEmphasisSchoolTypeId]),
    CONSTRAINT [FK_School_EducationOrganization] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_School_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId]) REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId]),
    CONSTRAINT [FK_SchoolType_School] FOREIGN KEY ([SchoolTypeId]) REFERENCES [edfi].[SchoolType] ([SchoolTypeId]),
    CONSTRAINT [FK_TitleIPartASchoolDesignationType_School] FOREIGN KEY ([TitleIPartASchoolDesignationTypeId]) REFERENCES [edfi].[TitleIPartASchoolDesignationType] ([TitleIPartASchoolDesignationTypeId])
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents an educational organization that includes staff and students who participate in classes and educational activity groups.
NEDM: School
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The instructional categorization of the school (e.g., Regular, Alternative, etc.)

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'SchoolTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A school or agency providing free public elementary or secondary education to eligible students under a specific charter granted by the state legislature or other appropriate authority and designated by such authority to be a charter school.

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'CharterStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Denotes the Title I Part A designation for the school.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'TitleIPartASchoolDesignationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A school that has been designed: 1) to attract students of different racial/ethnic backgrounds for the purpose of reducing, preventing, or eliminating racial isolation; and/or 2)to provide an academic or social focus on a particular theme (e.g., science/math, performing arts, gifted/talented, or foreign language).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'MagnetSpecialProgramEmphasisSchoolTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of education institution as classified by its funding source.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'School', @level2type = N'COLUMN', @level2name = N'AdministrativeFundingControlTypeId';

