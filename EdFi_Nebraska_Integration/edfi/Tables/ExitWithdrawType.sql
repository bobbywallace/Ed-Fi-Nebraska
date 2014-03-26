CREATE TABLE [edfi].[ExitWithdrawType] (
    [ExitWithdrawTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (20)  NOT NULL,
    [Description]        NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKExitWithdrawTypeType] PRIMARY KEY NONCLUSTERED ([ExitWithdrawTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIExitWithdrawTypeTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

