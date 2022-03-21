USE ANTERO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='KKVALTRAH')
BEGIN
    ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ADD KKVALTRAH int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='KULKAT')
BEGIN
    ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ADD KULKAT int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='TOIMINTO')
BEGIN
    ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ADD TOIMINTO int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='TUOTOT')
BEGIN
    ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ADD TUOTOT int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='KKVALTRAH')
BEGIN
    ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ADD KKVALTRAH int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='TTAVUSTU')
BEGIN
    ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ADD TTAVUSTU int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='LIIKETUO')
BEGIN
    ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ADD LIIKETUO int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='MUUTTUOT')
BEGIN
    ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ADD MUUTTUOT int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
  AND COLUMN_NAME ='OMAKATYHT')
BEGIN
    ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ADD OMAKATYHT int null
END
