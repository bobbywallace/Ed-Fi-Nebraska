CREATE TABLE [edfi].[ReasonNotTestedType] (
    [ReasonNotTestedTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (40)  NOT NULL,
    [Description]           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKReasonNotTestedType] PRIMARY KEY NONCLUSTERED ([ReasonNotTestedTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIReasonNotTestedTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

