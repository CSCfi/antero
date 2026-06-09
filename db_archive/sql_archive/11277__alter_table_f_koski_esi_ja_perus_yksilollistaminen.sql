use antero
go

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dw].[f_koski_esi_ja_perus_yksilollistaminen]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'dw.f_koski_esi_ja_perus_yksilollistaminen.oppija_oid', 'master_oid', 'COLUMN'
