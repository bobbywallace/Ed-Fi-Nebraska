CREATE TABLE [edfi].[OldEthnicityType] (
    [OldEthnicityTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (35)  NOT NULL,
    [Description]        NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKOldEthnicityType] PRIMARY KEY NONCLUSTERED ([OldEthnicityTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIOldEthnicityTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

