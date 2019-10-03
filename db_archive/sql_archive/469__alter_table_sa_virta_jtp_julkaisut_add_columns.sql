IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_julkaisut'
  and COLUMN_NAME='konferenssinNimi'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_julkaisut ADD konferenssinNimi nvarchar(500) NULL
END
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_julkaisut'
  and COLUMN_NAME='pysyvaOsoiteTeksti'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_julkaisut ADD pysyvaOsoiteTeksti nvarchar(500) NULL
END

/* revert
ALTER TABLE sa.sa_virta_jtp_julkaisut DROP COLUMN
  konferenssinNimi,
  pysyvaOsoiteTeksti
--*/
