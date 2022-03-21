USE [VipunenTK_DW]
GO

DROP VIEW IF EXISTS [dbo].[v_opettajat_kelpoisuus_amm]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_opettajat_kelpoisuus_amm] AS
SELECT
	id,
	alkaa,
	paattyy,
	kelpoisuus_koodi,
	kelpoisuus,
	kelpoisuus_SV,
	kelpoisuus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM dbo.d_opettajat_kelpoisuus_amm
UNION ALL
SELECT
	id,
	alkaa,
	paattyy,
	kelpoisuus_koodi,
	kelpoisuus,
	kelpoisuus_SV,
	kelpoisuus_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM VipunenTK_lisatiedot..v_opettajat_kelpoisuus_amm
WHERE virhetilanne='K'








GO



USE [ANTERO]