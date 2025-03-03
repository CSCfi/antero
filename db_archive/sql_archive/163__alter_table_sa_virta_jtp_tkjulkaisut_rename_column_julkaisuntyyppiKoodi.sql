IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='julkaisuntyyppiKoodi'
) AND
NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='julkaisutyyppiKoodi'
) BEGIN
EXEC sp_RENAME 'sa.sa_virta_jtp_tkjulkaisut.julkaisuntyyppiKoodi', 'julkaisutyyppiKoodi', 'COLUMN';
END
