USE KOSKI_SA



IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_koski_osasuoritus'
      AND COLUMN_NAME = 'suorituspaikkaJson'
)
BEGIN
    ALTER TABLE sa.sa_koski_osasuoritus
    ADD suorituspaikkaJson  VARCHAR(MAX) NULL;
END

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_koski_osasuoritus'
      AND COLUMN_NAME = 'arvioinnistaPaattaneetJson'
)
BEGIN
   ALTER TABLE sa.sa_koski_osasuoritus
    ADD arvioinnistaPaattaneetJson VARCHAR(MAX) NULL;
END

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_koski_osasuoritus'
      AND COLUMN_NAME = 'tyossaoppimisenYhteydessa'
)
BEGIN
   ALTER TABLE sa.sa_koski_osasuoritus
    ADD tyossaoppimisenYhteydessa int NULL;
END

USE ANTERO
