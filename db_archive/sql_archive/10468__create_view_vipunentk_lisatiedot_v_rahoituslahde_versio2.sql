USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_rahoituslahde]    Script Date: 19.12.2024 13.42.18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[v_rahoituslahde_versio2] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[rahoituslahde_koodi]
      ,[rahoituslahde]
      ,[rahoituslahde_SV]
      ,[rahoituslahde_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[rahoituslahde_versio2]
GO


