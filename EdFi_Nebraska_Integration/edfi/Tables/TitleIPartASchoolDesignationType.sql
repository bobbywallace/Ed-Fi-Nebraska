CREATE TABLE [edfi].[TitleIPartASchoolDesignationType] (
    [TitleIPartASchoolDesignationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                          NVARCHAR (60)  NOT NULL,
    [Description]                        NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKTitleIPartASchoolDesignationType] PRIMARY KEY NONCLUSTERED ([TitleIPartASchoolDesignationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UITitleIPartASchoolDesignationTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

