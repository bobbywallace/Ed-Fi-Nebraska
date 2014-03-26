CREATE TABLE [edfi].[Staff] (
    [StaffUSI]                               BIGINT        NOT NULL,
    [PersonalTitlePrefixTypeId]              INT           NULL,
    [FirstName]                              NVARCHAR (75) NOT NULL,
    [MiddleName]                             NVARCHAR (75) NULL,
    [LastSurname]                            NVARCHAR (75) NOT NULL,
    [GenerationCodeSuffixTypeId]             INT           NULL,
    [MaidenName]                             NVARCHAR (35) NULL,
    [PersonalInformationVerificationTypeId]  INT           NULL,
    [SexTypeId]                              INT           NULL,
    [BirthDate]                              DATE          NULL,
    [HispanicLatinoEthnicity]                BIT           NOT NULL,
    [OldEthnicityTypeId]                     INT           NULL,
    [HighestLevelOfEducationCompletedTypeId] INT           NOT NULL,
    [YearsOfPriorProfessionalExperience]     INT           NULL,
    [YearsOfPriorTeachingExperience]         INT           NULL,
    [HighlyQualifiedTeacher]                 BIT           NULL,
    [TeacherUSI]                             BIGINT        NULL,
    [LoginId]                                NVARCHAR (60) NULL,
    CONSTRAINT [PKStaff] PRIMARY KEY NONCLUSTERED ([StaffUSI] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_LevelOfEducationType_Staff] FOREIGN KEY ([HighestLevelOfEducationCompletedTypeId]) REFERENCES [edfi].[LevelOfEducationType] ([LevelOfEducationTypeId]),
    CONSTRAINT [FK_OldEthnicityType_Staff] FOREIGN KEY ([OldEthnicityTypeId]) REFERENCES [edfi].[OldEthnicityType] ([OldEthnicityTypeId]),
    CONSTRAINT [FK_SexType_Staff] FOREIGN KEY ([SexTypeId]) REFERENCES [edfi].[SexType] ([SexTypeId]),
    CONSTRAINT [FK_Staff_GenerationCodeSuffixType] FOREIGN KEY ([GenerationCodeSuffixTypeId]) REFERENCES [edfi].[GenerationCodeSuffixType] ([GenerationCodeSuffixTypeId]),
    CONSTRAINT [FK_Staff_PersonalInformationVerificationType] FOREIGN KEY ([PersonalInformationVerificationTypeId]) REFERENCES [edfi].[PersonalInformationVerificationType] ([PersonalInformationVerificationTypeId]),
    CONSTRAINT [FK_Staff_PersonalTitlePrefixType] FOREIGN KEY ([PersonalTitlePrefixTypeId]) REFERENCES [edfi].[PersonalTitlePrefixType] ([PersonalTitlePrefixTypeId])
)
WITH (DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_Staff_StudentRecord]
    ON [edfi].[Staff]([StaffUSI] ASC)
    INCLUDE([FirstName], [LastSurname]) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents an individual who performs specified activities for any public or private education institution or agency that provides instructional and/or support services to students or staff at the early childhood level through high school completion. For example, this includes: 
1) an "employee" who performs services under the direction of the employing institution or agency, is compensated for such services by the employer, and is eligible for employee benefits and wage or salary tax withholdings; 
2) a "contractor" or "consultant" who performs services for an agreed upon fee, or an employee of a management service contracted to work on site; 
3) a "volunteer" who performs services on a voluntary and uncompensated basis; 
4) an in kind service provider; or 
5) an independent contractor or businessperson working at a school site.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.
NEDM: First Name
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'FirstName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.
NEDM: Middle Name
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'MiddleName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name borne in common by members of a family.
NEDM: Last Name/Surname
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'LastSurname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).
NEDM: Generation Code / Suffix
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'GenerationCodeSuffixTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The person''s maiden name, if applicable.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'MaidenName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The evidence presented to verify one''s personal identity; for example: drivers license, passport, birth certificate, etc.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'PersonalInformationVerificationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A person''s gender.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'SexTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which an individual was born.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'BirthDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication that the individual traces his or her origin or descent to Mexico, Puerto Rico, Cuba, Central and South America, and other Spanish cultures, regardless of race. The term, "Spanish origin," can be used in addition to "Hispanic or Latino."
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'HispanicLatinoEthnicity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous definition of Ethnicity combining Hispanic/latino and race:
1 - American Indian or Alaskan Native
2 - Asian or Pacific Islander
3 - Black, not of Hispanic origin
4 - Hispanic
5 - White, not of Hispanic origin
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'OldEthnicityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The extent of formal instruction an individual has received (e.g., the highest grade in school completed or its equivalent or the highest degree received). 
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'HighestLevelOfEducationCompletedTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of years that an individual has previously held a similar professional position in one or more education institutions.
NEDM: Years of Prior Teaching Experience
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'YearsOfPriorProfessionalExperience';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of years that an individual has previously held a teaching position in one or more education institutions.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'YearsOfPriorTeachingExperience';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of whether a teacher is classified as highly qualified for his/her assignment according to state definition.  This attribute indicates the teacher is highly qualified for ALL sections being taught.
Section 9101(23) of the ESEA defines the term &ldquo;highly qualified.&rdquo;
NEDM: HQT Qualification Status
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'HighlyQualifiedTeacher';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An ID number maintained by the state that uniquely identifies this teacher.
TDCARSI Study: Recommendation for a statewide teacher UID
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Staff', @level2type = N'COLUMN', @level2name = N'TeacherUSI';

