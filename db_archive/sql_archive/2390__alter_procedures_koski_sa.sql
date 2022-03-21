USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_osasuoritus_kustannusryhma]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_osasuoritus_kustannusryhma]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]    Script Date: 12.9.2019 15:44:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut] AS' 
END
GO

ALTER procedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut] @date as date = '2018-01-01' as

TRUNCATE TABLE sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut


;WITH ed_jaksot AS (
	SELECT 
		 ooa.opiskeluoikeus_oid
		,tila_alkanut
		,loppu
		,case when ooa.tila = 'lasna' then osa_aikaisuus else null end as osa_aikaisuus
		,case when ooa.tila = 'lasna' then opintojen_rahoitus else null end as opintojen_rahoitus
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
	INNER JOIN Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_oidit o ON o.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
)

INSERT INTO sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut

SELECT 
	@date
	,ooa.opiskeluoikeus_oid
	,ooa.tila
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
	,lasna_pv_hyv = 
		case 
			when /*datediff(
					day,
					(select maxValue from dbo.Maximum (@date, alku, default)),
					(select minValue from dbo.Minimum (eomonth(@date),loppu, default))
				 ) + 1 < 0 
				 or*/ sisaltyy_toiseen_opiskeluoikeuteen = 1 
				 or alkanut_samana_paivana_hylataan = 1
				 or (toisen_opiskeluoikeuden_sisalla = 1 and valiaikainen_keskeytys = 0)
				 or (ed_jatkuu = 1 and valiaikainen_keskeytys = 0)  then 0.0
			else (osa_aikaisuus / 100.0) * (datediff(
					day,
					(select maxValue from dbo.Maximum (@date, alku, default)),
					(select minValue from dbo.Minimum (eomonth(@date),loppu, default))
				) + 1)
		end
	,lasna_pv_hyv_ei_muokattu = 
		 (osa_aikaisuus / 100.0) * (datediff(
					day,
					(select maxValue from dbo.Maximum (@date, alku_ei_muokattu, default)),
					(select minValue from dbo.Minimum (eomonth(@date),loppu_ei_muokattu, default))
				) + 1)
		
	,loma_pv_hyv = 0
	,loma_pv_hyv_ei_muokattu = 0
	,loma_pv_nyk = 0
	,loma_pv_nyk_ei_muokattu = 0
	,loma_pv_hist = 0
	,loma_pv_hist_ei_muokattu = 0
	,opva_pv_hyv = 0
	,opva_pv_hyv_ei_muokattu = 0
	,opva_pv_nyk = 0
	,opva_pv_nyk_ei_muokattu = 0
	,opva_pv_hist = 0
FROM ( 
	SELECT
		 sa1.opiskeluoikeus_oid
		,sa1.tila
		,alku = (select maxValue from dbo.Maximum (@date, sa1.alku, 
						case
							when dateadd(day,1,coalesce(ed_paattyi,dateadd(day,-1,oo_l.alku))) > oo_l.loppu then '1900-01-01' 
							else dateadd(day,1,coalesce(ed_paattyi,dateadd(day,-1,oo_l.alku)))
						end
				))--AP 11.7.2019 muutettu 1900-01-01 > oo_l.alku
		,loppu = (select minValue from dbo.Minimum (eomonth(@date), sa1.loppu, oo_l.loppu))
		,alku_ei_muokattu = (select maxValue from dbo.Maximum (@date, coalesce(oo_l.alku_tod, sa1.alku), default))
		,loppu_ei_muokattu = (select minValue from dbo.Minimum (eomonth(@date), coalesce(oo_l.loppu,sa1.loppu), default))
		,opintojen_rahoitus = coalesce(sa1.opintojen_rahoitus, sa2.opintojen_rahoitus, sa3.opintojen_rahoitus, sa4.opintojen_rahoitus)
		,majoitus
		,sisaoppilaitosmainen_majoitus
		,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
		,erityinen_tuki
		,vaativan_erityisen_tuen_erityinen_tehtava
		,hojks
		,vaikeasti_vammainen
		,vammainen_ja_avustaja
		,osa_aikaisuus = coalesce(sa1.osa_aikaisuus,sa2.osa_aikaisuus,sa3.osa_aikaisuus,sa4.osa_aikaisuus)
		,vankilaopetuksessa
		,oppisopimus_jossain_paatason_suorituksessa
		,opiskeluvalmiuksia_tukevat_opinnot
		,toisen_opiskeluoikeuden_sisalla
		,aiempi_koulutusmuoto = coalesce(oo_l.aiempi_koulutusmuoto,'')
		,ed_jatkuu
		,valiaikainen_keskeytys
		--,alkanut_samana_paivana_hylataan
		--,sisaltyy_toiseen_opiskeluoikeuteen
	FROM Koski_SA.[sa].[sa_koski_opiskeluoikeus_aikajakso] sa1
	
	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta
	LEFT JOIN ed_jaksot sa2 on sa2.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and datediff(day,sa2.loppu,sa1.tila_alkanut) = 1

	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisessä)
	LEFT JOIN ed_jaksot sa3 on sa3.opiskeluoikeus_oid = sa2.opiskeluoikeus_oid and datediff(day,sa3.loppu,sa2.tila_alkanut) = 1

	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisesssä)
	LEFT JOIN ed_jaksot sa4 on sa4.opiskeluoikeus_oid = sa3.opiskeluoikeus_oid and datediff(day,sa4.loppu,sa3.tila_alkanut) = 1

	--Opiskelijat, joilla useampi voimassa oleva opiskeluoikeus. Jos osa aiemmista opiskeluoikeuksista on päättynyt ja osa ei, huomioidaan vain voimassa oleva.
	LEFT JOIN (
		SELECT 
			opiskeluoikeus_oid
			,aiempi_koulutusmuoto
			,alku
			,loppu = coalesce(max(loppu),'')
			--,loppu = coalesce(loppu,'')
			,alku_tod
			,ed_paattyi
			,ed_jatkuu
			,toisen_opiskeluoikeuden_sisalla
			,valiaikainen_keskeytys
		FROM sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet
		WHERE ed_paattyi_ennen_jakson_alkua = 0
		GROUP BY opiskeluoikeus_oid,ed_paattyi,ed_jatkuu,aiempi_koulutusmuoto,toisen_opiskeluoikeuden_sisalla,valiaikainen_keskeytys,alku,alku_tod
	--AP 13.7.2019 lisätty ao ehto jakson ajankohdalle
	) oo_l on oo_l.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and oo_l.alku between sa1.alku and sa1.loppu

	WHERE sa1.tila in ('lasna','valmistunut') 
	and opiskeluvalmiuksia_tukevat_opinnot = 0
	and ((@date between sa1.alku and sa1.loppu) or (select isSame from dbo.Same_month_and_year (@date, sa1.alku)) = 1)
	--aiempi ei jatku tai väliaikainen keskeytys:
	and (coalesce(oo_l.ed_jatkuu,0) = 0	or (coalesce(oo_l.ed_jatkuu,1) = 1 and coalesce(oo_l.loppu,'a') != ''))	   
	--aiempi loppunut samana päivänä tai myöhemmin kuin nykyinen:
	and coalesce(oo_l.loppu,'9999-12-31') != '1900-01-01'															
	--AP 10.7.2019 ao otettu pois
	--ei päällekkäistä opiskeluoikeutta tai aiempi päättynyt:
	--and sa1.loppu > coalesce(oo_l.ed_paattyi,'1900-01-01')				

) ooa 

