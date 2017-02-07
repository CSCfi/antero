IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_liikennevalot'
  and COLUMN_NAME='luontipaivamaara' and DATA_TYPE='int'
) BEGIN

ALTER TABLE sa.sa_virta_otp_liikennevalot ALTER COLUMN luontipaivamaara bigint NULL -- datetime2(0) NOT NULL

END
