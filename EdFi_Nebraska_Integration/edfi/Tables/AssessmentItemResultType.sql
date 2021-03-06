﻿CREATE TABLE [edfi].[AssessmentItemResultType] (
    [AssessmentItemResultTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                  NVARCHAR (20)  NOT NULL,
    [Description]                NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAssessmentItemResultType] PRIMARY KEY NONCLUSTERED ([AssessmentItemResultTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAssessmentItemResultTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

