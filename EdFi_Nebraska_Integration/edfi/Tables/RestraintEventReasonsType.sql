CREATE TABLE [edfi].[RestraintEventReasonsType] (
    [RestraintEventReasonsTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                   NVARCHAR (20)  NOT NULL,
    [Description]                 NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKRestraintEventReasonsType] PRIMARY KEY NONCLUSTERED ([RestraintEventReasonsTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIRestraintEventReasonsTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

