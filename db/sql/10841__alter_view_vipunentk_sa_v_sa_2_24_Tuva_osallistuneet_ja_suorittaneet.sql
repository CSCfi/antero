USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_24_Tuva_osallistuneet_ja_suorittaneet]    Script Date: 18.6.2025 13.29.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER    VIEW [dbo].[v_sa_2_24_Tuva_osallistuneet_ja_suorittaneet] AS
SELECT [tilv] = cast(kaikkivuodet.tilv as nvarchar(4))
      ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	  ,[lahde] = cast(kaikkivuodet.lahde as nvarchar(2))
	  ,[jarj] = cast(kaikkivuodet.jarj as nvarchar(10))
	  ,[tunn] = cast(kaikkivuodet.tunn as nvarchar(5))
	  ,[suunta] = cast(kaikkivuodet.suunta as nvarchar(1))
	  ,[allv] = cast(kaikkivuodet.allv as nvarchar(4))
	  ,[allk] = cast(kaikkivuodet.allk as nvarchar(1))
	  ,[aloituskausikoodi] = Cast(case when len(allv)<4 then '-1' else allv+Case when allk in ('1', '2') then allk else '2' end end as varchar(8))
	  ,[suorv] = cast(isnull(kaikkivuodet.suorv, '') as nvarchar(4))
	  ,[suorlk] = cast(isnull(kaikkivuodet.suorlk, '') as nvarchar(1))
	  ,[suorituskausikoodi] = Cast(case when len(suorv)<4 or suorv is null then '-1' else suorv+Case when suorlk in ('1', '2') then suorlk else '2' end end as varchar(8))
	  ,[tuva_kk] = cast(kaikkivuodet.tuva_kk as nvarchar(2))
	  ,[sp] = cast(kaikkivuodet.sp as nvarchar(1))
	  ,[ikar9] = cast(kaikkivuodet.ikar9 as nvarchar(10))
	  ,[aikielir1] = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	  ,[tilvasmaak] = cast(kaikkivuodet.tilvasmaak as nvarchar(2))
	  ,[tilvasmaakx] = cast(kaikkivuodet.tilvasmaakx as nvarchar(2))
	  ,[lkm] = cast(kaikkivuodet.lkm as int)
   	  ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	  ,rivinumero = cast(kaikkivuodet.rivinumero as int)

FROM (

SELECT [tilv]
      ,[lahde]
      ,[jarj]
      ,[tunn]
      ,[suunta]
      ,[allv]
      ,[allk]
      ,[suorv]
      ,[suorlk]
      ,[tuva_kk]
      ,[sp]
      ,[ikar9] = 'ikar9_' + [ikar9]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[tilvasmaakx]
      ,[lkm]
	  ,[tietolahde]='2_24_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_24_sopv_23]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[jarj]
      ,[tunn]
      ,[suunta]
      ,[allv]
      ,[allk]
      ,[suorv]
      ,[suorlk]
      ,[tuva_kk]
      ,[sp]
      ,[ikar9] = 'ikar9_' + [ikar9]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[tilvasmaakx]
      ,[lkm]
	  ,[tietolahde]='2_24_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_24_sopv_24]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[jarj]
      ,[tunn]
      ,[suunta]
      ,[allv]
      ,[allk]
      ,[suorv]
      ,[suorlk]
      ,[tuva_kk]
      ,[sp]
      ,[ikar9] = 'ikar9_' + [ikar9]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[tilvasmaakx]
      ,[lkm]
	  ,[tietolahde]='2_24_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_24_sopv_25]

) as kaikkivuodet






GO


