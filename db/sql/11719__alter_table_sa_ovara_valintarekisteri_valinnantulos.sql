USE ANTERO

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_valintarekisteri_valinnantulos]') 
  AND name = 'master_oid'
)
BEGIN
	ALTER TABLE [sa].[sa_ovara_ataru_hakemus] ADD master_oid INT

END