USE ANTERO
GO

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='julkaisunTunnus' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN julkaisunTunnus NVARCHAR(500) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='JulkaisunOrgTunnus' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN JulkaisunOrgTunnus NVARCHAR(100) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='SivunumeroTeksti' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN SivunumeroTeksti NVARCHAR(MAX) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='JufoTunnus' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN JufoTunnus NVARCHAR(20) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='JulkaisumaaKoodi' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN JulkaisumaaKoodi NVARCHAR(20) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='VolyymiTeksti' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN VolyymiTeksti NVARCHAR(MAX) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='LehdenNumeroTeksti' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN LehdenNumeroTeksti NVARCHAR(MAX) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='JulkaisunKieliKoodi' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN JulkaisunKieliKoodi NVARCHAR(20) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='Lataus_ID' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN Lataus_ID NVARCHAR(255) NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='YhteisjulkaisunTunnus' and DATA_TYPE='nvarchar'
)  BEGIN
  ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ALTER COLUMN YhteisjulkaisunTunnus NVARCHAR(50) NULL
END
