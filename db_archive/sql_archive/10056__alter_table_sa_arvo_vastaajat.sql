USE Arvo_SA

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_vastaajat'
      AND COLUMN_NAME = 'kyselyid'
)
BEGIN
    ALTER TABLE sa.sa_arvo_vastaajat
    ADD kyselyid  INT NULL;
END;

USE Arvo_SA

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_vastaajat_jaadytetty'
      AND COLUMN_NAME = 'kyselyid'
)
BEGIN
    ALTER TABLE sa.sa_arvo_vastaajat_jaadytetty
    ADD kyselyid  INT NULL;
END;
