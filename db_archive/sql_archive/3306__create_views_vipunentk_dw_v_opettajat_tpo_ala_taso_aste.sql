USE [VipunenTK_DW]
GO

DROP VIEW IF EXISTS [dbo].[v_opettajat_ala_tpo]
GO

DROP VIEW IF EXISTS [dbo].[v_opettajat_koulutusaste_tpo]
GO

DROP VIEW IF EXISTS [dbo].[v_opettajat_opintotaso_tpo]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_opettajat_ala_tpo] AS
SELECT
	id,
	alkaa,
	paattyy,
	ala_koodi,
	ala,
	ala_SV,
	ala_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM dbo.d_opettajat_ala_tpo
UNION ALL
SELECT
	id,
	alkaa,
	paattyy,
	ala_koodi,
	ala,
	ala_SV,
	ala_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM VipunenTK_lisatiedot..v_opettajat_ala_tpo
WHERE virhetilanne='K'

GO

CREATE VIEW [dbo].[v_opettajat_koulutusaste_tpo] AS
SELECT
	id,
	alkaa,
	paattyy,
	koulutusaste_koodi,
	koulutusaste,
	koulutusaste_SV,
	koulutusaste_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM dbo.d_opettajat_koulutusaste_tpo
UNION ALL
SELECT
	id,
	alkaa,
	paattyy,
	koulutusaste_koodi,
	koulutusaste,
	koulutusaste_SV,
	koulutusaste_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM VipunenTK_lisatiedot..v_opettajat_koulutusaste_tpo
WHERE virhetilanne='K'

GO

CREATE VIEW [dbo].[v_opettajat_opintotaso_tpo] AS
SELECT
	id,
	alkaa,
	paattyy,
	opintotaso_koodi,
	opintotaso,
	opintotaso_SV,
	opintotaso_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM dbo.d_opettajat_opintotaso_tpo
UNION ALL
SELECT
	id,
	alkaa,
	paattyy,
	opintotaso_koodi,
	opintotaso,
	opintotaso_SV,
	opintotaso_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM VipunenTK_lisatiedot..v_opettajat_opintotaso_tpo
WHERE virhetilanne='K'

GO

USE [ANTERO]