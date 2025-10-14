USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_4_Amm_koulutuksen_tutkinnot]    Script Date: 14.10.2025 15.43.34 ******/
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
	--Huom. tilv21 alkaen aineiston (2, 3) <-> d_hallinnonala2 (3, 2):
	,ophal = cast(
		case 
			--lukio
			when lahde < 30 then 
				case 
					when coalesce(coalesce(d.koulutuksen_jarjestajan_korvaavakoodi,d.koulutuksen_jarjestajakoodi), '') = '0145076-7' --'Ålands Landskapsregering'
					then '3' --Muiden hallinnonalojen alainen koulutus
					else '1' --Opetushallinto, pl. työvoimakoulutus
				end
			--amm
			when ophal = '1' then '1'
			when ophal = '3' then '2' --Opetushallinto, työvoimakoulutus
			when ophal = '2' 
				and tilv < 2021
				and (
					rahoitus = '10'
					or (
						coalesce(tunn, '') not in ('90018', '30049') --'Pohjois-Kalotin koulutuskeskus'
						and coalesce(coalesce(d.koulutuksen_jarjestajan_korvaavakoodi, d.koulutuksen_jarjestajakoodi), '') not in (
							'0145076-7', '2153105-4', '150622-3', '0909306-3' --'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'
						)
					)
				)
				then '2'
			when ophal = '2' then '3'
			else '-1'
		end 
		as nvarchar(2)
	)
	,sp = CAST(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = CAST(kaikkivuodet.aikielir1 as nvarchar(2))
	,alvv = CAST(kaikkivuodet.alvv as nvarchar(4))
	,allk = CAST(kaikkivuodet.allk as nvarchar(1))
	,aiopis = CAST(kaikkivuodet.aiopis as nvarchar(1))
	,aikoul = CAST(kaikkivuodet.aikoul as nvarchar(1)) -- uusi sarake 2012
	,kirika2 = cast(coalesce(nullif(kaikkivuodet.kirika2 , '') , '-1') as nvarchar(2))
	,kirikar1 = cast(coalesce(nullif(kaikkivuodet.kirikar1 , '') , '-1') as nvarchar(2))
	,tilvika2 = cast(coalesce(nullif(kaikkivuodet.tilvika2 , '') , '-1') as nvarchar(2))
	,tilvikar1 = cast(coalesce(nullif(kaikkivuodet.tilvikar1, '') , '-1') as nvarchar(2))
	,tilvika = coalesce(nullif(kaikkivuodet.tilvika, '') , -1) -- Tarkka ikä CSCVIPUNEN-3747

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
	,tuva = cast(kaikkivuodet.tuva as nvarchar(2))
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
	,kirika2 = 
		case 
			when syntv='19XX' or alvv = 'BBBB' then '-1'
			else 
				case
					when cast(alvv as int)-cast(syntv as int) between 15 and 59 then cast(alvv as int)-cast(syntv as int)
					when cast(alvv as int)-cast(syntv as int) > 60 then '60'
					else '-1'
				end
		end
	,tilvika2 =
		case 
			when syntv='19XX' then '-1'
			else 
				case
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 15 and 59 then cast(left(suoraika,4) as int)-cast(syntv as int)
					when cast(left(suoraika,4) as int)-cast(syntv as int) > 60 then '60'
					else '-1'
				end
		end
	,kirikar1 =
		case 
			when syntv='19XX' or alvv = 'BBBB' then '-1'
			else 
				case
					when cast(alvv as int)-cast(syntv as int) between 15 and 19 then '15'
					when cast(alvv as int)-cast(syntv as int) between 20 and 24 then '20'
					when cast(alvv as int)-cast(syntv as int) between 25 and 29 then '25'
					when cast(alvv as int)-cast(syntv as int) between 30 and 34 then '30'
					when cast(alvv as int)-cast(syntv as int) between 35 and 39 then '35'
					when cast(alvv as int)-cast(syntv as int) between 40 and 44 then '40'
					when cast(alvv as int)-cast(syntv as int) between 45 and 49 then '45'
					when cast(alvv as int)-cast(syntv as int) between 50 and 54 then '50'
					when cast(alvv as int)-cast(syntv as int) between 55 and 59 then '55'
					when cast(alvv as int)-cast(syntv as int) > 60 then '60'
					else '-1'
				end
		end
	,tilvikar1 =
		case 
			when syntv='19XX' then '-1'
			else 
				case
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 15 and 19 then '15'
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 20 and 24 then '20'
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 25 and 29 then '25'
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 30 and 34 then '30'
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 35 and 39 then '35'
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 40 and 44 then '40'
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 45 and 49 then '45'
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 50 and 54 then '50'
					when cast(left(suoraika,4) as int)-cast(syntv as int) between 55 and 59 then '55'
					when cast(left(suoraika,4) as int)-cast(syntv as int) > 60 then '60'
					else '-1'
				end
		end
	,tilvika =
		case 
			when syntv = '19XX' THEN -1
			else CAST(LEFT(suoraika,4)  as int) - CAST(syntv as int)
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,aikoul -- uusi sarake 2012
	,kirika2 = null
	,tilvika2 = null
	,kirikar1
	,tilvikar1 = null
	,tilvika = null
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
	,tuva = '-1'
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
	,kirika2 = case 
				when syntv = '9999' then '-1' 
				when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
				when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
			end
	,tilvika2 = case 
					when syntv = '9999' then '-1' 
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast(cast(tilv as int) - cast(syntv as int) as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,kirikar1 = case 
					when syntv = '9999' then '-1' 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvikar1 = case 
					when syntv = '9999' then '-1' 
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast((cast(tilv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvika = case 
					when syntv = '9999' then -1
					else cast(tilv as int) - cast(syntv as int)
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
	,tuva = '-1'
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
	,kirika2 = NULL
	,tilvika2 = NULL
	,kirikar1 = NULL
	,tilvikar1 = NULL
	,tilvika = NULL
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
	,tuva = '-1'
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
	,kirika2 = case 
				when syntv = '9999' then '-1' 
				when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
				when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
			end
	,tilvika2 = case 
					when syntv = '9999' then '-1' 
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast(cast(tilv as int) - cast(syntv as int) as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,kirikar1 = case 
					when syntv = '9999' then '-1' 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvikar1 = case 
					when syntv = '9999' then '-1' 
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast((cast(tilv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvika = case 
					when syntv = '9999' then -1
					else cast(tilv as int) - cast(syntv as int)
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
	,tuva = '-1'
	,[tietolahde]='K2_4h_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4h_2020_sopv_21]
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
	,kirika2 = NULL
	,tilvika2 = NULL
	,kirikar1 = NULL
	,tilvikar1 = NULL
	,tilvika = NULL
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
	,tuva = '-1'
	,[tietolahde]='2_4c_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4c_sopv_21]

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
	,kirika2 = case 
				when syntv = '9999' then '-1' 
				when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
				when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
			end
	,tilvika2 = case 
					when syntv = '9999' then '-1' 
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast(cast(tilv as int) - cast(syntv as int) as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,kirikar1 = case 
					when syntv = '9999' then '-1' 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvikar1 = case 
					when syntv = '9999' then '-1'
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast((cast(tilv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvika = case 
					when syntv = '9999' then -1
					else cast(tilv as int) - cast(syntv as int)
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
	,tuva = '-1'
	,[tietolahde]='K2_4h_sopv_22'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_22] --tämäkin mukaan
where toteuma_tutk is not null

UNION all

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
	,ophal
	,sp
	,aikielir1
	,alvv = NULL
	,allk = NULL
	,aiopis = NULL
	,aikoul -- uusi sarake 2012
	,kirika2 = NULL
	,tilvika2 = NULL
	,kirikar1 = NULL
	,tilvikar1 = NULL
	,tilvika = NULL
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
	,tuva = '-1'
	,[tietolahde]='2_4c_sopv_22'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4c_sopv_22]

UNION all

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
	,kirika2 = case
				when syntv = '9999' then '-1'
				when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
				when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
			end
	,tilvika2 = case
					when syntv = '9999' then '-1'
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast(cast(tilv as int) - cast(syntv as int) as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,kirikar1 = case
					when syntv = '9999' then '-1'
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvikar1 = case
					when syntv = '9999' then '-1'
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast((cast(tilv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvika = case 
					when syntv = '9999' then -1
					else cast(tilv as int) - cast(syntv as int)
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
	,tuva = '-1'
	,[tietolahde]='K2_4h_sopv_23'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_23] --tämäkin mukaan
where toteuma_tutk is not null

UNION all

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
	,ophal
	,sp
	,aikielir1
	,alvv = NULL
	,allk = NULL
	,aiopis = NULL
	,aikoul -- uusi sarake 2012
	,kirika2 = NULL
	,tilvika2 = NULL
	,kirikar1 = NULL
	,tilvikar1 = NULL
	,tilvika = NULL
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
	,tuva = '-1'
	,[tietolahde]='2_4c_sopv_23'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4c_sopv_23]

UNION all

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
	,kirika2 = case
				when syntv = '9999' then '-1'
				when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
				when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
			end
	,tilvika2 = case
					when syntv = '9999' then '-1'
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast(cast(tilv as int) - cast(syntv as int) as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,kirikar1 = case
					when syntv = '9999' then '-1'
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvikar1 = case
					when syntv = '9999' then '-1'
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast((cast(tilv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvika = case 
					when syntv = '9999' then -1
					else cast(tilv as int) - cast(syntv as int)
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
	,tuva = case when tuva is null then '-1' else tuva end
	,[tietolahde]='K2_4h_sopv_24'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_24] --tämäkin mukaan
where toteuma_tutk is not null

UNION all

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
	,ophal
	,sp
	,aikielir1
	,alvv = NULL
	,allk = NULL
	,aiopis = NULL
	,aikoul -- uusi sarake 2012
	,kirika2 = NULL
	,tilvika2 = NULL
	,kirikar1 = NULL
	,tilvikar1 = NULL
	,tilvika = NULL
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
	,tuva = '-1'
	,[tietolahde]='2_4c_sopv_24'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4c_sopv_24]

UNION all

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
	,kirika2 = case
				when syntv = '9999' then '-1'
				when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
				when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
			end
	,tilvika2 = case
					when syntv = '9999' then '-1'
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast(cast(tilv as int) - cast(syntv as int) as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,kirikar1 = case
					when syntv = '9999' then '-1'
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvikar1 = case
					when syntv = '9999' then '-1'
					when cast(tilv as int) - cast(syntv as int) between 15 and 59 then cast((cast(tilv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
					when cast(tilv as int) - cast(syntv as int) between 60 and 110 then '60'
				end
	,tilvika = case 
					when syntv = '9999' then -1
					else cast(tilv as int) - cast(syntv as int)
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
	,tuva = case when tuva is null then '-1' else tuva end
	,[tietolahde]='K2_4h_sopv_25'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_25] --tämäkin mukaan
where toteuma_tutk is not null

UNION all

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
	,ophal
	,sp
	,aikielir1
	,alvv = NULL
	,allk = NULL
	,aiopis = NULL
	,aikoul -- uusi sarake 2012
	,kirika2 = NULL
	,tilvika2 = NULL
	,kirikar1 = NULL
	,tilvikar1 = NULL
	,tilvika = NULL
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
	,tuva = '-1'
	,[tietolahde]='2_4c_sopv_25'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4c_sopv_25]

) kaikkivuodet

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d on d.oppilaitos_avain = coalesce(nullif(coalesce(nullif(jarj, ''), opjarj), ''), tunn)

GO


