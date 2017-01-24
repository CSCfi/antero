IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_yhteisjulkaisut_ristiriitaiset'
  and COLUMN_NAME='luontipaivamaara' and DATA_TYPE='bigint'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset ALTER COLUMN luontipaivamaara datetime2(0)
END
