USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_kieli_vst]    Script Date: 20.4.2026 15.36.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER  VIEW [dbo].[v_kieli_vst] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[kieli_koodi]
      ,[kieli]
      ,[kieli_SV]
      ,[kieli_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_DW].[dbo].[d_kieli_vst]

UNION ALL

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[kieli_koodi]
      ,[kieli]
      ,[kieli_SV]
      ,[kieli_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[vst_kieli]
WHERE virhetilanne = 'K'

GO


