USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_koulutuslaji3]    Script Date: 7.1.2021 22:02:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_koulutuslaji3] AS 

/*
truncate table VipunenTK.dbo.d_koulutuslaji3
insert into VipunenTK.dbo.d_koulutuslaji3
select * from [VipunenTK_DW].dbo.[v_koulutuslaji3]

drop table VipunenTK.dbo.d_koulutuslaji3
select * into VipunenTK.dbo.d_koulutuslaji3 from [VipunenTK_DW].dbo.[v_koulutuslaji3]
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
      --,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_DW].[dbo].[d_koulutuslaji3]

UNION ALL 

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
      --,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutuslaji3]

WHERE virhetilanne = 'K'




GO


use antero