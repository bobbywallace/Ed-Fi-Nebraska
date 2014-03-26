CREATE TABLE [edfi].[EducationalEnvironmentType] (
    [EducationalEnvironmentTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                    NVARCHAR (40)  NOT NULL,
    [Description]                  NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKEducationalEnvironmentType] PRIMARY KEY NONCLUSTERED ([EducationalEnvironmentTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIEducationalEnvironmentTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

