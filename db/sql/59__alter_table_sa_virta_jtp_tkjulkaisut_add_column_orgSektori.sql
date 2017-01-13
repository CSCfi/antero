IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='orgSektori'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ADD orgSektori int null
END
