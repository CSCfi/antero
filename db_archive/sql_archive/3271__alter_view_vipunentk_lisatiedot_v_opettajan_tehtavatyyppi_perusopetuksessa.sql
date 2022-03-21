USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa]    Script Date: 14.2.2020 18:15:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa] AS
SELECT 

	[id]
	,[luotu]
	,[tehtavatyyppi_koodi]
	,[tehtavatyyppi]
	,[tehtavatyyppi_SV]
	,[tehtavatyyppi_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajan_tehtavatyyppi_perusopetuksessa]
--WHERE virhetilanne = 'E'



GO


USE [ANTERO]