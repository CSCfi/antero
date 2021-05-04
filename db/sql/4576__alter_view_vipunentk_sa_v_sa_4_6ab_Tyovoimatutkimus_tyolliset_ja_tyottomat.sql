USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]    Script Date: 3.5.2021 19:06:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat] AS

SELECT
	[tilv] = cast(kaikkivuodet.tilv as nvarchar(4))
    ,[tyovoima]
    ,[sp] = coalesce(cast(kaikkivuodet.sp as nvarchar(2)), '-1')
    ,CASE
		WHEN [ikar3] = 'V03' THEN '5v15'
		WHEN [ikar3] = 'V04' THEN '5v20'
		WHEN [ikar3] = 'V05' THEN '5v25'
		WHEN [ikar3] = 'V06' THEN '5v30'
		WHEN [ikar3] = 'V07' THEN '5v35'
		WHEN [ikar3] = 'V08' THEN '5v40'
		WHEN [ikar3] = 'V09' THEN '5v45'
		WHEN [ikar3] = 'V10' THEN '5v50'
		WHEN [ikar3] = 'V11' THEN '5v55'
		WHEN [ikar3] = 'V12' THEN '5v60'
		WHEN [ikar3] = 'V13' THEN '5v65'
		WHEN [ikar3] = 'V14' THEN '5v70'
	  END AS [ikar3]
    ,[opmast] = coalesce(cast(kaikkivuodet.opmast as nvarchar(5)), '-1')
    ,[opmopa] = coalesce(cast(kaikkivuodet.opmopa as nvarchar(5)), '-1')
	,[kaste_t2] = coalesce(cast(kaikkivuodet.kaste_t2 as nvarchar(5)), '-1')
    ,[iscfinarrow2013] = coalesce(cast(kaikkivuodet.iscfinarrow2013 as nvarchar(5)), '-1')
    ,[amm2010] = coalesce(cast(kaikkivuodet.amm2010 as nvarchar(5)), '-1')
	,[amm2001] = coalesce(cast(kaikkivuodet.amm2001 as nvarchar(5)), '-1')
    ,[lkm]
	,[tietolahde]
    ,[rivinumero]
FROM (

SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
      ,[opmast]
      ,[opmopa]
	  ,[kaste_t2] = NULL
      ,[iscfinarrow2013] = NULL
      ,[amm2010] = NULL
	  ,[amm2010] AS 'amm2001'
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_11]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_12_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_12_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_13_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_13_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_14_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_14_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_15_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_15_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_16_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_16_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_17_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_17_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_18]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_19]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_20]
--R4_6_sopv21 alkaen lopussa
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
      ,[opmast]
      ,[opmopa]
	  ,[kaste_t2] = NULL
      ,[iscfinarrow2013] = NULL
      ,[amm2010] = NULL
	  ,[amm2010] AS 'amm2001'
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_11]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
	  ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_12_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_12_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_13_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_13_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_14_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_14_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_15_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_15_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_16_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_16_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_17_H'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_17_H]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_18]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_19]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_20]

union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6a_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6a_sopv_21]
union all
SELECT [tilv]
      ,[tyovoima]
      ,[sp]
      ,[ikar3]
	  ,[opmast] = NULL
      ,[opmopa] = NULL
      ,[kaste_t2]
      ,[iscfinarrow2013]
      ,[amm2010]
	  ,[amm2001] = NULL
      ,[lkm]
	  ,[tietolahde]='R4_6b_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_6b_sopv_21]

) as kaikkivuodet

WHERE kaikkivuodet.lkm > 0

GO


