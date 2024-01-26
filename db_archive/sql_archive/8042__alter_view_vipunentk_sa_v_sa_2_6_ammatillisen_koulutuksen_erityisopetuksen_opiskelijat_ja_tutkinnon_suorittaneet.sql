USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_6_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]    Script Date: 5.9.2023 16:18:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_sa_2_6_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet] AS
SELECT [tilv] = CAST(tilv as nvarchar(4))
      ,[lahde] = CAST(COALESCE(NULLIF(lahde , ''), '-1') as nvarchar(2))
      ,[perusjoukko] = CAST(COALESCE(NULLIF(perusjoukko, ''), '-1') as nvarchar(2))
      ,[koulk] = CAST(COALESCE(NULLIF(koulk, ''), '-1') as nvarchar(6))
      ,[tutklaja] = CAST(COALESCE(NULLIF(tutklaja , ''), '-1') as nvarchar(2))
      ,[tutktav] = CAST(COALESCE(NULLIF(tutktav , ''), '-1') as nvarchar(2))
      ,[kkieli] = CAST(COALESCE(NULLIF(kkieli , ''), '-1') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''), NULLIF(kmaak , ''), '-1') as nvarchar(2))
      ,[knuts2u] = CAST(COALESCE(NULLIF(knuts2u , ''), '-1') as nvarchar(2))
      ,[kkunryh] = CAST(COALESCE(NULLIF(kkunryh , ''), '-1') as nvarchar(2))
      ,[kely] = CAST(COALESCE(NULLIF(kely , ''), '-1') as nvarchar(2))
      ,[kavi] = CAST(COALESCE(NULLIF(kavi , ''), '-1') as nvarchar(2))
      ,[sp] = CAST(COALESCE(NULLIF(sp , ''), '-1') as nvarchar(2))
      ,[aikielir1] = CAST(COALESCE(NULLIF(aikielir1 , ''), '-1') as nvarchar(2))
      ,[kansalr2] = CAST(COALESCE(NULLIF(kansalr2 , ''), '-1') as nvarchar(2))
      ,[alvv] = CAST(alvv as nvarchar(4))
      ,[allk] = CAST(allk as nvarchar(1))
      ,[olotamm] = CAST(olotamm as nvarchar(1))
      ,[olosyys] = CAST(olosyys as nvarchar(1))
      ,[aiopis] = CAST(COALESCE(NULLIF(aiopis , ''), '-1') as nvarchar(2))
      ,[erper] = CAST(COALESCE(NULLIF(erper , ''), '-1') as nvarchar(2))
      ,[erryh] = CAST(COALESCE(NULLIF(erryh , ''), '9') as nvarchar(2))
      ,[ammos] = CAST(ammos as int)
      ,[opintokok] = CAST(opintokok as int)
      ,[lkm] = CAST(lkm as int)
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_11'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_11]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_12'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_12]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_13'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_13]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_14'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_14]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_15'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_15]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_16'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_16]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_17'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_17]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper] = NULL
      ,[erryh]
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_18'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_18]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper] = NULL
      ,[erryh]
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_19'
FROM [TK_H9098_CSC].[dbo].[TK_K2_6_sopv_19]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper] = NULL
      ,[erryh] = NULL --Kosken hojks-tieto (deprecated)
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_21'
FROM [TK_H9098_CSC].[dbo].[TK_K2_6_2019_sopv_21]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper] = NULL
      ,[erryh] = NULL --Kosken hojks-tieto (deprecated)
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_21'
FROM [TK_H9098_CSC].[dbo].[TK_K2_6_2020_sopv_21]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper] = NULL
      ,[erryh] = NULL --Kosken hojks-tieto (deprecated)
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_22'
FROM [TK_H9098_CSC].[dbo].[TK_K2_6_sopv_22]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper] = NULL
      ,[erryh] = NULL --Kosken hojks-tieto (deprecated)
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_23'
FROM [TK_H9098_CSC].[dbo].[TK_K2_6_sopv_23]

) kaikkivuodet



GO


