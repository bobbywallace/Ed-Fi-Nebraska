CREATE TABLE [edfi].[StudentElectronicMail] (
    [StudentUSI]            BIGINT         NOT NULL,
    [ElectronicMailTypeId]  INT            NOT NULL,
    [ElectronicMailAddress] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_StudentElectronicMail] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [ElectronicMailTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentElectronicMail_ElectronicMailType] FOREIGN KEY ([ElectronicMailTypeId]) REFERENCES [edfi].[ElectronicMailType] ([ElectronicMailTypeId]),
    CONSTRAINT [FK_StudentElectronicMail_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);

