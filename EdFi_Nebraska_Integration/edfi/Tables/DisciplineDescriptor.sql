CREATE TABLE [edfi].[DisciplineDescriptor] (
    [DisciplineDescriptorId]  INT             IDENTITY (1, 1) NOT NULL,
    [EducationOrganizationId] INT             NOT NULL,
    [CodeValue]               NVARCHAR (20)   NOT NULL,
    [Description]             NVARCHAR (1024) NULL,
    [ShortDescription]        NVARCHAR (50)   NOT NULL,
    CONSTRAINT [PK_DisciplineDescriptor] PRIMARY KEY CLUSTERED ([DisciplineDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

