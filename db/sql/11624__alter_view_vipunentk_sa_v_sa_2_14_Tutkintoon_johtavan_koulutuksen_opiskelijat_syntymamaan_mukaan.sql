USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]    Script Date: 23.1.2026 9.48.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]
Select * into [VipunenTK_DW].[dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan] FROM VipunenTK_SA.[dbo].[v_sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]

Truncate table [VipunenTK_DW].[dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]
Insert into [VipunenTK_DW].[dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal] = Case when ophal in ('', '9') then '1' else ophal end
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)

FROM ( --kaikkivuodet

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak] = case kmaak when '20' then '01' else kmaak end
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_14_sopv_11]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_14_sopv_12]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_14_sopv_13]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_14_sopv_14]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_14_sopv_15]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_14_sopv_16]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_14_sopv_17]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_14_sopv_18]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal]
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2]
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_14_sopv_19]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal] = coalesce(ophal, '1')
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2] = klaji
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_14_sopv_20]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal] = coalesce(ophal, '1')
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2] = klaji
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_14_sopv_21]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal] = coalesce(ophal, '1')
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2] = klaji
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_14_sopv_22]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal] = coalesce(ophal, '1')
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2] = klaji
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_14_sopv_23]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal] = coalesce(ophal, '1')
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2] = klaji
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_14_sopv_24]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[koulk]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal] = coalesce(ophal, '1')
      ,[kkieli]
      ,[aikoul]
      ,[kmaak]
      ,[sp]
      ,[aiopis]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[tilvaskunryh]
      ,[klajir2] = klaji
      ,[svalt]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_14_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY svalt, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_14_sopv_25]


) kaikkivuodet



GO


