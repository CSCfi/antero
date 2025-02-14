USE [VipunenTK_SA]
GO

ALTER VIEW [dbo].[v_sa_3_1b_Oppisopimuskoulutus] AS

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
	,kesto = cast(kaikkivuodet.kesto as nvarchar(2))
	,kestotot = cast(kaikkivuodet.kestotot as nvarchar(2))
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
	  ,[iscfibroad2013]=NULL
	  ,[kaste_t2]=NULL
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]='3_1b_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_11]
union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]=NULL
	  ,[kaste_t2]=NULL
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]='3_1b_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_12]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]=NULL
	  ,[kaste_t2]=NULL
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]='3_1b_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_13]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]=NULL
	  ,[kaste_t2]=NULL
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]='3_1b_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_14]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]=NULL
	  ,[kaste_t2]=NULL
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]='3_1b_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_15]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]=NULL
	  ,[kaste_t2]=NULL
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]='3_1b_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_16]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]=NULL
	  ,[kaste_t2]=NULL
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]='3_1b_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_17]

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
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]='3_1b_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_18]



) as kaikkivuodet


GO

USE[ANTERO]


