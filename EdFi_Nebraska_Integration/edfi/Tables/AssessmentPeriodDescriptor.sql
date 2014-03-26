CREATE TABLE [edfi].[AssessmentPeriodDescriptor] (
    [AssessmentPeriodDescriptorId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]                    NVARCHAR (20)   NOT NULL,
    [Description]                  NVARCHAR (1024) NOT NULL,
    [ShortDescription]             NVARCHAR (50)   NULL,
    [BeginDate]                    DATE            NULL,
    [EndDate]                      DATE            NULL,
    CONSTRAINT [PK_AssessmentPeriodDescriptor] PRIMARY KEY CLUSTERED ([AssessmentPeriodDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

