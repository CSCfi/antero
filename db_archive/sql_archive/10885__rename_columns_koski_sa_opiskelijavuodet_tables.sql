USE [Koski_SA]
GO

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijavuodet_valitaulu]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'dbo.opiskelijavuodet_valitaulu.oppija_oid', 'master_oid', 'COLUMN'

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat.oppija_oid', 'master_oid', 'COLUMN'

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'sa.temp_opiskelijavuodet_opiskeluoikeus_oidit.oppija_oid', 'master_oid', 'COLUMN'

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet.oppija_oid', 'master_oid', 'COLUMN'

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijavuodet_valitaulu_unpivot]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'dbo.opiskelijavuodet_valitaulu_unpivot.oppija_oid', 'master_oid', 'COLUMN'

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'dbo.opiskelijavuodet_valitaulu_unpivot_luvat.oppija_oid', 'master_oid', 'COLUMN'
