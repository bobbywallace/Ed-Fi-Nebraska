﻿CREATE TABLE [edfi].[CohortType] (
    [CohortTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]    NVARCHAR (35)  NOT NULL,
    [Description]  NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCohortTypeType] PRIMARY KEY NONCLUSTERED ([CohortTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICohortTypeTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

