CREATE TABLE [edfi].[GradingPeriodType] (
    [GradingPeriodTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (20)  NOT NULL,
    [Description]         NVARCHAR (200) NOT NULL,
    [PeriodSequence]      INT            NULL,
    CONSTRAINT [PKGradingPeriodType] PRIMARY KEY NONCLUSTERED ([GradingPeriodTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIGradingPeriodTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_GradingPeriodTypeCodeValue]
    ON [edfi].[GradingPeriodType]([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE);

