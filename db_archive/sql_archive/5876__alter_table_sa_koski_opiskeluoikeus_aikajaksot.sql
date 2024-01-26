USE KOSKI_SA
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso'
  AND COLUMN_NAME ='oikeutta_maksuttomuuteen_pidennetty')
BEGIN
	ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [oikeutta_maksuttomuuteen_pidennetty] bit null
END

USE ANTERO