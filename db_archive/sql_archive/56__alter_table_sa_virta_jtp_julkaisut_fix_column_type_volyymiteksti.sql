IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='volyymiTeksti'
  and DATA_TYPE='varchar' and CHARACTER_MAXIMUM_LENGTH=100
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN volyymiTeksti varchar(200)
END
