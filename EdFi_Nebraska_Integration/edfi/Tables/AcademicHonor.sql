CREATE TABLE [edfi].[AcademicHonor] (
    [StudentUSI]           BIGINT        NOT NULL,
    [SchoolId]             INT           NOT NULL,
    [DiplomaTypeId]        INT           NOT NULL,
    [DiplomaAwardDate]     DATE          NOT NULL,
    [AcademicHonorsTypeId] INT           NOT NULL,
    [HonorAwardDate]       DATE          NOT NULL,
    [HonorsDescription]    NVARCHAR (80) NOT NULL,
    [SchoolYear]           SMALLINT      NULL,
    [TermTypeId]           INT           NULL,
    CONSTRAINT [PK_AcademicHonor] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [DiplomaTypeId] ASC, [DiplomaAwardDate] ASC, [AcademicHonorsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AcademicHonor_Diploma] FOREIGN KEY ([StudentUSI], [SchoolId], [DiplomaTypeId], [DiplomaAwardDate]) REFERENCES [edfi].[Diploma] ([StudentUSI], [SchoolId], [DiplomaTypeId], [DiplomaAwardDate]),
    CONSTRAINT [FK_AcademicHonorsTypeType_AcademicHonor] FOREIGN KEY ([AcademicHonorsTypeId]) REFERENCES [edfi].[AcademicHonorsType] ([AcademicHonorsTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Academic distinctions earned by or awarded to the student
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'DiplomaTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student met  graduation requirements and was awarded a diploma.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'DiplomaAwardDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A designation of the type of academic distinctions earned by or awarded to the student.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'AcademicHonorsTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the honor was awarded or earned.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'HonorAwardDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A description of the type of academic distinctions earned by or awarded to the individual.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'HonorsDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The "as of" school year the student academic record.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonor', @level2type = N'COLUMN', @level2name = N'TermTypeId';

