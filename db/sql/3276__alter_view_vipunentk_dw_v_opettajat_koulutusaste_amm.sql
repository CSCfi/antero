USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_opettajat_koulutusaste_amm]    Script Date: 11.2.2020 20:21:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_opettajat_koulutusaste_amm] AS
SELECT
	id,
	luotu,
	koulutusaste_koodi,
	koulutusaste,
	koulutusaste_SV,
	koulutusaste_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti,
	alkaa,
	paattyy
FROM dbo.d_opettajat_koulutusaste_amm
UNION ALL
SELECT
	id,
	luotu,
	koulutusaste_koodi,
	koulutusaste,
	koulutusaste_SV,
	koulutusaste_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti,
	alkaa,
	paattyy
FROM VipunenTK_lisatiedot..v_opettajat_koulutusaste_amm
WHERE virhetilanne='K'





GO


USE [ANTERO]