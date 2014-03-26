CREATE TABLE [edfi].[BehaviorDescriptor] (
    [BehaviorDescriptorId]    INT             IDENTITY (1, 1) NOT NULL,
    [EducationOrganizationId] INT             NOT NULL,
    [CodeValue]               NVARCHAR (20)   NOT NULL,
    [Description]             NVARCHAR (1024) NULL,
    [ShortDescription]        NVARCHAR (50)   NOT NULL,
    [BehaviorCategoryTypeId]  INT             NOT NULL,
    CONSTRAINT [PK_BehaviorDescriptor] PRIMARY KEY CLUSTERED ([BehaviorDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BehaviorDescriptor_BehaviorCategoryType] FOREIGN KEY ([BehaviorCategoryTypeId]) REFERENCES [edfi].[BehaviorCategoryType] ([BehaviorCategoryTypeId])
);

