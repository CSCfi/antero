USE ANTERO
GO

IF NOT (
	EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE object_id = OBJECT_ID(N'[dw].[d_opintojen_kulku_keskiarvot]') 
		AND name = 'selite2_fi'
	)
	OR EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE object_id = OBJECT_ID(N'[dw].[d_opintojen_kulku_keskiarvot]') 
		AND name = 'selite2_sv'
	)
	OR EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE object_id = OBJECT_ID(N'[dw].[d_opintojen_kulku_keskiarvot]') 
		AND name = 'selite2_en'
	)
	OR EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE object_id = OBJECT_ID(N'[dw].[d_opintojen_kulku_keskiarvot]') 
		AND name = 'jarj_keskiarvo2'
	)
)
BEGIN
	ALTER TABLE [dw].[d_opintojen_kulku_keskiarvot]
	ADD [selite2_fi] varchar(20)
		,[selite2_se] varchar(20)
		,[selite2_en] varchar(20)
		,[jarj_keskiarvo2] int
END
