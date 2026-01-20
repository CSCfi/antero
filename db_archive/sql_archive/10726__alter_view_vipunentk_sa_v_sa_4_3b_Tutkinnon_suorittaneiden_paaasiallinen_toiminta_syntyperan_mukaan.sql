USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]    Script Date: 27.3.2025 17.00.42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










--drop table VipunenTK_DW.dbo.sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan
--select * into VipunenTK_DW.dbo.sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan from [v_sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]

ALTER VIEW [dbo].[v_sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan] AS

SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
	,sp = cast(coalesce(nullif(kaikkivuodet.sp,''),'-1') as nvarchar(2))
	,kansalr1 = cast(coalesce(nullif(kaikkivuodet.kansalr1,''),'-1') as nvarchar(2))
	,syntyp2 = cast(coalesce(nullif(kaikkivuodet.syntyp2,''),'-1') as nvarchar(2))
	,tilvasmaak = cast(coalesce(nullif(kaikkivuodet.tilvasmaak,''),'-1') as nvarchar(2))
	,tutkmaak = cast(coalesce(nullif(kaikkivuodet.tutkmaak,''),'-1') as nvarchar(2))
	,rahlahde_v2 = cast(coalesce(nullif(kaikkivuodet.rahlahde_v2,''),'-1') as nvarchar(2)) 
	,kvopisk = cast(coalesce(nullif(kaikkivuodet.kvopisk,''),'-1') as nvarchar(2))
	,iscfi2013 = cast(coalesce(nullif(kaikkivuodet.iscfi2013,''),'-1') as nvarchar(4))
	,kaste_t2 = cast(coalesce(nullif(kaikkivuodet.kaste_t2,''),'-1') as nvarchar(2))
	,kouljat = cast(coalesce(nullif(kaikkivuodet.kouljat,''),'-1') as nvarchar(2))
	,oppis = cast(coalesce(nullif(kaikkivuodet.oppis,''),'-1') as nvarchar(2))
	,tutklaja_tr = cast(coalesce(nullif(kaikkivuodet.tutklaja_tr,''),'-1') as nvarchar(2))
	,ptoim1r6 = cast(coalesce(nullif(kaikkivuodet.ptoim1r6,''),'-1') as nvarchar(2))
	,maassaolo = cast(coalesce(nullif(kaikkivuodet.maassaolo,''),'-1') as nvarchar(2))
	,amas = cast(coalesce(nullif(kaikkivuodet.amas,''),'-1') as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)

	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)

FROM (

  SELECT 
    [tilv]
	,[suorv]
	,[sp]
    ,[tilvasmaak]
    ,[syntyp2]
    ,[kansalr1]
    ,[iscfi2013]
    ,[kaste_t2]
    ,[tutkmaak]
	,[rahlahde_v2] = '-1'
	,[kvopisk] = '-1'
    ,[kouljat]
    ,[oppis]
    ,[tutklaja_tr]
    ,[ptoim1r6]
    ,[maassaolo]
    ,[amas]
    ,[lkm]
    ,[tietolahde]='K4_3b_sopv_22'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3b_sopv_22]

  UNION ALL

  SELECT 
    [tilv]
	,[suorv]
	,[sp]
    ,[tilvasmaak]
    ,[syntyp2]
    ,[kansalr1]
    ,[iscfi2013]
    ,[kaste_t2]
    ,[tutkmaak]
	,[rahlahde_v2] = '-1'
	,[kvopisk] = '-1'
    ,[kouljat] = case when kaste_t2 = '31' and kouljat = '9' /*havaintoja IB, EB, RP tilv21*/ then '1' else kouljat end
    ,[oppis]
    ,[tutklaja_tr]
    ,[ptoim1r6]
    ,[maassaolo]
    ,[amas]
    ,[lkm]
    ,[tietolahde]='K4_3b_sopv_23'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3b_sopv_23]

  UNION ALL

  SELECT 
    [tilv]
	,[suorv]
	,[sp]
    ,[tilvasmaak]
    ,[syntyp2]
    ,[kansalr1]
    ,[iscfi2013]
    ,[kaste_t2]
    ,[tutkmaak]
	,[rahlahde_v2]
	,[kvopisk]
    ,[kouljat] = case when kaste_t2 = '31' and kouljat = '9' /*havaintoja IB, EB, RP tilv21*/ then '1' else kouljat end
    ,[oppis]
    ,[tutklaja_tr]
    ,[ptoim1r6]
    ,[maassaolo]
    ,[amas]
    ,[lkm]
    ,[tietolahde]='K4_3b_sopv_24'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3b_sopv_24]

  UNION ALL

  SELECT 
    [tilv]
	,[suorv]
	,[sp]
    ,[tilvasmaak]
    ,[syntyp2]
    ,[kansalr1]
    ,[iscfi2013]
    ,[kaste_t2]
    ,[tutkmaak]
	,[rahlahde_v2]
	,[kvopisk]
    ,[kouljat] = case when kaste_t2 = '31' and kouljat = '9' /*havaintoja IB, EB, RP tilv21*/ then '1' else kouljat end
    ,[oppis]
    ,[tutklaja_tr]
    ,[ptoim1r6]
    ,[maassaolo]
    ,[amas]
    ,[lkm]
    ,[tietolahde]='K4_3b_sopv_25'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3b_sopv_25]

) as kaikkivuodet


GO


