CREATE TABLE [edfi].[EdFiException] (
    [EdFiExceptionId]     INT             IDENTITY (1, 1) NOT NULL,
    [TableName]           NVARCHAR (255)  NULL,
    [ColumnNameList]      NVARCHAR (4000) NULL,
    [ColumnValueList]     NVARCHAR (4000) NULL,
    [ErrorMessage]        NVARCHAR (4000) NULL,
    [IdentifierCondition] NVARCHAR (4000) NULL,
    [LookupCondition]     NVARCHAR (4000) NULL,
    [ExceptionLevel]      NVARCHAR (20)   NULL,
    [StartTime]           DATETIME        NULL,
    [PackageName]         NVARCHAR (255)  NULL,
    [TaskName]            NVARCHAR (255)  NULL,
    [ComponentName]       NVARCHAR (255)  NULL,
    [ErrorCode]           INT             NULL,
    [ErrorDescription]    NVARCHAR (1000) NULL,
    [ErrorColumn]         INT             NULL,
    [ErrorColumnName]     NVARCHAR (255)  NULL,
    PRIMARY KEY CLUSTERED ([EdFiExceptionId] ASC) WITH (DATA_COMPRESSION = PAGE) ON [ExceptionFG1]
);

