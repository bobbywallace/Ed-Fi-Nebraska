CREATE TABLE [edfi].[BehaviorCategoryType] (
    [BehaviorCategoryTypeId] INT            NOT NULL,
    [CodeValue]              NVARCHAR (30)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_BehaviorCategoryType] PRIMARY KEY CLUSTERED ([BehaviorCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

