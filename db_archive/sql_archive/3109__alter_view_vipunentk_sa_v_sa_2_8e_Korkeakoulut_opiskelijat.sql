USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_8e_Korkeakoulut_opiskelijat]    Script Date: 2.6.2020 18:15:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_sa_2_8e_Korkeakoulut_opiskelijat] AS

-- truncate table vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat
-- insert into vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat select * from v_sa_2_8e_Korkeakoulut_opiskelijat
-- select * into vipunentk_dw.dbo.sa_2_8e_Korkeakoulut_opiskelijat from v_sa_2_8e_Korkeakoulut_opiskelijat

SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,aineisto = cast(kaikkivuodet.aineisto as nvarchar(1))
	,lahde = cast(kaikkivuodet.lahde as nvarchar(2))
	,tunn = cast(kaikkivuodet.tunn as nvarchar(5))
	,jarj = cast(kaikkivuodet.jarj as nvarchar(10))
	,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
	,koultyp = cast(kaikkivuodet.koultyp as nvarchar(1))
	,sp = cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1x as nvarchar(2))
	,syntv = cast(kaikkivuodet.syntv as nvarchar(4))
	,synkk = cast(kaikkivuodet.synkk as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,olotamm = cast(kaikkivuodet.olotamm as nvarchar(1))
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,kkieli = cast(kaikkivuodet.kkieli as nvarchar(2))
	,ltop = cast(kaikkivuodet.ltop as nvarchar(1))
    ,laak = cast(kaikkivuodet.laak as nvarchar(1))
	,alvv_kksek = cast(kaikkivuodet.alvv_kksek as nvarchar(4))
    ,kansalr2 = cast(kaikkivuodet.kansalr2 as nvarchar(1))
    ,opoikv = cast(kaikkivuodet.opoikv as nvarchar(4))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

	SELECT
	   [tilv]
      ,[aineisto]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
      ,[sp]
      ,[aikielir1x]
      ,[syntv]
      ,[synkk]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,[alvv_kksek]
      ,[kansalr2]
      ,[opoikv]
	  ,[tietolahde]='2_8e_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_17]

UNION ALL

SELECT
	   [tilv]
      ,[aineisto]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
      ,[sp]
      ,[aikielir1x]
      ,[syntv]
      ,[synkk]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,[alvv_kksek]
      ,[kansalr2]
      ,[opoikv]
	  ,[tietolahde]='2_8e_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_18]

UNION ALL

SELECT
	   [tilv]
      ,[aineisto]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
      ,[sp]
      ,[aikielir1x]
      ,[syntv]
      ,[synkk]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,[alvv_kksek]
      ,[kansalr2]
      ,[opoikv]
	  ,[tietolahde]='2_8e_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_19]

UNION ALL

SELECT
	   [tilv]
      ,[aineisto]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
      ,[sp]
      ,[aikielir1x]
      ,[syntv]
      ,[synkk]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,[alvv_kksek]
      ,[kansalr2]
      ,[opoikv]
	  ,[tietolahde]='2_8e_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_20]

) as kaikkivuodet










GO


USE [ANTERO]