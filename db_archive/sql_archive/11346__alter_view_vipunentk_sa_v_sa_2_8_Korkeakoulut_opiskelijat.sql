USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_8_Korkeakoulut_opiskelijat]    Script Date: 5.11.2025 10.20.51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









-- sopv_24 alkaen yliopistopuolella uusi muuttuja kirtu1pv. Vaikka muuttuja on vvvvkkkpp eli päivän tarkkuudella niin sitä on Jukka Haapamäen mukaan tarkoitus käyttää vastaavasti kuin amk-puolen
-- kirtu1v ja kirtu1k muuttujia. kirtu1pv tiedosta otetaan vastaavat tiedot ja liitetään kirtu1v ja kirtu1k muuttujiin, joita jatkossa voidaan hyödyntää molemmilla sektoreilla. Aiemmin yliopistopuolella
-- nuo jätettiin null-arvoisiksi ja näkyivät kuutioissa Tuntemattomina. Kuutioissakin ko muuttujilla on sektorineutraalit nimet. 12.6.2024 Mika



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
	,olosyys = 
		CASE 
			WHEN kaikkivuodet.koultyp = '7' and kaikkivuodet.olosyys = '0' THEN cast('1' as varchar(1))
			ELSE cast(kaikkivuodet.olosyys as varchar(1))
		END
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
	,avo = cast(kaikkivuodet.avo as varchar(1))
	,ltop = cast(kaikkivuodet.ltop as int)
	,laak = cast(kaikkivuodet.laak as varchar(1))
	,ophal = cast(kaikkivuodet.ophal as varchar(1))
	,kvopisk = cast(kaikkivuodet.kvopisk as varchar(1))
	,suormaa = cast(kaikkivuodet.suormaa as varchar(1))
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
	, avo = NULL
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
	,[tietolahde]='8_2_Historia'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_8_2_sopv_16] tk
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.tunn
WHERE lahde in (3,4) and tilv<2010

UNION ALL
/*
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	,[tietolahde]='2_8a_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8a_sopv_11]

UNION ALL
*/
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop = NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop=NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop= NULL
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop
	, laak = null
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop
	, laak
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, avo
	, ltop
	, laak
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, ltop
	, laak
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
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
	, ltop
	, laak
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
	,[tietolahde]='2_8b_sopv_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_K2_8b_sopv_19]

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
	, ltop
	, laak
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
	,[tietolahde]='2_8b_sopv_20'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_K2_8b_sopv_20]

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
	, syntv = case syntv when '19XX' then '9999' else syntv end
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
	, avo
	, ltop
	, laak
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
	,[tietolahde]='2_8b_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_K2_8b_sopv_21]
-- Rajataan pois tiedot Tampereen yliopiston erikoislääkäreistä (tiedot ovat puutteellisia)
WHERE (tunn = '10122' AND laak is null) OR (tunn != '10122')

UNION ALL

-- Tampereen yliopiston erikoislääkärit 2020 Virran erillisaineistosta
SELECT
	tilv
	, 'L' as aineisto
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
	, alvvkksek AS alvv_kksek
	, alvvkkseklasna AS alvv_kksek_lasna
	, alvvsek AS alvv_sek
	, alvvkkseklasna AS alvv_sek_lasna
	, alvvkk AS alvv_kk
	, alvvkklasna AS alvv_kk_lasna
	, alvvopa AS alvv_opa
	, alvvopalasna AS alvv_opa_lasna
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
	, avo
	, ltop = case when ltop = '1' then '1' end 
	, laak = CASE koulk WHEN '775101' THEN 1 WHEN '775201' THEN 2 ELSE NULL END
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
	,[tietolahde] = 'VipunenTK_SA sa_virta_otp_tampere_2020_erikoislaakarit'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [VipunenTK_SA].[dbo].[sa_virta_otp_tampere_2020_erikoislaakarit]

UNION ALL

