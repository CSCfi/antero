USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]    Script Date: 1.11.2020 16:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma] @date as date = '2018-01-01' as

declare @prevDateEnd as date
set @prevDateEnd = eomonth(dateadd(month,-1,@date))

--LOMIEN LASKENNASSA SEURAAVAT VAIHTOEHDOT:
--alkanut ennen jakson alkua, kertynyt yhtäjaksoisesti väh. 28 päivää -> saa arvon 0
--alkanut ennen jakson alkua, kertynyt yhtäjaksoisesti alle 28 päivää
	--aiempi loma + nykyisen jakson loma yhteensä yli 28 päivää -> saa arvon 28 - aiempi
	--muuten jakson aikana kertyneet päivät
--alkanut jakson aikana, kestää yli 28 päivää -> saa arvon 28
--alkanut jakson aikana -> jakson aikana kertyneet päivät
--muuten nolla

TRUNCATE TABLE sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma

;
WITH ed_jaksot AS (
	SELECT 
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,case when ooa.tila = 'lasna' then osa_aikaisuus else null end as osa_aikaisuus
		,case when ooa.tila = 'lasna' then opintojen_rahoitus else null end as opintojen_rahoitus
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)


INSERT INTO sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma

SELECT 
	 @date
	,ooa.opiskeluoikeus_oid
	,ooa.tila
	--,tila_alkanut
	,alku
	,loppu
	,alku_ei_muokattu
	,loppu_ei_muokattu
	,opintojen_rahoitus
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
	,toisen_opiskeluoikeuden_sisalla
	,sisaltyy_toiseen_opiskeluoikeuteen
	,aiempi_koulutusmuoto
	,lasna_pv_hyv = 0
	,lasna_pv_hyv_ei_muokattu = 0
	,loma_pv_hyv = (osa_aikaisuus / 100.0) *
					CASE	
						WHEN alkanut_samana_paivana_hylataan = 1
						  OR toisen_opiskeluoikeuden_sisalla = 1
						  OR sisaltyy_toiseen_opiskeluoikeuteen = 1 
						  OR (ed_jatkuu = 1 AND valiaikainen_keskeytys = 0)THEN 0
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
	,loma_pv_nyk = loma_pv_nyk * (osa_aikaisuus / 100.0)
	,loma_pv_nyk_ei_muokattu = loma_pv_nyk_ei_muokattu * (osa_aikaisuus / 100.0)
	,loma_pv_hist = loma_pv_hist * (osa_aikaisuus / 100.0)
	,loma_pv_hist_ei_muokattu = loma_pv_hist_ei_muokattu * (osa_aikaisuus / 100.0)
	,opva_pv_hyv = 0
	,opva_pv_hyv_ei_muokattu = 0
	,opva_pv_nyk = 0
	,opva_pv_nyk_ei_muokattu = 0
	,opva_pv_hist = 0
					
	
