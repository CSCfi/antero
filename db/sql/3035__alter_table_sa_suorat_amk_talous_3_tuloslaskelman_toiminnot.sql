USE ANTERO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='KULUTYHT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ALTER COLUMN [KULUTYHT] int  NULL
END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='KULKAT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ALTER COLUMN [KULKAT] int  NULL
END
