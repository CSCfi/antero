USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_kieli_vst]    Script Date: 20.4.2026 15.34.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER VIEW [dbo].[v_kieli_vst] AS
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
FROM [VipunenTK_lisatiedot].[dbo].[kieli_vst]

GO


