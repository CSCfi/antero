USE Arvo_SA

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet'
      AND COLUMN_NAME = 'kyselyid'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet
    ADD kyselyid  INT NULL;
END;

USE Arvo_SA

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_jaadytetty'
      AND COLUMN_NAME = 'kyselyid'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_jaadytetty
    ADD kyselyid  INT NULL;
END;
