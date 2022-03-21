USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]    Script Date: 12.3.2019 11:01:59 ******/
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
	  ,[iscfibroad2013] = NULL
	  ,[kaste_t2] = NULL
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_14'
  FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_14]
UNION ALL
SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] = NULL
	  ,[kaste_t2] = NULL
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_15'
  FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_15]
UNION ALL
SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] = NULL
	  ,[kaste_t2] = NULL
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_16'
  FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_16]
UNION ALL
SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] = NULL
	  ,[kaste_t2] = NULL
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = 'K4_22_sopv_17'
  FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_17]

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








GO


USE [ANTERO]