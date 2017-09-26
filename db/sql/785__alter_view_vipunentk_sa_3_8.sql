USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 22.9.2017 14:33:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat] AS
SELECT [tilv] = CAST(tilv as nvarchar(4))
      ,[lahde] = CAST(COALESCE(NULLIF(lahde , ''), '-1') as nvarchar(2))
      ,[alvv] = CAST(COALESCE(NULLIF(alvv , ''), '-1') as int)
      ,[jarj] = CAST(COALESCE(NULLIF(jarj, ''), '-1') as nvarchar(10))
      ,[opmala] = CAST(COALESCE(NULLIF(opmala, ''), '-1') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''), NULLIF(kmaak , ''), '-1') as nvarchar(2))
      ,[suorv] = CAST(COALESCE(NULLIF(suorv , ''), '-1') as int)
      ,[suoropmala] = CAST(COALESCE(NULLIF(suoropmala, ''), '-1') as nvarchar(2))
      ,[suortutk] = CAST(COALESCE(NULLIF(suortutk, ''), '-1') as nvarchar(2))
      ,[lkm] = CAST(lkm as int)
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_2011_sopv_13'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_2011_sopv_13]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_2012_sopv_13'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_2012_sopv_13]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_12'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_12]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_15'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_15]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_16'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_16]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_17'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_17]
  
  
  ) kaikkivuodet








GO


USE [ANTERO]