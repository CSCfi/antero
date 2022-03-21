USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_3_1a_Oppisopimuskoulutus]    Script Date: 3.9.2019 16:43:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_sa_3_1a_Oppisopimuskoulutus] AS

SELECT tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,oppisryh = cast(kaikkivuodet.oppisryh as nvarchar(8))
	,sp =  cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,ikar2 = cast(kaikkivuodet.ikar2 as nvarchar(2))
	,opmala = cast(kaikkivuodet.opmala as nvarchar(1))
	,opmast = cast(kaikkivuodet.opmast as nvarchar(2))
	,iscfibroad2013=cast(kaikkivuodet.iscfibroad2013 as nvarchar(2))
    ,kaste_t2=cast(kaikkivuodet.kaste_t2 as nvarchar(2))
	,tutklaja = cast(kaikkivuodet.tutklaja as nvarchar(1))
	,kmaak = cast(kaikkivuodet.kmaak as nvarchar(2))
	,ptoim1r3 = cast(kaikkivuodet.ptoim1r3 as nvarchar(2))
	,amas = cast(kaikkivuodet.amas as nvarchar(1))
	,tyansek= cast(kaikkivuodet.tyansek as nvarchar(1))
	,tol2002 = cast(kaikkivuodet.tol2002 as nvarchar(1))
	,tol2008 = cast(kaikkivuodet.tol2008 as nvarchar(1))
	,koko = cast(kaikkivuodet.koko as nvarchar(1))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)

  FROM (
	SELECT
	[tilv]
      ,[tutkryh] as oppisryh
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] = NULL
      ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002] = '-1'
	  ,[tol2008] = '-1'
      ,[koko]
      ,[lkm]

	,[tietolahde]='3_1a_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_11]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] = NULL
      ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002] = '-1'
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]='3_1a_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_12]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= '-1'
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]='3_1a_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_13_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= '-1'
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]='3_1a_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_14_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= '-1'
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]='3_1a_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_15_H]


union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= '-1'
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]='3_1a_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_16_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast] 
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= '-1'
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]='3_1a_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_17_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= '-1'
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]='3_1a_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_18]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= '-1'
	  ,[tol2008]
      ,[koko]
      ,[lkm] 
	  ,[tietolahde]='3_1a_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_19]

) as kaikkivuodet









GO


USE [ANTERO]