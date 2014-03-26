CREATE TABLE [util].[EdFiSanity] (
    [EdFiSanityId]         INT            IDENTITY (1, 1) NOT NULL,
    [BeginLine]            INT            NULL,
    [EndLine]              INT            NULL,
    [InterChangeName]      NVARCHAR (255) NULL,
    [ScriptResult]         NVARCHAR (20)  NULL,
    [ExpectedResult]       NVARCHAR (MAX) NULL,
    [ActualResult]         NVARCHAR (MAX) NULL,
    [Description]          NVARCHAR (MAX) NULL,
    [Script]               NVARCHAR (MAX) DEFAULT ('') NULL,
    [Operator]             CHAR (2)       NULL,
    [ExpectedNumber]       FLOAT (53)     NULL,
    [ParserCompletionFlag] BIT            DEFAULT ((0)) NULL,
    [ExecCompletionFlag]   BIT            DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([EdFiSanityId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

