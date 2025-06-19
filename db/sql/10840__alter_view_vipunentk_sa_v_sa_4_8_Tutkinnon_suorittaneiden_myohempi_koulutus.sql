USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 4.6.2025 15.21.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Select * into [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus] FROM VipunenTK_SA.[dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Truncate table [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Insert into [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Select * FROM VipunenTK_SA.[dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi] = Cast([suorv]+Case when [suorlk] in ('1', '2') then suorlk else '2' end as varchar(8))
      ,[koulk] = Cast(koulk as nvarchar(6))
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi] = Cast(case when len(alvv)<4 then '-1' else alvv+Case when allk in ('1', '2') then allk else '2' end end as varchar(8))
      ,[oppis] = cast([oppis] as nvarchar(2))
      ,[tutklaja] = cast([tutklaja] as nvarchar(2))
      ,[tutktav] = cast([tutktav] as nvarchar(2))
      ,[aikoul] = Cast([aikoul] as nvarchar(2))
      ,[ulkom] = Cast([ulkom] as nvarchar(2))
	  ,[sp] = Cast(sp as nvarchar(10))
      ,[aikielir1] = cast([aikielir1] as nvarchar(2))
      ,[syntv]
	  ,ika = cast(case 
					when len(replace(syntv,'x',''))<4 then -1 
					when len(replace(suorv,'x',''))<4 then -1 
					else cast(suorv as int) - cast(syntv as int) end as nvarchar(10))
	  --syntv sai myös arvon 19XX, jolloin iäksi asetetaan tuntematon
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
	  ,[luulkom] = Cast([luulkom] as nvarchar(2))
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
	  ,[ammulkom] = Cast([ammulkom] as nvarchar(2))
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
	  ,[opistulkom] = Cast([opistulkom] as nvarchar(2))
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
	  ,[ammkaulkom] = Cast([ammkaulkom] as nvarchar(2))
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
	  ,[amkulkom] = Cast([amkulkom] as nvarchar(2))
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
	  ,[akkulkom] = Cast([akkulkom] as nvarchar(2))
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
	  ,[ylamkulkom] = Cast([ylamkulkom] as nvarchar(2))
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
	  ,[ykkulkom] = Cast([ykkulkom] as nvarchar(2))
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
	  ,[laakerulkom] = Cast([laakerulkom] as nvarchar(2))
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
	  ,[lisulkom] = Cast([lisulkom] as nvarchar(2))
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
	  ,[tohtulkom] = Cast([tohtulkom] as nvarchar(2))
      ,[lkm]
      --,[luontipvm]
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = ROW_NUMBER() over(order by suorv, koulk) --CAST(kaikkivuodet.rivinumero as int)
  FROM ( 

--Aineistot ovat kumulatiivisia. Uusin riittää.
SELECT DISTINCT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
	  ,[ulkom]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
	  ,[luulkom]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
	  ,[ammopso]
	  ,[ammkoso]
      ,[ammtutklaja]
      ,[ammtutktav]
	  ,[ammulkom]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
	  ,[opistulkom]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
	  ,[ammkaulkom]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
	  ,[amkulkom]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
	  ,[akkulkom]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
	  ,[ylamkulkom]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
	  ,[ykkulkom]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
	  ,[laakerulkom]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
	  ,[lisulkom]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
	  ,[tohtulkom]
      ,[lkm]
      ,[luontipvm]
	  ,tilv = (select max(lusuorv) FROM [TK_H9098_CSC].[dbo].[TK_K4_8_sopv_25])
      ,[tietolahde]='TK_4_8_sopv_25'
      --,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_8_sopv_25]

 ) kaikkivuodet

GO


