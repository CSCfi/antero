USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]    Script Date: 7.3.2024 15:37:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan] AS

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] 
	  ,[kaste_t2] 
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_14'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_14_H]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] 
	  ,[kaste_t2] 
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_15'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_15_H]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2] 
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_16'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_16_H]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] 
	  ,[kaste_t2] 
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_17'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_17_H]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_18'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_18]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_19'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_19]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_20'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_20]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_21'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_21]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_22'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_22]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_23'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_23]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_24'
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_24]


GO


