CREATE TABLE [edfi].[StaffElectronicMail] (
    [StaffUSI]              BIGINT         NOT NULL,
    [ElectronicMailTypeId]  INT            NOT NULL,
    [ElectronicMailAddress] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_StaffElectronicMail] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [ElectronicMailTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StaffElectronicMail_ElectronicMailType] FOREIGN KEY ([ElectronicMailTypeId]) REFERENCES [edfi].[ElectronicMailType] ([ElectronicMailTypeId]),
    CONSTRAINT [FK_StaffElectronicMail_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);

