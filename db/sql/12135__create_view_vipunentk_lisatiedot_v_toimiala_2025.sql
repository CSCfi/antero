USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_toimiala_2025]    Script Date: 12.8.2026 16.55.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE OR ALTER VIEW [dbo].[v_toimiala_2025]
AS
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
FROM [VipunenTK_lisatiedot].[dbo].[toimiala_2025]

GO


