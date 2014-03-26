CREATE TABLE [edfi].[CohortYearType] (
    [CohortYearTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (20)  NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCohortYearType] PRIMARY KEY NONCLUSTERED ([CohortYearTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICohortYearTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

