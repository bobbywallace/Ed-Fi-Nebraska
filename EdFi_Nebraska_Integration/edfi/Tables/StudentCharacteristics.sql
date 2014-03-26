CREATE TABLE [edfi].[StudentCharacteristics] (
    [StudentUSI]                   BIGINT        NOT NULL,
    [StudentCharacteristicsTypeId] INT           NOT NULL,
    [BeginDate]                    DATE          NULL,
    [EndDate]                      DATE          NULL,
    [DesignatedBy]                 NVARCHAR (60) NULL,
    CONSTRAINT [PK_StudentCharacteristics] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [StudentCharacteristicsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentCharacteristics_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]),
    CONSTRAINT [FK_StudentCharacteristicsType_StudentCharacteristics] FOREIGN KEY ([StudentCharacteristicsTypeId]) REFERENCES [edfi].[StudentCharacteristicsType] ([StudentCharacteristicsTypeId])
);

