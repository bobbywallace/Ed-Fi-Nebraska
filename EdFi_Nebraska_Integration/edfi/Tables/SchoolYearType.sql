CREATE TABLE [edfi].[SchoolYearType] (
    [SchoolYear]            SMALLINT      NOT NULL,
    [SchoolYearDescription] NVARCHAR (50) NOT NULL,
    [CurrentSchoolYear]     BIT           NOT NULL,
    CONSTRAINT [PK_SchoolYearType] PRIMARY KEY CLUSTERED ([SchoolYear] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IX_SchoolYearType]
    ON [edfi].[SchoolYearType]([CurrentSchoolYear] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_SchoolYearTypeDescription]
    ON [edfi].[SchoolYearType]([SchoolYearDescription] ASC) WITH (DATA_COMPRESSION = PAGE);

