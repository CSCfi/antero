USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_kvopiskelija]    Script Date: 17.10.2025 17.32.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_kvopiskelija] AS
/*
Drop table VipunenTK.dbo.d_kvopiskelija
Select * into VipunenTK.dbo.d_kvopiskelija from VipunenTK_DW.dbo.v_kvopiskelija
Truncate table  VipunenTK.dbo.d_kvopiskelija
Insert into VipunenTK.dbo.d_kvopiskelija
Select * from VipunenTK_DW.dbo.v_kvopiskelija
*/

SELECT [id]
      --,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[kvopiskelija_koodi]
      ,[kvopiskelija]
      ,[kvopiskelija_SV]
      ,[kvopiskelija_EN]
      ,[jarjestys]
      --,[virhetilanne]
      ,[tietolahde]
      --,[kommentti]
  FROM [VipunenTK_DW].[dbo].[d_kvopiskelija]
  
UNION ALL

SELECT [id]
      --,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[kvopiskelija_koodi]
      ,[kvopiskelija]
      ,[kvopiskelija_SV]
      ,[kvopiskelija_EN]
      ,[jarjestys]
      --,[virhetilanne]
      ,[tietolahde]
      --,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[v_kvopiskelija]
  WHERE virhetilanne = 'K'

GO


