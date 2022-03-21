USE ANTERO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_5_kustannustiedot'
  AND COLUMN_NAME ='ERIKKOUL')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo_talous_5_kustannustiedot] ADD [ERIKKOUL] int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_5_kustannustiedot'
  AND COLUMN_NAME ='MUUTTUTOSAT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo_talous_5_kustannustiedot] ADD [MUUTTUTOSAT] int null
END
