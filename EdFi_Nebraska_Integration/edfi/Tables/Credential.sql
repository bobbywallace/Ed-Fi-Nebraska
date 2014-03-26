CREATE TABLE [edfi].[Credential] (
    [StaffUSI]                      BIGINT NOT NULL,
    [CredentialTypeId]              INT    NOT NULL,
    [CredentialFieldDescriptorId]   INT    NOT NULL,
    [LevelTypeId]                   INT    NOT NULL,
    [TeachingCredentialTypeId]      INT    NOT NULL,
    [CredentialIssuanceDate]        DATE   NOT NULL,
    [CredentialExpirationDate]      DATE   NULL,
    [TeachingCredentialBasisTypeId] INT    NULL,
    CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [CredentialTypeId] ASC, [CredentialFieldDescriptorId] ASC, [LevelTypeId] ASC, [TeachingCredentialTypeId] ASC, [CredentialIssuanceDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Credential_CredentialFieldDescriptor] FOREIGN KEY ([CredentialFieldDescriptorId]) REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId]),
    CONSTRAINT [FK_Credential_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI]),
    CONSTRAINT [FK_CredentialTypeType_Credential] FOREIGN KEY ([CredentialTypeId]) REFERENCES [edfi].[CredentialType] ([CredentialTypeId]),
    CONSTRAINT [FK_LevelType_Credential] FOREIGN KEY ([LevelTypeId]) REFERENCES [edfi].[LevelType] ([LevelTypeId]),
    CONSTRAINT [FK_TeachingCredentialBasisType_Credential] FOREIGN KEY ([TeachingCredentialBasisTypeId]) REFERENCES [edfi].[TeachingCredentialBasisType] ([TeachingCredentialBasisTypeId]),
    CONSTRAINT [FK_TeachingCredentialTypeType_Credential] FOREIGN KEY ([TeachingCredentialTypeId]) REFERENCES [edfi].[TeachingCredentialType] ([TeachingCredentialTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The legal document or authorization giving authorization to perform teaching assignment services.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Credential';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the category of credential an individual holds.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Credential', @level2type = N'COLUMN', @level2name = N'CredentialTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level(s) certified for teaching.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Credential', @level2type = N'COLUMN', @level2name = N'LevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the category of a legal document giving authorization to perform teaching assignment services.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Credential', @level2type = N'COLUMN', @level2name = N'TeachingCredentialTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which an active credential was issued to an individual.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Credential', @level2type = N'COLUMN', @level2name = N'CredentialIssuanceDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which an active credential held by an individual will expire.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Credential', @level2type = N'COLUMN', @level2name = N'CredentialExpirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the pre-determined criteria for granting the teaching credential that an individual holds.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Credential', @level2type = N'COLUMN', @level2name = N'TeachingCredentialBasisTypeId';

