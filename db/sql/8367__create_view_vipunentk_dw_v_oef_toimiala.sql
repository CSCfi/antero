USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_oef_toimiala]    Script Date: 12.12.2023 15:49:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_oef_toimiala]
AS 
SELECT [id]
      --,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[oef_toimiala_koodi]
      ,[oef_toimiala]
      ,[oef_toimiala_SV]
      ,[oef_toimiala_EN]
      ,[jarjestys_oef_toimiala]
      --,[virhetilanne]
      --,[poistettu]
      --,[tietolahde]
      --,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[oef_toimiala]


GO


