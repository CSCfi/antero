USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROC [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma] AS

--declare eomonth(dateadd(month,-1,pvm)) as date
--set eomonth(dateadd(month,-1,pvm)) = eomonth(dateadd(month,-1,pvm))

--LOMIEN LASKENNASSA SEURAAVAT VAIHTOEHDOT:
--alkanut ennen jakson alkua, kertynyt yhtäjaksoisesti väh. 28 päivää -> saa arvon 0
--alkanut ennen jakson alkua, kertynyt yhtäjaksoisesti alle 28 päivää
	--aiempi loma + nykyisen jakson loma yhteensä yli 28 päivää -> saa arvon 28 - aiempi
	--muuten jakson aikana kertyneet päivät
--alkanut jakson aikana, kestää yli 28 päivää -> saa arvon 28
--alkanut jakson aikana -> jakson aikana kertyneet päivät
--muuten nolla

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma
;

WITH ed_jaksot AS (
	SELECT 
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,case when ooa.tila = 'lasna' then osa_aikaisuus else null end as osa_aikaisuus
		,case when ooa.tila = 'lasna' then opintojen_rahoitus else null end as opintojen_rahoitus
	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)

SELECT 
	 pvm
	,ooa.opiskeluoikeus_oid
	,ooa.tila
	,tila_alkanut
	,alku
	,loppu
	,alku_ei_muokattu
	,loppu_ei_muokattu
	,opintojen_rahoitus
	,maksuton
	,oikeutta_maksuttomuuteen_pidennetty
	,majoitus
	,sisaoppilaitosmainen_majoitus
	,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
	,erityinen_tuki
	,vaativan_erityisen_tuen_erityinen_tehtava
	,hojks
	,vaikeasti_vammainen
	,vammainen_ja_avustaja
	,osa_aikaisuus
	,vankilaopetuksessa
	,oppisopimus_jossain_paatason_suorituksessa 
	,opiskeluvalmiuksia_tukevat_opinnot
	,alkanut_samana_paivana_hylataan
	--,toisen_opiskeluoikeuden_sisalla
	,sisaltyy_toiseen_opiskeluoikeuteen
	,aiempi_koulutusmuoto
	,aiempi_tuva_jarjestamislupa
	,valiaikainen_keskeytys
	,lasna_pv_hyv = 0
	,lasna_pv_hyv_ei_muokattu = 0
	--vanha malli sis. 28 pv rajoite
	,loma_pv_hyv = (osa_aikaisuus / 100.0) *
		CASE	
			WHEN sisaltyy_toiseen_opiskeluoikeuteen = 1 
				or alkanut_samana_paivana_hylataan = 1
				or (valiaikainen_keskeytys = 0 and ed_paattynyt = 0)
				--or (valiaikainen_keskeytys = 0 and toisen_opiskeluoikeuden_sisalla = 1) 
				THEN 0
			WHEN loma_pv_hist + datediff(day, tila_alkanut, alku) >= 28 THEN 0
			ELSE
				CASE
					WHEN loma_pv_hist + datediff(day, tila_alkanut, alku) + loma_pv_nyk >= 28 THEN 28 - (loma_pv_hist + datediff(day, tila_alkanut, alku))
					ELSE loma_pv_nyk
				END
		END					
	,loma_pv_hyv_ei_muokattu = (osa_aikaisuus / 100.0) *
		CASE	
			WHEN loma_pv_hist_ei_muokattu + datediff(day, tila_alkanut_ei_muokattu, alku_ei_muokattu) >= 28 THEN 0
			ELSE
				CASE
					WHEN loma_pv_hist_ei_muokattu + datediff(day, tila_alkanut_ei_muokattu, alku_ei_muokattu) + loma_pv_nyk_ei_muokattu >= 28 THEN 28 - (loma_pv_hist_ei_muokattu + datediff(day, tila_alkanut_ei_muokattu, alku_ei_muokattu))
					ELSE loma_pv_nyk_ei_muokattu
				END
		END
	--uusi malli käyttää tätä (ei 28 pv rajoitetta ja lisätty muita rajauksia)
	,loma_pv_nyk = (osa_aikaisuus / 100.0) *
		CASE	
			WHEN sisaltyy_toiseen_opiskeluoikeuteen = 1 
				or alkanut_samana_paivana_hylataan = 1
				or (valiaikainen_keskeytys = 0 and ed_paattynyt = 0)
				--or (valiaikainen_keskeytys = 0 and toisen_opiskeluoikeuden_sisalla = 1) 
				THEN 0
			ELSE loma_pv_nyk
		END
	--
	,loma_pv_nyk_ei_muokattu = loma_pv_nyk_ei_muokattu * (osa_aikaisuus / 100.0)
	,loma_pv_hist = loma_pv_hist * (osa_aikaisuus / 100.0)
	,loma_pv_hist_ei_muokattu = loma_pv_hist_ei_muokattu * (osa_aikaisuus / 100.0)
	,opva_pv_hyv = 0
	,opva_pv_hyv_ei_muokattu = 0
	,opva_pv_nyk = 0
	,opva_pv_nyk_ei_muokattu = 0
	,opva_pv_hist = 0
