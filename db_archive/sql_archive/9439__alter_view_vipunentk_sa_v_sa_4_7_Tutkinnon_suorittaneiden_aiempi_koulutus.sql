USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]    Script Date: 19.12.2023 22:18:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Select * into [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus] FROM VipunenTK_SA.[dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Truncate table [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Insert into [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Select * FROM VipunenTK_SA.[dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
*/

SELECT [tilv] = CAST(kaikkivuodet.suorv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.suorv+'0101' as date)
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi] = Cast([suorv]+Case when [suorlk] in ('1', '2') then suorlk else '2' end as varchar(8))
      ,[koulk] = Cast(koulk as nvarchar(6))
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi] = Cast(case when len(alvv)<4 then '-1' else alvv+Case when allk in ('1', '2') then allk else '2' end end as varchar(8))
      ,[oppis] = cast([oppis] as nvarchar(2))
	  ,sopimusjaksot = cast(
			case 
				when koso = 2 and opso = 2 then '3'
				when koso = 1 and opso = 2 then '4'
				when koso = 2 and opso = 1 then '5'
				when koso = 1 and opso = 1 then '6'
			end
		as nvarchar(2))
      ,[tutklaja] = cast([tutklaja] as nvarchar(2))
      ,[tutktav] = cast([tutktav] as nvarchar(2))
      ,[aikoul] = Cast([aikoul] as nvarchar(2))
      ,[sp] = Cast(sp as nvarchar(10))
      ,[aikielir1] = cast([aikielir1] as nvarchar(2))
      ,[syntv]
	  ,ika = cast(case when len(replace(syntv,'x',''))<4 then -1 else cast(suorv as int) - cast(syntv as int) end as nvarchar(10))
	  --syntv sai myös arvon 19XX, jolloin iäksi asetetaan tuntematon
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
	  ,amm_sopimusjaksot = cast(
			case 
				when ammkoso = 2 and ammopso = 2 then '3'
				when ammkoso = 1 and ammopso = 2 then '4'
				when ammkoso = 2 and ammopso = 1 then '5'
				when ammkoso = 1 and ammopso = 1 then '6'
			end
		as nvarchar(2))
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      --,[luontipvm]
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM ( 


  SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_11]

UNION ALL
SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_12]

UNION ALL
SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_13]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_14]

UNION ALL
SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_15]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] = case when syntv = '193.' or syntv = '197.' then '-1' else syntv end
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_16]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] = case when syntv = '193.' or syntv = '197.' then '-1' else syntv end
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_17]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] = case when syntv = '193.' or syntv = '197.' then '-1' else syntv end
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_18]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] 
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav] = NULL
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_7_sopv_19]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[opso] = null
      ,[koso] = null
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] 
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] = null
      ,[ammkoso] = null
      ,[ammtutklaja]
      ,[ammtutktav] = NULL
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_7_sopv_20]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis] = null
	  ,[opso]
	  ,[koso]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] 
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] 
      ,[ammkoso]
      ,[ammtutklaja]
      ,[ammtutktav] = NULL
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_7_sopv_21]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis] = null
	  ,[opso] = case when tutklaja in ('1','2','3') then coalesce(opso,'2') else opso end
	  ,[koso] = case when tutklaja in ('1','2','3') then coalesce(koso,'2') else koso end
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] 
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] 
      ,[ammkoso]
      ,[ammtutklaja]
      ,[ammtutktav] = NULL
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_7_sopv_22]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis] = null
	  ,[opso] = case when tutklaja in ('1','2','3') then coalesce(opso,'2') else opso end
	  ,[koso] = case when tutklaja in ('1','2','3') then coalesce(koso,'2') else koso end
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] 
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammopso] 
      ,[ammkoso]
      ,[ammtutklaja]
      ,[ammtutktav] = NULL
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_7_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_7_sopv_23]

) kaikkivuodet

GO
