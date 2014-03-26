CREATE TABLE [edfi].[StudentSchoolAssociation] (
    [StudentUSI]            BIGINT NOT NULL,
    [SchoolId]              INT    NOT NULL,
    [EntryDate]             DATE   NOT NULL,
    [EntryGradeLevelTypeId] INT    NOT NULL,
    [EntryTypeId]           INT    NULL,
    [RepeatGradeIndicator]  BIT    NULL,
    [ClassOf]               INT    NULL,
    [SchoolChoiceTransfer]  BIT    NULL,
    [ExitWithdrawDate]      DATE   NULL,
    [ExitWithdrawTypeId]    INT    NULL,
    CONSTRAINT [PK_StudentSchoolAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EntryTypeType_StudentSchoolAssociation] FOREIGN KEY ([EntryTypeId]) REFERENCES [edfi].[EntryType] ([EntryTypeId]),
    CONSTRAINT [FK_ExitWithdrawTypeType_StudentSchoolAssociation] FOREIGN KEY ([ExitWithdrawTypeId]) REFERENCES [edfi].[ExitWithdrawType] ([ExitWithdrawTypeId]),
    CONSTRAINT [FK_StudentSchoolAssociation_GradeLevelType] FOREIGN KEY ([EntryGradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_StudentSchoolAssociation_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_StudentSchoolAssociation_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociation]
    ON [edfi].[StudentSchoolAssociation]([StudentUSI] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociation_ExitWithdrawDateStudentUSI]
    ON [edfi].[StudentSchoolAssociation]([ExitWithdrawDate] ASC, [StudentUSI] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the school to which a student is enrolled.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which an individual enters and begins to receive instructional services in a campus.
NEDM: School Entry Date
NEDM: LEA Entry Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'EntryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level or primary instructional level at which a student enters and receives services in a school or an educational institution during a given academic session.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'EntryGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The process by which a student enters a school during a given academic session.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'EntryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of whether students transferred in or out of the school did so during the school year under the provisions for public school choice in accordance with Title I, Part A, Section 1116.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'SchoolChoiceTransfer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year of the first day after the date of an individual''s last attendance at a campus (if known), the day on which an individual graduated, or the date on which it becomes known officially that an individual left school.
NEDM: Exit/Withdraw Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'ExitWithdrawDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The circumstances under which the student exited from membership in an educational institution.
NEDM: Exit Withdraw Type
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'ExitWithdrawTypeId';

