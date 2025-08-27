USE ANTERO
GO

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