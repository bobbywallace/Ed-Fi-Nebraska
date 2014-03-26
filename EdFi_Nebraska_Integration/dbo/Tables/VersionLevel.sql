CREATE TABLE [dbo].[VersionLevel] (
    [ScriptSource] VARCHAR (256)  NOT NULL,
    [ScriptType]   VARCHAR (256)  NOT NULL,
    [DatabaseType] VARCHAR (256)  NOT NULL,
    [SubType]      VARCHAR (1024) NULL,
    [VersionLevel] INT            NOT NULL
)
WITH (DATA_COMPRESSION = PAGE);

