CREATE TABLE [edfi].[ClassRanking] (
    [StudentUSI]              BIGINT   NOT NULL,
    [EducationOrganizationId] INT      NOT NULL,
    [SchoolYear]              SMALLINT NOT NULL,
    [TermTypeId]              INT      NOT NULL,
    [ClassRank]               INT      NOT NULL,
    [TotalNumberInClass]      INT      NOT NULL,
    [PercentageRanking]       INT      NOT NULL,
    [ClassRankingDate]        DATE     NOT NULL,
    CONSTRAINT [PK_ClassRanking] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [EducationOrganizationId] ASC, [SchoolYear] ASC, [TermTypeId] ASC, [ClassRank] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ClassRanking_StudentAcademicRecord] FOREIGN KEY ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermTypeId]) REFERENCES [edfi].[StudentAcademicRecord] ([StudentUSI], [EducationOrganizationId], [SchoolYear], [TermTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The "as of" school year the student academic record.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The academic rank of a student in relation to his or her graduating class (e.g., 1st, 2nd, 3rd).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking', @level2type = N'COLUMN', @level2name = N'ClassRank';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of students in the student''s graduating class.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking', @level2type = N'COLUMN', @level2name = N'TotalNumberInClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The academic percentage rank of a student in relation to his or her graduating class (e.g., 95%, 80%, 50%).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking', @level2type = N'COLUMN', @level2name = N'PercentageRanking';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date class ranking was determined.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassRanking', @level2type = N'COLUMN', @level2name = N'ClassRankingDate';

