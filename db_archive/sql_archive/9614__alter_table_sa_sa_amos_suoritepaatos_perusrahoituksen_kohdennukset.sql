USE ANTERO
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_amos_suoritepaatos_perusrahoituksen_kohdennukset' AND COLUMN_NAME = 'Perusrahoitus yhteensä, €')
BEGIN
     ALTER TABLE [ANTERO].[sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset] ADD "Perusrahoitus yhteensä, €" int NULL
END
