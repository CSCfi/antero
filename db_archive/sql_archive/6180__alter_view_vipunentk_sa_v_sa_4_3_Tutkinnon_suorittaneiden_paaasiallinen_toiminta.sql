USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 3.5.2022 3:37:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] AS
SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,aineisto = cast(kaikkivuodet.aineisto as nvarchar(2))
	,tilvasmaak = cast(coalesce(nullif(kaikkivuodet.tilvasmaak,''),'-1') as nvarchar(2))
	,aiopis = cast(coalesce(nullif(kaikkivuodet.aiopis,'9'),'-1') as nvarchar(2))
	,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
	,tutkmaak = cast(coalesce(nullif(kaikkivuodet.tutkmaak,''),'-1') as nvarchar(2))
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj,''),'-1') as nvarchar(10))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn,''),'-1') as nvarchar(5))
	,akk = cast(coalesce(nullif(left(kaikkivuodet.akk,2),''),'-1') as nvarchar(2))
	,koulk = cast(coalesce(nullif(kaikkivuodet.koulk,''),'-1') as nvarchar(6))
	,kouljat = cast(coalesce(nullif(kaikkivuodet.kouljat,''),'-1') as nvarchar(2))
	,oppis = cast(coalesce(nullif(kaikkivuodet.oppis,''),'-1') as nvarchar(2))
	,tutklaja_tr = cast(coalesce(nullif(kaikkivuodet.tutklaja_tr,''),'-1') as nvarchar(2))
	,ptoim1r2 = cast(coalesce(nullif(kaikkivuodet.ptoim1r2,''),'-1') as nvarchar(2))
	,maassaolo = cast(coalesce(nullif(kaikkivuodet.maassaolo,''),'-1') as nvarchar(2))
	,amas = cast(coalesce(nullif(kaikkivuodet.amas,''),'-1') as nvarchar(2))
	,amm2010 = cast(coalesce(nullif(kaikkivuodet.amm2010,''),'-1') as nvarchar(5))
	,lkm = cast(kaikkivuodet.lkm as int)
	,eu_etamaat = cast(coalesce(nullif(kaikkivuodet.eu_etamaat,''),'-1') as nvarchar(2))
	,aikielir1 = cast(coalesce(nullif(kaikkivuodet.aikielir1,''),'-1') as nvarchar(2))
	,mosa = cast(coalesce(nullif(kaikkivuodet.mosa,''),'-1') as nvarchar(2))

	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] = coalesce(nullif([ptoim1r2],''),99)
      ,[maassaolo]
      ,[amas]
      ,[amm2010] = NULL
      ,[lkm]
	  ,'-1' AS eu_etamaat
	  ,'-1' AS aikielir1
	  ,'-1' AS mosa
      ,[tietolahde]='4_3_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_3_sopv_11]
union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] = coalesce(nullif([ptoim1r2],''),99)
      ,[maassaolo]
      ,[amas]
      ,[amm2010] = NULL
      ,[lkm]
	  ,'-1' AS eu_etamaat
	  ,'-1' AS aikielir1
	  ,'-1' AS mosa
      ,[tietolahde]='K4_3_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_12]
union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] = coalesce(nullif([ptoim1r2],''),99)
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,'-1' AS eu_etamaat
	  ,'-1' AS aikielir1
	  ,'-1' AS mosa
      ,[tietolahde]='K4_3_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_13]
  union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] = coalesce(nullif([ptoim1r2],''),99)
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,'-1' AS eu_etamaat
	  ,'-1' AS aikielir1
	  ,'-1' AS mosa
      ,[tietolahde]='K4_3_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_14]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] =     /* sopv_15 sisältää virheellisesti pääasiallisen toiminnan arvoja maasta muuttaneille, sovittu työjaostossa että korjataan vain näkymään arvoon muu tai tuntematon - Lasse R. 18.10.2016 */
		CASE
			WHEN maassaolo = 2 THEN 99
			ELSE coalesce(nullif([ptoim1r2],''),99)
		END
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]='K4_3_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_15]

union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]='K4_3_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_16]

  
union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]='K4_3_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_17]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]='K4_3_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_18]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]='K4_3_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_19]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]='K4_3_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_20]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]='K4_3_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_21]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]='K4_3_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_22]

) as kaikkivuodet

GO


