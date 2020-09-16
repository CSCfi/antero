USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_opettajat_aine_amm]    Script Date: 12.2.2020 21:17:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_opettajat_aine_amm] AS
SELECT
	id,
	luotu,
	aine_koodi,
	aine,
	aine_SV,
	aine_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti,
	alkaa,
	paattyy
FROM dbo.d_opettajat_aine_amm
UNION ALL
SELECT
	id,
	luotu,
	aine_koodi,
	aine,
	aine_SV,
	aine_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti,
	alkaa,
	paattyy
FROM VipunenTK_lisatiedot..v_opettajat_aine_amm
WHERE virhetilanne='K'







GO


USE [ANTERO]