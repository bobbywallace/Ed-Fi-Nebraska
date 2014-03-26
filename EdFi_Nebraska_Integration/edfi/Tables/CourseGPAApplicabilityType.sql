CREATE TABLE [edfi].[CourseGPAApplicabilityType] (
    [CourseGPAApplicabilityTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                    NVARCHAR (20)  NOT NULL,
    [Description]                  NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCourseGPAApplicabilityType] PRIMARY KEY NONCLUSTERED ([CourseGPAApplicabilityTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICourseGPAApplicabilityTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

