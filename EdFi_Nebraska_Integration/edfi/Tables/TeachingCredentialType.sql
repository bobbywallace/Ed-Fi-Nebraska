CREATE TABLE [edfi].[TeachingCredentialType] (
    [TeachingCredentialTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                NVARCHAR (30)  NOT NULL,
    [Description]              NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKTeachingCredentialTypeType] PRIMARY KEY NONCLUSTERED ([TeachingCredentialTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UITeachingCredentialTypeTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

