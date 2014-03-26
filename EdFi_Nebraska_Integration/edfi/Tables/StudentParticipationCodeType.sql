CREATE TABLE [edfi].[StudentParticipationCodeType] (
    [StudentParticipationCodeTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                      NVARCHAR (20)  NOT NULL,
    [Description]                    NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKStudentParticipationCodeType] PRIMARY KEY NONCLUSTERED ([StudentParticipationCodeTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIStudentParticipationCodeTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

