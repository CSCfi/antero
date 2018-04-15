USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_tarkastelujakso]    Script Date: 15.4.2018 17:49:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- Truncate table VipunenTK_DW.dbo.d_tarkastelujakso
-- Insert into VipunenTK_DW.dbo.d_tarkastelujakso select * from [VipunenTK_lisatiedot].[dbo].[v_tarkastelujakso] WHERE [virhetilanne] <> 'K'
--

ALTER VIEW [dbo].[v_tarkastelujakso] AS
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
  FROM [VipunenTK_lisatiedot].[dbo].[tarkastelujakso]



GO


USE [ANTERO]