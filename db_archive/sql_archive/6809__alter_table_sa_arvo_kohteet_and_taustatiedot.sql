USE ARVO_SA
IF  EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_kohteet'
  and COLUMN_NAME='taustatiedot.rahoitusryhma' and DATA_TYPE='varchar'
)
BEGIN
	ALTER TABLE [Arvo_SA].[sa].[sa_arvo_kohteet] DROP COLUMN [taustatiedot.rahoitusryhma]
END
GO
IF  EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_kohteet_taustatiedot'
  and COLUMN_NAME='rahoitusryhma' and DATA_TYPE='varchar'
)
BEGIN
	ALTER TABLE [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot] DROP COLUMN [rahoitusryhma]
END
GO
USE ANTERO
