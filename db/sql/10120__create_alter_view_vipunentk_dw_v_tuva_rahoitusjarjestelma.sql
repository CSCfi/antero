USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_tuva_rahoitusjarjestelma]    Script Date: 18.9.2024 10:51:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_tuva_rahoitusjarjestelma] AS

SELECT [id]
      ,[alkaa]
      ,[paattyy]
      ,[rahoitusjarjestelma_koodi]
      ,[rahoitusjarjestelma]
      ,[rahoitusjarjestelma_SV]
      ,[rahoitusjarjestelma_EN]
      ,[jarjestys]
      ,[tietolahde]
  FROM [VipunenTK_lisatiedot].[dbo].[tuva_rahoitusjarjestelma]


GO


