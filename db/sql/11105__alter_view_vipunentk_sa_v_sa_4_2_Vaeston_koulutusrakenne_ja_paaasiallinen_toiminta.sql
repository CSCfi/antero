USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 11.8.2025 15.45.57 ******/
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
	,kkieli = cast(kaikkivuodet.kkieli as nvarchar(2))
    ,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
    ,kouljat = cast(kaikkivuodet.kouljat as nvarchar(1))
    ,oppis = cast(kaikkivuodet.oppis as nvarchar(1))
    ,tutklaja_tr = cast(kaikkivuodet.tutklaja_tr as nvarchar(1))
    ,[ptoim1r6]= cast(kaikkivuodet.ptoim1r6 as nvarchar(2))
    ,[amm2001]= cast(kaikkivuodet.amm2001 as nvarchar(2))
    ,[amm2010]= cast(kaikkivuodet.amm2010 as nvarchar(2))
    ,[tsekt]= cast(kaikkivuodet.tsekt as nvarchar(2))
	--,opiskkoulk = cast(kaikkivuodet.opiskkoulk as nvarchar(6))
	,ka_opiskkoulk = cast(kaikkivuodet.ka_opiskkoulk as nvarchar(6))
	,ta_opiskkoulk = cast(kaikkivuodet.ta_opiskkoulk as nvarchar(6))
	,tutkjoht = cast(kaikkivuodet.tutkjoht as nvarchar(1))

	,kk_haku_kaste = cast(kaikkivuodet.kk_haku_kaste as nvarchar(2))
	,kk_haku_vuosi = cast(kaikkivuodet.kk_haku_vuosi as nvarchar(4))
	,ta_haku_kaste = cast(kaikkivuodet.ta_haku_kaste as nvarchar(2))
	,ta_haku_vuosi = cast(kaikkivuodet.ta_haku_vuosi as nvarchar(4))

	,ulkom = cast(kaikkivuodet.ulkom as nvarchar(1))
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
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] 
      ,[amm2010]= NULL
      ,[tsekt]
	 -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
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
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001]= NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
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
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
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
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
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
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
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
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
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
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
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
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
	  ,[lkm]
      ,[tietolahde]='4_2a_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_18]
  union all
/*  SELECT [tilv]
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
	  ,[lkm]
      ,[tietolahde]='4_2c_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_12]
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
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
	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[ulkom] = null
	  ,[lkm]
      ,[tietolahde]='4_2c_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_18]

union all
*/
SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
      ,[suormaak]
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
	  ,[lkm]
      ,[tietolahde]='4_2a_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_19]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]= NULL
--      ,[amm2001] = NULL
--      ,[amm2010]= NULL
--      ,[tsekt]= NULL
--      ,[opiskkoulk] = null
--	  ,[tutkjoht] = null
--	  ,[ulkom] = null
--	  ,[lkm]
--      ,[tietolahde]='4_2b_sopv_19'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--  FROM [TK_H9098_CSC].[dbo].[TK_K4_2b_sopv_19]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]
--      ,[amm2001] = NULL
--      ,[amm2010]= NULL
--      ,[tsekt]= NULL
--      ,[opiskkoulk] = null
--	  ,[tutkjoht] = null
--	  ,[ulkom] = null
--	  ,[lkm]
--      ,[tietolahde]='4_2c_sopv_19'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_19]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
      ,[suormaak]
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
	  ,[lkm]
      ,[tietolahde]='4_2a_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_20]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]= NULL
--      ,[amm2001] = NULL
--      ,[amm2010]= NULL
--      ,[tsekt]= NULL
--      ,[opiskkoulk] = null
--	  ,[tutkjoht] = null
--	  ,[ulkom] = null
--	  ,[lkm]
--      ,[tietolahde]='4_2b_sopv_20'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--  FROM [TK_H9098_CSC].[dbo].[TK_K4_2b_sopv_20]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]
--      ,[amm2001] = NULL
--      ,[amm2010]= NULL
--      ,[tsekt]= NULL
--      ,[opiskkoulk] = null
--	  ,[tutkjoht] = null
--	  ,[ulkom] = null
--	  ,[lkm]
--      ,[tietolahde]='4_2c_sopv_20'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_20]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
      ,[suormaak]
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null
	  ,[ka_opiskkoulk] = null
	  ,[ta_opiskkoulk] = null
	  ,[tutkjoht] = null
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom] = null
	  ,[lkm]
      ,[tietolahde]='4_2a_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_21]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]= NULL
