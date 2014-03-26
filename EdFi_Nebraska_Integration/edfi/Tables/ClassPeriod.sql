CREATE TABLE [edfi].[ClassPeriod] (
    [SchoolId]        INT           NOT NULL,
    [ClassPeriodName] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_ClassPeriod] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [ClassPeriodName] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents the designation of regularly scheduled series of class meetings at designated times and days of the week.
NEDM: Class Schedule
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules). 
NEDM: Class Period
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ClassPeriod', @level2type = N'COLUMN', @level2name = N'ClassPeriodName';

