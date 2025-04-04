USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 27.3.2025 16.40.56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk] AS

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
	  ,[iscfinarrow2013] = NULL
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
      ,[syntv] = COALESCE(NULLIF(syntv,'19X-'),'9999')
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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_12_H]  
  
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
	  ,[iscfinarrow2013] 
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
      
  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_13_H]  
  
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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_14_H]  
  
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
	  ,[iscfinarrow2013] 
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_15_H]  
  

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
	  ,[iscfinarrow2013] 
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_16_H]  


  
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
	  ,[iscfinarrow2013] 
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_17_H]

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
	  ,[iscfinarrow2013]
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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_19] 

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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_20] 

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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_21]

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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_22]

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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_23]
  
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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_24]

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
	  ,[iscfinarrow2013]
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

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_25]  

GO


