IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_yhteisjulkaisut_ristiriitaiset'
  and COLUMN_NAME='tila'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset ADD
  tila INT NULL
END
