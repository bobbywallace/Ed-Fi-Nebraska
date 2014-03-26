CREATE TABLE [edfi].[StaffIdentificationCode] (
    [StaffUSI]                        BIGINT        NOT NULL,
    [StaffIdentificationSystemTypeId] INT           NOT NULL,
    [AssigningOrganizationCode]       NVARCHAR (60) NULL,
    [IdentificationCode]              NVARCHAR (60) NOT NULL,
    CONSTRAINT [PK_StaffIdentificationCode] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [StaffIdentificationSystemTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StaffIdentificationCode_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]),
    CONSTRAINT [FK_StaffIdentificationCode_StaffIdentificationSystemType] FOREIGN KEY ([StaffIdentificationSystemTypeId]) REFERENCES [edfi].[StaffIdentificationSystemType] ([StaffIdentificationSystemTypeId])
);

