CREATE TABLE [edfi].[IdeaEligibilityType] (
    [IdeaEligibilityTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (20)  NOT NULL,
    [Description]           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKIdeaEligibilityType] PRIMARY KEY NONCLUSTERED ([IdeaEligibilityTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIIdeaEligibilityTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

