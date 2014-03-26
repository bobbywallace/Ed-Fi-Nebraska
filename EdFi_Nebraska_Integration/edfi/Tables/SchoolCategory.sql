CREATE TABLE [edfi].[SchoolCategory] (
    [SchoolId]             INT NOT NULL,
    [SchoolCategoryTypeId] INT NOT NULL,
    CONSTRAINT [PK_SchoolCategory] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [SchoolCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_SchoolCategory_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_SchoolCategory_SchoolCategoryType] FOREIGN KEY ([SchoolCategoryTypeId]) REFERENCES [edfi].[SchoolCategoryType] ([SchoolCategoryTypeId])
);

