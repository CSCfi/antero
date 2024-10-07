USE Arvo_SA
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot'
      AND COLUMN_NAME = 'tutkinnon_osat_oppilaitosmuotoinenkoulutus'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot ADD tutkinnon_osat_oppilaitosmuotoinenkoulutus  VARCHAR(500) NULL
END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot'
      AND COLUMN_NAME = 'tutkinnon_osat_oppisopimus'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot ADD tutkinnon_osat_oppisopimus  VARCHAR(500) NULL
END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot'
      AND COLUMN_NAME = 'tutkinnon_osat_koulutussopimus'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot ADD tutkinnon_osat_koulutussopimus  VARCHAR(500) NULL
END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot_jaadytetty'
      AND COLUMN_NAME = 'tutkinnon_osat_oppilaitosmuotoinenkoulutus'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot_jaadytetty ADD tutkinnon_osat_oppilaitosmuotoinenkoulutus  VARCHAR(500) NULL
END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot_jaadytetty'
      AND COLUMN_NAME = 'tutkinnon_osat_oppisopimus'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot_jaadytetty ADD tutkinnon_osat_oppisopimus  VARCHAR(500) NULL
END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa'
      AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot_jaadytetty'
      AND COLUMN_NAME = 'tutkinnon_osat_koulutussopimus'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kohteet_taustatiedot_jaadytetty ADD tutkinnon_osat_koulutussopimus  VARCHAR(500) NULL
END

GO
