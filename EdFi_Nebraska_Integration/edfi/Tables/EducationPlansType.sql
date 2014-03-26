CREATE TABLE [edfi].[EducationPlansType] (
    [EducationPlansTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]            NVARCHAR (20)  NOT NULL,
    [Description]          NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKEducationPlansType] PRIMARY KEY NONCLUSTERED ([EducationPlansTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIEducationPlansTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

