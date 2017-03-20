IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_julkaisut'
  and COLUMN_NAME='emojulkaisunNimi'
) BEGIN

ALTER TABLE sa.sa_virta_jtp_julkaisut ADD emojulkaisunNimi nvarchar(500) NULL

END
/* revert
ALTER TABLE sa.sa_virta_jtp_julkaisut DROP COLUMN emojulkaisunNimi
--*/
