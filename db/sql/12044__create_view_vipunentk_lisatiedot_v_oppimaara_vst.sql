USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_oppimaara_vst]    Script Date: 29.4.2026 10.23.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER VIEW [dbo].[v_oppimaara_vst] AS

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
FROM [VipunenTK_lisatiedot].[dbo].[oppimaara_vst]

GO


