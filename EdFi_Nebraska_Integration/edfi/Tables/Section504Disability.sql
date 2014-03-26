CREATE TABLE [edfi].[Section504Disability] (
    [StudentUSI]                 BIGINT NOT NULL,
    [Section504DisabilityTypeId] INT    NOT NULL,
    CONSTRAINT [PK_Section504Disability] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [Section504DisabilityTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Section504Disability_Section504DisabilityType] FOREIGN KEY ([Section504DisabilityTypeId]) REFERENCES [edfi].[Section504DisabilityType] ([Section504DisabilityTypeId]),
    CONSTRAINT [FK_Section504Disability_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);

