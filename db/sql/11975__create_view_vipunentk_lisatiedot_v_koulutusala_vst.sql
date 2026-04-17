USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_koulutusala_vst]    Script Date: 17.4.2026 16.39.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE OR ALTER   VIEW [dbo].[v_koulutusala_vst] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koulutusala_koodi]
      ,[koulutusala_taso1]
      ,[koulutusala_taso1_SV]
      ,[koulutusala_taso1_EN]
      ,[koulutusala_taso2]
      ,[koulutusala_taso2_SV]
      ,[koulutusala_taso2_EN]
      ,[taso1_jarjestys]
      ,[taso2_jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[koulutusala_vst]

GO


