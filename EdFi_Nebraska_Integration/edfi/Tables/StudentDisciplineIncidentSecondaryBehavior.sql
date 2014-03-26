CREATE TABLE [edfi].[StudentDisciplineIncidentSecondaryBehavior] (
    [StudentUSI]             BIGINT        NOT NULL,
    [SchoolId]               INT           NOT NULL,
    [IncidentIdentifier]     NVARCHAR (20) NOT NULL,
    [BehaviorCategoryTypeId] INT           NOT NULL,
    [SecondaryBehavior]      NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_StudentDisciplineIncidentSecondaryBehavior] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC, [BehaviorCategoryTypeId] ASC, [SecondaryBehavior] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentDisciplineIncidentSecondaryBehavior_BehaviorCategoryType] FOREIGN KEY ([BehaviorCategoryTypeId]) REFERENCES [edfi].[BehaviorCategoryType] ([BehaviorCategoryTypeId]),
    CONSTRAINT [FK_StudentDisciplineIncidentSecondaryBehavior_StudentDisciplineIncidentAssociation] FOREIGN KEY ([StudentUSI], [SchoolId], [IncidentIdentifier]) REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([StudentUSI], [SchoolId], [IncidentIdentifier])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentSecondaryBehavior', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentSecondaryBehavior', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentSecondaryBehavior', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The category of the incident behavior for classification purposes,
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentSecondaryBehavior', @level2type = N'COLUMN', @level2name = N'BehaviorCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the behavior of a student for a discipline incident.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentSecondaryBehavior', @level2type = N'COLUMN', @level2name = N'SecondaryBehavior';

