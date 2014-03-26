CREATE TABLE [edfi].[OpenStaffPosition] (
    [EducationOrganizationId]   INT           NOT NULL,
    [EmploymentStatusTypeId]    INT           NOT NULL,
    [StaffClassificationTypeId] INT           NOT NULL,
    [RequisitionNumber]         NVARCHAR (10) NOT NULL,
    [DatePosted]                DATE          NOT NULL,
    [PositionTitle]             NVARCHAR (45) NULL,
    [ProgramAssignmentTypeId]   INT           NULL,
    [DatePostingRemoved]        DATE          NULL,
    [PostingResultTypeId]       INT           NULL,
    CONSTRAINT [PK_OpenStaffPosition] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [EmploymentStatusTypeId] ASC, [StaffClassificationTypeId] ASC, [RequisitionNumber] ASC, [DatePosted] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EmploymentStatusType_OpenStaffPosition] FOREIGN KEY ([EmploymentStatusTypeId]) REFERENCES [edfi].[EmploymentStatusType] ([EmploymentStatusTypeId]),
    CONSTRAINT [FK_OpenStaffPosition_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_PostingResultType_OpenStaffPosition] FOREIGN KEY ([PostingResultTypeId]) REFERENCES [edfi].[PostingResultType] ([PostingResultTypeId]),
    CONSTRAINT [FK_ProgramAssignmentType_OpenStaffPosition] FOREIGN KEY ([ProgramAssignmentTypeId]) REFERENCES [edfi].[ProgramAssignmentType] ([ProgramAssignmentTypeId]),
    CONSTRAINT [FK_StaffClassificationType_OpenStaffPosition] FOREIGN KEY ([StaffClassificationTypeId]) REFERENCES [edfi].[StaffClassificationType] ([StaffClassificationTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Open staff position that s seeking to be filled.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The desired employment status (e.g., contractual, substitute, permanent employee)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition', @level2type = N'COLUMN', @level2name = N'EmploymentStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The position''s title or rank (e.g., Counselor, teacher, etc)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition', @level2type = N'COLUMN', @level2name = N'StaffClassificationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the position was posted.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition', @level2type = N'COLUMN', @level2name = N'DatePosted';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The descriptive name of an individual''s position.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition', @level2type = N'COLUMN', @level2name = N'PositionTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The program to which a teaching position would be assigned (e.g., regular education, special education, etc.)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition', @level2type = N'COLUMN', @level2name = N'ProgramAssignmentTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the posting was removed or filled.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition', @level2type = N'COLUMN', @level2name = N'DatePostingRemoved';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indication of whether the position was filled or retired without filling.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OpenStaffPosition', @level2type = N'COLUMN', @level2name = N'PostingResultTypeId';

