USE KOSKI_SA

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_koski_osasuoritus'
      AND COLUMN_NAME = 'tunnustettu'
)
BEGIN
    ALTER TABLE sa.sa_koski_osasuoritus
    ADD tunnustettu INT NULL;
END
USE ANTERO
