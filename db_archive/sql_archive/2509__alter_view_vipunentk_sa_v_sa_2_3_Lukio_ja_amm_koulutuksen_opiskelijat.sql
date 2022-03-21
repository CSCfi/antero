USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 17.10.2019 13:01:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat] AS


-- truncate table vipunentk_dw..sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat
-- insert into vipunentk_dw..sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat


SELECT
	tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(coalesce(nullif(kaikkivuodet.lahde , ''), '-1') as nvarchar(2))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
	/* vanha
	CASE WHEN lahde = 34 and tunn = '' THEN cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
			ELSE cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
			END   -- Ohjataan oppisopimuskoulutuksen lähteellä opjarj-muuttujan avain tyhjien arvojen tilalle - Lasse 26.5.2014

	*/
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj, ''), '-1') as nvarchar(10))
	,opjarj = cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
	,koulk = cast(coalesce(nullif(kaikkivuodet.koulk , ''), '-1') as nvarchar(6))
	,kkieli = cast(coalesce(nullif(kaikkivuodet.kkieli , ''), '-1') as nvarchar(2))
	,kkun = cast(coalesce(nullif(kaikkivuodet.kkun , ''), '-1') as nvarchar(3))
	,ophal = cast(coalesce(nullif(kaikkivuodet.ophal , ''), '-1') as nvarchar(2))
	,sp = cast(coalesce(nullif(kaikkivuodet.sp , ''), '-1') as nvarchar(2))
	,aikielir1 = cast(coalesce(nullif(kaikkivuodet.aikielir1 , ''), '-1') as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,olotamm = cast(kaikkivuodet.olotamm as nvarchar(1))
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,aiopis = cast(coalesce(nullif(kaikkivuodet.aiopis , ''), '-1') as nvarchar(2))
	,kirikar1 = cast(coalesce(nullif(nullif(kaikkivuodet.kirikar1 , '') , 'XX'), '-1') as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutklajl = cast(coalesce(nullif(kaikkivuodet.tutklajl , ''), '-1') as nvarchar(2))
	,aikoul = cast(coalesce(nullif(kaikkivuodet.aikoul , ''), '-1') as nvarchar(2))
	,tutalv = cast(coalesce(nullif(kaikkivuodet.tutalv , ''), '-1') as nvarchar(4))
	,tutalk = cast(coalesce(nullif(kaikkivuodet.tutalk , ''), '-1') as nvarchar(2))
	,tutklaja = cast(coalesce(nullif(kaikkivuodet.tutklaja , ''), '-1') as nvarchar(2))
	,tunim = cast(coalesce(nullif(kaikkivuodet.tunim , ''), '-1') as nvarchar(5))
	,sutunim = cast(coalesce(nullif(kaikkivuodet.sutunim , ''), '-1') as nvarchar(30))
	,rutunim = cast(coalesce(nullif(kaikkivuodet.rutunim , ''), '-1') as nvarchar(30))
	,koohj = cast(coalesce(nullif(kaikkivuodet.koohj , ''), '-1') as nvarchar(4))
	,sukoohj = cast(coalesce(nullif(kaikkivuodet.sukoohj , ''), '-1') as nvarchar(60))
	,rukoohj = cast(coalesce(nullif(kaikkivuodet.rukoohj , ''), '-1') as nvarchar(60))
	,tutktav = cast(coalesce(nullif(kaikkivuodet.tutktav , ''), '-1') as nvarchar(2))
	,tyov = cast(coalesce(nullif(kaikkivuodet.tyov , ''), '-1') as nvarchar(2))
	,rahoitus = cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as nvarchar(2))
	,alaika = cast(VipunenTK_SA.[dbo].RefineDateBegin(kaikkivuodet.alaika) as nvarchar(8))
	,loaika = cast(VipunenTK_SA.[dbo].RefineDateEnd(kaikkivuodet.loaika) as nvarchar(8))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse
	,yrit = cast(coalesce(nullif(kaikkivuodet.yrit , ''), '-1') as nvarchar(2))
	,purku = cast(coalesce(nullif(kaikkivuodet.purku , ''), '-1') as nvarchar(2))
	,todis = cast(coalesce(nullif(kaikkivuodet.todis , ''), '-1') as nvarchar(2))
	,tol2008 = cast(coalesce(nullif(kaikkivuodet.tol2008 , ''), '-1') as nvarchar(5))
	,koko = cast(coalesce(nullif(kaikkivuodet.koko , ''), '-1') as nvarchar(2))
	,tyansek = cast(coalesce(nullif(kaikkivuodet.tyansek , ''), '-1') as nvarchar(2))
	,tilvasmaak = case	when len(tilvasmaak) = 1 then '0' + cast(kaikkivuodet.tilvasmaak as nvarchar(2))
						else cast(coalesce(nullif(kaikkivuodet.tilvasmaak , ''), '-1') as nvarchar(2))
				  end

	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as nvarchar(10))
