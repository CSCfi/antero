USE Koski_SA
GO

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_koski_opiskeluoikeus_aikajakso' AND COLUMN_NAME = 'maksuton'
)
BEGIN
    ALTER TABLE sa.sa_koski_opiskeluoikeus_aikajakso
    ADD maksuton INT NULL;
END

GO

USE ANTERO
