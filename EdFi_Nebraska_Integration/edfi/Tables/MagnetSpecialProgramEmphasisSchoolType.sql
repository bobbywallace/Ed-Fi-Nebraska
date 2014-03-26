CREATE TABLE [edfi].[MagnetSpecialProgramEmphasisSchoolType] (
    [MagnetSpecialProgramEmphasisSchoolTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                                NVARCHAR (60)  NOT NULL,
    [Description]                              NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKMagnetSpecialProgramEmphasisSchoolType] PRIMARY KEY NONCLUSTERED ([MagnetSpecialProgramEmphasisSchoolTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIMagnetSpecialProgramEmphasisSchoolTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

