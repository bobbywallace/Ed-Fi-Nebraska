CREATE TABLE [edfi].[StudentIndicator] (
    [StudentUSI]     BIGINT        NOT NULL,
    [IndicatorName]  NVARCHAR (60) NOT NULL,
    [Indicator]      NVARCHAR (35) NOT NULL,
    [IndicatorGroup] NVARCHAR (60) NULL,
    [BeginDate]      DATETIME      NULL,
    [EndDate]        DATETIME      NULL,
    [DesignatedBy]   NVARCHAR (60) NULL,
    CONSTRAINT [PK_StudentIndicator] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [IndicatorName] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_StudentIndicator_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);

