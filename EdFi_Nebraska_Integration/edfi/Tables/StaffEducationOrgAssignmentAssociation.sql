CREATE TABLE [edfi].[StaffEducationOrgAssignmentAssociation] (
    [StaffUSI]                  BIGINT         NOT NULL,
    [EducationOrganizationId]   INT            NOT NULL,
    [StaffClassificationTypeId] INT            NOT NULL,
    [BeginDate]                 DATE           NOT NULL,
    [PositionTitle]             NVARCHAR (100) NULL,
    [EndDate]                   DATE           NULL,
    CONSTRAINT [PK_StaffEducationOrgAssignmentAssociation] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [EducationOrganizationId] ASC, [StaffClassificationTypeId] ASC, [BeginDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StaffClassificationType_StaffEducationOrgAssignmentAssociation] FOREIGN KEY ([StaffClassificationTypeId]) REFERENCES [edfi].[StaffClassificationType] ([StaffClassificationTypeId]),
    CONSTRAINT [FK_StaffEducationOrgAssignmentAssociation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_StaffEducationOrgAssignmentAssociation_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association indicates theeducation organization to which a staff member provides services. Also known as campus of service.
NEDM: Staff Services

', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgAssignmentAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgAssignmentAssociation', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgAssignmentAssociation', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The titles of employment, official status, or rank of education staff.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgAssignmentAssociation', @level2type = N'COLUMN', @level2name = N'StaffClassificationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the start or effective date of a staff member''s employment, contract or relationship with the LEA.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgAssignmentAssociation', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The descriptive name of an individual''s position.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgAssignmentAssociation', @level2type = N'COLUMN', @level2name = N'PositionTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the end or termination date of a staff member''s employment, contract or relationship with the LEA.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgAssignmentAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';

