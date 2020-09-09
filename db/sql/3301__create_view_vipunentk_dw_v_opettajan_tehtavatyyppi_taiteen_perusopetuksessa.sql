USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]    Script Date: 25.2.2020 20:40:07 ******/
DROP VIEW [dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]
GO

/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]    Script Date: 25.2.2020 20:40:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tehtavatyyppi_koodi,
	tehtavatyyppi,
	tehtavatyyppi_SV,
	tehtavatyyppi_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,	
	kommentti
FROM dbo.d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa
UNION ALL
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	tehtavatyyppi_koodi,
	tehtavatyyppi,
	tehtavatyyppi_SV,
	tehtavatyyppi_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot..v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa
WHERE virhetilanne='K'









GO


USE [ANTERO]