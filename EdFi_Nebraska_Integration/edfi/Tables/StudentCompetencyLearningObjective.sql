﻿CREATE TABLE [edfi].[StudentCompetencyLearningObjective] (
    [StudentUSI]                  BIGINT          NOT NULL,
    [CompetencyLevelDescriptorId] INT             NOT NULL,
    [Objective]                   NVARCHAR (60)   NOT NULL,
    [AcademicSubjectTypeId]       INT             NOT NULL,
    [ObjectiveGradeLevelTypeId]   INT             NOT NULL,
    [DiagnosticStatement]         NVARCHAR (1024) NULL,
    [SchoolId]                    INT             NULL,
    [ClassPeriodName]             NVARCHAR (20)   NULL,
    [ClassroomIdentificationCode] NVARCHAR (20)   NULL,
    [LocalCourseCode]             NVARCHAR (20)   NULL,
    [TermTypeId]                  INT             NULL,
    [SchoolYear]                  SMALLINT        NULL,
    [BeginDate]                   DATE            NULL,
    CONSTRAINT [PK_StudentCompetencyLearningObjective] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [CompetencyLevelDescriptorId] ASC, [Objective] ASC, [AcademicSubjectTypeId] ASC, [ObjectiveGradeLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentCompetencyLearningObjective_CompetencyLevelDescriptor] FOREIGN KEY ([CompetencyLevelDescriptorId]) REFERENCES [edfi].[CompetencyLevelDescriptor] ([CompetencyLevelDescriptorId]),
    CONSTRAINT [FK_StudentCompetencyLearningObjective_LearningObjective] FOREIGN KEY ([Objective], [AcademicSubjectTypeId], [ObjectiveGradeLevelTypeId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectTypeId], [ObjectiveGradeLevelTypeId]),
    CONSTRAINT [FK_StudentCompetencyLearningObjective_StudentSectionAssociation] FOREIGN KEY ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [BeginDate]) REFERENCES [edfi].[StudentSectionAssociation] ([StudentUSI], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [BeginDate])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The designated title of the learning objective.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'Objective';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level for which the learning objective is targeted,
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'ObjectiveGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the term in which the section is offered (e.g., First semester, Second semester, Year long, summer school)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the student''s entry or assignment to the section.  If blank, default is the start date of the first grading period.
NEDM: EntryDate
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCompetencyLearningObjective', @level2type = N'COLUMN', @level2name = N'BeginDate';

