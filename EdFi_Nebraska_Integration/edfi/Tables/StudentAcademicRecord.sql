CREATE TABLE [edfi].[StudentAcademicRecord] (
    [StudentUSI]                  BIGINT          NOT NULL,
    [EducationOrganizationId]     INT             NOT NULL,
    [SchoolYear]                  SMALLINT        NOT NULL,
    [TermTypeId]                  INT             NOT NULL,
    [CumulativeCreditsEarned]     DECIMAL (9, 2)  NULL,
    [CumulativeCreditsAttempted]  DECIMAL (9, 2)  NULL,
    [CumulativeGradePointsEarned] DECIMAL (18, 4) NULL,
    [CumulativeGradePointAverage] DECIMAL (18, 4) NULL,
    [GradeValueQualifier]         NVARCHAR (20)   NULL,
    [ProjectedGraduationDate]     DATE            NULL,
    CONSTRAINT [PK_StudentAcademicRecord] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [EducationOrganizationId] ASC, [SchoolYear] ASC, [TermTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentAcademicRecord_SchoolYearType] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear]),
    CONSTRAINT [FK_StudentAcademicRecord_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This educational entity represents the cumulative record of academic achievement for a student.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The "as of" school year the student academic record.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cumulative number of credits an individual earns by completing courses or examinations during his or her enrollment in the current school as well as those credits transferred from schools in which the individual had been previously enrolled.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeCreditsEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cumulative number of credits an individual attempts to earn by taking courses during his or her enrollment in the current school as well as those credits transferred from schools in which the individual had been previously enrolled.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeCreditsAttempted';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cumulative number of grade points an individual earns by successfully completing courses or examinations during his or her enrollment in the current school as well as those transferred from schools in which the individual had been previously enrolled.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeGradePointsEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A measure of average performance in all courses taken by an individual during his or her school career as determined for record-keeping purposes. This is obtained by dividing the total grade points received by the total number of credits attempted. This usually includes grade points received and credits attempted in his or her current school as well as those transferred from schools in which the individual was previously enrolled.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeGradePointAverage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The scale of equivalents, if applicable, for grades awarded as indicators of performance in schoolwork. For example, numerical equivalents for letter grades used in determining a student''s Grade Point Average (A=4, B=3, C=2, D=1 in a four-point system) or letter equivalents for percentage grades (90-100%=A, 80-90%=B, etc.).
NEDM: Grade Value Qualifier
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'GradeValueQualifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month and year the student is projected to graduate.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'ProjectedGraduationDate';

