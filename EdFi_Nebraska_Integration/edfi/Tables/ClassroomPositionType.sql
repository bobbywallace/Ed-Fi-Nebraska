CREATE TABLE [edfi].[ClassroomPositionType] (
    [ClassroomPositionTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (20)  NOT NULL,
    [Description]             NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKClassroomPositionType] PRIMARY KEY NONCLUSTERED ([ClassroomPositionTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIClassroomPositionTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

