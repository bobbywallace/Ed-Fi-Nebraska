CREATE TABLE [edfi].[IncidentLocationType] (
    [IncidentLocationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]              NVARCHAR (50)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKIncidentLocationType] PRIMARY KEY NONCLUSTERED ([IncidentLocationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIIncidentLocationTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

