CREATE TABLE [edfi].[ItemCategoryType] (
    [ItemCategoryTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (20)  NOT NULL,
    [Description]        NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKItemCategoryType] PRIMARY KEY NONCLUSTERED ([ItemCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIItemCategoryTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

