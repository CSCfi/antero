USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_7_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain]    Script Date: 5.9.2023 16:19:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_sa_2_7_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain] AS
SELECT [tilv] = CAST(tilv as nvarchar(4))
      ,[lahde] = CAST(COALESCE(NULLIF(lahde , ''), '-1') as nvarchar(2))
      ,[perusjoukko] = CAST(COALESCE(NULLIF(perusjoukko, ''), '-1') as nvarchar(2))
      ,[tunn] = CAST(COALESCE(NULLIF(tunn, ''), '-1') as nvarchar(5))
      ,[jarj] = CAST(COALESCE(NULLIF(jarj, ''), '-1') as nvarchar(10))
      ,[opjarj] = CAST(COALESCE(NULLIF(opjarj, ''), '-1') as nvarchar(10))
      ,[koulk] = CAST(COALESCE(NULLIF(koulk, ''), '-1') as nvarchar(6))
      ,[tutklaja] = CAST(COALESCE(NULLIF(tutklaja, ''), '-1') as nvarchar(2))
      ,[tutktav] = CAST(COALESCE(NULLIF(tutktav, ''), '-1') as nvarchar(2))
      ,[kkieli] = CAST(COALESCE(NULLIF(kkieli, ''), '-1') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''), NULLIF(kmaak , ''), '-1') as nvarchar(2))
      ,[lkm] = CAST(lkm as int)
      ,[tunn_opisk] = CAST(COALESCE(NULLIF(tunn_opisk, ''), '-1') as nvarchar(5))
      ,[jarj_opisk] = CAST(COALESCE(NULLIF(jarj_opisk, ''), '-1') as nvarchar(10))
      ,[olosyys] = CAST(olosyys as nvarchar(1))
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,NULL AS [tunn_opisk]
      ,NULL AS [jarj_opisk]
      ,9 AS [olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_12'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_12]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,NULL AS [tunn_opisk]
      ,NULL AS [jarj_opisk]
      ,9 AS [olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_13'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_13]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,NULL AS [tunn_opisk]
      ,NULL AS [jarj_opisk]
      ,9 AS [olosyys]
      ,NULL AS [luontipvm]
	  ,tietolahde = '2_7_2012_sopv_14'
  FROM [VipunenTK_SA].[dbo].[TK_2_7_2012_sopv_14]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_14'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_14]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_15'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_15]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_16'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_16]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_17'
FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_17]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_18'
FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_18]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_19'
FROM [TK_H9098_CSC].[dbo].[TK_K2_7_sopv_19]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_21'
FROM [TK_H9098_CSC].[dbo].[TK_K2_7_2019_sopv_21]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_21'
FROM [TK_H9098_CSC].[dbo].[TK_K2_7_2020_sopv_21]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_22'
FROM [TK_H9098_CSC].[dbo].[TK_K2_7_sopv_22]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_23'
FROM [TK_H9098_CSC].[dbo].[TK_K2_7_sopv_23]

) kaikkivuodet



GO


