CREATE TABLE [edfi].[ParentElectronicMail] (
    [ParentUSI]             BIGINT         NOT NULL,
    [ElectronicMailTypeId]  INT            NOT NULL,
    [ElectronicMailAddress] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_ParentElectronicMail] PRIMARY KEY CLUSTERED ([ParentUSI] ASC, [ElectronicMailTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ParentElectronicMail_ElectronicMailType] FOREIGN KEY ([ElectronicMailTypeId]) REFERENCES [edfi].[ElectronicMailType] ([ElectronicMailTypeId]),
    CONSTRAINT [FK_ParentElectronicMail_Parent] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parent Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ParentElectronicMail', @level2type = N'COLUMN', @level2name = N'ParentUSI';

