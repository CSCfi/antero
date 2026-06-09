USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_9_Korkeakoulut_tutkinnot]    Script Date: 5.11.2025 10.22.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









-- sopv_24 alkaen yliopistopuolella uusi muuttuja kirtu1pv. Vaikka muuttuja on vvvvkkkpp eli päivän tarkkuudella niin sitä on Jukka Haapamäen mukaan tarkoitus käyttää vastaavasti kuin amk-puolen
-- kirtu1v ja kirtu1k muuttujia. kirtu1pv tiedosta otetaan vastaavat tiedot ja liitetään kirtu1v ja kirtu1k muuttujiin, joita jatkossa voidaan hyödyntää molemmilla sektoreilla. Aiemmin yliopistopuolella
-- nuo jätettiin null-arvoisiksi ja näkyivät kuutioissa Tuntemattomina. Kuutioissakin ko muuttujilla on sektorineutraalit nimet. 12.6.2024 Mika

ALTER VIEW [dbo].[v_sa_2_9_Korkeakoulut_tutkinnot] AS

-- truncate table vipunentk_dw.dbo.sa_2_9_Korkeakoulut_tutkinnot
-- insert into vipunentk_dw.dbo.sa_2_9_Korkeakoulut_tutkinnot select * from v_sa_2_9_Korkeakoulut_tutkinnot

