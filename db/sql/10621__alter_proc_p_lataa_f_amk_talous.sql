USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_talous]    Script Date: 10.3.2025 8.33.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_f_amk_talous] AS

TRUNCATE TABLE dw.f_amk_talous

INSERT INTO dw.f_amk_talous
           (d_amk_id
		   ,d_ohjauksenala_id
		   ,d_tili_id
		   ,d_aineistotyyppi_id
		   ,d_toiminto_id
		   ,d_erittely_id
		   ,konserni
		   ,tilikausi
           ,arvo
           ,source)
SELECT d1.id as d_amk_id
    ,d2.id as d_ohjauksenala_id
    ,d3.id as d_tili_id
      ,d4.id as d_aineistotyyppi_id
    ,d5.id as d_toiminto_id
    ,d6.id as d_erittely_id
    ,konserni
	,TILIK
    ,arvo
    ,src as source
  FROM (select tilik
      ,amk_koodi
	  ,konserni
    ,'-1' as ohjauksenala
    ,tili
      ,aineistotyyppi_osa_1 as aineistotyyppi
    ,'-1' as toiminto
    ,'-1' as erittely
    ,arvo
      ,'ETL: p_lataa_f_amk_talous - SA_SUORAT_AMK_TALOUS_1_tuloslaskelma' AS src
from
(select tilik
		,amk_koodi
		,COALESCE(Emo_konserni, 'E') as konserni
		,aineistotyyppi_osa_1
		,liikevaihto
		,kvarastojenl
		,omkaytt
		,muuttuot
		,aitata
		,ostotilaik
		,varastlis
		,ulkpal
		,matyht
		,palkat
		,hsivukulut
		,elakekulut
		,msivukulut
		,hkulutyht
		,poistot
		,aalennukset
		,vvpaalennukset
		,muutkulut
		,lvoitto
		,konstuot
		,tuotosuu
		,tuotsamakons
		,tuototmuilt
		,muutkorksamkons
		,muutkorkmuilt
		,arvovastaasijo
		,arvovaihtvastrah
		,korkrahkulukons
		,korkrahkulumuut
		,voitto
		,sattuot
		,satkulut
		,voitenveroja
		,poistoero
		,vapehtvara
		,rahasiirt
		,tulovero
		,muutverot
		,tilvoitto
		,okmperus
		,akatemia
		,tekes as BusinessFinland
		,muuokm
		,sosturvarah
		,muuvaltio
		,kunnat
		,vottavoittelematon
		,kotiyritys
		,kotirah
		,kotitalous
		,eurah
		,eurahyrit
		,eurahmuu
		,muuulkyritys
		,muuulkmuurah
		,maksuasetus
		,muuliikevaihto
		,poiarvoyht
		 --2019 lisäykset
		,avustustuotot as avustust
		,liiktuotot as vtliiket
		,osuustulos as vtosuust
		,sidotut as sidottrm
		,omakatteiset as omakrahm
		,vahemmistoosuudet as vtvahem
		,korkvarstoimalv as alv
		,okmkompens as okmalv
		,harjoittelukoulujenvm as vmalv
		,muurahkomp as muualv
		,vmrahharjkoulu as vmhar
		,okmrahharjkoulu as okmhar
		,harjkoulukuluyht as harliik
		,konelaite as konevuok
		,kerlahjkotital as kerlahjkoti
		,kerlahjyri as kerlahjyrit
		,kerlahjmuut as kerlahjmuu
		,varainhankinta as vhliiket
		,muuvarainhankinta as vhmuutul
		,varainhankintakul as vhliikek
		,muutvarainhankintakul as vhmuuk
		,osinkotuotot as osinkot
		,korkotuotot as korkot
		,myyntituotot as mvoitto
		,vuokratuotot as vuokrat
		,korkokulut as korkok
		,vuokrakulut as vastikek
		,myyntitappiot as mtappio
		,muutvhkulut as srmuuk
		,ulkliiktoim
		,kvarvonmuutos
		,varssijtuot
		,muutkorkorahtuotot
		,arvonalentumisetpal
		,rahoitustuotot
		,siirtosidotusta
		,siirtosidottuun
		,siirtorahastosta
		,siirtorahastoon
		,kerlahjkulu
		,varainhankintatuot
		,muuttuotot_3
		,lukukausimaksut
		,pysyvaisluontoinen
		,muutmuuttuot
		,muutkulutyht
		,tilakustannukset
		,muutvhkulut
  from sa.sa_suorat_amk_talous_1_tuloslaskelma) p
  unpivot
  (arvo for tili in
    (	liikevaihto
		,kvarastojenl
		,omkaytt
		,muuttuot
		,aitata
		,ostotilaik
		,varastlis
		,ulkpal
		,matyht
		,palkat
		,hsivukulut
		,elakekulut
		,msivukulut
		,hkulutyht
		,poistot
		,aalennukset
		,vvpaalennukset
		,muutkulut
		,lvoitto
		,konstuot
		,tuotosuu
		,tuotsamakons
		,tuototmuilt
		,muutkorksamkons
		,muutkorkmuilt
		,arvovastaasijo
		,arvovaihtvastrah
		,korkrahkulukons
		,korkrahkulumuut
		,voitto
		,sattuot
		,satkulut
		,voitenveroja
		,poistoero
		,vapehtvara
		,rahasiirt
		,tulovero
		,muutverot
		,tilvoitto
		,okmperus
		,akatemia
		,BusinessFinland
		,muuokm
		,sosturvarah
		,muuvaltio
		,kunnat
		,vottavoittelematon
		,kotiyritys
		,kotirah
		,kotitalous
		,eurah
		,eurahyrit
		,eurahmuu
		,muuulkyritys
		,muuulkmuurah
		,maksuasetus
		,muuliikevaihto
		,poiarvoyht
		 --2019 lisäykset
		,avustust
		,vtliiket
		,vtosuust
		,sidottrm
		,omakrahm
		,vtvahem
		,alv
		,okmalv
		,vmalv
		,muualv
		,vmhar
		,okmhar
		,harliik
		,konevuok
		,kerlahjkoti
		,kerlahjyrit
		,kerlahjmuu
		,vhliiket
		,vhmuutul
		,vhliikek
		,vhmuuk
		,osinkot
		,korkot
		,mvoitto
		,vuokrat
		,korkok
		,vastikek
		,mtappio
		,srmuuk
		,ulkliiktoim
		,kvarvonmuutos
		,varssijtuot
		,muutkorkorahtuotot
		,arvonalentumisetpal
		,rahoitustuotot
		,siirtosidotusta
		,siirtosidottuun
		,siirtorahastosta
		,siirtorahastoon
		,kerlahjkulu
		,varainhankintatuot
		,muuttuotot_3
		,lukukausimaksut
		,pysyvaisluontoinen
		,muutmuuttuot
		,muutkulutyht
		,tilakustannukset
		,muutvhkulut
		)) as unpvt
	  where aineistotyyppi_osa_1 = case when (select count(*) from sa.sa_suorat_amk_talous_1_tuloslaskelma where tilik = unpvt.tilik and aineistotyyppi_osa_1 = 'L' and amk_koodi = unpvt.amk_koodi) > 0 then 'L' else 'E' end
       --Rajaa pois vanhan koodiston mukaiset luvut
	  AND (TILIK > 2018 OR( TILIK =2018 and Aineistotyyppi_osa_1='L'))

union all
select tilik
      ,amk_koodi
	  ,konserni
    ,'-1' as ohjauksenala
    ,tili
      ,aineistotyyppi_osa_1 as aineistotyyppi
    ,'-1' as toiminto
    ,'-1' as erittely
    ,arvo
      ,'ETL: p_lataa_f_amk_talous - SA_SUORAT_AMK_TALOUS_2_tase' AS src
from
(select amk_koodi
	  ,COALESCE(Emo_konserni, 'E') as konserni
      ,tilik
      ,aineistotyyppi_osa_1
      ,kehmenot
      ,aineetoi
      ,liikear
      ,muupmeno
      ,ahennakk
      ,maavesi
      ,rakennus
      ,koneet
      ,muuainh
      ,ennakesk
      ,osuuskon
      ,saamikon
      ,osuusoyy
      ,saamioyy
      ,muutosak
      ,muutsaam
      ,okrvarat
      ,aineet
      ,keskener
      ,valmiit
      ,muuvom
      ,voennakk
      ,pmyyntis
      ,pskonser
      ,psoyyrit
      ,plainas
      ,plveros
      ,pmuuts
      ,psiirtos
      ,lmyyntis
      ,lskonser
      ,lsoyyrit
      ,llainas
      ,llveros
      ,lmuuts
      ,lsiirtos
      ,raposuus
      ,raposakk
      ,muuarvop
      ,rahatps
      ,vastaava
      ,arvonkr
      ,kayvanar
      ,okarahas
      ,msirahas
      ,vaprahas
      ,opoyht
      ,tpskerty
      ,elakvara
      ,verovara
      ,mpakvara
      ,ppaaomal
      ,pjvelkal
      ,pvvelkal
      ,plrahala
      ,pelakel
      ,psaadute
      ,postovel
      ,prveksel
      ,pvkonser
      ,pvoyyrit
      ,pmuutvel
      ,psiirtov
      ,lpaaomal
      ,ljvelkal
      ,lvvelkal
      ,llrahala
      ,lelakel
      ,lsaadute
      ,lostovel
      ,lrveksel
      ,lvkonser
      ,lvoyyrit
      ,lmuutvel
      ,lsiirtov
      ,llverove
      ,vastatta
      ,osakepaa
      ,edtilvo
      ,tkvoitto
      ,okrsijyh
      ,okrrahas
      ,okrosakk
      ,okrmuuap
      ,okrrjaps
      ,okrmuutv
      ,kompperusalvm
      ,saadalvkomp
      ,alvsaavel
      ,plverove
	  --2019 lisäykset
	  ,kliikear
	  ,peruspo
	  ,porah
	  ,ykrah
	  ,sijvaprah
	  ,vararah
	  ,yjrah
	  ,toimpo
	  ,edjaama
  ,tkjaama
	  ,tavahem
	  ,veropvara
	  ,kreservi
	  ,okrvelat
  from sa.sa_suorat_amk_talous_2_tase) p
  unpivot (arvo for tili in
    (kehmenot
      ,aineetoi
      ,liikear
      ,muupmeno
      ,ahennakk
      ,maavesi
      ,rakennus
      ,koneet
      ,muuainh
      ,ennakesk
      ,osuuskon
      ,saamikon
      ,osuusoyy
      ,saamioyy
      ,muutosak
      ,muutsaam
      ,okrvarat
      ,aineet
      ,keskener
      ,valmiit
      ,muuvom
      ,voennakk
      ,pmyyntis
      ,pskonser
      ,psoyyrit
      ,plainas
      ,plveros
      ,pmuuts
      ,psiirtos
      ,lmyyntis
      ,lskonser
      ,lsoyyrit
      ,llainas
      ,llveros
      ,lmuuts
      ,lsiirtos
      ,raposuus
      ,raposakk
      ,muuarvop
      ,rahatps
      ,vastaava
      ,arvonkr
      ,kayvanar
      ,okarahas
      ,msirahas
      ,vaprahas
      ,opoyht
      ,tpskerty
      ,elakvara
      ,verovara
      ,mpakvara
      ,ppaaomal
      ,pjvelkal
      ,pvvelkal
      ,plrahala
      ,pelakel
      ,psaadute
      ,postovel
      ,prveksel
      ,pvkonser
      ,pvoyyrit
      ,pmuutvel
      ,psiirtov
      ,lpaaomal
      ,ljvelkal
      ,lvvelkal
      ,llrahala
      ,lelakel
      ,lsaadute
      ,lostovel
      ,lrveksel
      ,lvkonser
      ,lvoyyrit
      ,lmuutvel
      ,lsiirtov
      ,llverove
      ,vastatta
      ,osakepaa
      ,edtilvo
      ,tkvoitto
      ,okrsijyh
      ,okrrahas
      ,okrosakk
      ,okrmuuap
      ,okrrjaps
      ,okrmuutv
      ,kompperusalvm
      ,saadalvkomp
      ,alvsaavel
      ,plverove
	  ,kliikear
	  ,peruspo
	  ,porah
	  ,ykrah
	  ,sijvaprah
	  ,vararah
	  ,yjrah
	  ,toimpo
	  ,edjaama
  ,tkjaama
	  ,tavahem
	  ,veropvara
	  ,kreservi
	  ,okrvelat

	  )) as unpvt
	  where aineistotyyppi_osa_1 = case when (select count(*) from sa.sa_suorat_amk_talous_2_tase where tilik = unpvt.tilik and aineistotyyppi_osa_1 = 'L' and amk_koodi = unpvt.amk_koodi) > 0 then 'L' else 'E' end

union all
select	tilik
		,amk_koodi
		,'E' as Konserni
		,'-1' as ohjauksenala
		,tili
		,'L' as aineistotyyppi
		,toiminto
		,erittely
		,arvo
		 ,'ETL: p_lataa_f_amk_talous - SA_SUORAT_AMK_TALOUS_3_tuloslaskelman_toiminnot' AS src
from
(
 select tilik
      ,amk_koodi
      ,pttoiminto as toiminto
    ,'pt' as erittely
      ,ptprahoitus as tprahoitus
      ,pttuetavu as ttuetavu
      ,ptmakkorv as tmakkorv
      ,ptmuuliike as tmuuliike
      ,ptmuutuot as tmuutuot
      ,pkmatpal as kmatpal
      ,pkhenkilosto as khenkilosto
      ,pkpoisto as kpoisto
      ,pkmuutkulu as kmuutkulu
      ,posuusyku as osuusyku
	  --2019 muutokset
	  ,0 as kkvaltrah
	  ,0 as kulutyht
	  ,0 as kulkat
	  ,0 as ttavustu
	  ,0 as liiketuo
	  ,0 as muuttuot2
  from sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot
union all
select tilik
      ,amk_koodi
      ,lttoiminto as toiminto
    ,'lt' as erittely
      ,ltprahoitus as tprahoitus
      ,lttuetavu as ttuetavu
      ,ltmakkorv as tmakkorv
      ,ltmuuliike as tmuuliike
      ,ltmuutuot as tmuutuot
      ,lkmatpal as kmatpal
      ,lkhenkilosto as khenkilosto
      ,lkpoisto as kpoisto
      ,lkmuutkulu as kmuutkulu
      ,losuusyku as osuusyku
	  -- 2019 muutokset
	  ,0 as kkvaltrah
	  ,0 as kulutyht
	  ,0 as kulkat
	  ,0 as ttavustu
	  ,0 as liiketuo
	  ,0 as muuttuot2
  from sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot
union all
select tilik
      ,amk_koodi
      --2019 aineistossa vain yhteiset, mutta eri sarake
	  ,CASE WHEN tilik < 2019 THEN yttoiminto
			ELSE toiminto
	   END AS toiminto
	  ,'yht' as erittely
      ,ytprahoitus as tprahoitus
      ,yttuetavu as ttuetavu
      ,ytmakkorv as tmakkorv
      ,ytmuuliike as tmuuliike
      ,ytmuutuot as tmuutuot
      ,ykmatpal as kmatpal
      ,ykhenkilosto as khenkilosto
      ,ykpoisto as kpoisto
      ,ykmuutkulu as kmuutkulu
      ,yosuusyku as osuusyku
	  -- 2019 muutokset
	  ,kkvaltrah
	  ,kulutyht
 	  ,omakatyht as kulkat
	  ,ttavustu
	  ,liiketuo
	  ,muuttuot as muuttuot2
  from sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot) p
unpivot
  (arvo for tili in
  (tprahoitus
    ,ttuetavu
    ,tmakkorv
    ,tmuuliike
    ,tmuutuot
    ,kmatpal
    ,khenkilosto
    ,kpoisto
    ,kmuutkulu
    ,osuusyku
	--2019
	,kkvaltrah
	,ttavustu
	,liiketuo
	,muuttuot2
	,kulutyht
	,kulkat)) as unpvt
union all
select tilik
      ,amk_koodi
	  ,'E' as Konserni
 	  ,opm95opa_koodi as ohjauksenala
 	  ,tili
      ,'L' as aineistotyyppi
	  ,'-1' as toiminto
 	  ,'-1' as erittely
      ,arvo
      ,'ETL: p_lataa_f_amk_talous - SA_SUORAT_AMK_TALOUS_4_tutkimusmenot' AS src
from
(select amk_koodi
    ,tilik
      ,opm95opa_koodi
      ,tutmenot
      ,perusr
      ,ulkoptr
      ,akatemia as akatemia2
      ,muuokm as muuokm2
      ,tekes as BusinessFinland2
      ,muutem
      ,ulkomin
      ,oikmin
      ,sisämin
      ,puolmin
      ,valtvmin
      ,mmm
      ,lvm
      ,stm
      ,ympmin
      ,kunnat as kunnat2
			,hyvinvointialueet
      ,muujulkr
      ,kotiraha
      ,kotiyrit
      ,kotikk
      ,ulkoyrit
      ,eupuiter
      ,eakr
      ,esr
      ,muueur
      ,ulkoraha
      ,kvjarj
      ,ulkomuur
      ,amkomarah
  from sa.sa_suorat_amk_talous_4_tutkimusmenot) p
  unpivot (arvo for tili in
    (tutmenot
      ,perusr
      ,ulkoptr
      ,akatemia2
      ,muuokm2
      ,BusinessFinland2
      ,muutem
      ,ulkomin
      ,oikmin
      ,sisämin
      ,puolmin
      ,valtvmin
      ,mmm
      ,lvm
      ,stm
      ,ympmin
      ,kunnat2
			,hyvinvointialueet
      ,muujulkr
      ,kotiraha
      ,kotiyrit
      ,kotikk
      ,ulkoyrit
      ,eupuiter
      ,eakr
      ,esr
      ,muueur
      ,ulkoraha
      ,kvjarj
      ,ulkomuur
      ,amkomarah)) as unpvt
union all
select tilik
      ,amk_koodi
	  ,'E' as Konserni
	  ,ohjala as ohjauksenala
      ,tili
      ,'L' as aineistotyyppi
      ,'-1' as toiminto
      ,'-1' as erittely
      ,arvo
      ,'ETL: p_lataa_f_amk_talous - SA_SUORAT_AMK_TALOUS_5_kustannustiedot' AS src
from
(select amk_koodi
		,tilik
		,ohjala
		,vtkusty
		,tutkoul
		,ptutosat
		,ammopkoul
		,muukoul
		,tutkimus
		,ylamkkoul
		,tktoim
	  --2019 lisäykset--
		,erikkoul
		,taittoim
		,yleistoi
		,juloiksu
		,muuttutosat
  from sa.sa_suorat_amk_talous_5_kustannustiedot) p
  unpivot
  (arvo for tili in
  (vtkusty
		,tutkoul
	    ,ptutosat
		,ammopkoul
		,muukoul
	    ,tutkimus
		,ylamkkoul
		,tktoim
	  	 --2019 lisäykset--
		,erikkoul
		,taittoim
		,yleistoi
		,juloiksu
		,muuttutosat)) as unpvt
union all
select tilik
      ,amk_koodi
	  ,'E' as Konserni
      ,'-1' as ohjauksenala
      ,tili
      ,aineistotyyppi
      ,'-1' as toiminto
      ,'-1' as erittely
      ,arvo
      ,'ETL: p_lataa_f_amk_talous - SA_SUORAT_AMK_TALOUS_6_liiketoiminnan_tuloslaskelma' AS src
from
(select tilik
      ,amk_koodi
      ,aineistotyyppi
      ,varastojen_lisays_tai_vahennys
    ,valmistus_omaan_kayttoon
    ,liiketoiminnan_muut_tuotot
    ,ostot_tilikauden_aikana
    ,tuotteet_varastojen_lisays_tai_vahennys
    ,ulkopuoliset_palvelut
    ,palkat_ja_palkkiot
    ,elakekulut as elakekulut2
    ,muut_henkilostosivukulut
    ,suunnitelman_mukaiset_poistot
    ,sijoitukset_arvonalentumiset_pysyvat_vastaavat
    ,sijoitukset_arvonalentumiset_vaihtuvat_vastaavat
    ,liiketoiminnan_muut_kulut
    ,liikevoitto
    ,tuotot_osuuksista_konserni
    ,tuotot_osuuksista_omistusyhteistyoyrityksissa
    ,tuotot_sama_konserni
    ,tuotot_muilta
    ,muut_korkotuotot_sama_konserni
    ,muut_korkotuotot_muilta
    ,arvonalentumiset_pysyvat_vastaavat
    ,arvonalentumiset_vaihtuvat_vastaavat
    ,korkokulut_sama_konserni
    ,korkokulut_muille
    ,voitto_ennen_satunnaisia_eria
    ,satunnaiset_tuotot
    ,satunnaiset_kulut
    ,voitot_ennen_tilinpaatossiirtoja
    ,poistoeron_lisays
    ,vapaaehtoisten_varausten_lisays
    ,tuloverot
    ,muut_valittomat_verot
	,tilkauden_voitto
	--2019 lisaykset--
	,liikevaihto as lt_liikevaihto
	,tilinpaatossiirrot
	,henkilostokulut
	,poistot_ja_arvonalennukset
	,rahoitustuotot_ja_kulut

  from sa.sa_suorat_amk_talous_6_liiketoiminnan_tuloslaskelma) p
  unpivot
  (arvo for tili in
  (varastojen_lisays_tai_vahennys
    ,valmistus_omaan_kayttoon
    ,liiketoiminnan_muut_tuotot
    ,ostot_tilikauden_aikana
    ,tuotteet_varastojen_lisays_tai_vahennys
    ,ulkopuoliset_palvelut
    ,palkat_ja_palkkiot
    ,elakekulut2
    ,muut_henkilostosivukulut
    ,suunnitelman_mukaiset_poistot
    ,sijoitukset_arvonalentumiset_pysyvat_vastaavat
    ,sijoitukset_arvonalentumiset_vaihtuvat_vastaavat
    ,liiketoiminnan_muut_kulut
    ,liikevoitto
    ,tuotot_osuuksista_konserni
    ,tuotot_osuuksista_omistusyhteistyoyrityksissa
    ,tuotot_sama_konserni
    ,tuotot_muilta
    ,muut_korkotuotot_sama_konserni
    ,muut_korkotuotot_muilta
    ,arvonalentumiset_pysyvat_vastaavat
    ,arvonalentumiset_vaihtuvat_vastaavat
    ,korkokulut_sama_konserni
    ,korkokulut_muille
    ,voitto_ennen_satunnaisia_eria
    ,satunnaiset_tuotot
    ,satunnaiset_kulut
    ,voitot_ennen_tilinpaatossiirtoja
    ,poistoeron_lisays
    ,vapaaehtoisten_varausten_lisays
    ,tuloverot
    ,muut_valittomat_verot
    ,tilkauden_voitto
	--2019 lisaykset--
	,lt_liikevaihto
	,tilinpaatossiirrot
	,henkilostokulut
	,poistot_ja_arvonalennukset
	,rahoitustuotot_ja_kulut)) as unpvt
	  where aineistotyyppi = case when (select count(*) from sa.sa_suorat_amk_talous_6_liiketoiminnan_tuloslaskelma where tilik = unpvt.tilik and aineistotyyppi = 'L' and amk_koodi = unpvt.amk_koodi) > 0 then 'L' else 'E' end
	  --Rajaa pois vanhan koodiston mukaiset luvut
	  AND (TILIK > 2018 OR( TILIK =2018 and Aineistotyyppi='L'))
	) f

  INNER JOIN dw.d_organisaatioluokitus d1 ON f.AMK_koodi = d1.organisaatio_koodi
  INNER JOIN dw.d_ohjauksenala d2 ON f.ohjauksenala = d2.ohjauksenala_koodi
  INNER JOIN dw.d_tili d3 ON f.tili = case
									  when tilik < 2019 and d3.tili_koodi = 'muutkulut' and d3.tili_taso1_fi = '' then null
									  when tilik > 2018 and d3.tili_koodi = 'muutkulut' and d3.tili_taso1_fi <> '' then null
									  else tili_koodi end
  INNER JOIN dw.d_aineistotyyppi d4 ON f.aineistotyyppi = d4.aineistotyyppi_koodi
  INNER JOIN dw.d_toiminto d5 ON f.toiminto = d5.toiminto_koodi
  INNER JOIN dw.d_erittely d6 ON f.erittely = d6.erittely_koodi

GO

USE [ANTERO]