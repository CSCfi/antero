USE KOSKI_SA

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso'
  AND COLUMN_NAME ='majoitusetu')
BEGIN
	ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [majoitusetu] int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso'
  AND COLUMN_NAME ='kuljetusetu')
BEGIN
	ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [kuljetusetu] int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso'
  AND COLUMN_NAME ='vammainen')
BEGIN
	ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [vammainen] int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso'
  AND COLUMN_NAME ='pidennetty_oppivelvollisuus')
BEGIN
	ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [pidennetty_oppivelvollisuus] int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso'
  AND COLUMN_NAME ='joustava_perusopetus')
BEGIN
	ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [joustava_perusopetus] int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso'
  AND COLUMN_NAME ='koulukoti')
BEGIN
	ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [koulukoti] int null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso'
  AND COLUMN_NAME ='oppimaaran_suorittaja')
BEGIN
	ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [oppimaaran_suorittaja] int null
END

USE ANTERO
