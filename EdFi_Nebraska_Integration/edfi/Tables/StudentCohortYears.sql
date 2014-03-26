CREATE TABLE [edfi].[StudentCohortYears] (
    [StudentUSI]       BIGINT   NOT NULL,
    [CohortYearTypeId] INT      NOT NULL,
    [SchoolYear]       SMALLINT NOT NULL,
    CONSTRAINT [PK_StudentCohortYears] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [CohortYearTypeId] ASC, [SchoolYear] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentCohortYears_CohortYearType] FOREIGN KEY ([CohortYearTypeId]) REFERENCES [edfi].[CohortYearType] ([CohortYearTypeId]),
    CONSTRAINT [FK_StudentCohortYears_SchoolYearType] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear]),
    CONSTRAINT [FK_StudentCohortYears_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCohortYears', @level2type = N'COLUMN', @level2name = N'StudentUSI';

