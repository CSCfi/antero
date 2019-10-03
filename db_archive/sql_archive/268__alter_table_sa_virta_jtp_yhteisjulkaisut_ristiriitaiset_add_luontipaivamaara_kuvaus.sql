IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_yhteisjulkaisut_ristiriitaiset'
  and COLUMN_NAME='luontipaivamaara'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset ADD luontipaivamaara bigint null
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_yhteisjulkaisut_ristiriitaiset'
  and COLUMN_NAME='kuvaus'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset ADD kuvaus nvarchar(max) null
END
