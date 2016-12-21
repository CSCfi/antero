IF EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='f_kotimaiset_julkaisut_tilasto') BEGIN
  DROP TABLE f_kotimaiset_julkaisut_tilasto;
END
