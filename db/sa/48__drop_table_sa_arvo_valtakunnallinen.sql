IF EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_arvo_valtakunnallinen') BEGIN

DROP TABLE dbo.sa_arvo_valtakunnallinen;

END
