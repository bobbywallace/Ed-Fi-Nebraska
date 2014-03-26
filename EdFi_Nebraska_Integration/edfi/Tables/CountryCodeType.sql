CREATE TABLE [edfi].[CountryCodeType] (
    [CountryCodeTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]         NVARCHAR (20)  NOT NULL,
    [Description]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCountryCodeType] PRIMARY KEY NONCLUSTERED ([CountryCodeTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICountryCodeTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

