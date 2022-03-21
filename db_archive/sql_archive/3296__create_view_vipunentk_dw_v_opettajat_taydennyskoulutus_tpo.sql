USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_opettajat_taydennyskoulutus_tpo]    Script Date: 25.2.2020 20:32:19 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_taydennyskoulutus_tpo]
GO

/****** Object:  View [dbo].[v_opettajat_taydennyskoulutus_tpo]    Script Date: 25.2.2020 20:32:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_opettajat_taydennyskoulutus_tpo] AS
SELECT
	id,
	alkaa,
	paattyy,
	osaalue_koodi,
	osaalue,
	osaalue_SV,
	osaalue_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM dbo.d_opettajat_taydennyskoulutus_tpo
UNION ALL
SELECT
	id,
	alkaa,
	paattyy,
	osaalue_koodi,
	osaalue,
	osaalue_SV,
	osaalue_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	luotu,
	kommentti
FROM VipunenTK_lisatiedot..v_opettajat_taydennyskoulutus_tpo
WHERE virhetilanne='K'









GO


USE [ANTERO]