USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_tarkastelujakso]    Script Date: 15.4.2018 17:50:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_tarkastelujakso] AS

-- delete from VipunenTK.dbo.d_tarkastelujakso
-- Insert into VipunenTK.dbo.d_tarkastelujakso Select * from VipunenTK_DW.dbo.v_tarkastelujakso
-- Select * into VipunenTK.dbo.d_tarkastelujakso from VipunenTK_DW.dbo.v_tarkastelujakso
--
-- Select * from VipunenTK_DW.dbo.v_tarkastelujakso

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tarkastelujakso_koodi]
      ,[tarkastelujakso]
      ,[tarkastelujakso_SV]
      ,[tarkastelujakso_EN]
	  ,[tarkastelujakso2]
      ,[tarkastelujakso2_SV]
      ,[tarkastelujakso2_EN]
      ,[jaksovuosi] 
      ,[jaksokausi]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
      ,[sijoittuminen 0_5 - 5_0 vuotta]
      ,[sijoittuminen 1_0 - 5_5 vuotta]
  FROM [VipunenTK_DW].[dbo].[d_tarkastelujakso]

UNION ALL

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[tarkastelujakso_koodi]
      ,[tarkastelujakso]
      ,[tarkastelujakso_SV]
      ,[tarkastelujakso_EN]
	  ,[tarkastelujakso2]
      ,[tarkastelujakso2_SV]
      ,[tarkastelujakso2_EN]
      ,[jaksovuosi] 
      ,[jaksokausi]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
      ,[sijoittuminen 0_5 - 5_0 vuotta]
      ,[sijoittuminen 1_0 - 5_5 vuotta]
  FROM [VipunenTK_lisatiedot].[dbo].[v_tarkastelujakso]
  WHERE virhetilanne = 'K'

GO

USE [ANTERO]