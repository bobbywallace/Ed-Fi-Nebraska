CREATE TABLE [edfi].[RestraintEvent] (
    [StudentUSI]                   BIGINT        NOT NULL,
    [SchoolId]                     INT           NOT NULL,
    [RestraintEventIdentifier]     NVARCHAR (20) NOT NULL,
    [EventDate]                    DATE          NOT NULL,
    [EducationalEnvironmentTypeId] INT           NULL,
    CONSTRAINT [PK_RestraintEvent] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [SchoolId] ASC, [RestraintEventIdentifier] ASC, [EventDate] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_EducationalEnvironmentType_RestraintEvent] FOREIGN KEY ([EducationalEnvironmentTypeId]) REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId]),
    CONSTRAINT [FK_RestraintEvent_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId]),
    CONSTRAINT [FK_RestraintEvent_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [edfi].[Student] ([StudentUSI])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This event entity represents the instances where a special education student was physically or mechanically restrained due to imminent serious physical harm to themselves or others, imminent serious property destruction, or a combination of both imminent serious physical harm to themselves or others and imminent serious property destruction.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEvent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Student Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEvent', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEvent', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a restraint event by a school, school system, a state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEvent', @level2type = N'COLUMN', @level2name = N'RestraintEventIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the resteraint event.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEvent', @level2type = N'COLUMN', @level2name = N'EventDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The setting where the restrint was exercised..
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RestraintEvent', @level2type = N'COLUMN', @level2name = N'EducationalEnvironmentTypeId';

