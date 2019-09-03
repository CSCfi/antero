USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_3_2_Oppisopimuskoulutus_jatko_opinnot]    Script Date: 3.9.2019 17:23:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











/****** Script for SelectTopNRows command from SSMS  ******/
ALTER VIEW [dbo].[v_sa_3_2_Oppisopimuskoulutus_jatko_opinnot] AS

SELECT tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,oppisryh = cast(kaikkivuodet.oppisryh as nvarchar(8))
	,sp =  cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,ikar2 = cast(kaikkivuodet.ikar2 as nvarchar(2))
	,opmala = cast(kaikkivuodet.opmala as nvarchar(1))
	,iscfibroad2013=cast(kaikkivuodet.iscfibroad2013 as nvarchar(2))
	,tutklaja = cast(kaikkivuodet.tutklaja as nvarchar(1))
	,kmaak = cast(kaikkivuodet.kmaak as nvarchar(2))
	,jopmast = cast(kaikkivuodet.jopmast as nvarchar(2))
	,jkaste_t2=cast(kaikkivuodet.jkaste_t2 as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
	,opmast = cast(kaikkivuodet.opmast as nvarchar(2))
	,jopmala = cast(kaikkivuodet.jopmala as nvarchar(1))
	,kaste_t2=cast(kaikkivuodet.kaste_t2 as nvarchar(2))
	,jiscfibroad2013=cast(kaikkivuodet.jiscfibroad as nvarchar(2))

  FROM (
	SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013] = NULL
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2] = NULL
      ,[lkm]
	  ,[tietolahde]='3_2_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2] = NULL
      ,[jiscfibroad] = NULL
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_11]

union all

	SELECT
	   [tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013] = NULL
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2] = NULL
      ,[lkm]
	  ,[tietolahde]='3_2_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2] = NULL
      ,[jiscfibroad] = NULL
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_12]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	   ,[tietolahde]='3_2_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_13_H]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]='3_2_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_14_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
	  ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]='3_2_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_15_H]
union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]='3_2_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_16_H]
union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]='3_2_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_17_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast] = NULL
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]='3_2_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] = NULL
	  ,[jopmala] = NULL
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_18]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast] = NULL
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]='3_2_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] = NULL
	  ,[jopmala] = NULL
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_19]


) as kaikkivuodet



GO


USE [ANTERO]