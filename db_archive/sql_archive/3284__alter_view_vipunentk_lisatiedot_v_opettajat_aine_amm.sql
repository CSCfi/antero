USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_opettajat_aine_amm]    Script Date: 12.2.2020 21:12:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_opettajat_aine_amm] AS
SELECT 

	[id]
	,[luotu]
	,[aine_koodi]
	,[aine]
	,[aine_SV]
	,[aine_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]
	,[alkaa]
	,[paattyy]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_aine_amm]
--WHERE virhetilanne = 'E'








GO


USE [ANTERO]