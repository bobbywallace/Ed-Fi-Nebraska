CREATE TABLE [edfi].[EducationServiceCenter] (
    [EducationServiceCenterId] INT NOT NULL,
    [StateEducationAgencyId]   INT NULL,
    CONSTRAINT [PKEducationServiceCenter] PRIMARY KEY NONCLUSTERED ([EducationServiceCenterId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationServiceCenter_EducationOrganization] FOREIGN KEY ([EducationServiceCenterId]) REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId]),
    CONSTRAINT [FK_EducationServiceCenter_StateEducationAgency] FOREIGN KEY ([StateEducationAgencyId]) REFERENCES [edfi].[StateEducationAgency] ([StateEducationAgencyId])
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents a regional, multi-services public agency authorized by State law to develop, manage, and provide services, programs, or other options support (e.g., construction, food services, technology services) to LEAs.
NEDM: Intermediate Educational Unit (IEU)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationServiceCenter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationServiceCenter Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationServiceCenter', @level2type = N'COLUMN', @level2name = N'EducationServiceCenterId';

