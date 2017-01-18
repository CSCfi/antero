IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='sivunumeroTeksti'
  and DATA_TYPE='varchar' and CHARACTER_MAXIMUM_LENGTH=50
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN sivunumeroTeksti varchar(100)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='volyymiTeksti'
  and DATA_TYPE='varchar' and CHARACTER_MAXIMUM_LENGTH=50
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN volyymiTeksti varchar(100)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='lehdenNumeroTeksti'
  and DATA_TYPE='varchar' and CHARACTER_MAXIMUM_LENGTH=50
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN lehdenNumeroTeksti varchar(100)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='issn'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=20
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN issn varchar(100)
END
