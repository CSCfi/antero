USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]    Script Date: 25.2.2020 20:37:13 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]
GO

/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]    Script Date: 25.2.2020 20:37:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





create VIEW [dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa] AS
SELECT 

	[id]
	,[luotu]
	,alkaa
	,paattyy
	,[tehtavatyyppi_koodi]
	,[tehtavatyyppi]
	,[tehtavatyyppi_SV]
	,[tehtavatyyppi_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa]
--WHERE virhetilanne = 'E'





GO


USE [ANTERO]