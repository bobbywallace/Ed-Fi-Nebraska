CREATE TABLE [edfi].[FeederSchoolAssociation] (
    [SchoolId]                      INT             NOT NULL,
    [FeederSchoolId]                INT             NOT NULL,
    [BeginDate]                     DATE            NOT NULL,
    [EndDate]                       DATE            NULL,
    [FeederRelationshipDescription] NVARCHAR (1024) NULL,
    CONSTRAINT [PK_FeederSchoolAssociation] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [FeederSchoolId] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FeederSchoolAssociation_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_FeederSchoolAssociation_School1] FOREIGN KEY ([FeederSchoolId]) REFERENCES [edfi].[School] ([SchoolId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'FeederSchoolAssociation', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'FeederSchoolAssociation', @level2type = N'COLUMN', @level2name = N'FeederSchoolId';

