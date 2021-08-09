USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_4_Amm_koulutuksen_tutkinnot]    Script Date: 9.7.2021 11:27:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_sa_2_4_Amm_koulutuksen_tutkinnot] AS

-- truncate table vipunentk_dw..sa_2_4_Amm_koulutuksen_tutkinnot
-- insert into vipunentk_dw..sa_2_4_Amm_koulutuksen_tutkinnot select * from v_sa_2_4_Amm_koulutuksen_tutkinnot

--drop table vipunentk_dw.dbo.sa_2_4_Amm_koulutuksen_tutkinnot
--select * into vipunentk_dw.dbo.sa_2_4_Amm_koulutuksen_tutkinnot from v_sa_2_4_Amm_koulutuksen_tutkinnot

SELECT
	 tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = CAST(kaikkivuodet.lahde as nvarchar(2))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
	
	/* vanha
	CASE WHEN lahde = 34 and tunn = '' THEN cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
			ELSE cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
			END   -- Ohjataan oppisopimuskoulutuksen lähteellä opjarj-muuttujan avain tyhjien arvojen tilalle - Lasse 26.5.2014
			*/
--	,tunn = CAST(kaikkivuodet.tunn as nvarchar(5))
	,jarj = CAST(kaikkivuodet.jarj as nvarchar(10))
	,opjarj = CAST(kaikkivuodet.opjarj as nvarchar(10))
	,koulk = CAST(kaikkivuodet.koulk as nvarchar(6))
	,tunim = CAST(kaikkivuodet.tunim as nvarchar(5))
	,sutunim = CAST(kaikkivuodet.sutunim as nvarchar(30))
	,rutunim = CAST(kaikkivuodet.rutunim as nvarchar(30))
	,koohj = CAST(kaikkivuodet.koohj as nvarchar(4))
	,sukoohj = CAST(kaikkivuodet.sukoohj as nvarchar(60))
	,rukoohj = CAST(kaikkivuodet.rukoohj as nvarchar(60))
	,tutklaja = CAST(kaikkivuodet.tutklaja as nvarchar(1))
	,tutktav = cast(coalesce(nullif(kaikkivuodet.tutktav, ''), '-1') as nvarchar(2))
	,kkieli = CAST(kaikkivuodet.kkieli as nvarchar(2))
	,kkun = CAST(kaikkivuodet.kkun as nvarchar(3))
	,ophal = CAST(coalesce(nullif(kaikkivuodet.ophal,''),'1') as nvarchar(2))
	,sp = CAST(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = CAST(kaikkivuodet.aikielir1 as nvarchar(2))
	,alvv = CAST(kaikkivuodet.alvv as nvarchar(4))
	,allk = CAST(kaikkivuodet.allk as nvarchar(1))
	,aiopis = CAST(kaikkivuodet.aiopis as nvarchar(1))
	,aikoul = CAST(kaikkivuodet.aikoul as nvarchar(1)) -- uusi sarake 2012
	,ika2 = cast(coalesce(nullif(nullif(kaikkivuodet.ika2 , '') , 'XX'), '-1') as nvarchar(2))
	--,kirikar1 = CAST(kaikkivuodet.kirikar1 as nvarchar(2))
	,kirikar1 = cast(coalesce(nullif(nullif(kaikkivuodet.kirikar1 , '') , 'XX'), '-1') as nvarchar(2))

	,suorpvm = CAST(kaikkivuodet.suorpvm as nvarchar(8))
	,lkm = CAST(kaikkivuodet.lkm as int)
	,tutalv = CAST(kaikkivuodet.tutalv as nvarchar(4))
	,tutalk = CAST(kaikkivuodet.tutalk as nvarchar(1))
	,hyvennen = CAST(kaikkivuodet.hyvennen as int)
	,hyvaik = CAST(kaikkivuodet.hyvaik as int)
	,suorkouaik = CAST(kaikkivuodet.suorkouaik as int) -- nimi muuttunut 2012
	,ovyht = CAST(kaikkivuodet.ovyht as int)
	,tyop = CAST(kaikkivuodet.tyop as int)
	,ammos = CAST(kaikkivuodet.ammos as int)
	,opintokok = CAST(kaikkivuodet.opintokok as int)
	,tyov = CAST(kaikkivuodet.tyov as nvarchar(1))
	,rahoitus = cast(cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as int) as nvarchar(2))
	,vayla = CAST(kaikkivuodet.vayla as nvarchar(1))
	,alaika = CAST(VipunenTK_SA.[dbo].RefineDateBegin(kaikkivuodet.alaika) as nvarchar(8))
	,loaika = CAST(VipunenTK_SA.[dbo].RefineDateEnd(kaikkivuodet.loaika) as nvarchar(8))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse	
	
	--,toteuma_tutk  = CAST(kaikkivuodet.toteuma_tutk as nvarchar(1)) -- nimi muuttunut 2012
	,toteuma_tutk = 
	CASE 
		WHEN lahde = 32 THEN 1
		ELSE CAST(kaikkivuodet.toteuma_tutk as nvarchar(1))
	END        -- Opetussuunnitelmaperusteisen ammatillisen tutkinnon suorittaneet tulkitaan "suorittanut koko tutkinnon" -- 26.6.2014 Lasse

	,yrit = CAST(kaikkivuodet.yrit as nvarchar(1))
	,purku = CAST(kaikkivuodet.purku as nvarchar(1))
	,todis = CAST(kaikkivuodet.todis as nvarchar(1))
	,tol2008 = CAST(kaikkivuodet.tol2008 as nvarchar(5))
	,koko = CAST(kaikkivuodet.koko as nvarchar(1))
	,tyansek = CAST(kaikkivuodet.tyansek as nvarchar(1))
	,suorosat   = CAST(kaikkivuodet.suorosat as int)
	,tunn_opisk = cast(coalesce(nullif(kaikkivuodet.tunn_opisk , ''), '-1') as nvarchar(5))
	,jarj_opisk = cast(coalesce(nullif(kaikkivuodet.jarj_opisk , ''), '-1') as nvarchar(10))
	,kkun_opisk = cast(coalesce(nullif(kaikkivuodet.kkun_opisk , ''), '-1') as nvarchar(3))
	,koso = cast(kaikkivuodet.koso as nvarchar(1))
	,opso = cast(kaikkivuodet.opso as nvarchar(1))
	,tietolahde = CAST(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = CAST(kaikkivuodet.rivinumero as nvarchar(10))


  FROM (
  
--Historia-aineisto
select
	tilv = left(suoraika,4)
	,lahde = 
		case 
			when lahde=1 then '22'
			when lahde=2 and oppis=2 then '35'
			when lahde=2 and oppis=1 then '34'
			else '-1'
		end
	,tunn = oltunnus
	,jarj = op.koulutuksen_jarjestajakoodi
	,opjarj
	,koulk
	,tunim = null
	,sutunim = null
	,rutunim = null
	,koohj = null
	,sukoohj = null
	,rukoohj = null
	,tutklaja
	,tutktav = case when kouljat=1 and lahde=2 then '1' when kouljat=8 and lahde=2 then '2' when kouljat not in (1,8) and lahde=2 then '9' else '-1' end
	,kkieli = case kkielir1 when 'fs' then 'fi' else kkielir1 end
	,kkun
	,ophal = null
	,sp
	,aikielir1
	,alvv = case alvv when 'BBBB' then '9999' else alvv end
	,allk
	,aiopis = 
		case 
			when syntv='19XX' or alvv='BBBB' then '9'
			else
				case
					when cast(cast(left(suoraika,4) as int)-syntv as int)-(cast(left(suoraika,4) as int)-cast(alvv as int))<25 then '1'
					else '2'
				end
		end
	,aikoul = case when kouljat=1 and lahde=1 then '1' when kouljat=3 and lahde=1 then '2' else '-1' end
	,ika2 = null
	,kirikar1 =
		case 
			when syntv='19XX' then '-1'
			else 
				case
					when cast(left(suoraika,4) as int)-syntv between 15 and 19 then '15'
					when cast(left(suoraika,4) as int)-syntv between 20 and 24 then '20'
					when cast(left(suoraika,4) as int)-syntv between 25 and 29 then '25'
					when cast(left(suoraika,4) as int)-syntv between 30 and 34 then '30'
					when cast(left(suoraika,4) as int)-syntv between 35 and 39 then '35'
					when cast(left(suoraika,4) as int)-syntv between 40 and 44 then '40'
					when cast(left(suoraika,4) as int)-syntv between 45 and 49 then '45'
					when cast(left(suoraika,4) as int)-syntv between 50 and 54 then '50'
					when cast(left(suoraika,4) as int)-syntv between 55 and 59 then '55'
					when cast(left(suoraika,4) as int)-syntv > 60 then '60'
					else '-1'
				end
		end
	,suorpvm = CONVERT (VARCHAR(8), suoraika, 112)
	,lkm
	,tutalv = null
	,tutalk = null
	,hyvennen = null
	,hyvaik = null
	,suorkouaik = null
	,ovyht = null
	,tyop = null
	,ammos = null
	,opintokok = null
	,tyov = null
	,rahoitus = null
	,vayla = null
	,alaika = null
	,loaika = null
	,tavoite = null
	,toteuma_tutk = 1 --aineistossa vain koko tutkinnon suorittaneet
	,yrit = null
	,purku = null
	,todis = null
	,tol2008 = null
	,koko = null
	,tyansek = null
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='8_1_Historia_aineisto_tutkinnot'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_8_1_sopv_16] tk
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.oltunnus
WHERE lahde IN (1,2)

UNION ALL

select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	,null as aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_11]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	,null as aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_11]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	,null as aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_11]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_12]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_12]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_12]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	, suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	, toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4d_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4d_sopv_12]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_13]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(8), cast([alaika]+'01' as date), 112)
    ,[loaika]-- = CONVERT (VARCHAR(8), cast([loaika]+'01' as date), 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_13]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_13]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	, suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika-- = CONVERT(VARCHAR(8), alaika, 112)
	,loaika-- = CONVERT(VARCHAR(8), loaika, 112)
	,tavoite
	, toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4d_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4d_sopv_13]

