CREATE TABLE [edfi].[CareerPathwayType] (
    [CareerPathwayTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (50)  NOT NULL,
    [Description]         NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCareerPathwayType] PRIMARY KEY NONCLUSTERED ([CareerPathwayTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICareerPathwayTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

