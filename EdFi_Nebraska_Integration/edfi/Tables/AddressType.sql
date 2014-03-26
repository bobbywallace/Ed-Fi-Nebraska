﻿CREATE TABLE [edfi].[AddressType] (
    [AddressTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]     NVARCHAR (20)  NOT NULL,
    [Description]   NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAddressType] PRIMARY KEY NONCLUSTERED ([AddressTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAddressTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);
