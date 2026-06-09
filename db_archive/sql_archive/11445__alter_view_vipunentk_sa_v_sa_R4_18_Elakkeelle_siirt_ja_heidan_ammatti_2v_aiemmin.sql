USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 8.12.2025 12.24.55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














/****** Script for SelectTopNRows command from SSMS  ******/
ALTER    VIEW [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin] AS

/******************

HUOM! SISÄLTÄÄ A- JA B-AINEISTON

******************/


SELECT [tilv] = CAST([tilv] AS nvarchar(4))
	  ,[tilv_date] = CAST(tilv+'0101' as date)
      ,[lahde] = CAST([lahde] as nvarchar(10))
      ,[sp] = CAST([sp] as nvarchar(10))
      ,[aikielir1] = CAST([aikielir1] as nvarchar(10))
      ,[ika] = CAST([ika] as nvarchar(10))
      ,[elaji] = CAST([elaji] as nvarchar(10))
      ,[elk_koodi] = 
		CASE WHEN [lahde] = 'E' THEN CAST([elaji] as nvarchar(10))      
		WHEN [lahde] = 'K' THEN CAST('100' as nvarchar(10))     
      END      
      ,[ptoim1r8_2x] = 
      CASE
          WHEN [ptoim1r8_2x] = 99 THEN CAST('-1' as nvarchar(10))
          ELSE CAST([ptoim1r8_2x] as nvarchar(10))
      END
      ,[tmaak2x] = 
		CASE WHEN [tmaak2x] = 99 THEN CAST('-1' as nvarchar(10))
		ELSE CAST([tmaak2x] as nvarchar(10))
      END      
      ,[amm2001_m1_2x] = 
		CASE WHEN [amm2001_m1_2x] = 'XX' THEN CAST('-1' as nvarchar(10))
		     WHEN [amm2001_m1_2x] = '12' THEN CAST('-1' as nvarchar(10))
		ELSE CAST([amm2001_m1_2x] as nvarchar(10))
      END
      ,[amm2001_m2_2x] = 
		CASE WHEN [amm2001_m2_2x] LIKE '%XX%' THEN CAST('-1' as nvarchar(20))
		     WHEN [amm2001_m2_2x] LIKE '%12.%' THEN CAST('-1' as nvarchar(20))
		ELSE CAST([amm2001_m2_2x] as nvarchar(20))
	  END
	  ,[amm2010_oef1_2x] = CAST(kaikkivuodet.amm2010_oef1_2x as nvarchar(10))
	  ,[amm2010_oef2_2x] = CAST(kaikkivuodet.amm2010_oef2_2x as nvarchar(20))
      ,[lkm] = CAST([lkm] as int)
      ,[tietolahde] = CAST([tietolahde] as nvarchar(50))
      ,[rivinumero] = CAST([rivinumero] as int)
      ,[tietojen_ajankohta] = CAST([tietojen_ajankohta] as nvarchar(20))
      ,[tiet_ak] = CAST(CAST([tilv] as int) - 2 AS nvarchar(4))
      ,[tiet_akdate] = CAST(CAST(CAST([tilv] as int) - 2 as nvarchar(10)) + '0101' as date)   
      ,aineisto = CAST('R4.18' as nvarchar(8))         

FROM
(

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2001_'+Replace([amm2001_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]      
      ,[lkm]
      ,[tietolahde]='sa_R4_18a_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_11]
 
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_11]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_12]

  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_12]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_13]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_13]


UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
	  ,'-1' AS [amm2010_oef1_2x]
	  ,'-1' AS [amm2010_oef2_2x]
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_15]


-- uudella rakenteella

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_15_O]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_16_O] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_16_O]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_17_O] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_17_O]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_18_O] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_18_O]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_19_O] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_19_O]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_20_O] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_20_O]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_21_O] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_21_O]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_22_O] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_22_O]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_23] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_23]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_24] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_24]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_25] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,'-1' AS [amm2010_m1_2x]
      ,'-1' AS [amm2010_m2_2x]
	  ,[amm2010_oef1_2x]=Case when [amm2010_oef1_2x] = '17' then '-1' when [amm2010_oef1_2x] is null then '-1' else [amm2010_oef1_2x] end
	  ,[amm2010_oef2_2x]=Case when [amm2010_oef2_2x] = '17.01' then '-1' when [amm2010_oef2_2x] is null then '-1' else [amm2010_oef2_2x] end
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_25]

) kaikkivuodet





GO


