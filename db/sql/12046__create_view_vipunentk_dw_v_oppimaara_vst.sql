USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_oppimaara_vst]    Script Date: 29.4.2026 10.25.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER  VIEW [dbo].[v_oppimaara_vst] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[oppimaara_koodi]
      ,[oppimaara]
      ,[oppimaara_SV]
      ,[oppimaara_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_DW].[dbo].[d_oppimaara_vst]

UNION ALL

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[oppimaara_koodi]
      ,[oppimaara]
      ,[oppimaara_SV]
      ,[oppimaara_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[v_oppimaara_vst]
WHERE virhetilanne = 'K'

GO


