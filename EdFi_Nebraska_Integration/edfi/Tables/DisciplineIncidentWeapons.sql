CREATE TABLE [edfi].[DisciplineIncidentWeapons] (
    [SchoolId]           INT           NOT NULL,
    [IncidentIdentifier] NVARCHAR (20) NOT NULL,
    [WeaponsTypeId]      INT           NOT NULL,
    CONSTRAINT [PK_DisciplineIncidentWeapons] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [IncidentIdentifier] ASC, [WeaponsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_DisciplineIncidentWeapons_DisciplineIncident] FOREIGN KEY ([SchoolId], [IncidentIdentifier]) REFERENCES [edfi].[DisciplineIncident] ([SchoolId], [IncidentIdentifier]),
    CONSTRAINT [FK_WeaponsType_DisciplineIncidentWeapons] FOREIGN KEY ([WeaponsTypeId]) REFERENCES [edfi].[WeaponsType] ([WeaponsTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncidentWeapons', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncidentWeapons', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';