/* 14a, 14b ja 14c aineistot vielä rikki -- Lasse 27.11.2014
Otettu mukaan 20.1.2015 / Jarmo */

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_14]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_14]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_14]
/* Otettu mukaan 20.1.2015 / Jarmo 
*/

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_15]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_15]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_15]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_16]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_16]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_16]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_17]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_17]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_17]

union all

select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_18]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_18]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_18]

union all

select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav = NULL
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit = NULL
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4a_sopv_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4a_sopv_19]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav = NULL
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit = NULL
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4b_sopv_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4b_sopv_19]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,ika2 = null
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit = NULL
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4c_sopv_19]

union all

--a ja b aineistosta K2.4h tilastovuodesta 2019 alkaen
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj = jarj
	,koulk
	,tunim
	,sutunim = NULL
	,rutunim = NULL
	,koohj
	,sukoohj = NULL
	,rukoohj = NULL
	,tutklaja
	,tutktav = NULL
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	,aikoul
	,ika2 =	case 
				when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
				when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
			end 
	,kirikar1 = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,suorpvm = NULL
	,lkm
	,tutalv = NULL
	,tutalk = NULL
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla = NULL
    ,[alaika] = NULL
    ,[loaika] = NULL
	,tavoite
	,toteuma_tutk 
	,yrit = NULL
	,purku 
	,todis = NULL
	,tol2008
	,koko 
	,tyansek 
	,suorosat = NULL
	,tunn_opisk 
	,jarj_opisk 
	,kkun_opisk
	,koso
	,opso 
	,[tietolahde]='K2_4h_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4h_2019_sopv_21]