FROM (

	SELECT distinct
		 sa1.opiskeluoikeus_oid
		,ed_paattyi
		,sa1.tila
		,tila_alkanut = (select maxValue from dbo.Maximum (sa1.tila_alkanut, dateadd(day, 1, coalesce(oo_l.ed_paattyi,'1900-01-01')), @date))
		,alku = (select maxValue from dbo.Maximum (sa1.alku, dateadd(day, 1, coalesce(oo_l.ed_paattyi,'1900-01-01')), @date))
		,loppu = (select minValue from dbo.Minimum (sa1.loppu, coalesce(oo_l.loppu,'9999-12-31'), eomonth(@date)))
		,tila_alkanut_ei_muokattu = (select maxValue from dbo.Maximum (sa1.tila_alkanut, @date, default))
		,alku_ei_muokattu = (select maxValue from dbo.Maximum (sa1.alku, @date, default))
		,loppu_ei_muokattu = (select minValue from dbo.Minimum (sa1.loppu, eomonth(@date), default))
		,opintojen_rahoitus = coalesce(sa2.opintojen_rahoitus, sa3.opintojen_rahoitus, sa4.opintojen_rahoitus, sa1.opintojen_rahoitus)
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
		,toisen_opiskeluoikeuden_sisalla = case when oo_l.toisen_opiskeluoikeuden_sisalla = 1 then 1 else 0 end
		,ed_jatkuu
		,valiaikainen_keskeytys
		,loma_pv_nyk =	CASE
							WHEN datediff(day, (select maxValue from dbo.Maximum(@date, sa1.alku, dateadd(day, 1, coalesce(oo_l.ed_paattyi,'1900-01-01')))), (select minValue from dbo.Minimum (eomonth(@date), sa1.loppu, oo_l.loppu))) + 1 < 0 THEN 0
							ELSE datediff(day, (select maxValue from dbo.Maximum(@date, sa1.alku, dateadd(day, 1, coalesce(oo_l.ed_paattyi,'1900-01-01')))), (select minValue from dbo.Minimum (eomonth(@date), sa1.loppu, oo_l.loppu))) + 1
						END
		,loma_pv_hist =	CASE
							WHEN datediff(day, (select maxValue from dbo.Maximum (sa1.tila_alkanut, dateadd(day, 1, coalesce(oo_l.ed_paattyi,'1900-01-01')), DEFAULT)), @prevDateEnd) + 1 < 0 THEN 0
							ELSE datediff(day, (select maxValue from dbo.Maximum (sa1.tila_alkanut, dateadd(day, 1, coalesce(oo_l.ed_paattyi,'1900-01-01')), DEFAULT)), @prevDateEnd) + 1
						END
		,loma_pv_nyk_ei_muokattu =	
						CASE
							WHEN datediff(day, (select maxValue from dbo.Maximum(@date, sa1.alku, default)), (select minValue from dbo.Minimum (eomonth(@date), sa1.loppu, default))) + 1 < 0 THEN 0
							ELSE datediff(day, (select maxValue from dbo.Maximum(@date, sa1.alku, default)), (select minValue from dbo.Minimum (eomonth(@date), sa1.loppu, default))) + 1
						END
		,loma_pv_hist_ei_muokattu =	
						CASE
							WHEN datediff(day, sa1.tila_alkanut, @prevDateEnd) + 1 < 0 THEN 0
							ELSE datediff(day, sa1.tila_alkanut, @prevDateEnd) + 1
						END
		
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso sa1
	
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
			,ed_jatkuu
			,aiempi_koulutusmuoto
			,toisen_opiskeluoikeuden_sisalla
			,valiaikainen_keskeytys
		from sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet
		where ed_paattyi_ennen_jakson_alkua = 0
		group by opiskeluoikeus_oid,ed_paattyi,ed_jatkuu,aiempi_koulutusmuoto,toisen_opiskeluoikeuden_sisalla,valiaikainen_keskeytys,alku
	) oo_l on oo_l.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and oo_l.alku between sa1.alku and sa2.loppu

	WHERE sa1.tila = 'loma' 
	and (sa1.alku <= eomonth(@date) and sa1.loppu >= @date)
	--and ((@date between sa1.alku and sa1.loppu) or (SELECT isSame from dbo.Same_month_and_year (@date, sa1.alku)) = 1)															
	--tämä turha?, hoituu edellisellä
	and coalesce(oo_l.loppu,'9999-12-31') != '1900-01-01'																
	--aiempi ei jatku tai väliaikainen keskeytys
	and (coalesce(oo_l.ed_jatkuu,0) = 0	or (coalesce(oo_l.ed_jatkuu,1) = 1 and coalesce(oo_l.loppu,'a') != ''))			
	--AP 10.7.2019 ao ehto poistettu
	--jaksot joiden loppu on edellisen opiskeluoikeuden päättymisen jälkeen
	--and sa1.loppu > coalesce(oo_l.ed_paattyi,'1900-01-01')	
	--AP 18.7.2019 ao lisätty
	and sa1.opiskeluvalmiuksia_tukevat_opinnot = 0

) ooa

INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid

GO
USE ANTERO