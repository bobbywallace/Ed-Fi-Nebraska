CREATE TABLE [edfi].[Disability] (
    [StudentUSI]          BIGINT        NOT NULL,
    [DisabilityTypeId]    INT           NOT NULL,
    [DisabilityDiagnosis] NVARCHAR (80) NULL,
    [OrderOfDisability]   INT           NULL,
    CONSTRAINT [PK_Disability] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [DisabilityTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Disability_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI]),
    CONSTRAINT [FK_DisabilityType_Disability] FOREIGN KEY ([DisabilityTypeId]) REFERENCES [edfi].[DisabilityType] ([DisabilityTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This type represents an impairment of body structure or function, a limitation in activities, or a restriction in participation, as ordered by severity of impairment.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Disability';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A disability category that describes a child''s impairment.
NEDM: Primary Disability Type, Secondary Disability Type
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Disability', @level2type = N'COLUMN', @level2name = N'DisabilityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A description of the exact disability diagnosis.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Disability', @level2type = N'COLUMN', @level2name = N'DisabilityDiagnosis';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary, Secondary, Tertiary, etc.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Disability', @level2type = N'COLUMN', @level2name = N'OrderOfDisability';

