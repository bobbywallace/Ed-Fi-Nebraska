CREATE TABLE [edfi].[DisciplineIncidentBehavior] (
    [SchoolId]             INT           NOT NULL,
    [IncidentIdentifier]   NVARCHAR (20) NOT NULL,
    [BehaviorDescriptorId] INT           NOT NULL,
    CONSTRAINT [PK_DisciplineIncidentBehavior] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [IncidentIdentifier] ASC, [BehaviorDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_DisciplineIncidentBehavior_BehaviorDescriptor] FOREIGN KEY ([BehaviorDescriptorId]) REFERENCES [edfi].[BehaviorDescriptor] ([BehaviorDescriptorId]),
    CONSTRAINT [FK_DisciplineIncidentBehavior_DisciplineIncident] FOREIGN KEY ([SchoolId], [IncidentIdentifier]) REFERENCES [edfi].[DisciplineIncident] ([SchoolId], [IncidentIdentifier])
);

