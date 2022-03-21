USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_talous]    Script Date: 13.3.2019 12:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dw].[p_lataa_f_yo_talous] as

truncate table dw.f_yo_talous

insert into dw.f_yo_talous
           (d_yo_id
		   ,d_opintoala95_id
		   ,d_tili_id
		   ,d_aineistotyyppi_id
		   ,d_toiminto_id
		   ,d_ohjauksenala_id
		   ,konserni
		   ,tilikausi
           ,arvo
           ,source)


select d1.id as d_yo_id
	  ,d2.id as d_opintoala95_id
	  ,d3.id as d_tili_id
      ,d4.id as d_aineistotyyppi_id
	  ,d5.id as d_toiminto_id
	  ,d6.id as d_ohjauksenala_id
	  ,konserni
	  ,tilik
      ,arvo
	  ,src as source


 from (
	select tilik
      ,yliop_koodi
	  ,'-1' as opintoala95
	  ,tili
      ,aineistotyyppi_osa_1 as aineistotyyppi
	  ,'-1' as toiminto
	  ,konserni
	  ,'-1' as ohjauksenala
	  ,arvo
      ,'ETL: p_lataa_f_yo_talous - SA_SUORAT_YO_TALOUS_1_tuloslaskelma' as src from
		(select 
			   yliop_koodi
			  ,tilik
			  ,Emo_konserni as konserni
			  ,Aineistotyyppi_osa_1
			  ,akatemia as akatemia3
			  ,arvalpal
			  ,arvonal
			  ,elakek
			  ,eumuut
			  ,eusuora
			  ,euyritys
			  ,kerakulu
			  ,keratulo
			  ,konevuok
			  ,korkok
			  ,korkot
			  ,kotilahj
			  ,kotitalt
			  ,krahalt
			  ,kunnat as kunnat3
			  ,kyrityst
			  ,lahjkulu
			  ,mtappio
			  ,muujulkh
			  ,muulahj
			  ,muusivuk
			  ,muutilak
			  ,mvoitto
			  ,osinkot
			  ,palkkak
			  ,palvosto
			  ,poistot as poistot2
			  ,srjaama
			  ,srliikek
			  ,srliiket
			  ,srmuuk
			  ,srmuutul
			  ,srosuus
			  ,srvahem
			  ,tavaosto
			  ,tekes as BusinessFinland3
			  ,ulkmuu
			  ,ulkyrity
			  ,valtio
			  ,vastikek
			  ,vhjaama
			  ,vhliikek
			  ,vhliiket
			  ,vhmuuk
			  ,vhmuutul
			  ,vhosuust
			  ,vhvahem
			  ,vtjaama
			  ,vtliikek
			  ,vtliiket
			  ,vtmuuk
			  ,vtmuutul
			  ,vtosuust
			  ,vtvahem
			  ,vuokrak
			  ,vuokrat
			  ,vyhteiso
			  ,yritlahj
			  ,sattuoto as sattuot
			  ,satkulut
			  ,yolaki49
			  ,muuyavus
			  ,omakrahm
			  ,tiliktul
			  ,poistoem
			  ,sidottrm
			  ,tulovero
			  ,tilikjaam
			  ,yvarulkot
			  ,mvarulkot
			  ,alv
			  ,okmalv
			  ,vmalv
			  ,muualv
			  ,vmhar
			  ,okmhar
			  ,harliik
			  ,aptemka
			  ,aptever
		  from sa.sa_suorat_yo_talous_1_tuloslaskelma) p
		  unpivot (arvo for tili in
				(akatemia3
			  ,arvalpal
			  ,arvonal
			  ,elakek
			  ,eumuut
			  ,eusuora
			  ,euyritys
			  ,kerakulu
			  ,keratulo
			  ,konevuok
			  ,korkok
			  ,korkot
			  ,kotilahj
			  ,kotitalt
			  ,krahalt
			  ,kunnat3
			  ,kyrityst
			  ,lahjkulu
			  ,mtappio
			  ,muujulkh
			  ,muulahj
			  ,muusivuk
			  ,muutilak
			  ,mvoitto
			  ,osinkot
			  ,palkkak
			  ,palvosto
			  ,poistot2
			  ,srjaama
			  ,srliikek
			  ,srliiket
			  ,srmuuk
			  ,srmuutul
			  ,srosuus
			  ,srvahem
			  ,tavaosto
			  ,BusinessFinland3
			  ,ulkmuu
			  ,ulkyrity
			  ,valtio
			  ,vastikek
			  ,vhjaama
			  ,vhliikek
			  ,vhliiket
			  ,vhmuuk
			  ,vhmuutul
			  ,vhosuust
			  ,vhvahem
			  ,vtjaama
			  ,vtliikek
			  ,vtliiket
			  ,vtmuuk
			  ,vtmuutul
			  ,vtosuust
			  ,vtvahem
			  ,vuokrak
			  ,vuokrat
			  ,vyhteiso
			  ,yritlahj
			  ,sattuot
			  ,satkulut
			  ,yolaki49
			  ,muuyavus
			  ,omakrahm
			  ,tiliktul
			  ,poistoem
			  ,sidottrm
			  ,tulovero
			  ,tilikjaam
			  ,yvarulkot
			  ,mvarulkot
			  ,alv
			  ,okmalv
			  ,vmalv
			  ,muualv
			  ,vmhar
			  ,okmhar
			  ,harliik
			  ,aptemka
			  ,aptever)) as unpvt
			  where aineistotyyppi_osa_1 = case when (select count(*) from sa.sa_suorat_yo_talous_1_tuloslaskelma where tilik = unpvt.tilik and aineistotyyppi_osa_1 = 'L' and yliop_koodi = unpvt.yliop_koodi) > 0 then 'L' else 'E' end


	union all


	select tilik
		  ,yliop_koodi
		  ,'-1' as opintoala95
		  ,tili
		  ,aineistotyyppi_osa_1 as aineistotyyppi
		  ,'-1' as toiminto
		  ,konserni
		  ,'-1' as ohjauksenala
		  ,arvo
		  ,'ETL: p_lataa_f_yo_talous - SA_SUORAT_YO_TALOUS_2_tase' as src
	from
		(select tilik
			  ,yliop_koodi
			  ,aineistotyyppi_osa_1
			  ,Emo_konserni as konserni
			  ,kehmenot
			  ,aineetoi
			  ,liikear
			  ,kliikear
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
			  ,peruspo
			  ,arvonkr
			  ,kayvanar
			  ,okarahas
			  ,msirahas
			  ,vaprahas
			  ,toimpo
			  ,edjaama as edtilvo
			  ,tkjaama as tkvoitto
			  ,opoyht
			  ,tavahem
			  ,tpskerty
			  ,elakvara
			  ,verovara
			  ,mpakvara
			  ,kreservi
			  ,okrvelat
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
			  ,plverove
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
			  ,okrsijyh
			  ,okrrahas
			  ,okrosakk
			  ,okrmuuap
			  ,okrrjaps
			  ,okrmuutv
		  from sa.sa_suorat_yo_talous_2_tase) p
		  unpivot (arvo for tili in
				(kehmenot
			  ,aineetoi
			  ,liikear
			  ,kliikear
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
			  ,peruspo
			  ,arvonkr
			  ,kayvanar
			  ,okarahas
			  ,msirahas
			  ,vaprahas
			  ,toimpo
			  ,edtilvo
			  ,tkvoitto
			  ,opoyht
			  ,tavahem
			  ,tpskerty
			  ,elakvara
			  ,verovara
			  ,mpakvara
			  ,kreservi
			  ,okrvelat
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
			  ,plverove
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
			  ,okrsijyh
			  ,okrrahas
			  ,okrosakk
			  ,okrmuuap
			  ,okrrjaps
			  ,okrmuutv)) as unpvt
			  where aineistotyyppi_osa_1 = case when (select count(*) from sa.sa_suorat_yo_talous_2_tase where tilik = unpvt.tilik and aineistotyyppi_osa_1 = 'L' and yliop_koodi = unpvt.yliop_koodi) > 0 then 'L' else 'E' end


	union all


	select tilik
		  ,yliop_koodi
		  ,'-1' as opintoala95
		  ,tili
		  ,'L' as aineistotyyppi
		  ,toiminto
		  ,'E' as konserni
		  ,'-1' as ohjauksenala
		  ,arvo
		  ,'ETL: p_lataa_f_yo_talous - SA_SUORAT_YO_TALOUS_3_tuloslaskelman_toiminnot' as src from
		(select yliop_koodi
			  ,tilik
			  ,toiminto
			  ,ttavustu
			  ,liiketuo
			  ,muuttuot as muuttuot2
			  ,hlokulut as khenkilosto
			  ,ttpoisto as kpoisto
			  ,muutkulu
			  ,osuusyku
		  from sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot) p
		  unpivot (arvo for tili in
				(ttavustu
			  ,liiketuo
			  ,muuttuot2
			  ,khenkilosto
			  ,kpoisto
			  ,muutkulu
			  ,osuusyku)) as unpvt


	union all


	select tilik
		  ,yliop_koodi
		  ,coalesce(opm95opa_koodi, '-1') as opintoala95
		  ,tili
		  ,'L' as aineistotyyppi
		  ,'-1' as toiminto
		  ,'E' as konserni
		  ,coalesce(ohjauksenala_koodi, '-1') as ohjauksenala
		  ,arvo
		  ,'ETL: p_lataa_f_yo_talous - SA_SUORAT_YO_TALOUS_4_tutkimusmenot' as src
	from
		(select 
			   tilik
			  ,yliop_koodi
			  ,opm95opa_koodi
			  ,ohjauksenala_koodi
			  ,tutmenot
			  ,omatr
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
		  from sa.sa_suorat_yo_talous_4_tutkimusmenot) p
		  unpivot (arvo for tili in
				(tutmenot
			  ,omatr
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
			  ,ulkomuur)) as unpvt


	union all


		select tilik
		,yliop_koodi
		,coalesce(opm95opa_koodi, '-1') as opintoala95
		,tili
		,'L' as aineistotyyppi
		,'-1' as toiminto
		,'E' as konserni
		,coalesce(ohjauksenala_koodi, '-1') as ohjauksenala
		,arvo
		,'ETL: p_lataa_f_yo_talous - SA_SUORAT_YO_TALOUS_5_kustannustiedot' as src from
			(select tilik
				  ,yliop_koodi
				  ,opm95opa_koodi
				  ,ohjauksenala_koodi
				  ,ptutkoul as koulutus
				  ,ptutosat as ptutosat2
				  ,muukoul as muukoul2
				  ,jtutkkou
				  ,tiettutk
				  ,taittoim
				  ,juloiksu
				  ,yleistoi
				  ,esiope
				  ,perusope
				  ,lukioope
				  ,harjhkou
				  ,harjulko
				  ,opekehit
				  ,kultper
				  ,kanpakir
				  ,yototteh
			  from sa.sa_suorat_yo_talous_5_kustannustiedot) p
			  unpivot (arvo for tili in
					(koulutus
				  ,ptutosat2
				  ,muukoul2
				  ,jtutkkou
				  ,tiettutk
				  ,taittoim
				  ,juloiksu
				  ,yleistoi)) as unpvt


	union all


	select tilik
	,yliop_koodi
	,'-1' as opintoala95
	,tili
	,'L' as aineistotyyppi
	,'-1' as toiminto
	,'E' as konserni
	,'-1' as ohjauksenala
	,arvo
	,'ETL: p_lataa_f_yo_talous - SA_SUORAT_YO_TALOUS_5_kustannustiedot_harjoittelukoulut' as src from
		(select tilik
				,yliop_koodi
				,esiope
				,perusope
				,lukioope
				,harjhkou
				,harjulko
				,opekehit
				,kultper
				,kanpakir
				,yototteh
			from sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut) p
			unpivot (arvo for tili in
				(esiope
				,perusope
				,lukioope
				,harjhkou
				,harjulko
				,opekehit
				,kultper
				,kanpakir
				,yototteh)) as unpvt


	union all


	select tilik
		  ,yliop_koodi
		  ,'-1' as opintoala95
		  ,tili
		  ,aineistotyyppi
		  ,'-1' as toiminto
		  ,'E' as konserni
		  ,'-1' as ohjauksenala
		  ,arvo
		  ,'ETL: p_lataa_f_yo_talous - SA_SUORAT_YO_TALOUS_6_liiketoiminnan_tuloslaskelma' as src
	from
		(select tilik
			  ,yliop_koodi
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
		  from sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma) p
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
			  ,tilkauden_voitto)) as unpvt
			  where aineistotyyppi = case when (select count(*) from sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma where tilik = unpvt.tilik and aineistotyyppi = 'L' and yliop_koodi = unpvt.yliop_koodi) > 0 then 'L' else 'E' end
	  
	  
) f
  inner join dw.d_yo d1 on f.yliop_koodi = d1.yo_tunnus
  inner join dw.d_opintoala95 d2 on f.opintoala95 = d2.opintoala95_koodi
  inner join dw.d_tili d3 on f.tili = d3.tili_koodi
  inner join dw.d_aineistotyyppi d4 on f.aineistotyyppi = d4.aineistotyyppi_koodi
  inner join dw.d_toiminto d5 on f.toiminto = d5.toiminto_koodi
  inner join dw.d_ohjauksenala d6 on f.ohjauksenala = d6.ohjauksenala_koodi
