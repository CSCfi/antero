
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot'
      AND COLUMN_NAME = 'osaamisen_hankkimistapa'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot
    ADD osaamisen_hankkimistapa  VARCHAR(1000) NULL;
END;


IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot'
      AND COLUMN_NAME = 'koulutussektori'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot
    ADD  koulutussektori VARCHAR(100) NULL;
END;

IF  EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot'
      AND COLUMN_NAME = 'tarkenne'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot
    DROP COLUMN  tarkenne;
END;





IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot_jaadytetty'
      AND COLUMN_NAME = 'koulutussektori'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot_jaadytetty
    ADD  koulutussektori VARCHAR(100) NULL;
END;

IF  EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot_jaadytetty'
      AND COLUMN_NAME = 'tarkenne'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot_jaadytetty
    DROP COLUMN  tarkenne;
END;


IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot_jaadytetty'
      AND COLUMN_NAME = 'osaamisen_hankkimistapa'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot_jaadytetty
    ADD osaamisen_hankkimistapa  VARCHAR(1000) NULL;
END;
