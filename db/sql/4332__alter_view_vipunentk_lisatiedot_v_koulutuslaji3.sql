USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_koulutuslaji3]    Script Date: 7.1.2021 21:58:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_koulutuslaji3] AS

/*
truncate table [VipunenTK_DW].[dbo].[d_koulutuslaji3]
insert into [VipunenTK_DW].[dbo].[d_koulutuslaji3]
select * from [v_koulutuslaji3] where virhetilanne='E'

drop table [VipunenTK_DW].[dbo].[d_koulutuslaji3]
select * into [VipunenTK_DW].[dbo].[d_koulutuslaji3] from [v_koulutuslaji3] where virhetilanne='E'
*/

SELECT [id]
      ,[luotu]
      ,[koulutuslaji3_koodi]
      ,[koulutuslaji3]
      ,[koulutuslaji3_SV]
      ,[koulutuslaji3_EN]
      ,[jarjestys_koulutuslaji3]
      ,[koulutuslaji4]
      ,[koulutuslaji4_SV]
      ,[koulutuslaji4_EN]
      ,[jarjestys_koulutuslaji4]
      ,[jarjestamistapa]
      ,[jarjestamistapa_SV]
      ,[jarjestamistapa_EN]
      ,[jarjestys_jarjestamistapa]
      ,[jarjestamismuoto]
      ,[jarjestamismuoto_SV]
      ,[jarjestamismuoto_EN]
      ,[jarjestys_jarjestamismuoto]
      ,[tutkintotyyppi]
      ,[tutkintotyyppi_SV]
      ,[tutkintotyyppi_EN]
      ,[jarjestys_tutkintotyyppi]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [dbo].[koulutuslaji3]


GO


use antero