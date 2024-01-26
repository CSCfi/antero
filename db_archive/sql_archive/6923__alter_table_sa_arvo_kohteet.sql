USE ARVO_SA
GO

IF  EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_kohteet' AND COLUMN_NAME = 'vastaajatunnus')
BEGIN
     ALTER TABLE [sa].[sa_arvo_kohteet] ALTER COLUMN	[vastaajatunnus] [varchar](100) NULL;
END

USE ANTERO
