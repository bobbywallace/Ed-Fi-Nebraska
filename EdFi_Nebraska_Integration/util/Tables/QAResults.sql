CREATE TABLE [util].[QAResults] (
    [QAResultsId]           INT            IDENTITY (1, 1) NOT NULL,
    [ScriptFileName]        NVARCHAR (255) NULL,
    [ScriptResult]          NVARCHAR (20)  NULL,
    [NumberOfDiscrepancies] INT            NULL,
    [Comment]               NVARCHAR (MAX) NULL,
    [ResultFileName]        NVARCHAR (255) NULL,
    [CreateDateTime]        DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([QAResultsId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

