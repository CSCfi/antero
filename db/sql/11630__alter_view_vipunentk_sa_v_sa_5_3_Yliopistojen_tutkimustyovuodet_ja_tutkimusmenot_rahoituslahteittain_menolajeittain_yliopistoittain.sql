USE [VipunenTK_SA]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] AS

/*
Aineisto muuttui K-aineistoksi 2016. K-koodia ei lisätty näkymän nimeen. /18.1.2016 CSC Jarmo
K poistettu /16.2.2016 CSC Jarmo

Drop table [VipunenTK_DW].[dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
Select * into [VipunenTK_DW].[dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] FROM VipunenTK_SA.[dbo].[v_sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
Truncate table [VipunenTK_DW].[dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
Insert into [VipunenTK_DW].[dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[tunn] = CAST(kaikkivuodet.tunn as nvarchar(10))
      ,[tiede] = CAST(kaikkivuodet.tiede as nvarchar(10))

      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[akatemia]
      ,[mokm]
      ,[tekes]
      ,[mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[muuju]
      ,[rahas]
      ,[akys]
      ,[auys]
      ,[eu]
      ,[eup]
      ,[eakr]
      ,[esr]
      ,[meu]
      ,[urahas]
      ,[mkvj]
      ,[amus]
      ,[ot_menot]
	  ,[rkork]
	  ,CAST([halue] as decimal(9,3)) as halue
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
FROM ( --kaikkivuodet

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA07_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot]
	  ,[RKORK] = NULL
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_12]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot]
	  ,[RKORK] = NULL
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_13]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot]
	  ,[RKORK] = NULL
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_14]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK] = NULL
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_15]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK] = NULL
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_16]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_17]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_18]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_19]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_20]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_21]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_22]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue] = NULL
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_23]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[sakat] as [akatemia]
      ,[mokm]
      ,[tekes]
      ,[mtem] as [mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[mjulk] as [muuju]
      ,[krahas] as [rahas]
      ,[kyrit] as [akys]
      ,[uyrit] as [auys]
      ,[eu]
      ,[eupuite] as [eup]
      ,[eakr]
      ,[esr]
      ,[muueu] as [meu]
      ,[urahas]
      ,[kv_jarj] as [mkvj]
      ,[mulko] as [amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue]
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_24]

UNION ALL

SELECT [tilv]
      ,[tunn]
      ,[tiede] = 'TA10_'+tiede
      ,[yhme]
      ,[kmeno]
      ,[palme]
      ,[apuraha]
      ,[mkmeno]
      ,[ptmeno]
      ,[akatemia]
      ,[mokm]
      ,[tekes]
      ,[mktm]
      ,[um]
      ,[om]
      ,[sm]
      ,[pm]
      ,[vm]
      ,[mmm]
      ,[lvm]
      ,[stm]
      ,[ym]
      ,[kunnat]
      ,[muuju]
      ,[rahas]
      ,[akys]
      ,[auys]
      ,[eu]
      ,[eup]
      ,[eakr]
      ,[esr]
      ,[meu]
      ,[urahas]
      ,[mkvj]
      ,[amus]
      ,[ot_menot] = otmenot
	  ,[RKORK]
	  ,[halue]
      ,[luontipvm]
      ,[tietolahde]='TK_5_3_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_5_3_sopv_25]

) kaikkivuodet

GO


