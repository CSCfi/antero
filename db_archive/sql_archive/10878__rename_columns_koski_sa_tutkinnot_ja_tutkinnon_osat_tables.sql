USE [Koski_SA]
GO

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'dbo.tutkinnot_ja_tutkinnonosat_valitaulu.oppija_oid', 'master_oid', 'COLUMN'

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]') 
  AND name = 'master_oid'
)
EXEC sp_rename 'sa.temp_tutkinnot_ja_tutkinnonosat_aikajaksot.oppija_oid', 'master_oid', 'COLUMN'

