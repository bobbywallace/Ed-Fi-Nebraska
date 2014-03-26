CREATE TABLE [edfi].[PopulationServedType] (
    [PopulationServedTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]              NVARCHAR (20)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKPopulationServedType] PRIMARY KEY NONCLUSTERED ([PopulationServedTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIPopulationServedTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

