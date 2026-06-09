USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 10.11.2025 15.11.36 ******/
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
	  ,[iscfibroad2013] = CAST(COALESCE(NULLIF(iscfibroad2013, ''), '-1') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''), NULLIF(kmaak , ''), '-1') as nvarchar(2))
      ,[suorv] = CAST(COALESCE(NULLIF(suorv , ''), '-1') as int)
      ,[suoropmala] = CAST(COALESCE(NULLIF(suoropmala, ''), '-1') as nvarchar(2))
	  ,[suoriscfibroad2013] = CAST(COALESCE(NULLIF(suoriscfibroad2013, ''), '-1') as nvarchar(2))
      ,[suortutk] = CAST(COALESCE(NULLIF(suortutk, ''), '-1') as nvarchar(2))
      ,[lkm] = CAST(lkm as int)
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_2011_sopv_13'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_2011_sopv_13_H]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_2012_sopv_13'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_2012_sopv_13_H]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013] = NULL
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013] = NULL
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
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_15'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_15_H]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_16'
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_16_H]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_17'
FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_17_H]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_18'
FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_18]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_19'
FROM [TK_H9098_CSC].[dbo].[TK_K3_8_sopv_19] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_20'
FROM [TK_H9098_CSC].[dbo].[TK_K3_8_sopv_20] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_21'
FROM [TK_H9098_CSC].[dbo].[TK_K3_8_sopv_21] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_22'
FROM [TK_H9098_CSC].[dbo].[TK_K3_8_sopv_22] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_23'
FROM [TK_H9098_CSC].[dbo].[TK_K3_8_sopv_23] 
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_24'
FROM [TK_H9098_CSC].[dbo].[TK_K3_8_sopv_24] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_8_sopv_25'
FROM [TK_H9098_CSC].[dbo].[TK_K3_8_sopv_25] 
  
) kaikkivuodet



GO


