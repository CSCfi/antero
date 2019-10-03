IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='artikkelinumero'
  and DATA_TYPE='varchar' and CHARACTER_MAXIMUM_LENGTH=30
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN artikkelinumero varchar(100)
END
