IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maaraykset'
  and COLUMN_NAME='arvo'
) BEGIN
ALTER TABLE sa.sa_oiva_maaraykset ADD arvo varchar(100)
END
/* revert
ALTER TABLE sa.sa_oiva_maaraykset DROP COLUMN arvo
--*/
