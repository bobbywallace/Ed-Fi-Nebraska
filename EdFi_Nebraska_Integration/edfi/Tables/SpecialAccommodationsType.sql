CREATE TABLE [edfi].[SpecialAccommodationsType] (
    [SpecialAccommodationsTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                   NVARCHAR (25)  NOT NULL,
    [Description]                 NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKSpecialAccommodationsType] PRIMARY KEY NONCLUSTERED ([SpecialAccommodationsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UISpecialAccommodationsTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

