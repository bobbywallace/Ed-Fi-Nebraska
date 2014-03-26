CREATE TABLE [edfi].[StaffAddress] (
    [StaffUSI]                 BIGINT         NOT NULL,
    [AddressTypeId]            INT            NOT NULL,
    [StreetNumberName]         NVARCHAR (150) NOT NULL,
    [ApartmentRoomSuiteNumber] NVARCHAR (20)  NULL,
    [BuildingSiteNumber]       NVARCHAR (20)  NULL,
    [City]                     NVARCHAR (30)  NOT NULL,
    [StateAbbreviationTypeId]  INT            NOT NULL,
    [PostalCode]               NVARCHAR (17)  NOT NULL,
    [NameOfCounty]             NVARCHAR (30)  NULL,
    [CountyFIPSCode]           NVARCHAR (5)   NULL,
    [CountryCodeTypeId]        INT            NULL,
    [Latitude]                 NVARCHAR (20)  NULL,
    [Longitude]                NVARCHAR (20)  NULL,
    [BeginDate]                DATE           NULL,
    [EndDate]                  DATE           NULL,
    CONSTRAINT [PK_StaffAddress] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [AddressTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StaffAddress_AddressType] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId]),
    CONSTRAINT [FK_StaffAddress_CountryCodeType] FOREIGN KEY ([CountryCodeTypeId]) REFERENCES [edfi].[CountryCodeType] ([CountryCodeTypeId]),
    CONSTRAINT [FK_StaffAddress_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]),
    CONSTRAINT [FK_StaffAddress_StateAbbreviationType] FOREIGN KEY ([StateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The street number and street name or post office box number of an address.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'StreetNumberName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The apartment, room, or suite number of an address. 
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'ApartmentRoomSuiteNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of the building on the site, if more than one building shares the same address.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'BuildingSiteNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the city in which an address is located. 
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'City';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The abbreviation for the state (within the United States) or outlying area in which an address is located. 
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'StateAbbreviationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The five or nine digit zip code portion of an address.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'PostalCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the county, parish, borough, or comparable unit (within a state) in which an address is located.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'NameOfCounty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'5 digit code consisting of the two digit state code followed by the three digit FIPS code for the county.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'CountyFIPSCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique two character International Organization for Standardization (ISO) code for the country in which an address is located.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffAddress', @level2type = N'COLUMN', @level2name = N'CountryCodeTypeId';

