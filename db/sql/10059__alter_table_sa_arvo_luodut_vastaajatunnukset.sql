USE Arvo_SA

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_luodut_vastaajatunnukset'
      AND COLUMN_NAME = 'kyselyid'
)
BEGIN
    ALTER TABLE sa.sa_arvo_luodut_vastaajatunnukset
    ADD kyselyid  INT NULL;
END;
