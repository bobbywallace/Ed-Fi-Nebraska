CREATE TABLE [edfi].[CredentialType] (
    [CredentialTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (20)  NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKCredentialTypeType] PRIMARY KEY NONCLUSTERED ([CredentialTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UICredentialTypeTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

