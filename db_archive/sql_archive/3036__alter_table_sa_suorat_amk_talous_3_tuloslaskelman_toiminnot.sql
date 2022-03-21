USE ANTERO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='KULUTYHT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ADD  [KULUTYHT] int  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_3_tuloslaskelman_toiminnot'
AND COLUMN_NAME ='KULKAT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_3_tuloslaskelman_toiminnot]  ADD [KULKAT] int  NULL
END