where toteuma_tutk is not null
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj = NULL
	,koulk
	,tunim = NULL
	,sutunim = NULL
	,rutunim = NULL
	,koohj = NULL
	,sukoohj = NULL
	,rukoohj = NULL
	,tutklaja = NULL
	,tutktav = NULL
	,kkieli
	,kkun
	,ophal = NULL
	,sp
	,aikielir1
	,alvv = NULL
	,allk = NULL
	,aiopis = NULL
	,aikoul -- uusi sarake 2012
	,ika2 = NULL
	,kirikar1 = NULL
	,suorpvm
	,lkm
	,tutalv = NULL
	,tutalk = NULL
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov = NULL
	,rahoitus = NULL
	,vayla = NULL
	,alaika = NULL
	,loaika = NULL
	,tavoite = NULL
	,toteuma_tutk = NULL -- nimi muuttunut 2012
	,yrit = NULL
	,purku = NULL
	,todis = NULL
	,tol2008 = NULL
	,koko = NULL
	,tyansek = NULL
	,suorosat = NULL
	,tunn_opisk = NULL
	,jarj_opisk = NULL
	,kkun_opisk = NULL
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_20'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4c_sopv_20]

union all

select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj = jarj
	,koulk
	,tunim
	,sutunim = NULL
	,rutunim = NULL
	,koohj
	,sukoohj = NULL
	,rukoohj = NULL
	,tutklaja
	,tutktav = NULL
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	,aikoul
	,ika2 =	case 
				when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
				when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
			end 
	,kirikar1 =	case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,suorpvm = NULL
	,lkm
	,tutalv = NULL
	,tutalk = NULL
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla = NULL
    ,[alaika] = NULL
    ,[loaika] = NULL
	,tavoite
	,toteuma_tutk 
	,yrit = NULL
	,purku 
	,todis = NULL
	,tol2008
	,koko 
	,tyansek 
	,suorosat = NULL
	,tunn_opisk 
	,jarj_opisk 
	,kkun_opisk
	,koso
	,opso
	,[tietolahde]='K2_4h_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4h_2020_sopv_21]
where toteuma_tutk is not null
/*
--ei 2.4c sopv21 taulua vielä
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj = NULL
	,koulk
	,tunim = NULL
	,sutunim = NULL
	,rutunim = NULL
	,koohj = NULL
	,sukoohj = NULL
	,rukoohj = NULL
	,tutklaja = NULL
	,tutktav = NULL
	,kkieli
	,kkun
	,ophal = NULL
	,sp
	,aikielir1
	,alvv = NULL
	,allk = NULL
	,aiopis = NULL
	,aikoul -- uusi sarake 2012
	,ika2 = NULL
	,kirikar1 = NULL
	,suorpvm
	,lkm
	,tutalv = NULL
	,tutalk = NULL
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov = NULL
	,rahoitus = NULL
	,vayla = NULL
	,alaika = NULL
	,loaika = NULL
	,tavoite = NULL
	,toteuma_tutk = NULL -- nimi muuttunut 2012
	,yrit = NULL
	,purku = NULL
	,todis = NULL
	,tol2008 = NULL
	,koko = NULL
	,tyansek = NULL
	,suorosat = NULL
	,tunn_opisk = NULL
	,jarj_opisk = NULL
	,kkun_opisk = NULL
	,koso = null
	,opso = null
	,[tietolahde]='2_4c_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4c_sopv_21]
*/

) kaikkivuodet


GO


