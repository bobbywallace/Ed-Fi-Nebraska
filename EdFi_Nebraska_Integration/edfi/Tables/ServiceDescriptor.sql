CREATE TABLE [edfi].[ServiceDescriptor] (
    [ServiceDescriptorId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (20)   NOT NULL,
    [Description]         NVARCHAR (1024) NULL,
    [ShortDescription]    NVARCHAR (50)   NOT NULL,
    [ServiceCategory]     NVARCHAR (50)   NULL,
    CONSTRAINT [PK_ServiceDescriptor] PRIMARY KEY CLUSTERED ([ServiceDescriptorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

