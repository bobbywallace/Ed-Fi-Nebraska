CREATE TABLE [edfi].[CreditType] (
    [CreditTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]    NVARCHAR (20)  NOT NULL,
    [Description]  NVARCHAR (200) NULL,
    CONSTRAINT [PK_CreditType] PRIMARY KEY CLUSTERED ([CreditTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

