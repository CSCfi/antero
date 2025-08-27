USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_rahoituslahde]    Script Date: 19.12.2024 13.40.37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[v_rahoituslahde_versio2] AS

SELECT [id]
      --,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[rahoituslahde_koodi]
      ,[rahoituslahde]
      ,[rahoituslahde_SV]
      ,[rahoituslahde_EN]
      ,[jarjestys]
      --,[virhetilanne]
      ,[tietolahde]
      --,[kommentti]
  FROM [VipunenTK_DW].[dbo].[d_rahoituslahde_versio2]
  
UNION ALL

SELECT [id]
      --,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[rahoituslahde_koodi]
      ,[rahoituslahde]
      ,[rahoituslahde_SV]
      ,[rahoituslahde_EN]
      ,[jarjestys]
      --,[virhetilanne]
      ,[tietolahde]
      --,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[v_rahoituslahde_versio2]
  WHERE virhetilanne = 'K'

GO


