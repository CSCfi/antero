USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 4.1.2019 16:55:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER VIEW [dbo].[v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] AS
SELECT
	tilv= cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
    ,aineisto = cast(kaikkivuodet.aineisto as nvarchar(2))
    ,sp= cast(kaikkivuodet.sp as nvarchar(1))
    ,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
    ,syntv= cast(kaikkivuodet.syntv as nvarchar(4))
    ,tilvasmaak= cast(kaikkivuodet.tilvasmaak as nvarchar(3))
    ,kansalr1= cast(kaikkivuodet.kansalr1 as nvarchar(1))
    ,pohjmaa = cast(kaikkivuodet.pohjmaa as nvarchar(1))
    ,eumaa= cast(kaikkivuodet.eumaa as nvarchar(1))
    ,etamaa = cast(kaikkivuodet.etamaa as nvarchar(1))
    ,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
    ,suormaak = cast(kaikkivuodet.suormaak as nvarchar(2))
    ,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
    ,kouljat = cast(kaikkivuodet.kouljat as nvarchar(1))
    ,oppis = cast(kaikkivuodet.oppis as nvarchar(1))
    ,tutklaja_tr = cast(kaikkivuodet.tutklaja_tr as nvarchar(1))
    ,[ptoim1r6]= cast(kaikkivuodet.ptoim1r6 as nvarchar(2))
    ,[amm2001]= cast(kaikkivuodet.amm2001 as nvarchar(2))
    ,[amm2010]= cast(kaikkivuodet.amm2010 as nvarchar(2))
    ,[tsekt]= cast(kaikkivuodet.tsekt as nvarchar(2))
    ,[lkm]= cast(kaikkivuodet.lkm as int)
    ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
    ,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] 
      ,[amm2010]= NULL
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]='4_2a_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_11]
union all
SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001]= NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]='4_2a_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_12]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]='4_2a_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_13]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]='4_2a_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_14]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]='4_2a_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_15]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]='4_2a_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_16]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]='4_2a_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_17]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]='4_2a_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_18]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]=NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2b_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_11]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2b_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_12]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2b_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_13]
   union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2b_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_14]
   union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2b_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_15]
   union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2b_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_16]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2b_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_17]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2b_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_18]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2c_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_12]
  union all
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2c_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_13]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2c_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_14]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2c_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_15]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2c_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_16]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2c_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_17]
    union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = 'BBBB' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = 'BBBB' THEN ''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]='4_2c_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_18]


  ) as kaikkivuodet

  


GO


USE [ANTERO]