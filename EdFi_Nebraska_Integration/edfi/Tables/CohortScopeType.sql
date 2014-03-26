CREATE TABLE [edfi].[CohortScopeType] (
    [CohortScopeTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]         NVARCHAR (20)  NOT NULL,
    [Description]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCohortScopeType] PRIMARY KEY NONCLUSTERED ([CohortScopeTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICohortScopeTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

