CREATE TABLE [edfi].[SchoolFoodServicesEligibilityType] (
    [SchoolFoodServicesEligibilityTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                           NVARCHAR (20)  NOT NULL,
    [Description]                         NVARCHAR (600) NOT NULL,
    CONSTRAINT [PKSchoolFoodServicesEligibilityType] PRIMARY KEY NONCLUSTERED ([SchoolFoodServicesEligibilityTypeId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [UISchoolFoodServicesEligibilityTypeCodeValue] UNIQUE NONCLUSTERED ([CodeValue] ASC) WITH (DATA_COMPRESSION = PAGE)
)
WITH (DATA_COMPRESSION = PAGE);

