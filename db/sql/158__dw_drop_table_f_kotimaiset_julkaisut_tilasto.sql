IF EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_kotimaiset_julkaisut_tilasto') BEGIN
  DROP TABLE dw.f_kotimaiset_julkaisut_tilasto;
END
