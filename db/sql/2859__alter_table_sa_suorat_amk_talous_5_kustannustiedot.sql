USE ANTERO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_5_kustannustiedot'
  AND COLUMN_NAME ='ERIKKOUL')
BEGIN
ALTER TABLE [sa].[sa_suorat_amk_talous_5_kustannustiedot] ADD [ERIKKOUL] bigint NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_5_kustannustiedot'
  AND COLUMN_NAME ='TAITTOIM')
BEGIN
ALTER TABLE [sa].[sa_suorat_amk_talous_5_kustannustiedot] ADD [TAITTOIM] bigint NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_5_kustannustiedot'
  AND COLUMN_NAME ='YLEISTOI')
BEGIN
ALTER TABLE [sa].[sa_suorat_amk_talous_5_kustannustiedot] ADD [YLEISTOI] bigint NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_5_kustannustiedot'
  AND COLUMN_NAME ='JULOIKSU')
BEGIN
ALTER TABLE [sa].[sa_suorat_amk_talous_5_kustannustiedot] ADD [JULOIKSU] bigint NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_5_kustannustiedot'
  AND COLUMN_NAME ='MUUTTUTOSAT')
BEGIN
ALTER TABLE [sa].[sa_suorat_amk_talous_5_kustannustiedot] ADD [MUUTTUTOSAT] bigint NULL
END
