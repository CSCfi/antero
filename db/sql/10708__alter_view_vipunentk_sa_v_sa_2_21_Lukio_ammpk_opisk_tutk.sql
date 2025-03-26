USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_21_Lukio_ammpk_opisk_tutk]    Script Date: 26.3.2025 16.23.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







/*
select * into vipunentk_dw..sa_2_21_Lukio_ammpk_opisk_tutk from [dbo].[v_sa_2_21_Lukio_ammpk_opisk_tutk]
*/

ALTER VIEW [dbo].[v_sa_2_21_Lukio_ammpk_opisk_tutk] AS

SELECT
	   [tilv]= cast(kaikkivuodet.tilv as nvarchar(4))
	  ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
      ,[perusjoukko] = cast(kaikkivuodet.perusjoukko as nvarchar(2))
      ,[aikielir1] = cast(kaikkivuodet.aikielir1 as nvarchar(2))
      ,[koulk] = cast(kaikkivuodet.koulk as nvarchar(6))
      ,[kmaak] = cast(kaikkivuodet.kmaak as nvarchar(2))
      ,[lkm] = cast(kaikkivuodet.lkm as int)
   	  ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(20))
	  ,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak] = case 
					  when kmaak='20' then '01'
					  when left(kmaak,1)<>0 and len(kmaak)=1 then '0'+kmaak	
					  else kmaak
				 end
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_12'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_12]
     
UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak] = case 
					  when kmaak='20' then '01'
					  when left(kmaak,1)<>0 and len(kmaak)=1 then '0'+kmaak	
					  else kmaak
				 end
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_13'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_13]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_14'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_14]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_15'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_15]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_16'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_16]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_17'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_17]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_18'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_18]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_19'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_19]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_20'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_20]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_21'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_21]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_22'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_22]

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_23'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_23]


UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_24'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_24]  

UNION ALL

  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_25'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_25]  

) as kaikkivuodet




GO