INTO sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma					
	
FROM (

	SELECT distinct
		 pvm
		,sa1.opiskeluoikeus_oid
		,ed_paattyi
		,ed_paattynyt
		,sa1.tila
		,tila_alkanut = ca.tila_alkanut
		,alku = ca.alku
		,loppu = ca.loppu
		,tila_alkanut_ei_muokattu = ca.tila_alkanut_ei_muokattu
		,alku_ei_muokattu = ca.alku_ei_muokattu
		,loppu_ei_muokattu = ca.loppu_ei_muokattu
		,opintojen_rahoitus = coalesce(sa2.opintojen_rahoitus, sa3.opintojen_rahoitus, sa4.opintojen_rahoitus, sa1.opintojen_rahoitus)
		,maksuton
		,oikeutta_maksuttomuuteen_pidennetty
		,majoitus
		,sisaoppilaitosmainen_majoitus
		,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
		,erityinen_tuki
		,vaativan_erityisen_tuen_erityinen_tehtava
		,hojks
		,vaikeasti_vammainen
		,vammainen_ja_avustaja
		,osa_aikaisuus = coalesce(sa2.osa_aikaisuus, sa3.osa_aikaisuus, sa4.osa_aikaisuus, sa1.osa_aikaisuus)
		,vankilaopetuksessa
		,oppisopimus_jossain_paatason_suorituksessa
		,opiskeluvalmiuksia_tukevat_opinnot
		,aiempi_koulutusmuoto = coalesce(oo_l.aiempi_koulutusmuoto,'')
		,aiempi_tuva_jarjestamislupa
		--,toisen_opiskeluoikeuden_sisalla = case when oo_l.toisen_opiskeluoikeuden_sisalla = 1 then 1 else 0 end
		,valiaikainen_keskeytys
		,sisaltyy_opiskeluoikeuteen
		,alkanut_samana_paivana_hylataan
		--,toisen_opiskeluoikeuden_sisalla
		,sisaltyy_toiseen_opiskeluoikeuteen
		,loma_pv_nyk =	CASE
							WHEN datediff(day, (select maxValue from dbo.Maximum(pvm, sa1.alku, coalesce(case when ed_valmistunut=1 then dateadd(day,1,ed_paattyi) when ed_paattynyt=1 then ed_paattyi else oo_l.alku end, '1900-01-01'))), (select minValue from dbo.Minimum (eomonth(pvm), sa1.loppu, oo_l.loppu))) + 1 < 0 THEN 0
							ELSE datediff(day, (select maxValue from dbo.Maximum(pvm, sa1.alku, coalesce(case when ed_valmistunut=1 then dateadd(day,1,ed_paattyi) when ed_paattynyt=1 then ed_paattyi else oo_l.alku end, '1900-01-01'))), (select minValue from dbo.Minimum (eomonth(pvm), sa1.loppu, oo_l.loppu))) + 1
						END
		,loma_pv_hist =	CASE
							--WHEN oo_l.valiaikainen_keskeytys = 0 THEN 0
							WHEN datediff(day, (select maxValue from dbo.Maximum (sa1.tila_alkanut, dateadd(day, case when ed_valmistunut=1 then 1 else 0 end, coalesce(oo_l.ed_paattyi,'1900-01-01')), DEFAULT)), eomonth(dateadd(month,-1,pvm))) + 1 < 0 THEN 0
							ELSE datediff(day, (select maxValue from dbo.Maximum (sa1.tila_alkanut, dateadd(day, case when ed_valmistunut=1 then 1 else 0 end, coalesce(oo_l.ed_paattyi,'1900-01-01')), DEFAULT)), eomonth(dateadd(month,-1,pvm))) + 1
						END
		,loma_pv_nyk_ei_muokattu =	
						CASE
							WHEN datediff(day, (select maxValue from dbo.Maximum(pvm, ca.alku, default)), (select minValue from dbo.Minimum (eomonth(pvm), ca.loppu, default))) + 1 < 0 THEN 0
							ELSE datediff(day, (select maxValue from dbo.Maximum(pvm, ca.alku, default)), (select minValue from dbo.Minimum (eomonth(pvm), ca.loppu, default))) + 1
						END
		,loma_pv_hist_ei_muokattu =	
						CASE
							--WHEN oo_l.valiaikainen_keskeytys = 0 and oo_l.ed_paattynyt = 1 THEN 0
							WHEN datediff(day, sa1.tila_alkanut, eomonth(dateadd(month,-1,pvm))) + 1 < 0 THEN 0
							ELSE datediff(day, sa1.tila_alkanut, eomonth(dateadd(month,-1,pvm))) + 1
						END
		
	FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid
	
	LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso sa1 on sa1.opiskeluoikeus_oid = oid.opiskeluoikeus_oid
	
	--loman osa-aikaisuus ja rahoitus otetaan edellisestä läsnäolojaksosta
	LEFT JOIN ed_jaksot sa2 on sa2.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and datediff(day,sa2.loppu,sa1.tila_alkanut) = 1

	--loman osa-aikaisuus ja rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisessä)
	LEFT JOIN ed_jaksot sa3 on sa3.opiskeluoikeus_oid = sa2.opiskeluoikeus_oid and datediff(day,sa3.loppu,sa2.alku) = 1

	--loman osa-aikaisuus ja rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisesssä)
	LEFT JOIN ed_jaksot sa4 on sa4.opiskeluoikeus_oid = sa3.opiskeluoikeus_oid and datediff(day,sa4.loppu,sa3.alku) = 1
	
	--päällekkäiset opiskeluoikeudet
	LEFT JOIN (
		select 
			 opiskeluoikeus_oid
			,alku
			,loppu = coalesce(max(loppu),'')
			,ed_paattyi
			,ed_paattynyt
			,ed_valmistunut
			,aiempi_koulutusmuoto
			,aiempi_tuva_jarjestamislupa
			--,toisen_opiskeluoikeuden_sisalla
			,sisaltyy_opiskeluoikeuteen
			,valiaikainen_keskeytys
			,valiaikainen_keskeytys_alkanut
		from sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet
		group by opiskeluoikeus_oid,ed_paattyi,aiempi_koulutusmuoto,aiempi_tuva_jarjestamislupa,valiaikainen_keskeytys,alku,ed_paattynyt,ed_valmistunut,valiaikainen_keskeytys_alkanut,sisaltyy_opiskeluoikeuteen
	) oo_l on oo_l.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and oo_l.alku between sa1.alku and sa1.loppu

	CROSS APPLY (
		SELECT 
			 tila_alkanut = (select maxValue from dbo.Maximum (sa1.tila_alkanut, coalesce(case when oo_l.valiaikainen_keskeytys=1 then oo_l.valiaikainen_keskeytys_alkanut when ed_valmistunut=1 then dateadd(day,1,ed_paattyi) when ed_paattynyt=1 then ed_paattyi end, '1900-01-01'), pvm))
			,alku = (select maxValue from dbo.Maximum (sa1.alku, coalesce(case when ed_valmistunut=1 then dateadd(day,1,ed_paattyi) when ed_paattynyt=1 then ed_paattyi else oo_l.alku end, '1900-01-01'), pvm))
			,loppu = (select minValue from dbo.Minimum (sa1.loppu, coalesce(oo_l.loppu,'9999-12-31'), eomonth(pvm)))
			,tila_alkanut_ei_muokattu = (select maxValue from dbo.Maximum (sa1.tila_alkanut, pvm, default))
			,alku_ei_muokattu = (select maxValue from dbo.Maximum (sa1.alku, pvm, default))
			,loppu_ei_muokattu = (select minValue from dbo.Minimum (sa1.loppu, eomonth(pvm), default))
	) ca

	WHERE sa1.tila = 'loma' 
	and (sa1.alku <= eomonth(pvm) and sa1.loppu >= pvm)														
	--tämä turha?, hoituu edellisellä
	and coalesce(oo_l.loppu,'9999-12-31') != '1900-01-01'																
	and sa1.opiskeluvalmiuksia_tukevat_opinnot = 0
	and not (oid.sisaltyy_toiseen_opiskeluoikeuteen=1 and coalesce(oo_l.sisaltyy_opiskeluoikeuteen,1)=0)
) ooa

--INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid

WHERE 1=1

GO
