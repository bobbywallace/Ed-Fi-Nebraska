CREATE TABLE [edfi].[RelationType] (
    [RelationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]      NVARCHAR (35)  NOT NULL,
    [Description]    NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKRelationType] PRIMARY KEY NONCLUSTERED ([RelationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIRelationTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

