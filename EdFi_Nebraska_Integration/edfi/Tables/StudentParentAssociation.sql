CREATE TABLE [edfi].[StudentParentAssociation] (
    [StudentUSI]             BIGINT         NOT NULL,
    [ParentUSI]              BIGINT         NOT NULL,
    [RelationTypeId]         INT            NOT NULL,
    [PrimaryContactStatus]   BIT            NULL,
    [LivesWith]              BIT            NULL,
    [EmergencyContactStatus] BIT            NULL,
    [ContactPriority]        INT            NULL,
    [ContactRestrictions]    NVARCHAR (250) NULL,
    CONSTRAINT [PK_StudentParentAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [ParentUSI] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RelationType_StudentParentAssociation] FOREIGN KEY ([RelationTypeId]) REFERENCES [edfi].[RelationType] ([RelationTypeId]),
    CONSTRAINT [FK_StudentParentAssociation_Parent] FOREIGN KEY ([ParentUSI]) REFERENCES [edfi].[Parent] ([ParentUSI]),
    CONSTRAINT [FK_StudentParentAssociation_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association relates students to their parents, guardians, or caretakers and indicates their relationship.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentParentAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentParentAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parent Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentParentAssociation', @level2type = N'COLUMN', @level2name = N'ParentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The nature of an individual''s relationship to a student; for example:
Father
Mother
Step Father
Step Mother
Foster Father
Foster Mother
Guardian
...
NEDM: Relationship to Student
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentParentAssociation', @level2type = N'COLUMN', @level2name = N'RelationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of whether the person is a primary parental contact for the student.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentParentAssociation', @level2type = N'COLUMN', @level2name = N'PrimaryContactStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of whether the student lives with the associated parent.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentParentAssociation', @level2type = N'COLUMN', @level2name = N'LivesWith';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of whether the person is a designated emergency contact for the student.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentParentAssociation', @level2type = N'COLUMN', @level2name = N'EmergencyContactStatus';

