CREATE TABLE [edfi].[PostSecondaryEvent] (
    [StudentUSI]                       BIGINT        NOT NULL,
    [PostSecondaryEventCategoryTypeId] INT           NOT NULL,
    [EventDate]                        DATE          NOT NULL,
    [NameOfInstitution]                NVARCHAR (75) NULL,
    [InstitutionId]                    NVARCHAR (30) NULL,
    CONSTRAINT [PK_PostSecondaryEvent] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [PostSecondaryEventCategoryTypeId] ASC, [EventDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_PostSecondaryEvent_PostSecondaryEventCategoryType] FOREIGN KEY ([PostSecondaryEventCategoryTypeId]) REFERENCES [edfi].[PostSecondaryEventCategoryType] ([PostSecondaryEventCategoryTypeId]),
    CONSTRAINT [FK_PostSecondaryEvent_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Records significant events with postsecondary taken by students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PostSecondaryEvent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PostSecondaryEvent', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The postsecondary event that is logged (e.g., FAFSA application, college application, college acceptance)
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PostSecondaryEvent', @level2type = N'COLUMN', @level2name = N'PostSecondaryEventCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the event occurred or was recorded.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PostSecondaryEvent', @level2type = N'COLUMN', @level2name = N'EventDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The PostSecondary institution associated with the event.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PostSecondaryEvent', @level2type = N'COLUMN', @level2name = N'NameOfInstitution';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the postsecondary institution.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PostSecondaryEvent', @level2type = N'COLUMN', @level2name = N'InstitutionId';