--      ,[amm2001] = NULL
--      ,[amm2010]= NULL
--      ,[tsekt]= NULL
--      ,[opiskkoulk] = null
--	  ,[tutkjoht] = null
--	  ,[ulkom] = null
--	  ,[lkm]
--      ,[tietolahde]='4_2b_sopv_21'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--FROM [TK_H9098_CSC].[dbo].[TK_K4_2b_sopv_21]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]
--      ,[amm2001] = NULL
--      ,[amm2010]= NULL
--      ,[tsekt]= NULL
--      ,[opiskkoulk] = null
--	  ,[tutkjoht] = null
--	  ,[ulkom] = null
--	  ,[lkm]
--      ,[tietolahde]='4_2c_sopv_21'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_21]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
      ,[suormaak]
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null  -- null on 2025 kesämuutos
	  ,[ka_opiskkoulk]
	  ,[ta_opiskkoulk]
	  ,[tutkjoht]
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom]
	  ,[lkm]
      ,[tietolahde]='4_2a_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_22]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]= NULL
--      ,[amm2001] = NULL
--      ,[amm2010] = NULL
--      ,[tsekt] = NULL
--      ,[opiskkoulk]
--	  ,[tutkjoht]
--	  ,[ulkom]
--	  ,[lkm]
--      ,[tietolahde]='4_2b_sopv_22'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--FROM [TK_H9098_CSC].[dbo].[TK_K4_2b_sopv_22]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]
--      ,[amm2001] = NULL
--      ,[amm2010] = NULL
--      ,[tsekt] = NULL
--      ,[opiskkoulk]
--	  ,[tutkjoht]
--	  ,[ulkom]
--	  ,[lkm]
--      ,[tietolahde]='4_2c_sopv_22'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_22]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
      ,[suormaak]
	  ,[kkieli] = NULL
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null  -- null on 2025 kesämuutos
	  ,[ka_opiskkoulk]
	  ,[ta_opiskkoulk]
	  ,[tutkjoht]
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom]
	  ,[lkm]
      ,[tietolahde]='4_2a_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_23]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]
--      ,[amm2001] = NULL
--      ,[amm2010] = NULL
--      ,[tsekt] = NULL
--      ,[opiskkoulk]
--	  ,[tutkjoht]
--	  ,[ulkom]
--	  ,[lkm]
--      ,[tietolahde]='4_2c_sopv_23_2021'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_23_2021]

--union all

--SELECT [tilv]
--      ,[aineisto]
--      ,[sp]
--      ,[aikielir1]
--	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
--      ,[tilvasmaak]
--      ,[kansalr1]
--      ,[pohjmaa]
--      ,[eumaa]
--      ,[etamaa]
--	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
--      ,[suormaak]
--      ,[koulk]
--      ,[kouljat]
--      ,[oppis]
--      ,[tutklaja_tr]
--      ,[ptoim1r6]
--      ,[amm2001] = NULL
--      ,[amm2010] = NULL
--      ,[tsekt] = NULL
--      ,[opiskkoulk]
--	  ,[tutkjoht]
--	  ,[ulkom]
--	  ,[lkm]
--      ,[tietolahde]='4_2c_sopv_23_2022'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
--FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_23_2022]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
      ,[suormaak]
	  ,[kkieli]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
     -- ,[opiskkoulk] = null  -- null on 2025 kesämuutos
	  ,[ka_opiskkoulk]
	  ,[ta_opiskkoulk]
	  ,[tutkjoht]
      ,[kk_haku_kaste]
	  ,[kk_haku_vuosi]
	  ,[ta_haku_kaste]
	  ,[ta_haku_vuosi]
	  ,[ulkom]
	  ,[lkm]
      ,[tietolahde]='4_2a_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_24]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  ,(CASE WHEN [syntv] = 'BBBB' THEN '' ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = 'BBBB' THEN '' ELSE [suorv] END) AS suorv
      ,[suormaak]
	  ,[kkieli]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010] = NULL
      ,[tsekt] = NULL
     -- ,[opiskkoulk] = null  -- null on 2025 kesämuutos
	  ,[ka_opiskkoulk]
	  ,[ta_opiskkoulk]
	  ,[tutkjoht]
	  ,[kk_haku_kaste] = NULL
	  ,[kk_haku_vuosi] = NULL
	  ,[ta_haku_kaste] = NULL
	  ,[ta_haku_vuosi] = NULL
	  ,[ulkom]
	  ,[lkm]
      ,[tietolahde]='4_2c_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_24]

--a-aineiston saapuessa kommentoidaan pois saman tilastovuoden c-aineisto (voi olla ed. sopv riippuen sopimuksesta, esim. sopv23 osui kaksi c-aineistoa)
--sopv23 alkaen b poistunut ja pelkät koulutusrakennetiedot otetaan c:stä (poiskommentoitu b yltä sekä jatkolatausten ja -näkymien erotteluista datan määrän takia)
--vanhemmissa a-aineistoissa vielä hieman tutkinto- tms. tuplia korjaamatta (tilanne 21.12.2023)

) as kaikkivuodet

GO


