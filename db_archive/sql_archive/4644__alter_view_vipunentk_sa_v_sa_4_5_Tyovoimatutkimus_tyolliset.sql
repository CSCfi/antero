USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_5_Tyovoimatutkimus_tyolliset]    Script Date: 17.6.2021 10:33:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_sa_4_5_Tyovoimatutkimus_tyolliset] AS

SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,amm2001 = coalesce(cast(kaikkivuodet.amm2001 as nvarchar(5)), '-1')
	,amm2010 = coalesce(cast(kaikkivuodet.amm2010 as nvarchar(5)), '-1')
	,[tol2008]
    ,[sp] = coalesce(cast(kaikkivuodet.sp as nvarchar(2)), '-1')
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT [tilv]
      ,[amm2001]
	  ,NULL AS [amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_11]
union all
SELECT [tilv]
      ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_12]
union all
SELECT [tilv]
      ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_13]
union all
SELECT [tilv]
      ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_14]
union all
SELECT [tilv]
	  ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_15]
union all
SELECT [tilv]
	  ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_16]
union all
SELECT [tilv]
	  ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_17]
union all
SELECT [tilv]
	  ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_18]
union all
SELECT [tilv]
	  ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_19]
union all
SELECT [tilv]
	  ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_20]
union all
SELECT [tilv]
	  ,NULL AS [amm2001] 
      ,[amm2010]
	  ,[tol2008]
      ,[sp]
      ,[lkm]
	  ,[tietolahde]='R4_5_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_5_sopv_21]

) as kaikkivuodet

WHERE kaikkivuodet.lkm > 0

GO

