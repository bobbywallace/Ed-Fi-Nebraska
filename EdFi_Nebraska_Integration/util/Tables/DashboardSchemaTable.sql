CREATE TABLE [util].[DashboardSchemaTable] (
    [DashboardSchemaTableId] INT            IDENTITY (1, 1) NOT NULL,
    [TableSchema]            NVARCHAR (255) NULL,
    [TableName]              NVARCHAR (255) NULL
)
WITH (DATA_COMPRESSION = PAGE);

