CREATE TABLE [edfi].[ProgramAssignmentType] (
    [ProgramAssignmentTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (20)  NOT NULL,
    [Description]             NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKProgramAssignmentType] PRIMARY KEY NONCLUSTERED ([ProgramAssignmentTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIProgramAssignmentTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

