CREATE TABLE [edfi].[Diploma] (
    [StudentUSI]         BIGINT   NOT NULL,
    [SchoolId]           INT      NOT NULL,
    [DiplomaTypeId]      INT      NOT NULL,
    [DiplomaAwardDate]   DATE     NOT NULL,
    [SchoolYear]         SMALLINT NOT NULL,
    [TermTypeId]         INT      NOT NULL,
    [DiplomaLevelTypeId] INT      NULL,
    [CTECompleter]       BIT      NULL,
    [AcademicHonors]     INT      NOT NULL,
    [Recognitions]       INT      NOT NULL,
    CONSTRAINT [PK_Diploma] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [DiplomaTypeId] ASC, [DiplomaAwardDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Diploma_DiplomaLevelType] FOREIGN KEY ([DiplomaLevelTypeId]) REFERENCES [edfi].[DiplomaLevelType] ([DiplomaLevelTypeId]),
    CONSTRAINT [FK_Diploma_DiplomaType] FOREIGN KEY ([DiplomaTypeId]) REFERENCES [edfi].[DiplomaType] ([DiplomaTypeId]),
    CONSTRAINT [FK_Diploma_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_Diploma_StudentAcademicRecord] FOREIGN KEY ([StudentUSI], [SchoolId], [SchoolYear], [TermTypeId]) REFERENCES [edfi].[StudentAcademicRecord] ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This educational entity represents the conferring or certification by an educational organization that the student has successfully completed a particular course of study.  It represents the electronic version of its physical document counterpart.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'DiplomaTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student met  graduation requirements and was awarded a diploma.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'DiplomaAwardDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The "as of" school year the student academic record.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.
Minimum high school program
Recommended high school program
Distinguished Achievement Program

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'DiplomaLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicated a student who reached a state&ndash;defined threshold of vocational education and who attained a high school diploma or its recognized state equivalent or GED.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'CTECompleter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Academic distinctions earned by or awarded to the student.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'AcademicHonors';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Recognitions given to the student for accomplishments in a co-curricular, or extra-curricular activity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Diploma', @level2type = N'COLUMN', @level2name = N'Recognitions';

