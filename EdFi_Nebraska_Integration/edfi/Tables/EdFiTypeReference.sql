CREATE TABLE [edfi].[EdFiTypeReference] (
    [EdFiTypeRefId]     INT             IDENTITY (1, 1) NOT NULL,
    [EdFiTypeTable]     NVARCHAR (75)   NOT NULL,
    [SourceDescription] NVARCHAR (1024) NOT NULL,
    [EdFiDescription]   NVARCHAR (1024) NOT NULL,
    [EdFiTypeId]        INT             NOT NULL,
    CONSTRAINT [EdFiTypeRef] PRIMARY KEY CLUSTERED ([EdFiTypeRefId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'This is a reference table between the source ODS descriptions and the EdFi Type tables.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EdFiTypeReference';

