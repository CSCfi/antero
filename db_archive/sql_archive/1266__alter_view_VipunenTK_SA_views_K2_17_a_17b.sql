USE [VipunenTK_SA]
GO
/****** Object:  View [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.2.2018 16:38:48 ******/
DROP VIEW [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  View [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.2.2018 16:38:48 ******/
DROP VIEW [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  View [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.2.2018 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
















/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk] AS

/** HUOM! ophal-muuttuja ei toimi tilastovuosille 2009-2012, ohjattu tuntemattomaksi niiden osalta. Sen jälkeen ohjataan vain arvo 9 tuntemattomaksi **/

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] = '-1'
      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN '0' + opmopa
				WHEN len(opmopa) = 1 THEN '00' + opmopa
				ELSE opmopa
			END

      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] = '-1'
      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN '0' + opmopa
				WHEN len(opmopa) = 1 THEN '00' + opmopa
				ELSE opmopa
			END

	  ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_12]  
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')      
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] = '-1'
      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN '0' + opmopa
				WHEN len(opmopa) = 1 THEN '00' + opmopa
				ELSE opmopa
			END

      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)
      
  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_13]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] = '-1'
      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN '0' + opmopa
				WHEN len(opmopa) = 1 THEN '00' + opmopa
				ELSE opmopa
			END

      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_14]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = '9' THEN '-1'
				ELSE ophal
			END

      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN '0' + opmopa
				WHEN len(opmopa) = 1 THEN '00' + opmopa
				ELSE opmopa
			END

      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_15]  
  

UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = '9' THEN '-1'
				ELSE ophal
			END

      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN '0' + opmopa
				WHEN len(opmopa) = 1 THEN '00' + opmopa
				ELSE opmopa
			END

      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_16]  


  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = '9' THEN '-1'
				ELSE ophal
			END

      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN '0' + opmopa
				WHEN len(opmopa) = 1 THEN '00' + opmopa
				ELSE opmopa
			END

      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_17]

  UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = '9' THEN '-1'
				ELSE ophal
			END

      ,[opmopa] = NULL
			/**
				WHEN len(opmopa) = 2 THEN '0' + opmopa
				WHEN len(opmopa) = 1 THEN '00' + opmopa
				ELSE opmopa
			END **/

      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_18]  
  
  















GO
/****** Object:  View [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.2.2018 16:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk] AS

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				WHEN tilvaskun = 'BBB' THEN '999'
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = '9' THEN '-1'
				ELSE ophal
			END
      ,[opmopa]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END


      ,alvv = nullif([alvv], 'BBBB')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				WHEN tilvaskun = 'BBB' THEN '999'
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], 'BBBB')
	  ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_12]  
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				WHEN tilvaskun = 'BBB' THEN '999'
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], 'BBBB')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_13]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				WHEN tilvaskun = 'BBB' THEN '999'
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], 'BBBB')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_14]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				WHEN tilvaskun = 'BBB' THEN '999'
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], 'BBBB')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_15]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				WHEN tilvaskun = 'BBB' THEN '999'
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(nullif(muuttov,''), 'BBBB')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], 'BBBB')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_16]  

  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				WHEN tilvaskun = 'BBB' THEN '999'
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(nullif(muuttov,''), 'BBBB')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], 'BBBB')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_17]

  UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN '0' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN '00' + tilvaskun
				WHEN tilvaskun = 'BBB' THEN '999'
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(nullif(muuttov,''), 'BBBB')
      ,[aikielir4]
      ,[kansalr3] = Right('000'+[kansalr3],3)
      ,[svaltr3] = Right('000'+[svaltr3],3)
      ,[svaltr3_aiti] = Right('000'+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right('000'+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN '0' + kkun
				WHEN len(kkun) = 1 THEN '00' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], 'BBBB')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_18]  
  










GO

USE ANTERO