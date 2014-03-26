CREATE TABLE [edfi].[AdministrationEnvironmentType] (
    [AdministrationEnvironmentTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (20)  NOT NULL,
    [Description]                     NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAdministrationEnvironmentType] PRIMARY KEY NONCLUSTERED ([AdministrationEnvironmentTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAdministrationEnvironmentTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

