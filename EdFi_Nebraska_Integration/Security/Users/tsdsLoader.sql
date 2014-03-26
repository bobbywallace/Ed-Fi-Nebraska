CREATE USER [tsdsLoader]
    WITH DEFAULT_SCHEMA = [EdFi];
GO

GRANT CONNECT TO [tsdsLoader]
    AS [dbo];
GO
GRANT EXECUTE TO [tsdsLoader]
    AS [dbo];
GO


