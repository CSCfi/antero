
USE KOSKI_SA
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso' AND COLUMN_NAME='kotiopetus')

BEGIN
	ALTER TABLE sa.sa_koski_opiskeluoikeus_aikajakso ADD kotiopetus  int
END

GO

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_koski_opiskeluoikeus_aikajakso' AND COLUMN_NAME='ulkomaanjakso')

BEGIN
	ALTER TABLE sa.sa_koski_opiskeluoikeus_aikajakso ADD ulkomaanjakso int
END

USE ANTERO
