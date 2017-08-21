IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='jufoLuokkaVanha'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ADD jufoLuokkaVanha nvarchar(max) null
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='jufoLuokkaUusi'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ADD jufoLuokkaUusi nvarchar(max) null
END