SELECT
	 tilv = cast(kaikkivuodet.tilv as varchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,aineisto = cast(kaikkivuodet.aineisto as varchar(1))
	,lahde = cast(kaikkivuodet.lahde as varchar(2))
	,tunn = cast(kaikkivuodet.tunn as varchar(5))
	,jarj = cast(kaikkivuodet.jarj as varchar(10))
	,koulk = cast(kaikkivuodet.koulk as varchar(6))
	,opm95opa = cast(kaikkivuodet.opm95opa as varchar(2))
	,kkun = cast(kaikkivuodet.kkun as varchar(3))
	,sp = cast(kaikkivuodet.sp as varchar(1))
	,aikielir1x = cast(kaikkivuodet.aikielir1x as varchar(2))
	,syntv = cast(coalesce(nullif(kaikkivuodet.syntv,''),'9999') as varchar(4))
	,tilvaskun = cast(kaikkivuodet.tilvaskun as varchar(3))
	,tilvaskunx = cast(kaikkivuodet.tilvaskunx as varchar(3))
	,kansalr2 = cast(kaikkivuodet.kansalr2 as varchar(1))
	,alvv = cast(kaikkivuodet.alvv as varchar(4))
	,allk = cast(kaikkivuodet.allk as varchar(1))
	,suorv = cast(kaikkivuodet.suorv as varchar(4))
	,suorlk = cast(kaikkivuodet.suorlk as varchar(1))
	,rahlahde = cast(kaikkivuodet.rahlahde as varchar(1))
	,alvv_kksek = cast(kaikkivuodet.alvv_kksek as varchar(4))
	,alvv_kksek_lasna = cast(kaikkivuodet.alvv_kksek_lasna as varchar(4))
	,alvv_sek = cast(kaikkivuodet.alvv_sek as varchar(4))
	,alvv_sek_lasna = cast(kaikkivuodet.alvv_sek_lasna as varchar(4))
	,alvv_kk = cast(kaikkivuodet.alvv_kk as varchar(4))
	,alvv_kk_lasna = cast(kaikkivuodet.alvv_kk_lasna as varchar(4))
	,alvv_opa = cast(kaikkivuodet.alvv_opa as varchar(4))
	,alvv_opa_lasna = cast(kaikkivuodet.alvv_opa_lasna as varchar(4))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutkamk = cast(kaikkivuodet.tutkamk as varchar(3))
	,tunimamk = cast(kaikkivuodet.tunimamk as varchar(60))
	,koamk = cast(kaikkivuodet.koamk as varchar(4))
	,konimamk = cast(kaikkivuodet.konimamk as varchar(60))
	,suun_v = cast(kaikkivuodet.suun_v as varchar(5))
	,svnim = cast(kaikkivuodet.svnim as varchar(60))
	,koultyp = cast(kaikkivuodet.koultyp as varchar(1))
	,kkieli = cast(kaikkivuodet.kkieli as varchar(2))
	,lasnalk = cast(kaikkivuodet.lasnalk as int)
	,poissalk = cast(kaikkivuodet.poissalk as int)
	,oplaaj = cast(kaikkivuodet.oplaaj as int)
	,kirtu1v = cast(kaikkivuodet.kirtu1v as varchar(4))
	,kirtu1k = cast(kaikkivuodet.kirtu1k as varchar(1))
	,opyhtamk = cast(kaikkivuodet.opyhtamk as int)
	,opylamamk = cast(kaikkivuodet.opylamamk as int)
	,opmuuamk = cast(kaikkivuodet.opmuuamk as int)
	,opoamk = cast(kaikkivuodet.opoamk as int)
	,opmamk = cast(kaikkivuodet.opmamk as int)
	,opyliopamk = cast(kaikkivuodet.opyliopamk as int)
	,opulkomamk = cast(kaikkivuodet.opulkomamk as int)
	,tilmaa = cast(kaikkivuodet.tilmaa as varchar(1))
	,tutkyo = cast(kaikkivuodet.tutkyo as varchar(3))
	,tunimyo = cast(kaikkivuodet.tunimyo as varchar(60))
	,koyo = cast(kaikkivuodet.koyo as varchar(4))
	,konim = cast(kaikkivuodet.konimyo as varchar(60))
	,paine = cast(kaikkivuodet.paine as varchar(4))
	,painenim = cast(kaikkivuodet.painenim as varchar(60))
	,tdk = cast(kaikkivuodet.tdk as varchar(2))
	,om = cast(kaikkivuodet.om as varchar(1))
	,opkelp = cast(kaikkivuodet.opkelp as varchar(1))
	,opyhtyo = cast(kaikkivuodet.opyhtyo as int)
	,opulkyo = cast(kaikkivuodet.opulkyo as int)
	,opmuuyo = cast(kaikkivuodet.opmuuyo as int)
	,opoylio = cast(kaikkivuodet.opoylio as int)
	,opaylio = cast(kaikkivuodet.opaylio as int)
	,opmylio = cast(kaikkivuodet.opmylio as int)
	,opamkyo = cast(kaikkivuodet.opamkyo as int)
	,ltop  = cast(kaikkivuodet.ltop as int)
	,laak  = cast(kaikkivuodet.laak as int)
	,ophal = cast(kaikkivuodet.ophal as varchar(1))
	,kvopisk = cast(kaikkivuodet.kvopisk as varchar(1))
	,suormaa = cast(kaikkivuodet.suormaa as varchar(1))
	,liikkuvuuden_kesto = cast(kaikkivuodet.liikkuvuuden_kesto as varchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

--Historia-aineisto
	SELECT
	 tilv = left(suoraika,4)
	,aineisto = 'L'
	,lahde =
	case 
			when lahde = 3 then 42
			when lahde = 4 then 52
			else -1
		end
	,tunn = oltunnus
	,jarj = op.koulutuksen_jarjestajakoodi
	,koulk
	,opm95opa = null
	,kkun
	,sp
	,aikielir1x = aikielir1
	,syntv = case syntv when '19XX' then null else syntv end
	,tilvaskun = askun
	,tilvaskunx = null
	,kansalr2
	,alvv = case alvv when 'BBBB' then null else alvv end
	,allk
	,suorv = left(suoraika,4)
	,suorlk = null
	,rahlahde = null
	,alvv_kksek = null
	,alvv_kksek_lasna = null
	,alvv_sek = null
	,alvv_sek_lasna = null
	,alvv_kk = null
	,alvv_kk_lasna = null
	,alvv_opa = null
	,alvv_opa_lasna = null
	,lkm
	,tutkamk = null
	,tunimamk = null
	,koamk = null
	,konimamk = null
	,suun_v = null
	,svnim = null
	,koultyp = null
	,kkieli = case kkielir1 when 'fs' then 'fi' else kkielir1 end
	,lasnalk = null
	,poissalk = null
	,oplaaj = null
	,kirtu1v = null
	,kirtu1k = null
	,opyhtamk = null
	,opylamamk = null
	,opmuuamk = null
	,opoamk = null
	,opmamk = null
	,opyliopamk = null
	,opulkomamk = null
	,tilmaa = null
	,tutkyo = null
	,tunimyo = null
	,koyo = null
	,konimyo = null
	,paine = null
	,painenim = null
	,tdk = null
	,om = null
	,opkelp = null
	,opyhtyo = null
	,opulkyo = null
	,opmuuyo = null
	,opoylio = null
	,opaylio = null
	,opmylio = null
	,opamkyo = null
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='8_1_historia'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_8_1_sopv_16] tk
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.oltunnus
where lahde in (3,4) and left(suoraika,4)<2010

UNION ALL

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL 
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9a_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9a_sopv_11]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9b_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9b_sopv_11]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9c_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_11]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9a_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9a_sopv_12]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9b_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9b_sopv_12]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9c_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_12]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9a_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9a_sopv_13]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9b_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9b_sopv_13]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9c_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_13]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9a_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9a_sopv_14]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9b_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9b_sopv_14]

UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9c_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_14] -- siirtokannan taulusta puuttuu 20k riviä

UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak = NULL
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9c_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_15] 

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9c_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_16]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9c_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_17]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='2_9c_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_18]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null -- Tiedossa virhe ennen tilastovuotta 2021 CSCVIPUNEN-3559 
	,[tietolahde]='2_9c_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_9c_sopv_19]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null -- Tiedossa virhe ennen tilastovuotta 2021 CSCVIPUNEN-3559 
	,[tietolahde]='2_9c_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_9c_sopv_20]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null -- Tiedossa virhe ennen tilastovuotta 2021 CSCVIPUNEN-3559 
	,[tietolahde]='2_9c_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_9c_sopv_21]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk
	,suormaa = null
	,liikkuvuuden_kesto
	,[tietolahde]='2_9c_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_9c_sopv_22]

UNION ALL 

SELECT
	 tilv
	,cast('L' as varchar(1)) as aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	--,alvv_opa = null --alvv_iscfinarrow2013 (varmistuu myöhemmin miten menetellään, nyt sopv23 kumpikin saisi arvoja muttei samaan aikaan. JS 30.6.2023)
	,CASE WHEN [alvv_iscfinarrow2013] = '9999' THEN [alvv_opa] ELSE [alvv_iscfinarrow2013] END AS [alvv_opa]
	--,alvv_opa_lasna = null --alvv_iscfinarrow2013_lasna (varmistuu myöhemmin miten menetellään, nyt sopv23 kumpikin saisi arvoja muttei samaan aikaan. JS 30.6.2023)
	,CASE WHEN [alvv_iscfinarrow2013_lasna] = '9999' THEN [alvv_opa_lasna] ELSE [alvv_iscfinarrow2013_lasna] END AS [alvv_opa_lasna]
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk
	,suormaa = null
	,liikkuvuuden_kesto
	,[tietolahde]='2_9c_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM [TK_H9098_CSC].[dbo].[TK_K2_9c_sopv_23]

UNION ALL 

