USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_katsomusaine]    Script Date: 16.1.2026 16.03.26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_katsomusaine] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	katsomusaine_koodi,
	katsomusaine,
	katsomusaine_SV,
	katsomusaine_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.katsomusaine
GO


