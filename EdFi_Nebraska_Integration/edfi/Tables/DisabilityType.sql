CREATE TABLE [edfi].[DisabilityType] (
    [DisabilityTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (20)  NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKDisabilityType] PRIMARY KEY NONCLUSTERED ([DisabilityTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIDisabilityTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

