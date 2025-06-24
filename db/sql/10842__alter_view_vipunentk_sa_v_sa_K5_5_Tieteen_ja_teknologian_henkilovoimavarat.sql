USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]    Script Date: 19.6.2025 18.30.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] AS 
/*
drop table  [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
select * into [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] from [VipunenTK_SA].[dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]

truncate table  [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
insert into [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
 select * from   [VipunenTK_SA].[dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
*/

SELECT [tilv]
      ,[svalt] = Case when svalt in ('991', '997', '998') then '-1' else svalt end --Dimensiossa ei ole etunollia
      ,[kansal] = Case when kansal in ('991', '997', '998') then '-1' else kansal end --Dimensiossa ei ole etunollia
      ,[sp]
      ,ikar5 = ltrim([ikar])
      ,[maakunta]
      ,[ptoim1]
      ,[koulk] = ISNULL(koulk, '-1')
      ,[suorv]
      ,[suormaak] = ISNULL(NULLIF(suormaak, '99'), '-1')
      ,[amm2010_2] = CASE WHEN left(amm2010_2, 1) = 'X' then -1 when amm2010_2 is null then -1 else amm2010_2 end
      ,[tmaak] = ISNULL(NULLIF(tmaak, '99'), '-1')
      ,[tol2008_akatemia] = ISNULL(NULLIF([tol2008_akatemia], '99'), '-1')
      ,[tsekt_2] = ISNULL([tsekt_2], '0')
	  ,[ta_vaihdos] = ISNULL([ta_vaihdos],'-1')
	  ,[sl] = ISNULL([sl],'-1')
	  ,[tol2008_tthv_ed] = ISNULL(NULLIF([tol2008_tthv_ed], '99'), '-1')
	  ,[tsekt_ed] = ISNULL([tsekt_ed],'0')
      ,[lkm]
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
FROM ( --kaikkivuodet

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar]
      ,[maakunta]
      ,[ptoim1] = '-1'
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_akatemia]
      ,[tsekt_2]
	  ,[ta_vaihdos] = null
	  ,[sl] = null
	  ,[tol2008_tthv_ed] = null
	  ,[tsekt_ed] = null
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_15]
  WHERE tilv in ('2008', '2009', '2010')

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos] = null
	  ,[sl] = null
	  ,[tol2008_tthv_ed] = null
	  ,[tsekt_ed] = null
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_16]
  WHERE tilv in ('2011', '2012', '2013')

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_17]
WHERE tilv = '2014'

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_18]
WHERE tilv = '2015'

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_19]
WHERE tilv = '2016'

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_20]
WHERE tilv = '2017'

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_21]
WHERE tilv = '2018'

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_22]
WHERE tilv = '2019'

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_23]
WHERE tilv = '2020'

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_24]
WHERE tilv = '2021'

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]='TK_K5_5_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_25]
WHERE tilv = '2022'


 ) kaikkivuodet




GO


