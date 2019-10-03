IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='isbn'
  and DATA_TYPE='varchar' and CHARACTER_MAXIMUM_LENGTH=30
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN isbn varchar(100)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='sivunumeroTeksti'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN sivunumeroTeksti varchar(50)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='artikkelinumero'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN artikkelinumero varchar(30)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='jufoTunnus'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN jufoTunnus varchar(10)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='jufoLuokkaKoodi'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN jufoLuokkaKoodi varchar(2)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='volyymiTeksti'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN volyymiTeksti varchar(50)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='lehdenNumeroTeksti'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN lehdenNumeroTeksti varchar(50)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='julkaisunKieliKoodi'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN julkaisunKieliKoodi varchar(2)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='avoinSaatavuusKoodi'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN avoinSaatavuusKoodi varchar(2)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='latausId'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN latausId varchar(30)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='yhteisjulkaisuId'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN yhteisjulkaisuId varchar(30)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='jufoId'
  and DATA_TYPE='nvarchar' and CHARACTER_MAXIMUM_LENGTH=-1
) BEGIN
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN jufoId varchar(30)
END
