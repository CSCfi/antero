-- bigint will not convert to datetime?
IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_yhteisjulkaisut_ristiriitaiset'
  and COLUMN_NAME='luontipaivamaara' and DATA_TYPE='bigint'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset DROP COLUMN luontipaivamaara
END

ALTER TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset ADD luontipaivamaara datetime2(0) null
