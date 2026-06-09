use [VipunenTK_SA]
go

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'dbo.esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara.oppija_oid', 'master_oid', 'COLUMN'
