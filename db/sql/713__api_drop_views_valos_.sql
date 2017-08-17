IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.valos_suoritteet'))
DROP VIEW api.valos_suoritteet;
GO

IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.valos_koulutuksenkustannukset'))
DROP VIEW api.valos_koulutuksenkustannukset;
GO
