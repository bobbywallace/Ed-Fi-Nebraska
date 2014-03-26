CREATE TABLE [edfi].[StaffRace] (
    [StaffUSI]   BIGINT NOT NULL,
    [RaceTypeId] INT    NOT NULL,
    CONSTRAINT [PK_StaffRace] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [RaceTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RaceType_StaffRace] FOREIGN KEY ([RaceTypeId]) REFERENCES [edfi].[RaceType] ([RaceTypeId]),
    CONSTRAINT [FK_StaffRace_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The general racial category which most clearly reflects the individual''s recognition of his or her community or with which the individual most identifies. The way this data element is listed, it must allow for multiple entries so that each individual can specify all appropriate races.
      AMERICAN-INDIAN-ALASKA-NATIVE-CODE
      ASIAN-CODE
      BLACK-AFRICAN-AMERICAN-CODE
      NATIVE-HAWAIIAN-PACIFIC-ISLANDER-CODE
      WHITE-CODE
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffRace', @level2type = N'COLUMN', @level2name = N'RaceTypeId';

