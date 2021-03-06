﻿CREATE TABLE [edfi].[RepeatIdentifierType] (
    [RepeatIdentifierTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]              NVARCHAR (20)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKRepeatIdentifierType] PRIMARY KEY NONCLUSTERED ([RepeatIdentifierTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIRepeatIdentifierTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

