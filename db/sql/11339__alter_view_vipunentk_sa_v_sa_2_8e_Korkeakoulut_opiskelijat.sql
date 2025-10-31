USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_8e_Korkeakoulut_opiskelijat]    Script Date: 31.10.2025 10.48.44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















ALTER VIEW [dbo].[v_sa_2_8e_Korkeakoulut_opiskelijat] AS

-- truncate table vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat
-- insert into vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat select * from v_sa_2_8e_Korkeakoulut_opiskelijat

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
	,olosyys = 
		CASE 
			WHEN kaikkivuodet.koultyp = '7' AND kaikkivuodet.olosyys = '0' THEN cast('1' as varchar(1))
			ELSE cast(kaikkivuodet.olosyys as varchar(1))
		END 
	,kkieli = cast(kaikkivuodet.kkieli as nvarchar(2))
	,ltop = cast(kaikkivuodet.ltop as nvarchar(1))
    ,laak = cast(kaikkivuodet.laak as nvarchar(1))
	,alvv_kksek = cast(kaikkivuodet.alvv_kksek as nvarchar(4))
    ,kansalr2 = cast(kaikkivuodet.kansalr2 as nvarchar(1))
    ,opoikv = cast(kaikkivuodet.opoikv as nvarchar(4))
	,ophal = cast(kaikkivuodet.ophal as varchar(1))
	,kvopisk = cast(kaikkivuodet.kvopisk as varchar(1))
	,suormaa = cast(kaikkivuodet.suormaa as varchar(1))
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
	  ,[ophal] = '1'
	  ,[kvopisk] = null
	  ,[suormaa] = null
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
	  ,[ophal] = '1'
	  ,[kvopisk] = null
	  ,[suormaa] = null
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
	  ,[ophal] = '1'
	  ,[kvopisk] = null
	  ,[suormaa] = null
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
	  ,[ophal] = '1'
	  ,[kvopisk] = null
	  ,[suormaa] = null
	  ,[tietolahde]='2_8e_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_20]

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
      ,[syntv] = case syntv when '19XX' then '9999' else syntv end
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
	  ,[ophal] = '1'
	  ,[kvopisk] = null
	  ,[suormaa] = null
	  ,[tietolahde]='2_8e_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_21]

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
      ,[syntv] = case syntv when '19XX' then '9999' else syntv end
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
	  ,[ophal] = '1'
	  ,[kvopisk]
	  ,[suormaa] = null
	  ,[tietolahde]='2_8e_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_22]

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
      ,[syntv] = case syntv when '19XX' then '9999' else syntv end
      ,[synkk]
      ,case [alvv_v2] when '19' then '19XX' else [alvv_v2] end  as [alvv] -- karkeistus muuttunut
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,case [alvv_kksek_v2] when '19' then '19XX' else [alvv_kksek_v2] end as [alvv_kksek] -- karkeistus muuttunut
      ,[kansalr2]
      ,case [opoikv_v2] when '19' then '19XX' else [opoikv_v2] end as [opoikv]  -- karkeistus muuttunut
	  ,[ophal] = '1'
	  ,[kvopisk]
	  ,[suormaa] = null
	  ,[tietolahde]='2_8e_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_23]

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
      ,[syntv] = case syntv when '19XX' then '9999' else syntv end
      ,[synkk]
      ,case [alvv_v2] when '19' then '19XX' else [alvv_v2] end  as [alvv] -- karkeistus muuttunut
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,case [alvv_kksek_v2] when '19' then '19XX' else [alvv_kksek_v2] end as [alvv_kksek] -- karkeistus muuttunut
      ,[kansalr2]
      ,case [opoikv_v2] when '19' then '19XX' else [opoikv_v2] end as [opoikv]  -- karkeistus muuttunut
	  ,[ophal] = '1'
	  ,[kvopisk]
	  ,[suormaa] = null
	  ,[tietolahde]='2_8e_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_24]

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
      ,[syntv] = case syntv when '19XX' then '9999' else syntv end
      ,[synkk]
      ,case [alvv_v2] when '19' then '19XX' else [alvv_v2] end  as [alvv] -- karkeistus muuttunut
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,case [alvv_kksek_v2] when '19' then '19XX' else [alvv_kksek_v2] end as [alvv_kksek] -- karkeistus muuttunut
      ,[kansalr2]
      ,case [opoikv_v2] when '19' then '19XX' else [opoikv_v2] end as [opoikv]  -- karkeistus muuttunut
	  ,[ophal] = '1'
	  ,[kvopisk]
	  ,[suormaa]
	  ,[tietolahde]='2_8e_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_25]


) as kaikkivuodet



GO


