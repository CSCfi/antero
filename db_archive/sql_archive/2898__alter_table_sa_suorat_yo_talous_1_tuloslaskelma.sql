USE ANTERO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_1_tuloslaskelma'
AND COLUMN_NAME ='EURAH')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo_talous_1_tuloslaskelma]  ADD [EURAH] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KERLAHJKOTI')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo_talous_1_tuloslaskelma]  ADD [KERLAHJKOTI] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KERLAHJYRIT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo_talous_1_tuloslaskelma]  ADD [KERLAHJYRIT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KERLAHJMUU')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo_talous_1_tuloslaskelma]  ADD [KERLAHJMUU] bigint  NULL
END
