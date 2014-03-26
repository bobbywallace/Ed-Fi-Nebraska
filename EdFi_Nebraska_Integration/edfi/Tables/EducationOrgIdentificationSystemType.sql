CREATE TABLE [edfi].[EducationOrgIdentificationSystemType] (
    [EducationOrgIdentificationSystemTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                              NVARCHAR (50)  NOT NULL,
    [Description]                            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_EducationOrgIdentificationSystemType] PRIMARY KEY CLUSTERED ([EducationOrgIdentificationSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

