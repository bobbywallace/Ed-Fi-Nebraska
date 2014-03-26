CREATE TABLE [edfi].[ReasonExitedType] (
    [ReasonExitedTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (50)  NOT NULL,
    [Description]        NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKReasonExitedType] PRIMARY KEY NONCLUSTERED ([ReasonExitedTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIReasonExitedTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

