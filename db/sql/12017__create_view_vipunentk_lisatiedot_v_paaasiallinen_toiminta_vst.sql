USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_paaasiallinen_toiminta_vst]    Script Date: 24.4.2026 15.08.51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





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
FROM [VipunenTK_lisatiedot].[dbo].[paaasiallinen_toiminta_vst]

GO


