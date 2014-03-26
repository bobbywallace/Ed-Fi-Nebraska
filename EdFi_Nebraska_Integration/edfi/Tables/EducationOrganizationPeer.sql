CREATE TABLE [edfi].[EducationOrganizationPeer] (
    [EducationOrganizationId]     INT NOT NULL,
    [PeerEducationOrganizationId] INT NOT NULL,
    CONSTRAINT [PK_EducationOrganizationPeerReference] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [PeerEducationOrganizationId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationOrganizationPeerReference_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_EducationOrganizationPeerReference_EducationOrganization1] FOREIGN KEY ([PeerEducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
);

