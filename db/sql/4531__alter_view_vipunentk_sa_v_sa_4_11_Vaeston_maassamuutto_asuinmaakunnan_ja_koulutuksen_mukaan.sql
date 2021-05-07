USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]    Script Date: 8.4.2021 19:27:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
Select * into [VipunenTK_DW].[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan] FROM VipunenTK_SA.[dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]

Truncate table [VipunenTK_DW].[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
Insert into [VipunenTK_DW].[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[asmaak] = CAST(kaikkivuodet.asmaak as nvarchar(2))
      ,[koulk] = CAST(kaikkivuodet.koulk as nvarchar(6))
      ,[ulosmuutto] = CAST(kaikkivuodet.ulosmuutto as int)
      ,[sisaanmuutto] = CAST(kaikkivuodet.sisaanmuutto as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_11]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_12]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_13]

--UNION ALL
--SELECT [tilv]
--      ,[asmaak]
--      ,[koulk]
--      ,[sisaanmuutto]
--      ,[ulosmuutto]
--      ,[luontipvm]
--      ,[tietolahde]='TK_4_11_sopv_14'
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
--FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_14]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_15]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_16]

UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_17]

UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_18]

UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_19]

UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_20]

UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]='TK_4_11_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_21]


) kaikkivuodet






GO


