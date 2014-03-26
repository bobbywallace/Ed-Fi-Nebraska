CREATE TABLE [edfi].[MethodCreditEarnedType] (
    [MethodCreditEarnedTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                NVARCHAR (50)  NOT NULL,
    [Description]              NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKMethodCreditEarnedType] PRIMARY KEY NONCLUSTERED ([MethodCreditEarnedTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIMethodCreditEarnedTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

