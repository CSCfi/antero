IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='jufoLuokkaVanha' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN jufoLuokkaVanha NVARCHAR(5) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='jufoLuokkaUusi' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN jufoLuokkaUusi NVARCHAR(5)) NULL
END
