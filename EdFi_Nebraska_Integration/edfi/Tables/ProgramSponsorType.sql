CREATE TABLE [edfi].[ProgramSponsorType] (
    [ProgramSponsorTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]            NVARCHAR (30)  NOT NULL,
    [Description]          NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_ProgramSponsorType] PRIMARY KEY CLUSTERED ([ProgramSponsorTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

