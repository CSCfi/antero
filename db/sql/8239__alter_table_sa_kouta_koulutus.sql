USE ANTERO
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
    AND TABLE_NAME = 'sa_kouta_koulutus'
    AND COLUMN_NAME = 'opetuskieliKoodiUrit'
)
BEGIN
    ALTER TABLE sa.sa_kouta_koulutus
    ADD [opetuskieliKoodiUrit] VARCHAR(250);
END
