CREATE TABLE [edfi].[Program] (
    [EducationOrganizationId] INT           NOT NULL,
    [ProgramTypeId]           INT           NOT NULL,
    [ProgramId]               NVARCHAR (20) NULL,
    [ProgramSponsorTypeId]    INT           NULL,
    CONSTRAINT [PKProgram] PRIMARY KEY NONCLUSTERED ([EducationOrganizationId] ASC, [ProgramTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Program_EducationOrganization] FOREIGN KEY ([EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_Program_ProgramSponsorType] FOREIGN KEY ([ProgramSponsorTypeId]) REFERENCES [edfi].[ProgramSponsorType] ([ProgramSponsorTypeId]),
    CONSTRAINT [FK_Program_ProgramType] FOREIGN KEY ([ProgramTypeId]) REFERENCES [edfi].[ProgramType] ([ProgramTypeId])
)
WITH (DATA_COMPRESSION = PAGE);