--Rajataan tarkastelujakson opiskeluoikeuksiin
INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid


				




GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma] AS' 
END
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
		 opiskeluoikeus_oid
		,tila_alkanut
		,loppu
		,case when tila = 'lasna' then osa_aikaisuus else null end as osa_aikaisuus
		,case when tila = 'lasna' then opintojen_rahoitus else null end as opintojen_rahoitus
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] 
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
	LEFT JOIN ed_jaksot sa3 on sa3.opiskeluoikeus_oid = sa2.opiskeluoikeus_oid and datediff(day,sa3.loppu,sa2.tila_alkanut) = 1

	--loman osa-aikaisuus ja rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisesssä)
	LEFT JOIN ed_jaksot sa4 on sa4.opiskeluoikeus_oid = sa3.opiskeluoikeus_oid and datediff(day,sa4.loppu,sa3.tila_alkanut) = 1
	
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
	and ((@date between sa1.alku and sa1.loppu) or (SELECT isSame from dbo.Same_month_and_year (@date, sa1.alku)) = 1)															
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
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva] AS' 
END
GO

ALTER procedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva] @date AS DATE = '2018-01-01' as

--declare @date as date
declare @prevDateEnd as date
declare @maxPV as decimal(10,5)

--set @date = '2018-08-01'
set @prevDateEnd = eomonth(dateadd(month,-1,@date))
set @maxPV = 182.5


truncate table sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva
insert into sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva

SELECT 
	 @date
	,opiskeluoikeus_oid
	,tila
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
	,lasna_pv_hyv = 
		CASE
			WHEN opva_hyv_hist + opva_summa_kertyma >= @maxPV then opva_nyk
			ELSE
				CASE
					WHEN opva_hyv_hist + opva_summa_kertyma + opva_nyk > @maxPV THEN opva_hyv_hist + opva_summa_kertyma + opva_nyk - @maxPV
					ELSE 0.0
				END
		END
	,lasna_pv_hyv_ei_muokattu = 
		CASE
			WHEN opva_hyv_hist + opva_summa_kertyma_ei_muokattu >= @maxPV then opva_nyk_ei_muokattu
			ELSE
				CASE
					WHEN opva_hyv_hist + opva_summa_kertyma_ei_muokattu + opva_nyk_ei_muokattu > @maxPV THEN opva_hyv_hist + opva_summa_kertyma_ei_muokattu + opva_nyk_ei_muokattu - @maxPV
					ELSE 0.0
				END
		END
	,loma_pv_hyv = 0
	,loma_pv_hyv_ei_muokattu = 0
	,loma_pv_nyk = 0
	,loma_pv_nyk_ei_muokattu = 0
	,loma_pv_hist = 0
	,loma_pv_hist_ei_muokattu = 0
	,opva_pv_hyv = (hyvaksytaan) *
		(CASE
			WHEN opva_hyv_hist + opva_summa_kertyma >= @maxPV then 0.0
			ELSE
				CASE
					WHEN opva_hyv_hist + opva_summa_kertyma + opva_nyk > @maxPV THEN @maxPV - opva_hyv_hist - opva_summa_kertyma
					ELSE opva_nyk
				END
		END)
	,opva_pv_hyv_ei_muokattu = 
		(CASE
			WHEN opva_hyv_hist + opva_summa_kertyma_ei_muokattu >= @maxPV then 0.0
			ELSE
				CASE
					WHEN opva_hyv_hist + opva_summa_kertyma_ei_muokattu + opva_nyk_ei_muokattu > @maxPV THEN @maxPV - opva_hyv_hist - opva_summa_kertyma_ei_muokattu
					ELSE opva_nyk_ei_muokattu
				END
		END)
	,opva_nyk
	,opva_nyk_ei_muokattu 
	,opva_hyv_hist
