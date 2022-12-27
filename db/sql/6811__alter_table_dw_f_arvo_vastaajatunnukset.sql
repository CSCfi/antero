USE ANTERO
IF  EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA='dw' and TABLE_NAME='f_arvo_luodut_vastaajatunnukset'
  and COLUMN_NAME='rahoitusryhma' and DATA_TYPE='nchar'
)
BEGIN
	ALTER TABLE [Antero].[dw].[f_arvo_luodut_vastaajatunnukset] DROP COLUMN [rahoitusryhma]
END
GO
