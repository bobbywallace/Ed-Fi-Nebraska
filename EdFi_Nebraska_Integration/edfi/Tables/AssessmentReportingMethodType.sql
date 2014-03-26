CREATE TABLE [edfi].[AssessmentReportingMethodType] (
    [AssessmentReportingMethodTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (50)  NOT NULL,
    [Description]                     NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAssessmentReportingMethodType] PRIMARY KEY NONCLUSTERED ([AssessmentReportingMethodTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAssessmentReportingMethodTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

