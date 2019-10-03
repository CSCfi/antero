IF EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_valtakunnallinen') BEGIN

DROP TABLE sa.sa_arvo_valtakunnallinen;

END
