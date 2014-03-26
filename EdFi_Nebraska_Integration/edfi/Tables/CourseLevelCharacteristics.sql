CREATE TABLE [edfi].[CourseLevelCharacteristics] (
    [EducationOrganizationId]          INT           NOT NULL,
    [IdentityCourseCode]               NVARCHAR (20) NOT NULL,
    [CourseLevelCharacteristicsTypeId] INT           NOT NULL,
    CONSTRAINT [PK_CourseLevelCharacteristics] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [IdentityCourseCode] ASC, [CourseLevelCharacteristicsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_CourseLevelCharacteristics_Course] FOREIGN KEY ([EducationOrganizationId], [IdentityCourseCode]) REFERENCES [edfi].[Course] ([EducationOrganizationId], [IdentityCourseCode]),
    CONSTRAINT [FK_CourseLevelCharacteristicsType_CourseLevelCharacteristics] FOREIGN KEY ([CourseLevelCharacteristicsTypeId]) REFERENCES [edfi].[CourseLevelCharacteristicsType] ([CourseLevelCharacteristicsTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CourseLevelCharacteristics', @level2type = N'COLUMN', @level2name = N'IdentityCourseCode';

