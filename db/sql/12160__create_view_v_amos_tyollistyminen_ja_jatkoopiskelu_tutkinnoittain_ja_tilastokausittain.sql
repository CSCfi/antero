USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu_tutkinnoittain_ja_tilastokausittain] AS

SELECT *
FROM [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu_tutkinnoittain] v
CROSS APPLY (
	select maxVarainhoitovuosi = max([Varainhoitovuosi]) 
	from [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu_tutkinnoittain] v2
) ca
WHERE 1=1 
AND [Toteuma/Estimaatti] = 'Toteuma'
AND (
	--tilastokausi vain tuoreimmasta aineistosta
	right([Tilastokausi],4) + 1 = right([Rahoituskausi],4) 
	OR [Varainhoitovuosi] = ca.maxVarainhoitovuosi
)

GO
