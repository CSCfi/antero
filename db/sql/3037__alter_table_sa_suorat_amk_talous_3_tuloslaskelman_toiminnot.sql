USE ANTERO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='KULUTYHT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ALTER COLUMN  [KULUTYHT] bigint  NULL
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='KULKAT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ALTER COLUMN [KULKAT] bigint  NULL
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='KKVALTRAH')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ALTER COLUMN  [KKVALTRAH] bigint  NULL
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='TTAVUSTU')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ALTER COLUMN [TTAVUSTU] bigint  NULL
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='LIIKETUO')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ALTER COLUMN  [LIIKETUO] bigint  NULL
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='MUUTTUOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ALTER COLUMN [MUUTTUOT] bigint  NULL
END
