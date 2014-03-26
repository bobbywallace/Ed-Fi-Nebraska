CREATE TABLE [edfi].[AdministrativeFundingControlType] (
    [AdministrativeFundingControlTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                          NVARCHAR (20)  NOT NULL,
    [Description]                        NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKAdministrativeFundingControlType] PRIMARY KEY NONCLUSTERED ([AdministrativeFundingControlTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIAdministrativeFundingControlTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