SELECT
	 tilv
	,cast('L' as varchar(1)) as aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	--,alvv_opa = null --alvv_iscfinarrow2013 (varmistuu myöhemmin miten menetellään, nyt sopv23 kumpikin saisi arvoja muttei samaan aikaan. JS 30.6.2023)
	,CASE WHEN [alvv_iscfinarrow2013] = '9999' THEN [alvv_opa] ELSE [alvv_iscfinarrow2013] END AS [alvv_opa]
	--,alvv_opa_lasna = null --alvv_iscfinarrow2013_lasna (varmistuu myöhemmin miten menetellään, nyt sopv23 kumpikin saisi arvoja muttei samaan aikaan. JS 30.6.2023)
	,CASE WHEN [alvv_iscfinarrow2013_lasna] = '9999' THEN [alvv_opa_lasna] ELSE [alvv_iscfinarrow2013_lasna] END AS [alvv_opa_lasna]
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v = case when lahde = '42' then [kirtu1v] else case when [kirtu1pv] is not null then substring([kirtu1pv], 1, 4 ) else [kirtu1pv] end end
	,kirtu1k = case when lahde = '42' then [kirtu1k] else case when [kirtu1pv] is not null then case when cast(substring([kirtu1pv], 5, 2 ) as int) < 8 then '1' else '2' end else [kirtu1pv] end end
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk
	,suormaa = null
	,liikkuvuuden_kesto
	,[tietolahde]='2_9c_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM [TK_H9098_CSC].[dbo].[TK_K2_9c_sopv_24]

UNION ALL 

SELECT
	 tilv
	,cast('L' as varchar(1)) as aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	--,alvv_opa = null --alvv_iscfinarrow2013 (varmistuu myöhemmin miten menetellään, nyt sopv23 kumpikin saisi arvoja muttei samaan aikaan. JS 30.6.2023)
	,CASE WHEN [alvv_iscfinarrow2013] = '9999' THEN [alvv_opa] ELSE [alvv_iscfinarrow2013] END AS [alvv_opa]
	--,alvv_opa_lasna = null --alvv_iscfinarrow2013_lasna (varmistuu myöhemmin miten menetellään, nyt sopv23 kumpikin saisi arvoja muttei samaan aikaan. JS 30.6.2023)
	,CASE WHEN [alvv_iscfinarrow2013_lasna] = '9999' THEN [alvv_opa_lasna] ELSE [alvv_iscfinarrow2013_lasna] END AS [alvv_opa_lasna]
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v = case when lahde = '42' then [kirtu1v] else case when [kirtu1pv] is not null then substring([kirtu1pv], 1, 4 ) else [kirtu1pv] end end
	,kirtu1k = case when lahde = '42' then [kirtu1k] else case when [kirtu1pv] is not null then case when cast(substring([kirtu1pv], 5, 2 ) as int) < 8 then '1' else '2' end else [kirtu1pv] end end
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak
	,ophal = '1'
	,kvopisk
	,suormaa
	,liikkuvuuden_kesto
	,[tietolahde]='2_9c_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct ophal
FROM [TK_H9098_CSC].[dbo].[TK_K2_9c_sopv_25]


UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x = case aikielir1x when 'fi' then 'fs' else aikielir1x end
	,syntv
	,tilvaskun
	,tilvaskunx
	,d2.kansalaisuus_versio2_koodi as kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvvkksek as alvv_kksek
	,alvvkkseklasna as alvv_kksek_lasna
	,alvvsek as alvv_sek
	,alvvseklasna as alvv_sek_lasna
	,alvvkk as alvv_kk
	,alvvkklasna as alvv_kk_lasna
	,alvvopa as alvv_opa
	,alvvopalasna as alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,laak = CASE koulk WHEN '775101' THEN 1 WHEN '775201' THEN 2 ELSE NULL END
	,ophal = '1'
	,kvopisk = null
	,suormaa = null
	,liikkuvuuden_kesto = null
	,[tietolahde]='Virta_otp'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [Antero].[sa].[sa_virta_otp_tktutkintoennakko] v
LEFT JOIN VipunenTK.dbo.d_valtio d on v.kansalr2 = d.maa_koodi
LEFT JOIN VipunenTK.dbo.d_kansalaisuus_versio2 d2 on d2.kansalaisuus_versio2_koodi =	CASE 
																							WHEN v.kansalr2 = '246' THEN 1
																							WHEN d.etamaa_koodi = 1 OR d.eumaa_koodi = 1 THEN 2
																							WHEN d.id IS NULL OR d.id = '-1' THEN NULL
																							ELSE 9
																						END

) as kaikkivuodet


GO


