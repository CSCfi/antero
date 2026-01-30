USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan]    Script Date: 23.1.2026 10.48.16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--drop table VipunenTK_DW.dbo.sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan
--select * into VipunenTK_DW.dbo.sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan from [v_sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan]

ALTER VIEW [dbo].[v_sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan] AS

SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,sp = cast(coalesce(nullif(kaikkivuodet.sp,''),'-1') as nvarchar(2))
	,aikielir1 = cast(coalesce(nullif(kaikkivuodet.aikielir1,''),'-1') as nvarchar(2))
	,ikar8 = cast(coalesce(nullif(kaikkivuodet.ikar8,''),'-1') as nvarchar(2))
	,kansalr2 = cast(coalesce(nullif(kaikkivuodet.kansalr2,''),'-1') as nvarchar(2))
	,syntyp2 = cast(coalesce(nullif(kaikkivuodet.syntyp2,''),'-1') as nvarchar(2))
	,tilvasmaak = cast(coalesce(nullif(kaikkivuodet.tilvasmaak,''),'-1') as nvarchar(2))
	,suormaak = cast(coalesce(nullif(kaikkivuodet.suormaak,''),'-1') as nvarchar(2))
	,iscfi2013 = cast(coalesce(nullif(kaikkivuodet.iscfi2013,''),'-1') as nvarchar(4))
	,kaste_t2 = cast(coalesce(nullif(kaikkivuodet.kaste_t2,''),'-1') as nvarchar(2))
	,kouljat = cast(coalesce(nullif(kaikkivuodet.kouljat,''),'-1') as nvarchar(2))
	,oppis = cast(coalesce(nullif(kaikkivuodet.oppis,''),'-1') as nvarchar(2))
	,opso = cast(coalesce(nullif(kaikkivuodet.opso,''),'-1') as nvarchar(2))
	,koso = cast(coalesce(nullif(kaikkivuodet.koso,''),'-1') as nvarchar(2))
	,tutklaja_tr = cast(coalesce(nullif(kaikkivuodet.tutklaja_tr,''),'-1') as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)

	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)

FROM (

  SELECT 
    [tilv]
	,[sp]
	,[ikar8]
	,[aikielir1]
    ,[tilvasmaak]
    ,[syntyp2]
    ,[kansalr2]
    ,[iscfi2013]
    ,[kaste_t2]
    ,[suormaak]
    ,[kouljat]
    ,[oppis]
	,[opso]
	,[koso]
    ,[tutklaja_tr]
    ,[lkm]
    ,[tietolahde]='K4_2d_sopv_22'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_2d_sopv_22]

  UNION ALL

  SELECT 
    [tilv]
	,[sp]
	,[ikar8]
	,[aikielir1]
    ,[tilvasmaak]
    ,[syntyp2]
    ,[kansalr2]
    ,[iscfi2013]
    ,[kaste_t2]
    ,[suormaak]
    ,[kouljat]
    ,[oppis]
	,[opso]
	,[koso]
    ,[tutklaja_tr]
    ,[lkm]
    ,[tietolahde]='K4_2d_sopv_23'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_2d_sopv_23]

  UNION ALL

  SELECT 
    [tilv]
	,[sp]
	,[ikar8]
	,[aikielir1]
    ,[tilvasmaak]
    ,[syntyp2]
    ,[kansalr2]
    ,[iscfi2013]
    ,[kaste_t2]
    ,[suormaak]
    ,[kouljat]
    ,[oppis]
	,[opso]
	,[koso]
    ,[tutklaja_tr]
    ,[lkm]
    ,[tietolahde]='K4_2d_sopv_24'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_2d_sopv_24]

  UNION ALL

  SELECT 
    [tilv]
	,[sp]
	,[ikar8]
	,[aikielir1]
    ,[tilvasmaak]
    ,[syntyp2]
    ,[kansalr2]
    ,[iscfi2013]
    ,[kaste_t2]
    ,[suormaak]
    ,[kouljat]
    ,[oppis]
	,[opso]
	,[koso]
    ,[tutklaja_tr]
    ,[lkm]
    ,[tietolahde]='K4_2d_sopv_25'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_2d_sopv_25]


) as kaikkivuodet

GO


