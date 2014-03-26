CREATE TABLE [edfi].[StaffClassificationType] (
    [StaffClassificationTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                 NVARCHAR (20)  NOT NULL,
    [Description]               NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKStaffClassificationType] PRIMARY KEY NONCLUSTERED ([StaffClassificationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIStaffClassificationTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

