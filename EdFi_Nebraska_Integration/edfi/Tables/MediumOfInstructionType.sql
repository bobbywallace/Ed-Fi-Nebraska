CREATE TABLE [edfi].[MediumOfInstructionType] (
    [MediumOfInstructionTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                 NVARCHAR (20)  NOT NULL,
    [Description]               NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKMediumOfInstructionType] PRIMARY KEY NONCLUSTERED ([MediumOfInstructionTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIMediumOfInstructionTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