FROM (

	SELECT 
		opiskeluoikeus_oid
		,tila
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
		,hyvaksytaan
		,opva_nyk = (opva_lasna_nyk + opva_loma_hyv) * (osa_aikaisuus / 100.0)
		,opva_nyk_ei_muokattu = (opva_lasna_nyk_ei_muokattu + opva_loma_hyv_ei_muokattu) * (osa_aikaisuus / 100.0)
		,opva_hyv_hist
		,opva_summa_kertyma = sum((opva_lasna_nyk + opva_loma_hyv) * (osa_aikaisuus / 100.0)) over (partition by opiskeluoikeus_oid order by alku) 
							   - ((opva_lasna_nyk + opva_loma_hyv) * (osa_aikaisuus / 100.0))
		,opva_summa_kertyma_ei_muokattu = sum((opva_lasna_nyk_ei_muokattu + opva_loma_hyv_ei_muokattu) * (osa_aikaisuus / 100.0)) over (partition by opiskeluoikeus_oid order by alku) 
										   - ((opva_lasna_nyk_ei_muokattu + opva_loma_hyv_ei_muokattu) * (osa_aikaisuus / 100.0))

	FROM (
		SELECT
			opiskeluoikeus_oid
			,tila
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
			,hyvaksytaan
			,opva_lasna_nyk
			,opva_lasna_nyk_ei_muokattu
			,opva_loma_hyv = 
				CASE
					WHEN opva_loma_hist + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut, @date, DEFAULT)), alku) >= 28 THEN 0
					WHEN opva_loma_hist + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut, @date, DEFAULT)), alku) + opva_loma_nyk >= 28 THEN 28 - (opva_loma_hist + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut, @date, DEFAULT)), alku))
					ELSE opva_loma_nyk
				END	
			,opva_loma_hyv_ei_muokattu = 
				CASE
					WHEN opva_loma_hist_ei_muokattu + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut_ei_muokattu, @date, DEFAULT)), alku) >= 28 THEN 0
					WHEN opva_loma_hist_ei_muokattu + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut_ei_muokattu, @date, DEFAULT)), alku) + opva_loma_nyk_ei_muokattu >= 28 THEN 28 - (opva_loma_hist_ei_muokattu + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut_ei_muokattu, @date, DEFAULT)), alku))
					ELSE opva_loma_nyk_ei_muokattu
				END	
			,opva_loma_nyk
			,opva_loma_nyk_ei_muokattu
			,opva_hyv_hist
	
		FROM (
			SELECT 
				 opiskeluoikeus_oid
				,tila
				,tila_alkanut
				,tila_alkanut_ei_muokattu
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
				,hyvaksytaan =
					case
						when sisaltyy_toiseen_opiskeluoikeuteen = 1 
							or alkanut_samana_paivana_hylataan = 1
							or (toisen_opiskeluoikeuden_sisalla = 1 and valiaikainen_keskeytys = 0)
							or (ed_jatkuu = 1 and valiaikainen_keskeytys = 0)  then 0
						else 1
					end
				,opva_lasna_nyk = case when tila in ('lasna','valmistunut') then DATEDIFF(day, alku, loppu) + 1 else 0 end
				,opva_lasna_nyk_ei_muokattu = case when tila in ('lasna','valmistunut') then DATEDIFF(day, alku_ei_muokattu, loppu_ei_muokattu) + 1 else 0 end
				,opva_loma_nyk = case when tila in ('loma') then DATEDIFF(day, alku, loppu) + 1 else 0 end
				,opva_loma_nyk_ei_muokattu = case when tila in ('loma') then DATEDIFF(day, alku_ei_muokattu, loppu_ei_muokattu) + 1 else 0 end
				,opva_loma_hist = 
					CASE
						WHEN tila = 'loma' THEN
							CASE
								WHEN datediff(day, tila_alkanut, @prevDateEnd) + 1 < 0 THEN 0
								ELSE datediff(day, tila_alkanut, @prevDateEnd) + 1
							END
						ELSE NULL
					END
				,opva_loma_hist_ei_muokattu = 
					CASE
						WHEN tila = 'loma' THEN
							CASE
								WHEN datediff(day, tila_alkanut_ei_muokattu, @prevDateEnd) + 1 < 0 THEN 0
								ELSE datediff(day, tila_alkanut_ei_muokattu, @prevDateEnd) + 1
							END
						ELSE NULL
					END
				,opva_hyv_hist
			
			FROM (
				SELECT distinct 
					 ooa.opiskeluoikeus_oid
					,ooa.tila
					,tila_alkanut = (select maxValue from dbo.Maximum(ooa.tila_alkanut, dateadd(day, 1, coalesce(oo_l.ed_paattyi,'1900-01-01')), DEFAULT))
					,tila_alkanut_ei_muokattu = ooa.tila_alkanut
					,alku = (select maxValue from dbo.Maximum (coalesce(oo_l.alku, ooa.alku), @date, DEFAULT)) 
					,loppu = (select minValue from dbo.Minimum (coalesce(oo_l.loppu, ooa.loppu), EOMONTH(@date), DEFAULT))
					,alku_ei_muokattu = (select maxValue from dbo.Maximum (@date, coalesce(oo_l.alku_tod, ooa.alku), DEFAULT)) 
					,loppu_ei_muokattu = (select minValue from dbo.Minimum (EOMONTH(@date), coalesce(oo_l.loppu, ooa.loppu), DEFAULT))
					,opintojen_rahoitus = case when ooa.tila in ('loma','valmistunut') then coalesce(sa2.opintojen_rahoitus, ooa.opintojen_rahoitus) else ooa.opintojen_rahoitus end
					,majoitus
					,sisaoppilaitosmainen_majoitus
					,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
					,erityinen_tuki
					,vaativan_erityisen_tuen_erityinen_tehtava
					,hojks
					,vaikeasti_vammainen
					,vammainen_ja_avustaja
					,osa_aikaisuus = case when ooa.tila = 'loma' then coalesce(sa2.osa_aikaisuus, ooa.osa_aikaisuus) else ooa.osa_aikaisuus end
					,vankilaopetuksessa
					,oppisopimus_jossain_paatason_suorituksessa 
					,opiskeluvalmiuksia_tukevat_opinnot
					,alkanut_samana_paivana_hylataan = null --case when hyl.opiskeluoikeus_oid_hylataan is not null then 1 else 0 end
					,toisen_opiskeluoikeuden_sisalla = case when oo_l.toisen_opiskeluoikeuden_sisalla = 1 then 1 else 0 end
					,sisaltyy_toiseen_opiskeluoikeuteen
					,aiempi_koulutusmuoto = coalesce(oo_l.aiempi_koulutusmuoto,'')
					,ed_jatkuu
					,valiaikainen_keskeytys
					,ed_paattyi
					,opva_hyv_hist = coalesce(opva.opva_hyv_hist,0)
				FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
				INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet oo_l on oo_l.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and oo_l.alku between ooa.alku and ooa.loppu
				--LEFT JOIN sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat hyl on hyl.opiskeluoikeus_oid_hylataan = ooa.opiskeluoikeus_oid
				--loman rahoitus- ja osa-aikaisuustieto ja valmistumisen rahoitustieto edellisestä läsnäolojaksosta
				LEFT JOIN (
					SELECT 
						 opiskeluoikeus_oid
						,loppu
						,opintojen_rahoitus
						,osa_aikaisuus
					FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] 
					WHERE tila='lasna' and opiskeluvalmiuksia_tukevat_opinnot = 1
				) sa2 ON sa2.opiskeluoikeus_oid=ooa.opiskeluoikeus_oid and DATEDIFF(DAY,sa2.loppu,ooa.tila_alkanut) = 1
				--kertyneet opva päivät
				LEFT JOIN (
					SELECT 
						opiskeluoikeus_oid
						,opva_hyv_hist = SUM(opiskelijavuosi_opva)
					FROM Koski_SA.sa.opiskelijavuodet_valitaulu
					WHERE vuosi < YEAR(@date) OR (kuukausi < MONTH(@date) and vuosi = YEAR(@date))
					GROUP BY opiskeluoikeus_oid
				) opva ON opva.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid

				WHERE ooa.opiskeluvalmiuksia_tukevat_opinnot = 1 
				and ooa.tila in ('lasna','valmistunut','loma')
				--ei ole päättynyt ennen tarkastelujakson alkua
				and ooa.loppu >= @date																													
				--päällekkäinen opiskeluoikeus päättynyt tai väliaikainen keskeytys
				and (coalesce(oo_l.ed_jatkuu,0) = 0	or (oo_l.ed_jatkuu = 1 and oo_l.alku is not null))													
				--alkunut kyseisen kuukauden aikana tai sitä ennen
				and (@date >= coalesce(oo_l.alku, ooa.alku) or (select isSame from dbo.Same_month_and_year (@date, coalesce(oo_l.alku, ooa.alku)))=1)	
				--and oo.sisaltyy_opiskeluoikeuteen_oid is null

			) q1

		) q2

	) q3

) q4

