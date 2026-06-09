USE ANTERO

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_ataru_hakemus]') 
  AND name = 'kiinnostunut_oppisopimuksesta'
)
BEGIN
	ALTER TABLE [sa].[sa_ovara_ataru_hakemus] ADD kiinnostunut_oppisopimuksesta INT

END
GO
