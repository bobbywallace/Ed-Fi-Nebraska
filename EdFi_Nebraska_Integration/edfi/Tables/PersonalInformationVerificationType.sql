CREATE TABLE [edfi].[PersonalInformationVerificationType] (
    [PersonalInformationVerificationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                             NVARCHAR (35)  NOT NULL,
    [Description]                           NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKPersonalInformationVerificationType] PRIMARY KEY NONCLUSTERED ([PersonalInformationVerificationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIPersonalInformationVerificationTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

