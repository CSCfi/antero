USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 22.10.2019 20:39:27 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 22.10.2019 20:39:27 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]    Script Date: 22.10.2019 20:39:27 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 22.10.2019 20:39:27 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]    Script Date: 22.10.2019 20:39:27 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]    Script Date: 22.10.2019 20:39:27 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]    Script Date: 22.10.2019 20:39:27 ******/
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
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]    Script Date: 22.10.2019 20:39:27 ******/
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
		 ooa.opiskeluoikeus_oid
		,tila_alkanut
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
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 22.10.2019 20:39:27 ******/
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
					FROM Koski_SA.dbo.opiskelijavuodet_valitaulu
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
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]    Script Date: 22.10.2019 20:39:27 ******/
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
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 22.10.2019 20:39:27 ******/
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
		from Koski_SA.dbo.kustannusryhma_osasuoritus
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
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 22.10.2019 20:39:27 ******/
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
	INNER JOIN Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = pts.opiskeluoikeus_oid
) ps  
LEFT JOIN ANTERO.dw.d_koulutusluokitus k ON k.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo,'999904'), ps.tutkinto_koodiarvo)
--kustannusryhmä
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = coalesce(k.uusi_eat_koodi,k.koulutusluokitus_koodi)
where ps.rnk = 1

GO
USE [ANTERO]