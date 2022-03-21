USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]    Script Date: 17.10.2019 13:05:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dbo].[v_sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan] AS
/*
Drop table [VipunenTK_DW].[dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]
Select * into [VipunenTK_DW].[dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan] FROM VipunenTK_SA.[dbo].[v_sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]

Truncate table [VipunenTK_DW].[dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]
Insert into [VipunenTK_DW].[dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]
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
      ,[aikieli]
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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_15_sopv_11]

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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_15_sopv_12]

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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_15_sopv_13]
  
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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_15_sopv_14]
  
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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_15_sopv_15]
  
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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_15_sopv_16]
    
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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_15_sopv_17]

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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_15_sopv_18]

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
      ,[aikieli]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_2_15_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY aikieli, koulk, alvv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_15_sopv_19]

) kaikkivuodet





GO


USE [ANTERO]