USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_toimiala_2025]    Script Date: 12.8.2026 16.58.33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_toimiala_2025] as

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[toimiala_2025_koodi]
      ,[toimiala_2025]
      ,[toimiala_2025_SV]
      ,[toimiala_2025_EN]
      ,[taso]
      ,[taso1]
      ,[jarjestys]
      ,[jarjestys_taso]
      ,[jarjestys_taso1]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_DW].[dbo].[d_toimiala_2025]

UNION ALL

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[toimiala_2025_koodi]
      ,[toimiala_2025]
      ,[toimiala_2025_SV]
      ,[toimiala_2025_EN]
      ,[taso]
      ,[taso1]
      ,[jarjestys]
      ,[jarjestys_taso]
      ,[jarjestys_taso1]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[v_toimiala_2025]
WHERE virhetilanne = 'K'

GO


