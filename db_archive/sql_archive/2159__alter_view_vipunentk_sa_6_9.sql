USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_6_9_Valtiot]    Script Date: 12.3.2019 11:11:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_sa_6_9_Valtiot] AS
SELECT
	 tilv
	,tilv_date = cast(tilv as date)
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa = Case when maa='248' then '1' else eumaa end
    ,etamaa = Case when maa='248' then '1' else etamaa end
    ,mosa_2
    ,mosanim_2
    ,mosa_3
    ,mosanim_3
    ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
	,luontipvm
FROM (

	SELECT
	 tilv
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa
    ,etamaa
    ,null as mosa_2
    ,null as mosanim_2
    ,null as mosa_3
    ,null as mosanim_3
    ,tietolahde = '6_9_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY maanimi_s)
	,luontipvm
FROM [TK_H9098_CSC].[dbo].[TK_6_9_sopv_11]
UNION ALL 
	SELECT
	 tilv
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa
    ,etamaa
    ,mosa_2
    ,mosanim_2
    ,mosa_3
    ,mosanim_3
    ,tietolahde = '6_9_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY maanimi_s)
	,luontipvm
FROM [TK_H9098_CSC].[dbo].[TK_6_9_sopv_13]
UNION ALL 
	SELECT
	 tilv
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa
    ,etamaa
    ,mosa_2
    ,mosanim_2
    ,mosa_3
    ,mosanim_3
    ,tietolahde = 'TK_6_9_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY maanimi_s)
	,luontipvm
FROM [TK_H9098_CSC].[dbo].[TK_6_9_sopv_14]
UNION ALL 
	SELECT
	 tilv
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa
    ,etamaa
    ,mosa_2
    ,mosanim_2
    ,mosa_3
    ,mosanim_3
    ,tietolahde = 'TK_6_9_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY maanimi_s)
	,luontipvm
FROM [TK_H9098_CSC].[dbo].[TK_6_9_sopv_15]
UNION ALL 
	SELECT
	 tilv
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa
    ,etamaa
    ,mosa_2
    ,mosanim_2
    ,mosa_3
    ,mosanim_3
    ,tietolahde = 'TK_6_9_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY maanimi_s)
	,luontipvm
FROM [TK_H9098_CSC].[dbo].[TK_6_9_sopv_16]
UNION ALL 
	SELECT
	 tilv
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa
    ,etamaa
    ,mosa_2
    ,mosanim_2
    ,mosa_3
    ,mosanim_3
    ,tietolahde = 'TK_6_9_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY maanimi_s)
	,luontipvm
FROM [TK_H9098_CSC].[dbo].[TK_6_9_sopv_17]

UNION ALL 

  SELECT
	 tilv
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa
    ,etamaa
    ,mosa_2
    ,mosanim_2
    ,mosa_3
    ,mosanim_3
    ,tietolahde = 'TK_6_9_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY maanimi_s)
	,luontipvm
  FROM [TK_H9098_CSC].[dbo].[TK_6_9_sopv_18]

UNION ALL 

  SELECT
	 tilv
    ,maa
    ,maanimi_s
    ,maanimi_r
    ,maanimi_e
    ,mosa
    ,mosanim
    ,eumaa
    ,etamaa
    ,mosa_2
    ,mosanim_2
    ,mosa_3
    ,mosanim_3
    ,tietolahde = 'TK_6_9_sopv_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY maanimi_s)
	,luontipvm
  FROM [TK_H9098_CSC].[dbo].[TK_6_9_sopv_19]


) as kaikkivuodet




GO


USE [ANTERO]