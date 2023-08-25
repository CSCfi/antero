USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_1_Perusopetuksen_lis‰opetuksen_p‰‰tt‰neiden_sijoittuminen]    Script Date: 25.8.2023 13:43:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[v_sa_4_1_Perusopetuksen_lis‰opetuksen_p‰‰tt‰neiden_sijoittuminen] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_1_Perusopetuksen_lis‰opetuksen_p‰‰tt‰neiden_sijoittuminen]
Select * into [VipunenTK_DW].[dbo].[sa_4_1_Perusopetuksen_lis‰opetuksen_p‰‰tt‰neiden_sijoittuminen] FROM VipunenTK_SA.[dbo].[v_sa_4_1_Perusopetuksen_lis‰opetuksen_p‰‰tt‰neiden_sijoittuminen]

Truncate table [VipunenTK_DW].[dbo].[sa_4_1_Perusopetuksen_lis‰opetuksen_p‰‰tt‰neiden_sijoittuminen]
Insert into [VipunenTK_DW].[dbo].[sa_4_1_Perusopetuksen_lis‰opetuksen_p‰‰tt‰neiden_sijoittuminen]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_1_Perusopetuksen_lis‰opetuksen_p‰‰tt‰neiden_sijoittuminen]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[sp] = CAST(kaikkivuodet.sp as nvarchar(10))
      ,[aikielir1] = CAST(kaikkivuodet.aikielir1 as nvarchar(2))
      ,[asmaak] = CAST(kaikkivuodet.asmaak as nvarchar(2))
      ,[asema] = CAST( CASE
		WHEN kaikkivuodet.asema = '' THEN '99' 
		WHEN kaikkivuodet.asema = ' ' THEN '99' 
		WHEN kaikkivuodet.asema = 'bl' THEN '99' 
		ELSE kaikkivuodet.asema
		END as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_11]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_12]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_13]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_14]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_15]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_16]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_17]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_18]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_19]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_20]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_4_1_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_tilv_2018_2020]

) kaikkivuodet












GO


