USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_kvopiskelija]    Script Date: 17.10.2025 17.31.25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_kvopiskelija] AS
/*
Drop table VipunenTK_DW.dbo.d_rahoituslahde
Select * into VipunenTK_DW.dbo.d_rahoituslahde from VipunenTK_lisatiedot.dbo.[v_rahoituslahde] where virhetilanne<>'K'
Truncate table VipunenTK_DW.dbo.d_rahoituslahde
Insert into VipunenTK_DW.dbo.d_rahoituslahde
Select * from VipunenTK_lisatiedot.dbo.[v_rahoituslahde] where virhetilanne<>'K'
*/

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[kvopiskelija_koodi]
      ,[kvopiskelija]
      ,[kvopiskelija_SV]
      ,[kvopiskelija_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[kvopiskelija]
GO


