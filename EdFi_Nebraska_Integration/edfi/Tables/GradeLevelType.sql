CREATE TABLE [edfi].[GradeLevelType] (
    [GradeLevelTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (40)  NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_GradeLevelType] PRIMARY KEY CLUSTERED ([GradeLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

