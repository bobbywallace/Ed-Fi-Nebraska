CREATE TABLE [edfi].[InstitutionTelephoneNumberType] (
    [InstitutionTelephoneNumberTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [CodeValue]                        NVARCHAR (20)  NOT NULL,
    [Description]                      NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_InstitutionTelephoneNumberType] PRIMARY KEY CLUSTERED ([InstitutionTelephoneNumberTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

