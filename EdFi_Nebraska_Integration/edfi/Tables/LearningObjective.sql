CREATE TABLE [edfi].[LearningObjective] (
    [Objective]                       NVARCHAR (60)   NOT NULL,
    [AcademicSubjectTypeId]           INT             NOT NULL,
    [ObjectiveGradeLevelTypeId]       INT             NOT NULL,
    [Description]                     NVARCHAR (1024) NULL,
    [LearningStandardId]              NVARCHAR (40)   NULL,
    [ParentObjective]                 NVARCHAR (60)   NULL,
    [ParentAcademicSubjectTypeId]     INT             NULL,
    [ParentObjectiveGradeLevelTypeId] INT             NULL,
    CONSTRAINT [PK_LearningObjective] PRIMARY KEY CLUSTERED ([Objective] ASC, [AcademicSubjectTypeId] ASC, [ObjectiveGradeLevelTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_AcademicSubjectType_LearningObjective] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_LearningObjective_AcademicSubjectType] FOREIGN KEY ([AcademicSubjectTypeId]) REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId]),
    CONSTRAINT [FK_LearningObjective_GradeLevelType] FOREIGN KEY ([ObjectiveGradeLevelTypeId]) REFERENCES [edfi].[GradeLevelType] ([GradeLevelTypeId]),
    CONSTRAINT [FK_LearningObjective_LearningObjective] FOREIGN KEY ([ParentObjective], [ParentAcademicSubjectTypeId], [ParentObjectiveGradeLevelTypeId]) REFERENCES [edfi].[LearningObjective] ([Objective], [AcademicSubjectTypeId], [ObjectiveGradeLevelTypeId]),
    CONSTRAINT [FK_LearningObjective_LearningStandard] FOREIGN KEY ([LearningStandardId]) REFERENCES [edfi].[LearningStandard] ([LearningStandardId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents identified learning objectives that are tested.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LearningObjective';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The designated title of the learning objective.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LearningObjective', @level2type = N'COLUMN', @level2name = N'Objective';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LearningObjective', @level2type = N'COLUMN', @level2name = N'AcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level for which the learning objective is targeted,
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LearningObjective', @level2type = N'COLUMN', @level2name = N'ObjectiveGradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the learning objective.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LearningObjective', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The designated title of the learning objective.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LearningObjective', @level2type = N'COLUMN', @level2name = N'ParentObjective';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LearningObjective', @level2type = N'COLUMN', @level2name = N'ParentAcademicSubjectTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level for which the learning objective is targeted,
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LearningObjective', @level2type = N'COLUMN', @level2name = N'ParentObjectiveGradeLevelTypeId';

