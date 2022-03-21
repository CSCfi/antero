USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_8_Korkeakoulut_opiskelijat]    Script Date: 5.3.2019 12:25:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER VIEW [dbo].[v_sa_2_8_Korkeakoulut_opiskelijat] AS

-- truncate table vipunentk_dw..sa_2_8_Korkeakoulut_opiskelijat
-- insert into vipunentk_dw..sa_2_8_Korkeakoulut_opiskelijat select * from v_sa_2_8_Korkeakoulut_opiskelijat


select
	tilv = cast(kaikkivuodet.tilv as varchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,aineisto = cast(kaikkivuodet.aineisto as varchar(1))
	,lahde = cast(kaikkivuodet.lahde as varchar(2))
	,tunn = cast(kaikkivuodet.tunn as varchar(5))
	,jarj = cast(kaikkivuodet.jarj as varchar(10))
	,koulk = cast(kaikkivuodet.koulk as varchar(6))
	,kkun = cast(kaikkivuodet.kkun as varchar(3))
	,sp = cast(kaikkivuodet.sp as varchar(1))
	,aikielir1x = cast(kaikkivuodet.aikielir1x as varchar(2))
	,syntv = cast(kaikkivuodet.syntv as varchar(4))
	,tilvaskun = cast(kaikkivuodet.tilvaskun as varchar(6))
	,tilvaskunx = cast(kaikkivuodet.tilvaskunx as varchar(3))
	,tilvaskun2x = cast(kaikkivuodet.tilvaskun2x as varchar(3))
	,kansalr2 = cast(kaikkivuodet.kansalr2 as varchar(1))
	,alvv = cast(kaikkivuodet.alvv as varchar(4))
	,allk = cast(kaikkivuodet.allk as varchar(1))
	,olotamm = cast(kaikkivuodet.olotamm as varchar(1))
	,olosyys = cast(kaikkivuodet.olosyys as varchar(1))
	,rahlahde = cast(kaikkivuodet.rahlahde as varchar(1))
	,fte = cast(kaikkivuodet.fte as varchar(1))
	,alvv_kksek = cast(kaikkivuodet.alvv_kksek as varchar(4))
	,alvv_kksek_lasna = cast(kaikkivuodet.alvv_kksek_lasna as varchar(4))
	,alvv_sek = cast(kaikkivuodet.alvv_sek as varchar(4))
	,alvv_sek_lasna = cast(kaikkivuodet.alvv_sek_lasna as varchar(4))
	,alvv_kk = cast(kaikkivuodet.alvv_kk as varchar(4))
	,alvv_kk_lasna = cast(kaikkivuodet.alvv_kk_lasna as varchar(4))
	,alvv_opa = cast(kaikkivuodet.alvv_opa as varchar(4))
	,alvv_opa_lasna = cast(kaikkivuodet.alvv_opa_lasna as varchar(4))
	,lkm = cast(kaikkivuodet.lkm as int)
	,opyht0 = cast(kaikkivuodet.opyht0 as int)
	,opyht14 = cast(kaikkivuodet.opyht14 as int)
	,opyht29 = cast(kaikkivuodet.opyht29 as int)
	,opyht44 = cast(kaikkivuodet.opyht44 as int)
	,opyht59 = cast(kaikkivuodet.opyht59 as int)
	,opyht74 = cast(kaikkivuodet.opyht74 as int)
	,opyht89 = cast(kaikkivuodet.opyht89 as int)
	,opyht104 = cast(kaikkivuodet.opyht104 as int)
	,opyht119 = cast(kaikkivuodet.opyht119 as int)
	,opyht120 = cast(kaikkivuodet.opyht120 as int)
	,op55 = cast(kaikkivuodet.op55 as varchar(1))
	,opes = cast(kaikkivuodet.opes as int)
	,opek = cast(kaikkivuodet.opek as int)
	,opker = cast(kaikkivuodet.opker as int)
	,tutkamk = cast(kaikkivuodet.tutkamk as varchar(3))
	,tunimamk = cast(kaikkivuodet.tunimamk as nvarchar(60))
	,koamk = cast(kaikkivuodet.koamk as varchar(4))
	,konimamk = cast(kaikkivuodet.konimamk as nvarchar(60))
	,suun_v = cast(kaikkivuodet.suun_v as varchar(5))
	,svnim = cast(kaikkivuodet.svnim as nvarchar(40))
	,koultyp = cast(kaikkivuodet.koultyp as varchar(1))
	,kkieli = cast(kaikkivuodet.kkieli as varchar(2))
	,lasnalk = cast(kaikkivuodet.lasnalk as int)
	,poissalk = cast(kaikkivuodet.poissalk as int)
	,oplaaj = cast(kaikkivuodet.oplaaj as int)
	,kirtu1v = cast(kaikkivuodet.kirtu1v as varchar(4))
	,kirtu1k = cast(kaikkivuodet.kirtu1k as varchar(1))
	,ensisop = cast(kaikkivuodet.ensisop as varchar(1))
	,tilmaa = cast(kaikkivuodet.tilmaa as varchar(1))
	,tutkyo = cast(kaikkivuodet.tutkyo as varchar(3))
	,tunimyo = cast(kaikkivuodet.tunimyo as nvarchar(40))
	,koyo = cast(kaikkivuodet.koyo as varchar(4))
	,konimyo = cast(kaikkivuodet.konimyo as nvarchar(50))
	,paine = cast(kaikkivuodet.paine as varchar(4))
	,painenim = cast(kaikkivuodet.painenim as nvarchar(60))
	,kk = cast(kaikkivuodet.kk as varchar(2))
	,tdk = cast(kaikkivuodet.tdk as varchar(2))
	,fuksi = cast(kaikkivuodet.fuksi as varchar(1))
	,opoikv = cast(kaikkivuodet.opoikv as varchar(4))
	,om = cast(kaikkivuodet.om as varchar(1))
	,opkelp = cast(kaikkivuodet.opkelp as varchar(1))
	,avo  = cast(kaikkivuodet.avo as varchar(1))
	,laak  = cast(kaikkivuodet.laak as varchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as varchar(10))
FROM (

--Historia-aineisto
SELECT
	tilv
	, aineisto = 'L'
	, lahde =
		case 
			when lahde = 3 then 41
			when lahde = 4 then 51
			else -1
		end
	, tunn
	, jarj = op.koulutuksen_jarjestajakoodi
	, koulk
	, kkun
	, sp
	, aikielir1x = aikielir1
	, syntv = CASE WHEN LTRIM(ika) in ('.','') then null else cast(tilv as int)-cast(LTRIM(ika) as int) end
	, tilvaskun = case when asmaak is null or asmaak=99 then null else 'MAAK'+asmaak end
	, tilvaskunx = null
	, tilvaskun2x = null
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde = null
	, fte
	, alvv_kksek = null
	, alvv_kksek_lasna = null
	, alvv_sek = null
	, alvv_sek_lasna = null
	, alvv_kk = null
	, alvv_kk_lasna = null
	, alvv_opa = null
	, alvv_opa_lasna = null
	, lkm
	, opyht0 = null
	, opyht14 = null
	, opyht29 = null
	, opyht44 = null
	, opyht59 = null
	, opyht74 = null
	, opyht89 = null
	, opyht104 = null
	, opyht119 = null
	, opyht120 = null
	, null as op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk = null
	, tunimamk = null
	, koamk = null
	, konimamk = null
	, suun_v = null
	, svnim = null
	, koultyp
	, kkieli = case kkielir1 when 'fs' then 'fi' else kkielir1 end
	, lasnalk = null
	, poissalk = null
	, oplaaj = null
	, kirtu1v = null
	, kirtu1k = null
	, ensisop = null
	, tilmaa = null
	, tutkyo = null
	, tunimyo = null
	, koyo = null
	, konimyo = null
	, paine = null
	, painenim = null
	, kk = null
	, tdk = null
	, fuksi = null
	, opoikv = null
	, om = null
	, opkelp = null
	, avo = NULL, laak = NULL
	,[tietolahde]='8_2_Historia'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_8_2_sopv_16] tk
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.tunn
WHERE lahde in (3,4) and tilv<2010

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, null as op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8a_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8a_sopv_11]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, null as op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8b_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_11]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, null as op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8c_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8c_sopv_11]
/* 2.8d v2011? */
/* 2.8a v2012? */
UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8b_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_12]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8c_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8c_sopv_12]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8d_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8d_sopv_12]
/* 2.8a v2013? */
UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8b_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_13]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8c_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8c_sopv_13]
/* 2.8d v2013? */

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8d_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8d_sopv_13]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8b_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_14]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8d_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8d_sopv_14]


UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='2_8b_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_2_8b_sopv_15]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak
	,[tietolahde]='2_8b_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_2_8b_sopv_16]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak
	,[tietolahde]='2_8b_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_2_8b_sopv_17]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	, laak
	,[tietolahde]='2_8b_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_2_8b_sopv_18]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, case when koulk in ('775101','775201') then '999999'
	       else koulk
	  end as koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk = null
	, tunimamk = null
	, koamk = null
	, konimamk = null
	, suun_v = null
	, svnim = null
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo = null
	, tunimyo = null
	, koyo = null
	, konimyo = null
	, paine = null
	, painenim = null
	, kk
	, tdk = null
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo, laak= NULL
	,[tietolahde]='antero sa_virta_otp_tkOpiskOKMEnnakko'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM Antero.sa.[sa_virta_otp_tkOPISKOKMEnnakko]

) kaikkivuodet




GO


USE [ANTERO]