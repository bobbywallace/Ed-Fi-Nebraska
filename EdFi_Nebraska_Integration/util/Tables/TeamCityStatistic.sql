CREATE TABLE [util].[TeamCityStatistic] (
    [TeamCityStatisticId] INT            IDENTITY (1, 1) NOT NULL,
    [StatisticKey]        NVARCHAR (255) NULL,
    [StatisticValue]      NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([TeamCityStatisticId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

