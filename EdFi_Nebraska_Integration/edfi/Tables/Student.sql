CREATE TABLE [edfi].[Student] (
    [StudentUSI]                            BIGINT        NOT NULL,
    [PersonalTitlePrefixTypeId]             INT           NULL,
    [FirstName]                             NVARCHAR (75) NOT NULL,
    [MiddleName]                            NVARCHAR (75) NULL,
    [LastSurname]                           NVARCHAR (75) NOT NULL,
    [GenerationCodeSuffixTypeId]            INT           NULL,
    [MaidenName]                            NVARCHAR (35) NULL,
    [PersonalInformationVerificationTypeId] INT           NULL,
    [SexTypeId]                             INT           NOT NULL,
    [BirthDate]                             DATE          NOT NULL,
    [CityOfBirth]                           NVARCHAR (30) NULL,
    [StateOfBirthAbbreviationTypeId]        INT           NULL,
    [CountryOfBirthCodeTypeId]              INT           NULL,
    [DateEnteredUS]                         DATE          NULL,
    [MultipleBirthStatus]                   BIT           NULL,
    [ProfileThumbnail]                      NVARCHAR (59) NULL,
    [HispanicLatinoEthnicity]               BIT           NOT NULL,
    [OldEthnicityTypeId]                    INT           NULL,
    [EconomicDisadvantaged]                 BIT           NULL,
    [SchoolFoodServicesEligibilityTypeId]   INT           NULL,
    [LimitedEnglishProficiencyTypeId]       INT           NULL,
    [DisplacementStatusType]                NVARCHAR (30) NULL,
    [LoginId]                               NVARCHAR (60) NULL,
    CONSTRAINT [PKStudent] PRIMARY KEY NONCLUSTERED ([StudentUSI] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_LimitedEnglishProficiencyType_Student] FOREIGN KEY ([LimitedEnglishProficiencyTypeId]) REFERENCES [edfi].[LimitedEnglishProficiencyType] ([LimitedEnglishProficiencyTypeId]),
    CONSTRAINT [FK_OldEthnicityType_Student] FOREIGN KEY ([OldEthnicityTypeId]) REFERENCES [edfi].[OldEthnicityType] ([OldEthnicityTypeId]),
    CONSTRAINT [FK_SchoolFoodServicesEligibilityType_Student] FOREIGN KEY ([SchoolFoodServicesEligibilityTypeId]) REFERENCES [edfi].[SchoolFoodServicesEligibilityType] ([SchoolFoodServicesEligibilityTypeId]),
    CONSTRAINT [FK_SexType_Student] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId]),
    CONSTRAINT [FK_Student_CountryCodeType] FOREIGN KEY ([CountryOfBirthCodeTypeId]) REFERENCES [edfi].[CountryCodeType] ([CountryCodeTypeId]),
    CONSTRAINT [FK_Student_GenerationCodeSuffixType] FOREIGN KEY ([GenerationCodeSuffixTypeId]) REFERENCES [edfi].[GenerationCodeSuffixType] ([GenerationCodeSuffixTypeId]),
    CONSTRAINT [FK_Student_PersonalInformationVerificationType] FOREIGN KEY ([PersonalInformationVerificationTypeId]) REFERENCES [edfi].[PersonalInformationVerificationType] ([PersonalInformationVerificationTypeId]),
    CONSTRAINT [FK_Student_PersonalTitlePrefixType] FOREIGN KEY ([PersonalTitlePrefixTypeId]) REFERENCES [edfi].[PersonalTitlePrefixType] ([PersonalTitlePrefixTypeId]),
    CONSTRAINT [FK_Student_StateAbbreviationType] FOREIGN KEY ([StateOfBirthAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents an individual for whom instruction, services and/or care are provided in an early childhood, elementary or secondary educational program under the jurisdiction of a school, education agency, or other institution or program.  A student is a person who has been enrolled in a campus or other educational institution.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.
NEDM: First Name
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'FirstName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.
NEDM: Middle Name
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'MiddleName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name borne in common by members of a family.
NEDM: Last Name/Surname
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'LastSurname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).
NEDM: Generation Code / Suffix
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'GenerationCodeSuffixTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The person''s maiden name, if applicable.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'MaidenName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The evidence presented to verify one''s personal identity; for example: drivers license, passport, birth certificate, etc.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'PersonalInformationVerificationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A person''s gender.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'SexTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which an individual was born.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'BirthDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'CityOfBirth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The abbreviation for the name of the state (within the United States) or extra-state jurisdiction in which an individual was born.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'StateOfBirthAbbreviationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the country in which an individual was born. (Note: A list of countries and codes is currently maintained and updated by the ISO as ISO 3166 on its website: http://www.iso.org/iso/country_codes.htm)
NEDM: Country Of Birth Code
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'CountryOfBirthCodeTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'MultipleBirthStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'File name for the ProfileThumbnail photograph
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'ProfileThumbnail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication that the individual traces his or her origin or descent to Mexico, Puerto Rico, Cuba, Central and South America, and other Spanish cultures, regardless of race. The term, "Spanish origin," can be used in addition to "Hispanic or Latino."
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'HispanicLatinoEthnicity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous definition of Ethnicity combining Hispanic/latino and race:
1 - American Indian or Alaskan Native
2 - Asian or Pacific Islander
3 - Black, not of Hispanic origin
4 - Hispanic
5 - White, not of Hispanic origin
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'OldEthnicityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of inadequate financial condition of an individual''s family, as determined by family income, number of family members/dependents, participation in public assistance programs, and/or other characteristics considered relevant by federal, state, and local policy.
NEDM: Economic Disadvantaged Status
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'EconomicDisadvantaged';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of a student''s level of eligibility for breakfast, lunch, snack, supper, and milk programs.
NEDM: Eligibility Status for School Food Service Programs
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'SchoolFoodServicesEligibilityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication that the student has sufficient difficulty speaking, reading, writing, or understanding the English language, as to require special English Language services.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'LimitedEnglishProficiencyTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates a state health or weather related event that displaces a group of students, and may require additional funding, educational, or social services.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'DisplacementStatusType';

