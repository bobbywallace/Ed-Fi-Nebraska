CREATE TABLE [edfi].[GraduationPlanType] (
    [GraduationPlanTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]            NVARCHAR (20)  NOT NULL,
    [Description]          NVARCHAR (200) NOT NULL,
    CONSTRAINT [PKGraduationPlanType] PRIMARY KEY NONCLUSTERED ([GraduationPlanTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UIGraduationPlanTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

