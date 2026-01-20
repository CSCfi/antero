USE [Koski_SA]
GO

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]') 
  AND name = 'duplikaatti_suorituskausittain'
)
EXEC sp_rename 'dbo.tutkinnot_ja_tutkinnonosat_valitaulu.duplikaatti_rahoituskausittain', 'duplikaatti_suorituskausittain', 'COLUMN'
