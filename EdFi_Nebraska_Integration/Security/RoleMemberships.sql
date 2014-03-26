ALTER ROLE [db_ddladmin] ADD MEMBER [edfiLoader];


GO
ALTER ROLE [db_ddladmin] ADD MEMBER [tsdsLoader];


GO
ALTER ROLE [db_datareader] ADD MEMBER [edfiLoader];


GO
ALTER ROLE [db_datareader] ADD MEMBER [tsdsLoader];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [edfiLoader];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [tsdsLoader];

