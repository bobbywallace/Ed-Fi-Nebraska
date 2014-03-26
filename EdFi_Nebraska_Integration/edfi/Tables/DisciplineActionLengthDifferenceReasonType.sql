CREATE TABLE [edfi].[DisciplineActionLengthDifferenceReasonType] (
    [DisciplineActionLengthDifferenceReasonTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                                    NVARCHAR (20)  NOT NULL,
    [Description]                                  NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DisciplineActionLengthDifferenceReasonType] PRIMARY KEY CLUSTERED ([DisciplineActionLengthDifferenceReasonTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

