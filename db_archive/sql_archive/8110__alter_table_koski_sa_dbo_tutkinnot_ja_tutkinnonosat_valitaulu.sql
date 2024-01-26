USE Koski_SA
GO

IF NOT EXISTS (
	SELECT * 
	FROM sys.columns 
	WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]') 
	AND name = 'paallekkainen_tuva'	      
)
BEGIN
  ALTER TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]
  ADD [paallekkainen_tuva] int null
END
