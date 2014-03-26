CREATE TABLE [edfi].[TeachingCredentialBasisType] (
    [TeachingCredentialBasisTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                     NVARCHAR (20)  NOT NULL,
    [Description]                   NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKTeachingCredentialBasisType] PRIMARY KEY NONCLUSTERED ([TeachingCredentialBasisTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UITeachingCredentialBasisTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

