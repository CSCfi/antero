USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 12.12.2017 14:34:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain] AS

/*
Aineisto muuttui K-aineistoksi 2016. K-koodia ei lisätty näkymän nimeen. /18.1.2016 CSC Jarmo

Drop table [VipunenTK_DW].[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
Select * into [VipunenTK_DW].[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain] FROM VipunenTK_SA.[dbo].[v_sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
Truncate table [VipunenTK_DW].[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
Insert into [VipunenTK_DW].[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[tunn] = CAST(kaikkivuodet.tunn as nvarchar(10))
      ,[tiede] = CAST(kaikkivuodet.tiede as nvarchar(10))
      ,[vryhma] = CAST(kaikkivuodet.vryhma as nvarchar(10))
      ,[ikar4] = CAST(ltrim(rtrim(kaikkivuodet.ikar4)) as nvarchar(10))
      ,[sp] = CAST(kaikkivuodet.sp as nvarchar(10))
      ,[tutktaso] = CAST(Case when kaikkivuodet.tutktaso='90' then '-1' else kaikkivuodet.tutktaso end as nvarchar(10))
      ,[lkm_tutkimustyovuodet] = CAST(kaikkivuodet.ttv_lkm as decimal(8,4))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA07_'+tiede
      ,[vryhma]
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
      ,[ttv_lkm]
      ,[tietolahde]='TK_K5_2_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_2_sopv_12]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
      ,[ttv_lkm]
      ,[tietolahde]='TK_K5_2_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_2_sopv_13]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
      ,[ttv_lkm]
      ,[tietolahde]='TK_K5_2_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_2_sopv_14]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
      ,[ttv_lkm]
      ,[tietolahde]='TK_K5_2_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_2_sopv_15]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
      ,[ttv_lkm]
      ,[tietolahde]='TK_K5_2_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_2_sopv_16]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
      ,[ttv_lkm]
      ,[tietolahde]='TK_K5_2_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_2_sopv_17]
) kaikkivuodet









GO

USE [ANTERO]
