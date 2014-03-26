CREATE TABLE [util].[EdFiPopulation] (
    [EdFiPopulationId]    INT             IDENTITY (1, 1) NOT NULL,
    [TableSchema]         NVARCHAR (255)  NULL,
    [TableName]           NVARCHAR (255)  NULL,
    [RecordCount]         INT             NULL,
    [PriorRecordCount]    INT             NULL,
    [PercentChanged]      DECIMAL (10, 2) NULL,
    [MostRecentDate]      DATE            NULL,
    [PriorMostRecentDate] DATE            NULL,
    [DatabaseName]        NVARCHAR (255)  NULL,
    [PriorDatabaseName]   NVARCHAR (255)  NULL,
    [Comment]             NVARCHAR (100)  NULL,
    PRIMARY KEY CLUSTERED ([EdFiPopulationId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

