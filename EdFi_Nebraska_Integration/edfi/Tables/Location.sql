CREATE TABLE [edfi].[Location] (
    [SchoolId]                    INT           NOT NULL,
    [ClassroomIdentificationCode] NVARCHAR (20) NOT NULL,
    [MaximumNumberOfSeats]        INT           NULL,
    [OptimalNumberOfSeats]        INT           NULL,
    CONSTRAINT [PKLocation] PRIMARY KEY NONCLUSTERED ([SchoolId] ASC, [ClassroomIdentificationCode] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_Location_School] FOREIGN KEY ([SchoolId]) REFERENCES [edfi].[School] ([SchoolId])
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents the physical space where students gather for a particular class/section.  The location may be an indoor or outdoor area designated for the purpose of meeting the educational needs of students.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Location';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'ClassroomIdentificationCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The most number of seats the class can maintain.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'MaximumNumberOfSeats';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of seats that is most favorable to the class.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'OptimalNumberOfSeats';

