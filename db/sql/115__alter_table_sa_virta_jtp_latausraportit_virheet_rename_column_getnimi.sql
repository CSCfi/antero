IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_latausraportit_virheet'
  and COLUMN_NAME='getnimi'
) AND
NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_latausraportit_virheet'
  and COLUMN_NAME='nimi'
) BEGIN
EXEC sp_RENAME 'sa.sa_virta_jtp_latausraportit_virheet.getnimi', 'nimi', 'COLUMN';
END
