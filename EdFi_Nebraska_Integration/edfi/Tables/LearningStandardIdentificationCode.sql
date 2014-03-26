CREATE TABLE [edfi].[LearningStandardIdentificationCode] (
    [LearningStandardId]                 NVARCHAR (40) NOT NULL,
    [LearningStandardIdentificationCode] NVARCHAR (60) NOT NULL,
    [ContentStandardName]                NVARCHAR (65) NULL,
    CONSTRAINT [PK_LearningStandardIdentificationCode] PRIMARY KEY CLUSTERED ([LearningStandardId] ASC, [LearningStandardIdentificationCode] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_LearningStandardIdentificationCode_LearningStandard] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
);

