CREATE TABLE [edfi].[PostSecondaryEventCategoryType] (
    [PostSecondaryEventCategoryTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                        NVARCHAR (20)  NOT NULL,
    [Description]                      NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKPostSecondaryEventCategoryType] PRIMARY KEY NONCLUSTERED ([PostSecondaryEventCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIPostSecondaryEventCategoryTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

