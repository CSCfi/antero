USE ANTERO
IF  EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA='dw' and TABLE_NAME='f_arvo_amis'
  and COLUMN_NAME='d_rahoitusryhma_id' and DATA_TYPE='int'
)
BEGIN
	ALTER TABLE [Antero].[dw].[f_arvo_amis] DROP COLUMN [d_rahoitusryhma_id]
END
GO
IF  EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA='dw' and TABLE_NAME='f_arvo_amis_tep'
  and COLUMN_NAME='d_rahoitusryhma_id' and DATA_TYPE='int'
)
BEGIN
	ALTER TABLE [Antero].[dw].[f_arvo_amis_tep] DROP COLUMN [d_rahoitusryhma_id]
END
GO
