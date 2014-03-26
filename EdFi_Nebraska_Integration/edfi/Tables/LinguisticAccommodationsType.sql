CREATE TABLE [edfi].[LinguisticAccommodationsType] (
    [LinguisticAccommodationsTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                      NVARCHAR (50)  NOT NULL,
    [Description]                    NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKLinguisticAccommodationsType] PRIMARY KEY NONCLUSTERED ([LinguisticAccommodationsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UILinguisticAccommodationsTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