FROM (

--Historia-aineisto
SELECT
	tilv
	, lahde = 
		case 
			when lahde=1 then '21'
			when lahde=2 and oppis=2 then '35'
			when lahde=2 and oppis=1 then '34'
			else '-1'
		end
	, tunn
	, jarj = op.koulutuksen_jarjestajakoodi
	, opjarj
	, koulk
	, kkieli = case kkielir1 when 'fs' then 'fi' else kkielir1 end
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis = 
		case 
			when ltrim(ika)='.' or alvv='9999' then '9'
			else
				case
					when cast(ika as int)-(cast(tilv as int)-cast(alvv as int))<25 then '1'
					else '2'
				end
		end
	, kirikar1 = 
		case 
			when ltrim(ika)='.' then '-1'
			else 
				case
					when cast(ika as int) between 15 and 19 then '15'
					when cast(ika as int) between 20 and 24 then '20'
					when cast(ika as int) between 25 and 29 then '25'
					when cast(ika as int) between 30 and 34 then '30'
					when cast(ika as int) between 35 and 39 then '35'
					when cast(ika as int) between 40 and 44 then '40'
					when cast(ika as int) between 45 and 49 then '45'
					when cast(ika as int) between 50 and 54 then '50'
					when cast(ika as int) between 55 and 59 then '55'
					when cast(ika as int) > 60 then '60'
					else '-1'
				end
		end
	, lkm
	, tutklajl = 
		case 
			when koulk = '301101' then '1'
			when koulk = '301102' then '2'--IB
			when koulk = '301103' then '3'--Reifeprüfung
			when koulk = '309901' then '4'--Gymnasieexamen
			when koulk = '301104' then '5'--EB
			else '-1'
		end
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim = null
	, sutunim = null
	, rutunim = null
	, koohj = null
	, sukoohj = null
	, rukoohj = null
	, tutktav
	, tyov
	, rahoitus
	, alaika = null
	, loaika = null
	, tavoite
	, yrit = null
	, purku = null
	, todis = null
	, tol2008 = null
	, koko = null
	, tyansek = null
	, tilvasmaak = asmaak
	,[tietolahde]='8_2_Historia_aineisto_opiskelijat'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_8_2_sopv_16] tk
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.tunn
where lahde in (1,2) and tilv<2010

UNION ALL

SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika 
	, loaika 
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_11]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun =
		CASE 
			WHEN len(kkun) = 1 THEN '00' + kkun
			WHEN len(kkun) = 2 THEN '0' + kkun
			ELSE kkun
		END
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_11]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_11]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3d_Lukio_ja_amm_koulutuksen_opiskelijat_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3d_sopv_11]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_12]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_12]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_12]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3d_Lukio_ja_amm_koulutuksen_opiskelijat_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3d_sopv_12]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_113'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_13]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_13]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_13]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3d_Lukio_ja_amm_koulutuksen_opiskelijat_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3d_sopv_13]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_14]

/* aineistot 14b, 14c rikki vielä -- Lasse 27.11.2014 
Otettu mukaan 20.1.2015 / Jarmo */
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_14]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_14]
/* Otettu mukaan 20.1.2015 / Jarmo 
*/

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_15]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_15]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_15]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_16]
-- Tarjolla on myös TK_2_3e_sopv_15 mutta e-aineistoja ei ole aiempiakaan, joten sitä ei oteta mukaan. / CSC Jarmo 3.8.2015



union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_16]


union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_16]

union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_17]

union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_17]


union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_17]

union all

SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_18]

union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_18]


union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_18]

union all

SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit = NULL
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3a_sopv_19]

union all

SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav = NULL
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit = NULL
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3b_sopv_19]

union all

SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav = NULL
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit = NULL
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3c_sopv_19]

) kaikkivuodet





GO
USE [ANTERO]