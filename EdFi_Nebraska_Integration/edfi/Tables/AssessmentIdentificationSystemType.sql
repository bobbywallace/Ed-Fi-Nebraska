CREATE TABLE [edfi].[AssessmentIdentificationSystemType] (
    [AssessmentIdentificationSystemTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                            NVARCHAR (50)  NOT NULL,
    [Description]                          NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_AssessmentIdentificationSystemType] PRIMARY KEY CLUSTERED ([AssessmentIdentificationSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

