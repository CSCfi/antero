USE Arvo_SA
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_kohteet_taustatiedot' AND COLUMN_NAME = 'tarkenne')
BEGIN
     ALTER TABLE [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot] ADD [tarkenne] [VARCHAR](100) NULL
END

USE Antero
