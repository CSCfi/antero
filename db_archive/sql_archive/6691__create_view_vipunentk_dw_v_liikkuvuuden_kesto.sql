USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_liikkuvuuden_kesto]    Script Date: 25.11.2022 16:10:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_liikkuvuuden_kesto] AS
SELECT
	id,
	luotu,
	liikkuvuuden_kesto_koodi,
	liikkuvuuden_kesto,
	liikkuvuuden_kesto_SV,
	liikkuvuuden_kesto_EN,
	jarjestys,
	virhetilanne,
	tietolahde,
	kommentti
FROM dbo.d_liikkuvuuden_kesto
UNION ALL
SELECT
	id,
	luotu,
	liikkuvuuden_kesto_koodi,
	liikkuvuuden_kesto,
	liikkuvuuden_kesto_SV,
	liikkuvuuden_kesto_EN,
	jarjestys,
	virhetilanne,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot..v_liikkuvuuden_kesto
WHERE virhetilanne='K'

GO

USE [ANTERO]