ORDER BY opiskeluoikeus_oid desc

GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit] AS' 
END
GO

ALTER procedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit] @date as date = '2018-01-01' as

/*
	Hakee opiskeluoikeudet, joilla on lasna-, valmistunut- tai lomajakso tarkastelukuukauden aikana.
*/

truncate table sa.temp_opiskelijavuodet_opiskeluoikeus_oidit

insert into sa.temp_opiskelijavuodet_opiskeluoikeus_oidit
(
	 pvm
	,oppija_oid
	,opiskeluoikeus_oid
	,alkamispaiva
	,paattymispaiva
	,osatutkinto
	,alkanut_samana_paivana_hylataan
	,sisaltyy_toiseen_opiskeluoikeuteen
)

select 
	 @date
	,oppija_oid
	,opiskeluoikeus_oid
	,alkamispaiva
	,paattymispaiva
	,osatutkinto =	
		case
			when a_oid is null and ao_oid is not null then 1 
			else 0 
		end
	,alkanut_samana_paivana_hylataan = 
		case 
			when opiskeluoikeus_oid_hylataan is not null then 1
			else 0
		end
	,sisaltyy_toiseen_opiskeluoikeuteen = 
		case 
			when sisaltyy_opiskeluoikeuteen_oid is not null then 1
			else 0
		end
from (

	select distinct
		 oo.oppija_oid
		,oo.opiskeluoikeus_oid
		,oo.alkamispaiva
		,oo.paattymispaiva
		,a_oid = atutk.opiskeluoikeus_oid
		,ao_oid = atutko.opiskeluoikeus_oid
		,opiskeluoikeus_oid_hylataan = null --hyl.opiskeluoikeus_oid_hylataan
		,sisaltyy_opiskeluoikeuteen_oid
	from sa.sa_koski_opiskeluoikeus oo
	inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
	left join (
		select 
			opiskeluoikeus_oid
		from Koski_SA.sa.sa_koski_paatason_suoritus
		where suorituksen_tyyppi = 'ammatillinentutkinto'
	) atutk on atutk.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	left join (
		select 
			opiskeluoikeus_oid
		from Koski_SA.sa.sa_koski_paatason_suoritus
		where suorituksen_tyyppi = 'ammatillinentutkintoosittainen'
	) atutko on atutko.opiskeluoikeus_oid = oo.opiskeluoikeus_oid

	--left join Koski_SA.sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat hyl on hyl.opiskeluoikeus_oid_hylataan = oo.opiskeluoikeus_oid

	where oo.koulutusmuoto = 'ammatillinenkoulutus'
	--and oo.sisaltyy_opiskeluoikeuteen_oid is null
	and ooa.tila in ('loma','lasna','valmistunut')
	and ((@date between ooa.alku and ooa.loppu) or (select isSame from dbo.Same_month_and_year (@date, ooa.alku)) = 1)

) q




GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma] AS' 
END
GO



ALTER procedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma] as

truncate table sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

insert into sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma
(
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,kr
)

SELECT distinct
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,kr = coalesce(min_kr_ot, okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
FROM (

	SELECT 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo
		,min_kr_ot = min(case when d.kr_count > 1 then d.kr_min_ilman1 else d.kr_min end)
	FROM Koski_SA.sa.sa_koski_paatason_suoritus ps
	inner join Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and osatutkinto = 1
	inner join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	left join Koski_SA.sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id and os.suorituksen_tyyppi = 'ammatillisentutkinnonosa'
	left join (
		select 
			 tutkinnonosa_koodi
			,kr_min = min(kustannusryhma_koodi)
			,kr_min_ilman1 = min(case when kustannusryhma_koodi='1' then '5' else kustannusryhma_koodi end)
			,kr_count = count(distinct kustannusryhma_koodi)
		from Koski_SA.sa.osasuoritus_kustannusryhma 
		group by tutkinnonosa_koodi
	) d on d.tutkinnonosa_koodi = os.koulutusmoduuli_koodiarvo 

	where ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' 
	and year(ooa.loppu) >= 2018 and ooa.tila in ('loma','lasna','valmistunut')

	group by 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo

) q

--kustannusryhma niille joilta ei löydy osasuorituksia
left join ANTERO.dw.d_koulutusluokitus k3 ON k3.koulutusluokitus_koodi = COALESCE(NULLIF(q.koulutusmoduuli_koodiarvo,'999904'), q.tutkinto_koodiarvo)
left join ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = q.osaamisala_koodiarvo
left join ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(k3.uusi_eat_koodi,k3.koulutusluokitus_koodi)
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet] @startDate as date = '2018-01-01' AS


declare @endDate as date
set @endDate = EOMONTH(@startdate)

truncate table sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet

insert into sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet
(
	 pvm
	,oppija_oid
	,opiskeluoikeus_oid
	,aiempi_koulutusmuoto
	,tila
	,alku
	,loppu
	,alku_tod
	,ed_paattyi
	,ed_paattyi_ennen_jakson_alkua
	,ed_jatkuu
	,valiaikainen_keskeytys
	,toisen_opiskeluoikeuden_sisalla
)
SELECT
	alkupvm
	,oppija_oid
	,nyk_opiskeluoikeus_oid
	,aiempi_koulutusmuoto
	,nyk_tila
	,alku
	,loppu
	,alku_tod
	,ed_paattyi
	,ed_paattyi_ennen_jakson_alkua
	,ed_jatkuu
	,valiaikainen_kesk
	,toisen_opiskeluoikeuden_sisalla
