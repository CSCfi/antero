USE ANTERO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='TOIMINTO')
BEGIN
    ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ALTER COLUMN TOIMINTO varchar(255) null
END
