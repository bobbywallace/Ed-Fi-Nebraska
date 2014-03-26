CREATE TABLE [edfi].[EmploymentStatusType] (
    [EmploymentStatusTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]              NVARCHAR (20)  NOT NULL,
    [Description]            NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKEmploymentStatusType] PRIMARY KEY NONCLUSTERED ([EmploymentStatusTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIEmploymentStatusTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

