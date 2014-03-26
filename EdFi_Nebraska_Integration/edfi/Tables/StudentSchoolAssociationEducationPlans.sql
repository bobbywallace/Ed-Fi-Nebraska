CREATE TABLE [edfi].[StudentSchoolAssociationEducationPlans] (
    [StudentUSI]           BIGINT NOT NULL,
    [SchoolId]             INT    NOT NULL,
    [EntryDate]            DATE   NOT NULL,
    [EducationPlansTypeId] INT    NOT NULL,
    CONSTRAINT [PK_StudentSchoolAssociationEducationPlans] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC, [EducationPlansTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationPlansType_StudentSchoolAssociationEducationPlans] FOREIGN KEY ([EducationPlansTypeId]) REFERENCES [edfi].[EducationPlansType] ([EducationPlansTypeId]),
    CONSTRAINT [FK_StudentSchoolAssociationEducationPlans_StudentSchoolAssociation] FOREIGN KEY ([StudentUSI], [SchoolId], [EntryDate]) REFERENCES [edfi].[StudentSchoolAssociation] ([StudentUSI], [SchoolId], [EntryDate])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationEducationPlans', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationEducationPlans', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which an individual enters and begins to receive instructional services in a campus.
NEDM: School Entry Date
NEDM: LEA Entry Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationEducationPlans', @level2type = N'COLUMN', @level2name = N'EntryDate';

