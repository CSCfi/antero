USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 2.6.2020 18:41:27 ******/
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
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
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

--Aineistot ovat kumulatiivisia. Uusin riittää.
SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
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
	  ,tilv = (select max(lusuorv) FROM [TK_H9098_CSC].[dbo].[TK_K4_8_sopv_20])
      ,[tietolahde]='TK_4_8_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_8_sopv_20]

 ) kaikkivuodet



GO


USE [ANTERO]