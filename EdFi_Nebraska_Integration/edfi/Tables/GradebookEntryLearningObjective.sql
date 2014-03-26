CREATE TABLE [edfi].[GradebookEntryLearningObjective] (
    [SchoolId]                    INT           NOT NULL,
    [ClassPeriodName]             NVARCHAR (20) NOT NULL,
    [ClassroomIdentificationCode] NVARCHAR (20) NOT NULL,
    [LocalCourseCode]             NVARCHAR (20) NOT NULL,
    [TermTypeId]                  INT           NOT NULL,
    [SchoolYear]                  SMALLINT      NOT NULL,
    [GradebookEntryType]          NVARCHAR (60) NOT NULL,
    [DateAssigned]                DATE          NOT NULL,
    [Objective]                   NVARCHAR (60) NOT NULL,
    [AcademicSubjectTypeId]       INT           NOT NULL,
    [ObjectiveGradeLevelTypeId]   INT           NOT NULL,
    CONSTRAINT [PK_GradebookEntryLearningObjective] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC, [LocalCourseCode] ASC, [TermTypeId] ASC, [SchoolYear] ASC, [GradebookEntryType] ASC, [DateAssigned] ASC, [Objective] ASC, [AcademicSubjectTypeId] ASC, [ObjectiveGradeLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_GradebookEntryLearningObjective_GradebookEntry] FOREIGN KEY ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [GradebookEntryType], [DateAssigned]) REFERENCES [edfi].[GradebookEntry] ([SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [GradebookEntryType], [DateAssigned]),
    CONSTRAINT [FK_GradebookEntryLearningObjective_LearningObjective] FOREIGN KEY ([Objective], [AcademicSubjectTypeId], [ObjectiveGradeLevelTypeId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectTypeId], [ObjectiveGradeLevelTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'LocalCourseCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the term in which the section is offered (e.g., First semester, Second semester, Year long, summer school)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year (e.g., 2010/11).
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The designated title of the learning objective.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'Objective';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level for which the learning objective is targeted,
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradebookEntryLearningObjective', @level2type = N'COLUMN', @level2name = N'ObjectiveGradeLevelTypeId';

