CREATE TABLE [edfi].[AssessmentCategoryType] (
    [AssessmentCategoryTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                NVARCHAR (60)  NOT NULL,
    [Description]              NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAssessmentCategoryType] PRIMARY KEY NONCLUSTERED ([AssessmentCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAssessmentCategoryTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

