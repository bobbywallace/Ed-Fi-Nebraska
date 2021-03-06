﻿CREATE TABLE [edfi].[LevelType] (
    [LevelTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]   NVARCHAR (30)  NOT NULL,
    [Description] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKLevelType] PRIMARY KEY NONCLUSTERED ([LevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UILevelTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

