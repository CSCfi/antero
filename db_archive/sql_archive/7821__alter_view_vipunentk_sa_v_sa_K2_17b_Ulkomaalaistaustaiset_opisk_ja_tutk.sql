USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 30.6.2023 22:51:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk] AS

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
	  ,[iscfinarrow2013] = NULL
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
	  ,[iscfinarrow2013] = NULL
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
	  ,[iscfinarrow2013] = NULL
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
	  ,[iscfinarrow2013] = NULL
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
	  ,[iscfinarrow2013] = NULL
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
	  ,[iscfinarrow2013] = NULL
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
	  ,[iscfinarrow2013] = NULL
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
	  ,[iscfinarrow2013]
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
	  ,[iscfinarrow2013]
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
FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_19] 

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
	  ,[iscfinarrow2013]
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
FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_20]  

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
      ,[oleskelux] = NULL
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
	  ,[iscfinarrow2013]
      ,[kkieli] = NULL
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
FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_21] 

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
      ,[oleskelux] = NULL
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
	  ,[iscfinarrow2013]
      ,[kkieli] = NULL
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
FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_22] 

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
      ,[oleskelux] = NULL
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
	  ,[iscfinarrow2013]
      ,[kkieli] = NULL
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
FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_23] 

GO
