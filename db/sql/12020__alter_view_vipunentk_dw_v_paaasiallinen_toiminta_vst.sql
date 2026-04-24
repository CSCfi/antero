USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_paaasiallinen_toiminta_vst]    Script Date: 24.4.2026 16.05.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER VIEW [dbo].[v_paaasiallinen_toiminta_vst] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[paaasiallinen_toiminta_koodi]
      ,[paaasiallinen_toiminta]
      ,[paaasiallinen_toiminta_SV]
      ,[paaasiallinen_toiminta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_DW].[dbo].[d_paaasiallinen_toiminta_vst]

UNION ALL

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[paaasiallinen_toiminta_koodi]
      ,[paaasiallinen_toiminta]
      ,[paaasiallinen_toiminta_SV]
      ,[paaasiallinen_toiminta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[v_paaasiallinen_toiminta_vst]
WHERE virhetilanne = 'K'

GO


