USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 10.11.2025 15.10.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat] AS
SELECT [tilv] = CAST(tilv as nvarchar(4))
      ,[lahde] = CAST(COALESCE(NULLIF(lahde , ''), '-1') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''), NULLIF(kmaak , ''), '-1') as nvarchar(2))
      ,[jarj] = CAST(COALESCE(NULLIF(jarj, ''), '-1') as nvarchar(10))
      ,[koulk] = CAST(COALESCE(NULLIF(koulk, ''), '-1') as nvarchar(6))
      ,[ophal] = CAST(COALESCE(NULLIF(ophal, ''), '-1') as nvarchar(2))
      ,[tutkmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = tutkmaak), ''), NULLIF(tutkmaak , ''), '-1') as nvarchar(2))
      ,[tutkjarj] = CAST(COALESCE(NULLIF(tutkjarj, ''), '-1') as nvarchar(10))
      ,[tutkkoulk] = CAST(COALESCE(NULLIF(tutkkoulk, ''), '-1') as nvarchar(6))
      ,[seurvkmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = seurvkmaak), ''), NULLIF(seurvkmaak , ''), '-1') as nvarchar(3))
      ,[seurvjarj] = CAST(COALESCE(NULLIF(seurvjarj, ''), '-1') as nvarchar(10))
      ,[seurvkoulk] = CAST(COALESCE(NULLIF(seurvkoulk, ''), '-1') as nvarchar(6))
      ,[lkm] = CAST(lkm as int)
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_11'
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_11]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_12'
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_12]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_13'
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_13]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_14'
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_14]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_15'
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_15]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_16'
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_16]
 UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_17'
FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_17]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_18'
FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_18]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_19'
FROM [TK_H9098_CSC].[dbo].[TK_K3_7_sopv_19] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_20'
FROM [TK_H9098_CSC].[dbo].[TK_K3_7_sopv_20]  

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_21'
FROM [TK_H9098_CSC].[dbo].[TK_K3_7_sopv_21]  

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal] = '1'
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_22'
FROM [TK_H9098_CSC].[dbo].[TK_K3_7_sopv_22]  
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal] = '1'
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_23'
FROM [TK_H9098_CSC].[dbo].[TK_K3_7_sopv_23]  

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal] = '1'
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_24'
FROM [TK_H9098_CSC].[dbo].[TK_K3_7_sopv_24]  

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal] = '1'
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = '3_7_sopv_25'
FROM [TK_H9098_CSC].[dbo].[TK_K3_7_sopv_25]  

) kaikkivuodet





GO