FROM (

	SELECT 
	
		 alkupvm
		,oppija_oid
		,nyk_opiskeluoikeus_oid
		,aiempi_koulutusmuoto 
		,nyk_tila
		,alku = nullif(nyk_alku_korjattu,'9999-12-31') --case when max(ed_jatkuu) = 0 and nullif(max(nyk_alku_korjattu),'9999-12-31') is null then '1900-01-01' else nullif(max(nyk_alku_korjattu),'9999-12-31') end
		,loppu = nullif(nyk_loppu_korjattu,'9999-12-31') --case when max(ed_jatkuu) = 0 and nullif(max(nyk_loppu_korjattu),'9999-12-31') is null then '1900-01-01' else nullif(max(nyk_loppu_korjattu),'9999-12-31') end
		,ed_paattyi = case when aiempi_paattymispvm < nyk_loppu_korjattu then cast(aiempi_paattymispvm as date) else null end--nullif(max(coalesce(ed_paattyi,'9999-12-31')),'9999-12-31')
		,alku_tod = case when datediff(day,aiempi_paattymispvm,nyk_alku_korjattu)=1 and nyk_tila != 'valmistunut' and datediff(day, aiempi_paattymispvm, nyk_alku) != 1  then cast(aiempi_paattymispvm as date) else nyk_alku_korjattu end
		,ed_paattyi_ennen_jakson_alkua = min(ed_paattyi_ennen_alkua)
		,ed_jatkuu = case when aiempi_paattymispvm >= nyk_loppu_korjattu then 1 else 0 end--max(ed_jatkuu)
		,toisen_opiskeluoikeuden_sisalla = max(toisen_opiskeluoikeuden_sisalla)
		,valiaikainen_kesk 
		,rnk = rank() over (partition by nyk_opiskeluoikeus_oid order by aiempi_paattymispvm desc, aiempi_alkamispvm, aiempi_koulutusmuoto desc/*, valiaikainen_kesk desc*/) --AP 11.7.2019 lisätty väliaikainen keskeytys
	FROM (

		SELECT distinct
			 alkupvm = @startDate
			,oo_a.oppija_oid
			,aiempi_koulutusmuoto = coalesce(oo_la.koulutusmuoto,'')
			,aiempi_alkamispvm = oo_la.alkamispaiva
			,aiempi_paattymispvm = oo_la.paattymispaiva
			,nyk_opiskeluoikeus_oid = oo_a.opiskeluoikeus_oid
			,oo_la.tila
			,cast(oo_la.alku as date) vanha_alku
			,cast(oo_la.loppu as date) vanha_loppu
			,nyk_tila = ooa.tila
			,nyk_alku = ooa.alku
			,nyk_alku_korjattu = cast(
			
						case	
							when oo_la.tila = 'valiaikaisestikeskeytynyt' 
									and ((@startDate between oo_la.alku and oo_la.loppu) or (select isSame from dbo.Same_month_and_year (@startDate, oo_la.alku)) = 1)	--aiemman opiskeluoikeuden käynnissä oleva jakso
									and ooa.alku <= oo_la.loppu																											--jakso alkanut ennen edellisen opiskeluoikeuden päättymistä
									then (select MaxValue from dbo.Maximum (@startDate, ooa.alku, oo_la.alku))
							when oo_la.tila in ('katsotaaneronneeksi','eronnut','valmistunut','peruutettu') --and ed_jatkuu = 0
									and ((@startDate between oo_la.alku and oo_la.loppu) or (select isSame from dbo.Same_month_and_year (@startDate, oo_la.alku)) = 1)	--aiemman oikeuden käynnissä oleva jakso
									and (select isSame from dbo.Same_month_and_year (oo_la.paattymispaiva, @startDate)) = 1												--päättynyt kuun aikana
									and oo_la.paattymispaiva < ooa.loppu 
									then (select MaxValue from dbo.Maximum (ooa.alku, CASE WHEN dateadd(day, 1, oo_la.paattymispaiva) > @endDate THEN @endDate ELSE dateadd(day, 1, oo_la.paattymispaiva) END, DEFAULT))
							when oo_la.paattymispaiva < @startDate																										--aiempi opiskeluoikeus ei enää voimassa
									then (select MaxValue from dbo.Maximum (ooa.alku, @startDate, DEFAULT))
							when --ed_jatkuu = 1 and																													--kaksi opiskeluoikeutta joista toinen päättynyt ja toinen ei
									valiaikainen_kesk = 0 
									and ((@startDate between oo_la.alku and oo_la.loppu) or (select isSame from dbo.Same_month_and_year (@startDate, oo_la.alku)) = 1) 
									--AP 10.7.2019 ao muokattu
									then (select MaxValue from dbo.Maximum (@startDate, ooa.alku, oo_la.alku))--'9999-12-31'
							--AP 10.7.2019 lisätty else
							else (select MaxValue from dbo.Maximum (ooa.alku, @startDate, oo_la.alku))
						end 
			
			 as date)
			,nyk_loppu_korjattu = cast(
			
						case
							when oo_la.tila = 'valiaikaisestikeskeytynyt' 
									and ((@startDate between oo_la.alku and oo_la.loppu) or (select isSame from dbo.Same_month_and_year (@startDate, oo_la.alku)) = 1)	--aiemman opiskeluoikeuden käynnissä oleva jakso
									and ooa.alku <= oo_la.loppu																										--jakso alkanut ennen edellisen opiskeluoikeuden päättymistä
									then (select MinValue From dbo.Minimum (@endDate, oo_la.loppu, ooa.loppu))
							when oo_la.tila in ('katsotaaneronneeksi','eronnut','valmistunut','peruutettu')-- and ed_jatkuu = 0
									and ((@startDate between oo_la.alku and oo_la.loppu) or (select isSame from dbo.Same_month_and_year (@startDate, oo_la.alku)) = 1)	--aiemman oikeuden käynnissä oleva jakso
									and (select isSame from dbo.Same_month_and_year (oo_la.paattymispaiva, @startDate)) = 1												--päättynyt kuun aikana
									and oo_la.paattymispaiva < ooa.loppu 
									then (select MinValue From dbo.Minimum (@endDate, ooa.loppu, DEFAULT))
							when oo_la.paattymispaiva < @startDate																										--aiempi opiskeluoikeus ei enää voimassa
									then (select MinValue From dbo.Minimum (@endDate, ooa.loppu, DEFAULT))
							when --ed_jatkuu = 1 and																														--kaksi opiskeluoikeutta joista toinen päättynyt ja toinen ei
								 valiaikainen_kesk = 0 and
									oo_la.viim_jakso_ennen_valmistumista_tai_eroamista = 1 and
									((@startDate between oo_la.alku and oo_la.loppu) or (select isSame from dbo.Same_month_and_year (@startDate, oo_la.alku)) = 1) 
									--AP 10.7.2019 ao muokattu
									then (select MinValue From dbo.Minimum (@endDate, ooa.loppu, oo_la.loppu)) --'9999-12-31'
							when ed_jatkuu = 1
									and ((@startDate between oo_la.alku and oo_la.loppu) or (select isSame from dbo.Same_month_and_year (@startDate, oo_la.alku)) = 1) 
									then (select MinValue From dbo.Minimum (@endDate, ooa.loppu, oo_la.loppu))
							--AP 10.7.2019 lisätty else
							else (select MinValue From dbo.Minimum (@endDate, ooa.loppu, oo_la.loppu))
						end 
			
			 as date)
			 ,ed_paattyi_ennen_alkua = case when oo_la.paattymispaiva < @startDate then 1 else 0 end
			 ,toisen_opiskeluoikeuden_sisalla = case when oo_la.paattymispaiva >= coalesce(oo_a.paattymispaiva,'9999-12-31') then 1 else 0 end
			 ,valiaikainen_kesk
	
		FROM [Koski_SA].[sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit] oo_a

		inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo_a.opiskeluoikeus_oid

		--opiskelijan päällekkäiset opiskeluoikeudet ja aikajaksot
		inner join (

			select 
				 oo.oppija_oid
				,ooa.opiskeluoikeus_oid
				,oo.alkamispaiva
				,paattymispaiva = cast(coalesce(oo.paattymispaiva,'9999-12-31') as datetime)
				,ooa.alku
				,ooa.loppu
				,viim_jakso_ennen_valmistumista_tai_eroamista = case when datediff(day,ooa.loppu,oo.paattymispaiva)=1 then 1 else 0 end
				,ooa.tila
				,oo.koulutusmuoto
				,ed_jatkuu = case when coalesce(oo.paattymispaiva,'9999-12-31') >= @endDate then 1 else 0 end
				,valiaikainen_kesk = case when tila = 'valiaikaisestikeskeytynyt' and ooa.loppu > @startDate then 1 else 0 end
				,alkanut_samana_paivana = 0
			from Koski_SA.sa.sa_koski_opiskeluoikeus oo
			inner join (select distinct oppija_oid from sa.temp_opiskelijavuodet_opiskeluoikeus_oidit) o on o.oppija_oid = oo.oppija_oid 
			inner join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
			left join Koski_SA.sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			where (oo.koulutusmuoto = 'ammatillinenkoulutus' or (oo.koulutusmuoto = 'lukiokoulutus' and ps.suorituksen_tyyppi = 'lukionoppimaara'))
			and ooa.alku <= @endDate
			and (@startDate between ooa.alku and ooa.loppu or (select isSame from dbo.Same_month_and_year (@startDate, ooa.alku)) = 1)
			and oo.sisaltyy_opiskeluoikeuteen_oid is null

			UNION

			select 
				 oo.oppija_oid
				,ooa.opiskeluoikeus_oid
				,oo.alkamispaiva
				,paattymispaiva = cast(coalesce(oo.paattymispaiva,'9999-12-31') as datetime)
				,ooa.alku
				,ooa.loppu
				,viim_jakso_ennen_valmistumista_tai_eroamista = case when datediff(day,ooa.loppu,oo.paattymispaiva)=1 then 1 else 0 end
				,ooa.tila
				,oo.koulutusmuoto
				,ed_jatkuu = case when coalesce(oo.paattymispaiva,'9999-12-31') >= @endDate then 1 else 0 end
				,valiaikainen_kesk = case when tila = 'valiaikaisestikeskeytynyt' and ooa.loppu > @startDate then 1 else 0 end
				,alkanut_samana_paivana = 1
			from Koski_SA.sa.sa_koski_opiskeluoikeus oo
			inner join sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat o on o.opiskeluoikeus_oid_hyvaksytaan = oo.opiskeluoikeus_oid
			inner join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
			left join Koski_SA.sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			where ooa.alku <= @endDate
			and (@startDate between ooa.alku and ooa.loppu or (select isSame from dbo.Same_month_and_year (@startDate, ooa.alku)) = 1)
			and oo.sisaltyy_opiskeluoikeuteen_oid is null
	
		) oo_la on oo_la.oppija_oid = oo_a.oppija_oid					--sama oppija-oid
			   and oo_la.opiskeluoikeus_oid != oo_a.opiskeluoikeus_oid	--eri opiskeluoikeus
			   and (													--ammatillinen alkanut ennen nykyistä
				(oo_la.alkamispaiva < oo_a.alkamispaiva and oo_la.koulutusmuoto = 'ammatillinenkoulutus' and alkanut_samana_paivana = 0) 
				or														--lukio alkanut ennen nykyistä tai samana päivänä
				(oo_la.alkamispaiva <= oo_a.alkamispaiva and oo_la.koulutusmuoto = 'lukiokoulutus' and alkanut_samana_paivana = 0) 
				or
				(alkanut_samana_paivana = 1)
			   )
			   and oo_la.paattymispaiva > oo_a.alkamispaiva				--ei ole päättynyt ennen nykyistä
			   and ((oo_la.loppu between ooa.alku and ooa.loppu) or (oo_la.alku between ooa.alku and ooa.loppu) or (ooa.alku between oo_la.alku and oo_la.loppu) or (ooa.loppu between oo_la.alku and oo_la.loppu)) --aikajaksot menee päällekkäin
		
		--samana päivänä alkaneet hylättävät
		--left join Koski_SA.sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat hyl on hyl.opiskeluoikeus_oid_hylataan = oo_la.opiskeluoikeus_oid

		where 1=1
		--nykyinen opiskeluoikeus
		and (oo_a.alkamispaiva <= @startDate or (select isSame from dbo.Same_month_and_year (@startDate, oo_a.alkamispaiva)) = 1)		--uusi oikeus alkanut ennen jaksoa tai sen aikana
		--käynnissä olevat jaksot 
		and ((@startDate between ooa.alku and ooa.loppu) or (select isSame from dbo.Same_month_and_year (@startDate, ooa.alku)) = 1)	
		and ooa.tila in ('lasna','valmistunut','loma')
		--and hyl.opiskeluoikeus_oid_hylataan is null


	) q
	where nyk_alku_korjattu <= nyk_loppu_korjattu
	group by 
			 alkupvm
			,oppija_oid
			,aiempi_koulutusmuoto
			,aiempi_alkamispvm
			,aiempi_paattymispvm
			,nyk_alku
			,nyk_opiskeluoikeus_oid
			,nyk_tila
			,nyk_alku_korjattu
			,nyk_loppu_korjattu
			,valiaikainen_kesk
) q2
where rnk=1


GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_paatason_suoritus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_paatason_suoritus] AS' 
END
GO


ALTER procedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus] as

truncate table sa.temp_opiskelijavuodet_paatason_suoritus

insert into sa.temp_opiskelijavuodet_paatason_suoritus


SELECT
	 ps.opiskeluoikeus_oid
	,paatason_suoritus_id
	,ps.suorituksen_tyyppi
	,ps.koulutusmoduuli_koodiarvo
	,ps.tutkinto_koodiarvo
	,ps.osaamisala_koodiarvo
	,k.koulutusluokitus_koodi
	,okr.kustannusryhma_koodi as kustannusryhma_oa
	,tkr.kustannusryhma_koodi as kustannusryhma_tutk
	,ps.toimipiste_oid
	,rnk
FROM 
(
	SELECT distinct
		 pts.opiskeluoikeus_oid
		,paatason_suoritus_id
		,suorituksen_tyyppi
		,koulutusmoduuli_koodiarvo
		,tutkinto_koodiarvo
		,osaamisala_koodiarvo
		,toimipiste_oid
		,RANK() OVER (PARTITION BY pts.opiskeluoikeus_oid ORDER BY suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo) as rnk 
	FROM [Koski_SA].sa.sa_koski_paatason_suoritus pts
	INNER JOIN temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = pts.opiskeluoikeus_oid
) ps  
LEFT JOIN ANTERO.dw.d_koulutusluokitus k ON k.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo,'999904'), ps.tutkinto_koodiarvo)
--kustannusryhmä
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = coalesce(k.uusi_eat_koodi,k.koulutusluokitus_koodi)
where ps.rnk = 1

GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat] AS

/*
 Katsotaan oppija_oideittain samana päivänä alkaneet opiskeluoikeudet (huomioidaan maksimissaan kolme samaan aikaan alkanutta. Neljä samaan aikaan alkanutta on vain muutamalla opiskelijalla. Niiden osalta päättely ei välttämättä tuota täysin oikeaa lopputulosta, mutta ehtojen määrä neljässä tapauksessa on liian suuri). 
 Valittujen kriteerien perusteella valitaan yksi opiskeluoikeus (joka on rahoituksen kannalta relevantein). 
 Sen jälkeen katsotaan riveittäin onko opiskeluoikeus sama kuin kyseisen oppijan valittu opiskeluoikeus. 
 Lopputuloksena lista hylättävistä opiskeluoikeuksista, jotka liitetään tauluun temp_opiskelijavuodet_opiskeluoikeus_oidit (ks. sen proseduuri).

 --Juhon ja Sepon speksi: 
 --Ensisijaisesti valitaan se opiskeluoikeus, joka vaikuttaa rahoitukseen (hylätään "muuta kautta rahoitetut" ja "työnantajan kokonaan rahoittamat").
 --Sen jälkeen valitaan pisimpään jatkunut/yhä voimassa oleva. 
 --Sen jälkeen muu-kuin-näyttötutkintoonvalmistava. 
 --Sen jälkeen osa-aikaisuusprosentin mukaan.
 --Sen jälkeen valmistumisen mukaan (valmistunut vs keskeyttänyt/eronnut)
 --Jos edellä mainituilla kriteereillä ei saada valittua niin sitten randomisti. Jos päädytään viimeiseen kohtaan, kyse on luultavasti siitä, että opiskelijalle on vahingossa luotu tuplaoikeus.
*/

TRUNCATE TABLE Koski_SA.sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat

;
WITH suorituksen_tyyppi AS (
	select 
		 opiskeluoikeus_oid
		,suorituksen_Tyyppi
		,rnk
	from (
		SELECT 
			sa1.opiskeluoikeus_oid
			,suorituksen_tyyppi
			,RANK() OVER (PARTITION BY sa1.opiskeluoikeus_oid ORDER BY suorituksen_tyyppi, koulutusmoduuli_koodiarvo) rnk
		FROM Koski_SA.sa.sa_koski_paatason_suoritus sa1
		join Koski_SA.sa.sa_koski_opiskeluoikeus sa2 on sa2.opiskeluoikeus_oid=sa1.opiskeluoikeus_oid
		where sa2.koulutusmuoto = 'ammatillinenkoulutus'
	) q2
	where rnk = 1
)

INSERT INTO Koski_SA.sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat (oppija_oid, opiskeluoikeus_oid_hyvaksytaan)

SELECT DISTINCT
	oppija_oid
	,opiskeluoikeus_oid_hyvaksytaan = case when oid1 = oid_valittu then oid1 else null end 

