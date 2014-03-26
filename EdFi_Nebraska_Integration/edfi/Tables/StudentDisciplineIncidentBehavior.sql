CREATE TABLE [edfi].[StudentDisciplineIncidentBehavior] (
    [StudentUSI]           BIGINT        NOT NULL,
    [SchoolId]             INT           NOT NULL,
    [IncidentIdentifier]   NVARCHAR (20) NOT NULL,
    [BehaviorDescriptorId] INT           NOT NULL,
    CONSTRAINT [PK_StudentDisciplineIncidentBehavior] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC, [BehaviorDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentDisciplineIncidentBehavior_BehaviorDescriptor] FOREIGN KEY ([BehaviorDescriptorId]) REFERENCES [edfi].[BehaviorDescriptor] ([BehaviorDescriptorId]),
    CONSTRAINT [FK_StudentDisciplineIncidentBehavior_StudentDisciplineIncidentAssociation] FOREIGN KEY ([StudentUSI], [SchoolId], [IncidentIdentifier]) REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([StudentUSI], [SchoolId], [IncidentIdentifier])
);

