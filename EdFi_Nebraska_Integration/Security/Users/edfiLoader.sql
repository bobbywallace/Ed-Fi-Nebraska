CREATE USER [edfiLoader]
    WITH DEFAULT_SCHEMA = [EdFi];
GO
GRANT CONNECT TO [edfiLoader]
    AS [dbo];
GO
GRANT EXECUTE TO [edfiLoader]
    AS [dbo];