-- TK:n sopv22 aineisto
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
	, syntv = case syntv when '19XX' then '9999' else syntv end
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
	, kk = null
	, tdk = null
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	, ltop
	, laak
	, ophal = '1'
	, kvopisk
	, suormaa = null
	,[tietolahde]='2_8b_sopv_22'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_K2_8b_sopv_22]

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
	, syntv = case syntv when '19XX' then '9999' else syntv end
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
	-- , alvv_opa = null --alvv_iscfinarrow2013 (alustava, varmistuu myöhemmin tehdäänkö näin vai uusia muuttujia. JS 30.6.2023)
	, alvv_iscfinarrow2013 as alvv_opa
	-- , alvv_opa_lasna = null --alvv_iscfinarrow2013_lasna (alustava, varmistuu myöhemmin tehdäänkö näin vai uusia muuttujia. JS 30.6.2023)
	, alvv_iscfinarrow2013_lasna as alvv_opa_lasna
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
	, kk = null
	, tdk = null
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	, ltop
	, laak
	, ophal = '1'
	, kvopisk
	, suormaa = null
	,[tietolahde]='2_8b_sopv_23'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM TK_H9098_CSC.[dbo].[TK_K2_8b_sopv_23]

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
	, syntv = case syntv when '19XX' then '9999' else syntv end
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
	-- , alvv_opa = null --alvv_iscfinarrow2013 (alustava, varmistuu myöhemmin tehdäänkö näin vai uusia muuttujia. JS 30.6.2023)
	, alvv_iscfinarrow2013 as alvv_opa
	-- , alvv_opa_lasna = null --alvv_iscfinarrow2013_lasna (alustava, varmistuu myöhemmin tehdäänkö näin vai uusia muuttujia. JS 30.6.2023)
	, alvv_iscfinarrow2013_lasna as alvv_opa_lasna
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
	, kirtu1v = case when lahde = '41' then [kirtu1v] else case when [kirtu1pv] is not null then substring([kirtu1pv], 1, 4 ) else [kirtu1pv] end end
	, kirtu1k = case when lahde = '41' then [kirtu1k] else case when [kirtu1pv] is not null then case when cast(substring([kirtu1pv], 5, 2 ) as int) < 8 then '1' else '2' end else [kirtu1pv] end end
	, ensisop
	, NULL AS tilmaa
	, tutkyo = null
	, tunimyo = null
	, koyo = null
	, konimyo = null
	, paine = null
	, painenim = null
	, kk = null
	, tdk = null
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	, ltop
	, laak
	, ophal = '1'
	, kvopisk
	, suormaa = null
	,[tietolahde]='2_8b_sopv_24'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM TK_H9098_CSC.[dbo].[TK_K2_8b_sopv_24]


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
	, syntv = case syntv when '19XX' then '9999' else syntv end
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
	-- , alvv_opa = null --alvv_iscfinarrow2013 (alustava, varmistuu myöhemmin tehdäänkö näin vai uusia muuttujia. JS 30.6.2023)
	, alvv_iscfinarrow2013 as alvv_opa
	-- , alvv_opa_lasna = null --alvv_iscfinarrow2013_lasna (alustava, varmistuu myöhemmin tehdäänkö näin vai uusia muuttujia. JS 30.6.2023)
	, alvv_iscfinarrow2013_lasna as alvv_opa_lasna
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
	, kirtu1v = case when lahde = '41' then [kirtu1v] else case when [kirtu1pv] is not null then substring([kirtu1pv], 1, 4 ) else [kirtu1pv] end end
	, kirtu1k = case when lahde = '41' then [kirtu1k] else case when [kirtu1pv] is not null then case when cast(substring([kirtu1pv], 5, 2 ) as int) < 8 then '1' else '2' end else [kirtu1pv] end end
	, ensisop
	, NULL AS tilmaa
	, tutkyo = null
	, tunimyo = null
	, koyo = null
	, konimyo = null
	, paine = null
	, painenim = null
	, kk = null
	, tdk = null
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	, ltop
	, laak
	, ophal = '1'
	, kvopisk
	, suormaa
	,[tietolahde]='2_8b_sopv_25'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM TK_H9098_CSC.[dbo].[TK_K2_8b_sopv_25]

UNION ALL

SELECT 
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, case when koulk in ('775101','775201') then '999999'
		   when koulk = '' then '-1'
	       else coalesce(koulk,'-1')
	  end as koulk
	, kkun
	, sp
	, aikielir1x = case aikielir1x when 'fi' then 'fs' else aikielir1x end
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, d2.kansalaisuus_versio2_koodi as kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvvkksek AS alvv_kksek
	, alvvkkseklasna AS alvv_kksek_lasna
	, alvvsek AS alvv_sek
	, alvvkkseklasna AS alvv_sek_lasna
	, alvvkk AS alvv_kk
	, alvvkklasna AS alvv_kk_lasna
	, alvvopa AS alvv_opa
	, alvvopalasna AS alvv_opa_lasna
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
	, kk = null
	, tdk = null
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	, ltop = case when ltop = '1' then '1' end --opiskelijaennakossa ltop päätelty lastusta k/e; TK-aineistoissa ja ilm. tutkintoennakossa ltop ~ lastu / CSC Juha 24.9.2021
	, laak = CASE koulk WHEN '775101' THEN 1 WHEN '775201' THEN 2 ELSE NULL END
	, ophal = '1'
	, kvopisk = null
	, suormaa = null
	,[tietolahde] = 'antero sa_virta_otp_tk_opisk_ennakko'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM Antero.sa.[sa_virta_otp_tk_opisk_ennakko] v
LEFT JOIN VipunenTK.dbo.d_valtio d on v.kansalr2 = d.maa_koodi
LEFT JOIN VipunenTK.dbo.d_kansalaisuus_versio2 d2 on d2.kansalaisuus_versio2_koodi =	CASE 
																							WHEN v.kansalr2 = '246' THEN 1
																							WHEN d.etamaa_koodi = 1 OR d.eumaa_koodi = 1 THEN 2
																							WHEN d.id IS NULL OR d.id = '-1' THEN NULL
																							ELSE 9
																						END

) kaikkivuodet






GO


