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

IF NOT EXISTS (
	SELECT 1
	FROM [dw].[d_opintojen_kulku_keskiarvot]
	WHERE tyyppi = 'keskiarvo'
	AND nullif([selite2_fi], '') is not null
)
BEGIN
	UPDATE [dw].[d_opintojen_kulku_keskiarvot]
	SET [selite2_fi] = concat(replace(left(selite_fi, 3), ',5', ',0'), ' - ', cast(left(selite_fi, 1) as int) + 1, case when left(selite_fi, 1) = '9' then '' else ',0' end)
		,[jarj_keskiarvo2] = 10 - left(selite_fi, 1)
	WHERE tyyppi = 'keskiarvo'
END
