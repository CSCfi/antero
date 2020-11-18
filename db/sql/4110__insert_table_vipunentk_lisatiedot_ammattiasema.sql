/****** Script for SelectTopNRows command from SSMS  ******/
USE VipunenTK_lisatiedot
GO

DELETE FROM [VipunenTK_lisatiedot].[dbo].[ammattiasema] 
WHERE [ammattiasema_koodi] = '9'

INSERT INTO [VipunenTK_lisatiedot].[dbo].[ammattiasema]
SELECT [id] = 9
      ,[luotu]='2020-10-21'
      ,[alkaa]
      ,[paattyy]
      ,[ammattiasema_koodi] = '9'
      ,[ammattiasema]
      ,[ammattiasema_SV]
      ,[ammattiasema_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti] = 'AL null-ohjaus / CSC Juha'
  FROM [VipunenTK_lisatiedot].[dbo].[ammattiasema]
  WHERE [ammattiasema_koodi] = '-1'
  
GO
USE [ANTERO]