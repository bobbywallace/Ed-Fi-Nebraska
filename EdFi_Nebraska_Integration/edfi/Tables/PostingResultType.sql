CREATE TABLE [edfi].[PostingResultType] (
    [PostingResultTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (20)  NOT NULL,
    [Description]         NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKPostingResultType] PRIMARY KEY NONCLUSTERED ([PostingResultTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIPostingResultTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

