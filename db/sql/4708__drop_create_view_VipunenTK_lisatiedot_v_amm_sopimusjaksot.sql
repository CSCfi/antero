USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_amm_sopimusjaksot]    Script Date: 5.8.2021 14:14:31 ******/
DROP VIEW IF EXISTS [dbo].[v_amm_sopimusjaksot]
GO

/****** Object:  View [dbo].[v_amm_sopimusjaksot]    Script Date: 5.8.2021 14:14:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_amm_sopimusjaksot]

AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koodi]
      ,[selite_fi]
      ,[selite_sv]
      ,[selite_en]
      ,[jarjestys_koodi]
      ,[virhetilanne]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[amm_sopimusjaksot]
GO


