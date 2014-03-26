CREATE TABLE [edfi].[CourseCodeSystemType] (
    [CourseCodeSystemTypeId] INT            NOT NULL,
    [CodeValue]              NVARCHAR (50)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_CourseCodeSystemType] PRIMARY KEY CLUSTERED ([CourseCodeSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

