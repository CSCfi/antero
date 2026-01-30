USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]    Script Date: 23.1.2026 9.50.55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain] AS

/*
Aineisto muuttui K-aineistoksi 2016. K-koodia ei lisätty näkymän nimeen. /18.1.2016 CSC Jarmo
Ainestoon lisätty kaste_t2 vuonna 2017. Aiemmilta vuosilta puuttuu.

Drop table [VipunenTK_DW].[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
Select * into [VipunenTK_DW].[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain] FROM VipunenTK_SA.[dbo].[v_sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
Truncate table [VipunenTK_DW].[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
Insert into [VipunenTK_DW].[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[tunn] = CAST(kaikkivuodet.tunn as nvarchar(10))
      ,[tiede] = CAST(kaikkivuodet.tiede as nvarchar(10))
      ,[vryhma] = CAST(kaikkivuodet.vryhma as nvarchar(10))
      ,[tuturap] = CAST(kaikkivuodet.tuturap as nvarchar(10))
      ,[ikar4] = CAST(ltrim(rtrim(kaikkivuodet.ikar4)) as nvarchar(10))
      ,[sp] = CAST(kaikkivuodet.sp as nvarchar(10))
      ,[tutktaso] = CAST(Case 
							when kaikkivuodet.tutktaso='50' then '51'
							when kaikkivuodet.tutktaso='90' then '-1' 
							else kaikkivuodet.tutktaso 
						 end 
					as nvarchar(10))
	  ,[kaste_t2] =  CAST(Case 
							when kaikkivuodet.kaste_t2='91' then '-1' 
							else kaikkivuodet.kaste_t2 
						 end 
					as nvarchar(10))
      ,[lkm_tutkimushenkilokunta] = CAST(kaikkivuodet.tutk_lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA07_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
	  ,[kaste_t2] = NULL
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_12]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
	  ,[kaste_t2] = NULL
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_13]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
	  ,[kaste_t2] = NULL
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_14]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
	  ,[kaste_t2] = NULL
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_15]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso]
	  ,[kaste_t2] = NULL
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_16]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_17]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_18]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_19]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_20]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma]
	  ,[tuturap] = NULL
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_21]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma] = NULL
	  ,[tuturap]
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_22]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma] = NULL
	  ,[tuturap]
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_23]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma] = NULL
	  ,[tuturap]
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_24]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[vryhma] = NULL
	  ,[tuturap]
      ,[ikar4]
      ,[sp]
      ,[tutktaso] = NULL
	  ,[kaste_t2]
      ,[tutk_lkm]
      ,[tietolahde]='TK_K5_1_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K5_1_sopv_25]

) kaikkivuodet

GO


