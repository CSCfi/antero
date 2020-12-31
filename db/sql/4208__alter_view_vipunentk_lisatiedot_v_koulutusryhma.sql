USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_koulutusryhma]    Script Date: 31.12.2020 14:25:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_koulutusryhma] AS
SELECT 

	[id]
	,[luotu]
	,[koulutusryhma_koodi]
	,[koulutusryhma]
	,[koulutusryhma_SV]
	,[koulutusryhma_EN]
	,[koulutusryhma2]
	,[koulutusryhma2_SV]
	,[koulutusryhma2_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]
	,[jarjestys2]


FROM [VipunenTK_lisatiedot].[dbo].[koulutusryhma]
WHERE virhetilanne = 'E'


GO


USE [ANTERO]