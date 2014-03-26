CREATE TABLE [edfi].[AccountabilityRating] (
    [EducationOrganizationId] INT           NOT NULL,
    [RatingTitle]             NVARCHAR (30) NOT NULL,
    [SchoolYear]              SMALLINT      NOT NULL,
    [Rating]                  NVARCHAR (30) NOT NULL,
    [RatingDate]              DATE          NULL,
    [RatingOrganization]      NVARCHAR (20) NULL,
    [RatingProgram]           NVARCHAR (30) NULL,
    CONSTRAINT [PK_AccountabilityRating] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [RatingTitle] ASC, [SchoolYear] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AccountabilityRating_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_AccountabilityRating_SchoolYearType] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An accountability rating for a campus or district.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountabilityRating';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The title of the rating (e.g., Campus Rating, Safety Score, etc.)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountabilityRating', @level2type = N'COLUMN', @level2name = N'RatingTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The school year for which the rating was awarded.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountabilityRating', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An accountability rating level, designation, or assessment.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountabilityRating', @level2type = N'COLUMN', @level2name = N'Rating';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the rating was awarded.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountabilityRating', @level2type = N'COLUMN', @level2name = N'RatingDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The organization assigning the accountability rating.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountabilityRating', @level2type = N'COLUMN', @level2name = N'RatingOrganization';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The rating program (e.g., NCLB, AEIS, etc.)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AccountabilityRating', @level2type = N'COLUMN', @level2name = N'RatingProgram';

