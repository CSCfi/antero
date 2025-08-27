USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_tuva_rahoitusjarjestelma]    Script Date: 18.9.2024 10:49:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER  VIEW [dbo].[v_tuva_rahoitusjarjestelma]
AS
SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[rahoitusjarjestelma_koodi]
      ,[rahoitusjarjestelma]
      ,[rahoitusjarjestelma_SV]
      ,[rahoitusjarjestelma_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[tuva_rahoitusjarjestelma]


GO


