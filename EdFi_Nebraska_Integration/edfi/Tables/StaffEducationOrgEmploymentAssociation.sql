CREATE TABLE [edfi].[StaffEducationOrgEmploymentAssociation] (
    [StaffUSI]                BIGINT       NOT NULL,
    [EducationOrganizationId] INT          NOT NULL,
    [EmploymentStatusTypeId]  INT          NOT NULL,
    [HireDate]                DATE         NOT NULL,
    [EndDate]                 DATE         NULL,
    [SeparationTypeId]        INT          NULL,
    [SeparationReasonTypeId]  INT          NULL,
    [Department]              NVARCHAR (3) NULL,
    [FullTimeEquivalency]     INT          NULL,
    CONSTRAINT [PK_StaffEducationOrgEmploymentAssociation] PRIMARY KEY CLUSTERED ([StaffUSI] ASC, [EducationOrganizationId] ASC, [EmploymentStatusTypeId] ASC, [HireDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EmploymentStatusType_StaffEducationOrgEmploymentAssociation] FOREIGN KEY ([EmploymentStatusTypeId]) REFERENCES [edfi].[EmploymentStatusType] ([EmploymentStatusTypeId]),
    CONSTRAINT [FK_StaffEducationOrgEmploymentAssociation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_StaffEducationOrgEmploymentAssociation_SeparationReasonType] FOREIGN KEY ([SeparationReasonTypeId]) REFERENCES [edfi].[SeparationReasonType] ([SeparationReasonTypeId]),
    CONSTRAINT [FK_StaffEducationOrgEmploymentAssociation_SeparationType] FOREIGN KEY ([SeparationTypeId]) REFERENCES [edfi].[SeparationType] ([SeparationTypeId]),
    CONSTRAINT [FK_StaffEducationOrgEmploymentAssociation_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfi].[Staff] ([StaffUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association indicates the education organization an employee, contractor, volunteeer or other service provider is formally associated with, typically indicated by which organization the staff member has a services contract with or receives their compensation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reflects the type of employment or contract; for example:
Probationary
Contractual
Substitute/temporary
Tenured or permanent
Volunteer/no contract
...
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'EmploymentStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which a contract between an individual and a governing authority specifies that employment is to begin (or the date on which the agreement is made valid).
NEDM: Contract Beginning Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'HireDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which a contract between an individual and a governing authority ends or is terminated under the provisions of the contract (or the date on which the agreement is made invalid).
NEDM: Contract Ending Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of employment separation; for example:
Voluntary separation
Involuntary separation
Mutual agreement
Other
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'SeparationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason for terminating the employment; for example:
Employment in education
Employment outside of education
Retirement
Family/personal relocation
Change of assignment
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'SeparationReasonTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The department or suborganization the employee/contractor is associated with in the Education Organization.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'Department';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ratio between the hours of work expected in a position and the hours of work normally expected in a full-time position in the same setting.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StaffEducationOrgEmploymentAssociation', @level2type = N'COLUMN', @level2name = N'FullTimeEquivalency';

