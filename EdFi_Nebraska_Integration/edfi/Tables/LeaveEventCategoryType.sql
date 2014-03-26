CREATE TABLE [edfi].[LeaveEventCategoryType] (
    [LeaveEventCategoryTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                NVARCHAR (30)  NOT NULL,
    [Description]              NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKLeaveEventCategoryType] PRIMARY KEY NONCLUSTERED ([LeaveEventCategoryTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UILeaveEventCategoryTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

