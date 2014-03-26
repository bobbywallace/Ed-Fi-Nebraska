CREATE TABLE [edfi].[StudentIdentificationCode] (
    [StudentUSI]                        BIGINT        NOT NULL,
    [StudentIdentificationSystemTypeId] INT           NOT NULL,
    [AssigningOrganizationCode]         NVARCHAR (60) NULL,
    [IdentificationCode]                NVARCHAR (60) NOT NULL,
    CONSTRAINT [PK_StudentIdentificationCode] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [StudentIdentificationSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentIdentificationCode_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]),
    CONSTRAINT [FK_StudentIdentificationCode_StudentIdentificationSystemType] FOREIGN KEY ([StudentIdentificationSystemTypeId]) REFERENCES [edfi].[StudentIdentificationSystemType] ([StudentIdentificationSystemTypeId])
);

