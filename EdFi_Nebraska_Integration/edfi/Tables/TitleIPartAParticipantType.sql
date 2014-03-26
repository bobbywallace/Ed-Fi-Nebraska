CREATE TABLE [edfi].[TitleIPartAParticipantType] (
    [TitleIPartAParticipantTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                    NVARCHAR (40)  NOT NULL,
    [Description]                  NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKTitleIPartAParticipantType] PRIMARY KEY NONCLUSTERED ([TitleIPartAParticipantTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UITitleIPartAParticipantTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

