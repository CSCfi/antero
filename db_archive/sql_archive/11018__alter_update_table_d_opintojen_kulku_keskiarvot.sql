USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dw].[d_opintojen_kulku_keskiarvot]') 
  AND name = 'opv_kerroin'
)
BEGIN
	ALTER TABLE [dw].[d_opintojen_kulku_keskiarvot]
	ADD [opv_kerroin] decimal(3,2)
END
GO

UPDATE [dw].[d_opintojen_kulku_keskiarvot]
SET opv_kerroin = 
	case selite2_fi	
		when '4,0 - 5,0' then 3.03
		when '5,0 - 6,0' then 3.03
		when '6,0 - 7,0' then 1.26
		when '7,0 - 8,0' then 0.71
		when '8,0 - 9,0' then 0.56
		when '9,0 - 10' then 0.52
		when 'Tieto puuttuu' then 2.00
	end
WHERE opv_kerroin is null AND tyyppi = 'keskiarvo'

GO