FROM (
	SELECT 
		 oo.oppija_oid
		,oid1
		,oid2
		,oid3
		,case 
			when rahoitus1 not in (4,6) and rahoitus2 in (4,6) and rahoitus3 in (4,6) then oid1
			when rahoitus1 in (4,6) and rahoitus2 not in (4,6) and rahoitus3 in (4,6) then oid2
			when rahoitus1 in (4,6) and rahoitus2 in (4,6) and rahoitus3 not in (4,6) then oid3
			when paattymispvm1 > paattymispvm2 and paattymispvm1 > paattymispvm3 then oid1
			when paattymispvm1 < paattymispvm2 and paattymispvm2 > paattymispvm3 then oid2
			when paattymispvm1 < paattymispvm3 and paattymispvm2 < paattymispvm3 then oid3
			when suorituksen_tyyppi1 = 'nayttotutkintoonvalmistavakoulutus' then
				case
					when suorituksen_tyyppi2 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 <> 'nayttotutkintoonvalmistavakoulutus' and paattymispvm2 <> paattymispvm3 then
						case 
							when paattymispvm2 > paattymispvm3 then oid2
							else oid3
						end 
					when suorituksen_tyyppi2 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 = 'nayttotutkintoonvalmistavakoulutus' then oid2
					when suorituksen_tyyppi2 = 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 <> 'nayttotutkintoonvalmistavakoulutus' then oid3
				end
			when suorituksen_tyyppi2 = 'nayttotutkintoonvalmistavakoulutus' then
				case
					when suorituksen_tyyppi1 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 <> 'nayttotutkintoonvalmistavakoulutus' and paattymispvm1 <> paattymispvm3 then
						case 
							when paattymispvm1 > paattymispvm3 then oid1
							else oid3
						end 
					when suorituksen_tyyppi1 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 = 'nayttotutkintoonvalmistavakoulutus' then oid1
					when suorituksen_tyyppi1 = 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 <> 'nayttotutkintoonvalmistavakoulutus' then oid3
				end 
			when suorituksen_tyyppi3 = 'nayttotutkintoonvalmistavakoulutus' and oid3 <> '9' then
				case
					when suorituksen_tyyppi1 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi2 <> 'nayttotutkintoonvalmistavakoulutus' and paattymispvm1 <> paattymispvm2 then
						case 
							when paattymispvm1 > paattymispvm2 then oid1
							else oid2
						end 
					when suorituksen_tyyppi1 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi2 = 'nayttotutkintoonvalmistavakoulutus' then oid1
					when suorituksen_tyyppi1 = 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi2 <> 'nayttotutkintoonvalmistavakoulutus' then oid2
				end 
			when osa_aikaisuus1 > osa_aikaisuus2 and osa_aikaisuus1 > osa_aikaisuus3 then oid1
			when osa_aikaisuus1 < osa_aikaisuus2 and osa_aikaisuus2 > osa_aikaisuus3 then oid2
			when osa_aikaisuus1 < osa_aikaisuus3 and osa_aikaisuus2 < osa_aikaisuus3 then oid3
			when valmistunut1 is not null and valmistunut2 is null and valmistunut3 is null then oid1
			when valmistunut1 is null and valmistunut2 is not null and valmistunut3 is null then oid2
			when valmistunut1 is null and valmistunut2 is null and valmistunut3 is not null then oid3
			else 
				case
					when oid1 < oid2 and oid1 < oid3 then oid1
					when oid1 > oid2 and oid2 < oid3 then oid2
					else oid3
				end
		end as oid_valittu

	FROM (
	--haetaan maksimissaan kolmen samana päivänä alkaneen opiskeluoikeuden suorituksen tyyppi sekä rahoitus- ja osa-aikaisuustieto. Haetaan myös tieto onko opiskeluoikeus päättynyt valmistumiseen.
		SELECT 
			oo_a1.opiskeluoikeus_oid as oid1
			,ps1.suorituksen_tyyppi as suorituksen_tyyppi1
			,max(coalesce(ooa1.opintojen_rahoitus,6)) as rahoitus1
			,avg(coalesce(ooa1.osa_aikaisuus,0)) as osa_aikaisuus1
			,ooa1b.tila as valmistunut1
			,coalesce(oo_a1.paattymispaiva,'9999-12-31') as paattymispvm1
			,oo_a2.opiskeluoikeus_oid as oid2
			,ps2.suorituksen_tyyppi as suorituksen_tyyppi2
			,max(coalesce(ooa2.opintojen_rahoitus,6)) as rahoitus2
			,avg(coalesce(ooa2.osa_aikaisuus,0)) as osa_aikaisuus2
			,ooa2b.tila as valmistunut2
			,coalesce(oo_a2.paattymispaiva,'9999-12-31') as paattymispvm2
			,coalesce(oo_a3.opiskeluoikeus_oid,'9') as oid3
			,coalesce(ps3.suorituksen_tyyppi,'nayttotutkintoonvalmistavakoulutus') as suorituksen_tyyppi3
			,max(coalesce(ooa3.opintojen_rahoitus,6)) as rahoitus3
			,avg(coalesce(ooa3.osa_aikaisuus,0)) as osa_aikaisuus3
			,ooa3b.tila as valmistunut3
			,case when oo_a3.opiskeluoikeus_oid is null then '1900-01-01' else coalesce(oo_a3.paattymispaiva,'9999-12-31') end as paattymispvm3
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo_a1

	---EKA OPISKELUOIKEUS
		--suorituksen tyyppi
		inner join suorituksen_tyyppi ps1 on ps1.opiskeluoikeus_oid=oo_a1.opiskeluoikeus_oid
		--läsnä-tilat
		inner join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa1 on ooa1.opiskeluoikeus_oid=oo_a1.opiskeluoikeus_oid and ooa1.tila='lasna'
		--valmistunut-tila (ei välttämättä löydy, siksi left join)
		left join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa1b on ooa1b.opiskeluoikeus_oid=oo_a1.opiskeluoikeus_oid and ooa1b.tila='valmistunut'

	---TOINEN OPISKELUOIKEUS
		inner join Koski_SA.sa.sa_koski_opiskeluoikeus oo_a2 on oo_a2.oppija_oid=oo_a1.oppija_oid and oo_a2.opiskeluoikeus_oid != oo_a1.opiskeluoikeus_oid and oo_a2.alkamispaiva = oo_a1.alkamispaiva
		--suorituksen tyyppi
		inner join suorituksen_tyyppi ps2 on ps2.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid		
		--läsnä-tilat
		inner join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa2 on ooa2.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid and ooa2.tila='lasna'	
		--valmistunut-tila (ei välttämättä löydy, siksi left join)												
		left join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa2b on ooa2b.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid and ooa2b.tila='valmistunut'

	---KOLMAS OPISKELUOIKEUS (ei välttämättä löydy, siksi left join)	
		left join Koski_SA.sa.sa_koski_opiskeluoikeus oo_a3 on oo_a3.oppija_oid=oo_a1.oppija_oid and oo_a3.opiskeluoikeus_oid != oo_a1.opiskeluoikeus_oid and oo_a3.opiskeluoikeus_oid != oo_a2.opiskeluoikeus_oid and oo_a3.alkamispaiva = oo_a1.alkamispaiva
		--suorituksen tyyppi
		left join suorituksen_tyyppi ps3 on ps3.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid	
		--läsnä-tilat 		
		left join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa3 on ooa3.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid and ooa3.tila='lasna'		
		--valmistunut-tila 										
		left join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa3b on ooa3b.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid and ooa3b.tila='valmistunut'

		where oo_a1.koulutusmuoto = 'ammatillinenkoulutus'
		--rajataan pois muihin sisältyvät opiskeluoikeudet
		and oo_a1.sisaltyy_opiskeluoikeuteen_oid is null and oo_a2.sisaltyy_opiskeluoikeuteen_oid is null and oo_a3.sisaltyy_opiskeluoikeuteen_oid is null
		--rajataan pois tulevaisuudessa alkavat jaksot
		and ooa1.alku < getdate() and ooa2.alku < getdate() and coalesce(ooa3.alku,'1900-01-01') < getdate()

		group by 
			oo_a1.opiskeluoikeus_oid, oo_a2.opiskeluoikeus_oid, oo_a3.opiskeluoikeus_oid
			,oo_a1.paattymispaiva, oo_a2.paattymispaiva, oo_a3.paattymispaiva
			,ps1.suorituksen_tyyppi, ps2.suorituksen_tyyppi, ps3.suorituksen_tyyppi
			,ooa1b.tila, ooa2b.tila, ooa3b.tila

	) q

	join Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid=q.oid1

) q2

where (case when oid1 = oid_valittu then null else oid1 end) is not null
GO
/****** Object:  StoredProcedure [sa].[p_lataa_osasuoritus_kustannusryhma]    Script Date: 12.9.2019 15:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_osasuoritus_kustannusryhma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_osasuoritus_kustannusryhma] AS' 
END
GO


ALTER procedure [sa].[p_lataa_osasuoritus_kustannusryhma] AS

TRUNCATE TABLE sa.osasuoritus_kustannusryhma

INSERT INTO sa.osasuoritus_kustannusryhma

SELECT DISTINCT
	 tutkinnonosa_koodi = epe_to.[koodiarvo]
	,tutkinnonosa_nimi_fi = epe_to.[nimi_fi]
	,tutkinto_koodi = epe.tutkintokoodi
	,tutkinto_nimi_fi = epe.nimi_fi
	,osaamisala_koodi = oa.osaamisala_koodi
	,osaamisala_nimi_fi = oa.nimi_fi
	,COALESCE(kr1.kustannusryhma_koodi, kr2.kustannusryhma_koodi)
FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] epe_to
LEFT JOIN Koski_SA.SA.sa_eperusteet epe on epe.eperusteid = epe_to.eperusteid
LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat oa on oa.eperusteid = epe_to.eperusteid
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = epe.tutkintokoodi
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma kr1 on kr1.osaamisala_koodi = oa.osaamisala_koodi
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma kr2 on kr2.tutkinto_koodi = COALESCE(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

WHERE RIGHT(diaarinumero,4) = (SELECT MAX(RIGHT(diaarinumero,4)) FROM Koski_SA.SA.sa_eperusteet epe2 WHERE epe2.tutkintokoodi = epe.tutkintokoodi)

ORDER BY tutkinnonosa_koodi

GO
USE ANTERO