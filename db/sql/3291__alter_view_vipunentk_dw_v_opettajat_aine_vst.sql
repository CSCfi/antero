USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_opettajat_aine_vst]    Script Date: 6.2.2020 15:26:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_opettajat_aine_vst] AS
SELECT
	id,
	alkaa,
	paattyy,
	aine_koodi,
	aine,
	aine_SV,
	aine_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM dbo.d_opettajat_aine_vst
UNION ALL
SELECT
	id,
	alkaa,
	paattyy,
	aine_koodi,
	aine,
	aine_SV,
	aine_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM VipunenTK_lisatiedot..v_opettajat_aine_vst
WHERE virhetilanne='K'








GO


USE [ANTERO]