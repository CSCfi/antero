USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_opettajat_koulutusaste_amm]    Script Date: 11.2.2020 20:16:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_opettajat_koulutusaste_amm] AS
SELECT 

	[id]
	,[luotu]
	,[koulutusaste_koodi]
	,[koulutusaste]
	,[koulutusaste_SV]
	,[koulutusaste_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]
	,[alkaa]
	,[paattyy]

FROM [VipunenTK_lisatiedot].[dbo].[opettajat_koulutusaste_amm]
--WHERE virhetilanne = 'E'






GO


USE [ANTERO]