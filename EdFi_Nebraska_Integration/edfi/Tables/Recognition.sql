CREATE TABLE [edfi].[Recognition] (
    [StudentUSI]             BIGINT        NOT NULL,
    [SchoolId]               INT           NOT NULL,
    [DiplomaTypeId]          INT           NOT NULL,
    [DiplomaAwardDate]       DATE          NOT NULL,
    [RecognitionTypeId]      INT           NOT NULL,
    [RecognitionAwardDate]   DATE          NULL,
    [RecognitionDescription] NVARCHAR (80) NULL,
    [SchoolYear]             SMALLINT      NULL,
    [TermTypeId]             INT           NULL,
    CONSTRAINT [PK_Recognition] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [DiplomaTypeId] ASC, [DiplomaAwardDate] ASC, [RecognitionTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Recognition_Diploma] FOREIGN KEY ([StudentUSI], [SchoolId], [DiplomaTypeId], [DiplomaAwardDate]) REFERENCES [edfi].[Diploma] ([StudentUSI], [SchoolId], [DiplomaTypeId], [DiplomaAwardDate]),
    CONSTRAINT [FK_Recognition_RecognitionType] FOREIGN KEY ([RecognitionTypeId]) REFERENCES [edfi].[RecognitionType] ([RecognitionTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Recognition', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Recognition', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Recognition', @level2type = N'COLUMN', @level2name = N'DiplomaTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which the student met  graduation requirements and was awarded a diploma.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Recognition', @level2type = N'COLUMN', @level2name = N'DiplomaAwardDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The "as of" school year the student academic record.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Recognition', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Recognition', @level2type = N'COLUMN', @level2name = N'TermTypeId';

