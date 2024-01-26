USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]    Script Date: 6.3.2022 18:29:06 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut] AS

--DECLARE pvm as date = pvm2

DROP INDEX IF EXISTS [NonClusteredIndex-20200704-203729] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut


;WITH ed_jaksot AS (
	SELECT 
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,case when ooa.tila = 'lasna' then osa_aikaisuus end as osa_aikaisuus
		,case when ooa.tila = 'lasna' then opintojen_rahoitus end as opintojen_rahoitus
	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)


SELECT 
	pvm=pvm
	,ooa.opiskeluoikeus_oid
	,ooa.tila
	,tila_alkanut = cast(null as date)
	,alku
	,loppu
	,alku_ei_muokattu
	,loppu_ei_muokattu
	--,ed_alku
	--,ed_loppu
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
	,sisaltyy_toiseen_opiskeluoikeuteen 
	,aiempi_koulutusmuoto
	,valiaikainen_keskeytys
	,lasna_pv_hyv = 
		case 
			when sisaltyy_toiseen_opiskeluoikeuteen = 1 
				 or alkanut_samana_paivana_hylataan = 1
				 or (valiaikainen_keskeytys = 0 and ed_paattynyt = 0)
				 --or (valiaikainen_keskeytys = 0 and toisen_opiskeluoikeuden_sisalla = 1)
				 then 0.0
			else (osa_aikaisuus / 100.0) * (datediff(
					day,
					(select maxValue from dbo.Maximum (pvm, alku, default)),
					(select minValue from dbo.Minimum (eomonth(pvm),loppu, default))
				) + 1)
		end
	,lasna_pv_hyv_ei_muokattu = 
		 (osa_aikaisuus / 100.0) * (datediff(
					day,
					(select maxValue from dbo.Maximum (pvm, alku_ei_muokattu, default)),
					(select minValue from dbo.Minimum (eomonth(pvm),loppu_ei_muokattu, default))
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
INTO sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut
FROM ( 
	SELECT
		 sa1.opiskeluoikeus_oid
		,sa1.tila
		,alku = ca.alku
		,loppu = ca.loppu
		,alku_ei_muokattu = ca.alku_ei_muokattu--(select maxValue from dbo.Maximum (pvm, coalesce(oo_l.alku_tod, sa1.alku), default))
		,loppu_ei_muokattu = ca.loppu_ei_muokattu  --(select minValue from dbo.Minimum (eomonth(pvm), coalesce(oo_l.loppu,sa1.loppu), default))
		,ed_alku = oo_l.alku
		,ed_loppu = oo_l.loppu
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
		--,toisen_opiskeluoikeuden_sisalla
		,aiempi_koulutusmuoto = coalesce(oo_l.aiempi_koulutusmuoto,'')
		,valiaikainen_keskeytys
		,ed_paattynyt
		,ed_valmistunut
		,oo_l.sisaltyy_opiskeluoikeuteen
		,oid.alkanut_samana_paivana_hylataan
		,oid.sisaltyy_toiseen_opiskeluoikeuteen
		,oid.pvm
	FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid
	
	LEFT JOIN [sa].[sa_koski_opiskeluoikeus_aikajakso] sa1 on sa1.opiskeluoikeus_oid = oid.opiskeluoikeus_oid
	
	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta
	LEFT JOIN ed_jaksot sa2 on sa2.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and datediff(day,sa2.loppu,sa1.tila_alkanut) = 1

	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisessä)
	LEFT JOIN ed_jaksot sa3 on sa3.opiskeluoikeus_oid = sa2.opiskeluoikeus_oid and datediff(day,sa3.loppu,sa2.alku) = 1

	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisesssä)
	LEFT JOIN ed_jaksot sa4 on sa4.opiskeluoikeus_oid = sa3.opiskeluoikeus_oid and datediff(day,sa4.loppu,sa3.alku) = 1

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
			--,toisen_opiskeluoikeuden_sisalla
			,sisaltyy_opiskeluoikeuteen
			,valiaikainen_keskeytys
			,ed_paattynyt
			,ed_valmistunut
			--,ed_jatkuu
		FROM sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet
		GROUP BY opiskeluoikeus_oid,ed_paattyi,aiempi_koulutusmuoto,valiaikainen_keskeytys,alku,alku_tod,ed_paattynyt,ed_valmistunut,sisaltyy_opiskeluoikeuteen
	) oo_l on oo_l.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and oo_l.alku between sa1.alku and sa1.loppu

	CROSS APPLY (
		SELECT
			alku = (select maxValue from dbo.Maximum (pvm, sa1.alku, case when ed_valmistunut=1 then dateadd(day,1,ed_paattyi) when ed_paattynyt=1 then ed_paattyi else oo_l.alku end)),
			alku_ei_muokattu = (select maxValue from dbo.Maximum (pvm, coalesce(oo_l.alku_tod, sa1.alku), default)),
			loppu = (select minValue from dbo.Minimum (eomonth(pvm), sa1.loppu, oo_l.loppu)),
			loppu_ei_muokattu = (select minValue from dbo.Minimum (eomonth(pvm), coalesce(oo_l.loppu,sa1.loppu), default))
	) ca

	WHERE sa1.tila in ('lasna','valmistunut') 
	and opiskeluvalmiuksia_tukevat_opinnot = 0
	and (sa1.alku <= eomonth(pvm) and sa1.loppu >= pvm)
	and not (oid.sisaltyy_toiseen_opiskeluoikeuteen=1 and coalesce(oo_l.sisaltyy_opiskeluoikeuteen,1)=0)

) ooa 

--Rajataan tarkastelujakson opiskeluoikeuksiin
--INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid

WHERE 1=1

--ooa.opiskeluoikeus_oid='1.2.246.562.15.79249625876'
				
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200704-203729] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]
(
	[opiskeluoikeus_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]




GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma] AS' 
END
GO



ALTER procedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma] AS

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
	,valiaikainen_keskeytys
	,lasna_pv_hyv = 0
	,lasna_pv_hyv_ei_muokattu = 0
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
	,loma_pv_nyk = loma_pv_nyk * (osa_aikaisuus / 100.0)
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
			--,toisen_opiskeluoikeuden_sisalla
			,sisaltyy_opiskeluoikeuteen
			,valiaikainen_keskeytys
			,valiaikainen_keskeytys_alkanut
		from sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet
		group by opiskeluoikeus_oid,ed_paattyi,aiempi_koulutusmuoto,valiaikainen_keskeytys,alku,ed_paattynyt,ed_valmistunut,valiaikainen_keskeytys_alkanut,sisaltyy_opiskeluoikeuteen
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
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva] AS' 
END
GO



ALTER procedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva] AS

--declare pvm as date
--declare eomonth(dateadd(month,-1,pvm)) as date
declare @maxPV as decimal(4,1)

--set pvm = '2018-08-01'
--set eomonth(dateadd(month,-1,pvm)) = eomonth(dateadd(month,-1,pvm))
set @maxPV = 182.5



DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva

;WITH ed_jaksot AS (
	SELECT 
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,case when ooa.tila = 'lasna' and opiskeluvalmiuksia_tukevat_opinnot = 1 then osa_aikaisuus else null end as osa_aikaisuus
		,case when ooa.tila = 'lasna' and opiskeluvalmiuksia_tukevat_opinnot = 1 then opintojen_rahoitus else null end as opintojen_rahoitus
	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)


SELECT 
	 pvm
	,opiskeluoikeus_oid
	,tila
	,tila_alkanut = cast(null as date)
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
	--,toisen_opiskeluoikeuden_sisalla 
	,sisaltyy_toiseen_opiskeluoikeuteen
	,aiempi_koulutusmuoto
	,valiaikainen_keskeytys	
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

INTO sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva

FROM (

	SELECT 
		 pvm
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
		--,toisen_opiskeluoikeuden_sisalla 
		,aiempi_koulutusmuoto	
		,valiaikainen_keskeytys
		,hyvaksytaan
		,sisaltyy_opiskeluoikeuteen
		,sisaltyy_toiseen_opiskeluoikeuteen
		,opva_nyk = (opva_lasna_nyk + opva_loma_hyv) * (osa_aikaisuus / 100.0)
		,opva_nyk_ei_muokattu = (opva_lasna_nyk_ei_muokattu + opva_loma_hyv_ei_muokattu) * (osa_aikaisuus / 100.0)
		,opva_hyv_hist
		,opva_summa_kertyma = sum((opva_lasna_nyk + opva_loma_hyv) * (osa_aikaisuus / 100.0)) over (partition by opiskeluoikeus_oid order by alku) 
							   - ((opva_lasna_nyk + opva_loma_hyv) * (osa_aikaisuus / 100.0))
		,opva_summa_kertyma_ei_muokattu = sum((opva_lasna_nyk_ei_muokattu + opva_loma_hyv_ei_muokattu) * (osa_aikaisuus / 100.0)) over (partition by opiskeluoikeus_oid order by alku) 
										   - ((opva_lasna_nyk_ei_muokattu + opva_loma_hyv_ei_muokattu) * (osa_aikaisuus / 100.0))

	FROM (
		SELECT
			 pvm
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
			--,toisen_opiskeluoikeuden_sisalla 
			,aiempi_koulutusmuoto	
			,valiaikainen_keskeytys
			,hyvaksytaan
			,sisaltyy_opiskeluoikeuteen
			,sisaltyy_toiseen_opiskeluoikeuteen
			,opva_lasna_nyk
			,opva_lasna_nyk_ei_muokattu
			,opva_loma_hyv = 
				CASE
					WHEN opva_loma_hist + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut, pvm, DEFAULT)), alku) >= 28 THEN 0
					WHEN opva_loma_hist + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut, pvm, DEFAULT)), alku) + opva_loma_nyk >= 28 THEN 28 - (opva_loma_hist + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut, pvm, DEFAULT)), alku))
					ELSE opva_loma_nyk
				END	
			,opva_loma_hyv_ei_muokattu = 
				CASE
					WHEN opva_loma_hist_ei_muokattu + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut_ei_muokattu, pvm, DEFAULT)), alku) >= 28 THEN 0
					WHEN opva_loma_hist_ei_muokattu + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut_ei_muokattu, pvm, DEFAULT)), alku) + opva_loma_nyk_ei_muokattu >= 28 THEN 28 - (opva_loma_hist_ei_muokattu + datediff(day, (select maxValue from dbo.Maximum (tila_alkanut_ei_muokattu, pvm, DEFAULT)), alku))
					ELSE opva_loma_nyk_ei_muokattu
				END	
			,opva_loma_nyk
			,opva_loma_nyk_ei_muokattu
			,opva_hyv_hist
	
		FROM (
			SELECT 
				 pvm
				,opiskeluoikeus_oid
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
				--,toisen_opiskeluoikeuden_sisalla 
				,aiempi_koulutusmuoto
				,valiaikainen_keskeytys
				,sisaltyy_opiskeluoikeuteen
				,sisaltyy_toiseen_opiskeluoikeuteen
				,hyvaksytaan =
					case
						when sisaltyy_toiseen_opiskeluoikeuteen = 1 
							 or alkanut_samana_paivana_hylataan = 1
							 or (valiaikainen_keskeytys = 0 and ed_paattynyt = 0)
							 --or (valiaikainen_keskeytys = 0 and toisen_opiskeluoikeuden_sisalla = 1)  
							 then 0
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
								WHEN datediff(day, tila_alkanut, eomonth(dateadd(month,-1,pvm))) + 1 < 0 THEN 0
								ELSE datediff(day, tila_alkanut, eomonth(dateadd(month,-1,pvm))) + 1
							END
						ELSE NULL
					END
				,opva_loma_hist_ei_muokattu = 
					CASE
						WHEN tila = 'loma' THEN
							CASE
								WHEN datediff(day, tila_alkanut_ei_muokattu, eomonth(dateadd(month,-1,pvm))) + 1 < 0 THEN 0
								ELSE datediff(day, tila_alkanut_ei_muokattu, eomonth(dateadd(month,-1,pvm))) + 1
							END
						ELSE NULL
					END
				,opva_hyv_hist
			
			FROM (
				SELECT distinct 
					 oid.pvm
					,ooa.opiskeluoikeus_oid
					,ooa.tila
					,tila_alkanut = (select maxValue from dbo.Maximum(ooa.tila_alkanut, dateadd(day, 1, coalesce(case when oo_l.valiaikainen_keskeytys != 1 then oo_l.ed_paattyi end,'1900-01-01')), DEFAULT))
					,tila_alkanut_ei_muokattu = ooa.tila_alkanut
					,alku = (select maxValue from dbo.Maximum (coalesce(oo_l.alku, ooa.alku), pvm, DEFAULT)) 
					,loppu = (select minValue from dbo.Minimum (coalesce(oo_l.loppu, ooa.loppu), EOMONTH(pvm), DEFAULT))
					,alku_ei_muokattu = (select maxValue from dbo.Maximum (pvm, coalesce(oo_l.alku_tod, ooa.alku), DEFAULT)) 
					,loppu_ei_muokattu = (select minValue from dbo.Minimum (EOMONTH(pvm), coalesce(oo_l.loppu, ooa.loppu), DEFAULT))
					,opintojen_rahoitus = case when ooa.tila in ('loma','valmistunut') then coalesce(sa2.opintojen_rahoitus, sa3.opintojen_rahoitus, sa4.osa_aikaisuus, ooa.opintojen_rahoitus) else ooa.opintojen_rahoitus end
					,majoitus
					,sisaoppilaitosmainen_majoitus
					,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
					,erityinen_tuki
					,vaativan_erityisen_tuen_erityinen_tehtava
					,hojks
					,vaikeasti_vammainen
					,vammainen_ja_avustaja
					,osa_aikaisuus = case when ooa.tila = 'loma' then coalesce(sa2.osa_aikaisuus, sa3.osa_aikaisuus, sa4.osa_aikaisuus, ooa.osa_aikaisuus) else ooa.osa_aikaisuus end
					,vankilaopetuksessa
					,oppisopimus_jossain_paatason_suorituksessa 
					,opiskeluvalmiuksia_tukevat_opinnot
					,alkanut_samana_paivana_hylataan = null --case when hyl.opiskeluoikeus_oid_hylataan is not null then 1 else 0 end
					--,toisen_opiskeluoikeuden_sisalla = case when oo_l.toisen_opiskeluoikeuden_sisalla = 1 then 1 else 0 end
					,aiempi_koulutusmuoto = coalesce(oo_l.aiempi_koulutusmuoto,'')
					--,ed_jatkuu
					,valiaikainen_keskeytys
					,ed_paattyi
					,ed_paattynyt
					,oo_l.sisaltyy_opiskeluoikeuteen
					,oid.sisaltyy_toiseen_opiskeluoikeuteen
					,opva_hyv_hist = coalesce(opva.opva_hyv_hist,0)
				FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
				INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet oo_l on oo_l.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and oo_l.alku between ooa.alku and ooa.loppu
				--LEFT JOIN sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat hyl on hyl.opiskeluoikeus_oid_hylataan = ooa.opiskeluoikeus_oid
				--loman rahoitus- ja osa-aikaisuustieto ja valmistumisen rahoitustieto edellisestä läsnäolojaksosta
				LEFT JOIN ed_jaksot sa2 ON sa2.opiskeluoikeus_oid=ooa.opiskeluoikeus_oid and DATEDIFF(DAY,sa2.loppu,ooa.tila_alkanut) = 1
				LEFT JOIN ed_jaksot sa3 ON sa3.opiskeluoikeus_oid=ooa.opiskeluoikeus_oid and DATEDIFF(DAY,sa3.loppu,sa2.alku) = 1
				LEFT JOIN ed_jaksot sa4 ON sa4.opiskeluoikeus_oid=ooa.opiskeluoikeus_oid and DATEDIFF(DAY,sa4.loppu,sa3.alku) = 1
				--kertyneet opva päivät
				LEFT JOIN (
					SELECT 
						vt.opiskeluoikeus_oid
						,opva_hyv_hist = SUM(opiskelijavuosi_opva)
					FROM dbo.opiskelijavuodet_valitaulu vt
					inner join sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid=vt.opiskeluoikeus_oid
					WHERE vuosi < YEAR(pvm) OR (kuukausi < MONTH(pvm) and vuosi = YEAR(pvm))
					--AND vt.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
					GROUP BY vt.opiskeluoikeus_oid
				) opva ON opva.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid

				WHERE ooa.opiskeluvalmiuksia_tukevat_opinnot = 1 
				and ooa.tila in ('lasna','valmistunut','loma')
				--ei ole päättynyt ennen tarkastelujakson alkua
				and ooa.loppu >= pvm																													
				--päällekkäinen opiskeluoikeus päättynyt tai väliaikainen keskeytys
				--and (coalesce(oo_l.ed_jatkuu,0) = 0	or (oo_l.ed_jatkuu = 1 and oo_l.alku is not null))													
				--alkunut kyseisen kuukauden aikana tai sitä ennen
				and (pvm >= coalesce(oo_l.alku, ooa.alku) or (select isSame from dbo.Same_month_and_year (pvm, coalesce(oo_l.alku, ooa.alku)))=1)	
				--and oo.sisaltyy_opiskeluoikeuteen_oid is null
				and not (sisaltyy_toiseen_opiskeluoikeuteen=1 and coalesce(sisaltyy_opiskeluoikeuteen,1)=0)

			) q1

		) q2

	) q3

) q4

--WHERE not (sisaltyy_toiseen_opiskeluoikeuteen=1 and coalesce(sisaltyy_opiskeluoikeuteen,1)=0)

ORDER BY opiskeluoikeus_oid desc



GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit] AS' 
END
GO

ALTER procedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit] @date2 as date = '2018-01-01' as

DECLARE @date as date = @date2
/*
	Hakee opiskeluoikeudet, joilla on lasna-, valmistunut- tai lomajakso tarkastelukuukauden aikana.
*/

DROP INDEX IF EXISTS [NonClusteredIndex-20200704-203543] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit]

TRUNCATE TABLE sa.temp_opiskelijavuodet_opiskeluoikeus_oidit

INSERT INTO sa.temp_opiskelijavuodet_opiskeluoikeus_oidit
(
	 pvm
	,oppija_oid
	,opiskeluoikeus_oid
	,alkamispaiva
	,paattymispaiva
	,osatutkinto
	,alkanut_samana_paivana_hylataan
	,sisaltyy_toiseen_opiskeluoikeuteen
	,sisaltyy_oid
)

SELECT
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
	,sisaltyy_oid = sisaltyy_opiskeluoikeuteen_oid
FROM (

	select distinct
		 oo1.oppija_oid
		,oo1.opiskeluoikeus_oid
		,oo1.alkamispaiva
		,oo1.paattymispaiva
		,a_oid = atutk.opiskeluoikeus_oid
		,ao_oid = atutko.opiskeluoikeus_oid
		,opiskeluoikeus_oid_hylataan = null --hyl.opiskeluoikeus_oid_hylataan
		,oo1.sisaltyy_opiskeluoikeuteen_oid
	from sa.sa_koski_opiskeluoikeus oo1
	inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo1.opiskeluoikeus_oid 
	left join (
		select 
			opiskeluoikeus_oid
		from sa.sa_koski_paatason_suoritus
		where suorituksen_tyyppi = 'ammatillinentutkinto'
	) atutk on atutk.opiskeluoikeus_oid = oo1.opiskeluoikeus_oid
	left join (
		select 
			opiskeluoikeus_oid
		from sa.sa_koski_paatason_suoritus
		where suorituksen_tyyppi = 'ammatillinentutkintoosittainen'
	) atutko on atutko.opiskeluoikeus_oid = oo1.opiskeluoikeus_oid
	--varmistus että myös mahdollinen pihvikoulutus ammatillista
	--left join sa.sa_koski_opiskeluoikeus oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo1.opiskeluoikeus_oid

	--left join Koski_SA.sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat hyl on hyl.opiskeluoikeus_oid_hylataan = oo.opiskeluoikeus_oid

	where oo1.koulutusmuoto = 'ammatillinenkoulutus'-- and coalesce(oo2.koulutusmuoto,'ammatillinenkoulutus') = 'ammatillinenkoulutus'
	--and oo.sisaltyy_opiskeluoikeuteen_oid is null
	and ooa.tila in ('loma','lasna','valmistunut')
	and (ooa.alku <= eomonth(@date) and ooa.loppu >= @date)

) q



CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200704-203543] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit]
(
	[oppija_oid] ASC,
	[opiskeluoikeus_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 6.3.2022 18:29:06 ******/
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


DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

SELECT distinct
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,kr = coalesce(min_kr_ot, okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
	--,kr_uusi = coalesce(min_kr_ot_uusi, okr.kustannusryhma_koodi, tkr_u.kustannusryhma_koodi)

INTO sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

FROM (

	SELECT 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo
		,oo.pvm
		,min_kr_ot = min(case when d.kr_count > 1 then d.kr_min_ilman1 else d.kr_min end)
		--,min_kr_ot_uusi = min(case when d_uusi.kr_count > 1 then d_uusi.kr_min_ilman1 else d_uusi.kr_min end) 
	FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo
	--left join sa.sa_koski_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
	left join sa.temp_opiskelijavuodet_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
	left join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	left join sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id and ((ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and os.suorituksen_tyyppi = 'ammatillisentutkinnonosa') or ps.suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus')
	--kustannusryhmä
	left join (
		select 
			 tutkinnonosa_koodi
			,kr_min = min(kustannusryhma_koodi)
			,kr_min_ilman1 = min(case when kustannusryhma_koodi='1' then '5' else kustannusryhma_koodi end)
			,kr_count = count(distinct kustannusryhma_koodi)
		from dbo.kustannusryhma_osasuoritus 
		group by tutkinnonosa_koodi
	) d on cast(d.tutkinnonosa_koodi as varchar(50)) = coalesce(os.liittyy_tutkinnonosaan_koodiarvo, os.koulutusmoduuli_koodiarvo)
	--left join (
	--	select 
	--		 tutkinnonosa_koodi
	--		,kr_min = min(kustannusryhma_koodi_uusi)
	--		,kr_min_ilman1 = min(case when kustannusryhma_koodi_uusi='1' then '5' else kustannusryhma_koodi_uusi end)
	--		,kr_count = count(distinct kustannusryhma_koodi_uusi)
	--	from dbo.kustannusryhma_osasuoritus 
	--	group by tutkinnonosa_koodi
	--) d_uusi on cast(d_uusi.tutkinnonosa_koodi as varchar(50)) = coalesce(os.liittyy_tutkinnonosaan_koodiarvo, os.koulutusmoduuli_koodiarvo)

	where 1=1
	and ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen', 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus')
	--and ((ps.suorituksen_tyyppi='ammatillinentutkintoosittainen' and os.suorituksen_tyyppi = 'ammatillisentutkinnonosa') or ps.suorituksen_tyyppi='tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus')
	and year(ooa.loppu) >= 2018 
	--and ooa.tila in ('loma','lasna','valmistunut')
	--and osatutkinto = 1

	group by 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo
		,oo.pvm

) q

--kustannusryhma niille joilta ei löydy osasuorituksia
left join ANTERO.dw.d_koulutusluokitus k3 ON k3.koulutusluokitus_koodi = COALESCE(NULLIF(q.koulutusmoduuli_koodiarvo,'999904'), q.tutkinto_koodiarvo)
left join ANTERO.dw.d_amos_tutkinto_kustannusryhma okr ON okr.osaamisala_koodi = q.osaamisala_koodiarvo and year(q.pvm) between year(okr.alkupvm) and year(coalesce(okr.loppupvm,'9999-12-31'))
left join ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(k3.uusi_eat_koodi, k3.koulutusluokitus_koodi)  and year(q.pvm) between year(tkr.alkupvm) and year(coalesce(tkr.loppupvm,'9999-12-31'))
--left join ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi tkr_u ON tkr_u.tutkinto_koodi = COALESCE(k3.uusi_eat_koodi, k3.koulutusluokitus_koodi)

GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet] AS' 
END
GO




ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet] AS



DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet;


;WITH ed_jaksot AS (
	SELECT 
		 ooa.opiskeluoikeus_oid
		,tila
		,alku
		,loppu
		,case when ooa.tila = 'lasna' then ooa.opintojen_rahoitus else null end as opintojen_rahoitus
	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)


SELECT
	*

INTO sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet

FROM (
	SELECT 
		 alkupvm
		,oppija_oid
		,opiskeluoikeus_oid = nyk_opiskeluoikeus_oid
		,paallekkainen_opiskeluoikeus_oid = opiskeluoikeus_oid
		,aiempi_koulutusmuoto 
		,nyk_tila
		,alku = nyk_alku_korjattu
		,alku_tod = 
			case 
				when datediff(day,aiempi_paattymispvm,nyk_alku_korjattu)=1 and nyk_tila != 'valmistunut' and datediff(day, aiempi_paattymispvm, nyk_alku) != 1  then cast(aiempi_paattymispvm as date) 
				else nyk_alku_korjattu 
			end
		,loppu = nullif(nyk_loppu_korjattu,'9999-12-31') 
		--
		,ed_paattyi = case when aiempi_paattymispvm <= nyk_loppu_korjattu and (ed_valmistunut=1 or ed_paattynyt=1) then cast(aiempi_paattymispvm as date) end
		,valiaikainen_keskeytys = valiaikainen_kesk
		,valiaikainen_keskeytys_alkanut = valiaikainen_kesk_alkanut
		,ed_valmistunut
		,ed_paattynyt
		,sisaltyy_opiskeluoikeuteen
		,rnk = rank() over (partition by nyk_opiskeluoikeus_oid order by opintojen_rahoitus_vos_max desc, voimassa_jakson_alkaessa desc, valiaikainen_kesk_max, aiempi_paattymispvm desc, aiempi_alkamispvm) 

	FROM (

		SELECT 
			alkupvm = oo_a.pvm
			,oo_a.oppija_oid
			,oo_la.opiskeluoikeus_oid
			,aiempi_koulutusmuoto = coalesce(oo_la.koulutusmuoto,'')
			,aiempi_alkamispvm = oo_la.alkamispaiva
			,aiempi_paattymispvm = oo_la.paattymispaiva
			,nyk_opiskeluoikeus_oid = oo_a.opiskeluoikeus_oid
			,nyk_tila = ooa.tila
			,nyk_alku = ooa.alku
			,nyk_alku_korjattu = ca1.nyk_alku_korjattu
			,nyk_loppu_korjattu = ca1.nyk_loppu_korjattu
			,voimassa_jakson_alkaessa = case when oo_la.paattymispaiva >= oo_a.pvm and not (oo_la.valiaikainen_kesk=1 and oo_la.tila_alkanut <= oo_a.pvm and oo_la.loppu >= eomonth(oo_a.pvm)) then 1 else 0 end
			,valiaikainen_kesk = case when valiaikainen_kesk = 1 or opintojen_rahoitus_vos = 0 or (ed_tila_valiaikainen_kesk = 1 and oo_la.opiskeluoikeus_paattynyt = 1 and oo_la.tila != 'valmistunut') then 1 else 0 end
			,valiaikainen_kesk_alkanut  = case when valiaikainen_kesk=1 then oo_la.tila_alkanut when opintojen_rahoitus_vos = 0 then oo_la.ei_vos_minimi end
			,ed_valmistunut = case when oo_la.tila='valmistunut' and opintojen_rahoitus_vos=1 then 1 else 0 end
			,ed_paattynyt = case when ((ed_tila_valiaikainen_kesk=1 or ed_tila_vos=0) and oo_la.tila != 'valmistunut') or (oo_la.tila='valmistunut' and opintojen_rahoitus_vos=0) then 0 else oo_la.opiskeluoikeus_paattynyt end
			,sisaltyy_opiskeluoikeuteen = case when oo_a.sisaltyy_oid = oo_la.opiskeluoikeus_oid then 1 else 0 end
			,opintojen_rahoitus_vos
			,valiaikainen_kesk_max = max(oo_la.valiaikainen_kesk) over (partition by oo_la.opiskeluoikeus_oid)
			,opintojen_rahoitus_vos_max = max(oo_la.opintojen_rahoitus_vos) over (partition by oo_la.opiskeluoikeus_oid)
			--,rnk = rank() over (partition by oo_a.opiskeluoikeus_oid order by (case when oo_la.paattymispaiva >= oo_a.pvm then 1 else 0 end) desc, opintojen_rahoitus_vos desc, oo_la.valiaikainen_kesk, oo_la.paattymispaiva desc, oo_la.alkamispaiva) 
	
		FROM [sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit] oo_a

		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo_a.opiskeluoikeus_oid

		--opiskelijan päällekkäiset opiskeluoikeudet ja aikajaksot
		inner join (
			--aiemmin alkaneet
			select 
				oo.oppija_oid
				,ooa.opiskeluoikeus_oid
				,oo.alkamispaiva
				,paattymispaiva = cast(coalesce(oo.paattymispaiva,'9999-12-31') as datetime)
				,ooa.tila_alkanut
				,ooa.alku
				,ooa.loppu
				,ooa.tila
				,oo.koulutusmuoto
				,ooa.opiskeluoikeus_paattynyt
				,valiaikainen_kesk = case when ooa.tila = 'valiaikaisestikeskeytynyt' then 1 else 0 end
				,ed_tila_valiaikainen_kesk = case when ed1.tila =  'valiaikaisestikeskeytynyt' then 1 else 0 end
				,ed_tila_vos = case when coalesce(d2.sisaltyy_okm_perusrahoitus,d3.sisaltyy_okm_perusrahoitus,d4.sisaltyy_okm_perusrahoitus,1) = 1 then 1 else 0 end
				,opintojen_rahoitus_vos = coalesce(d1.sisaltyy_okm_perusrahoitus,d2.sisaltyy_okm_perusrahoitus,d3.sisaltyy_okm_perusrahoitus,d4.sisaltyy_okm_perusrahoitus,1) 
				,alkanut_samana_paivana = 0
				,ei_vos_minimi =
					case
						when d1.sisaltyy_okm_perusrahoitus=0 then
							case
								when d2.sisaltyy_okm_perusrahoitus=0 then
									case
										when d3.sisaltyy_okm_perusrahoitus=0 then
											case
												when d4.sisaltyy_okm_perusrahoitus=0 then ed3.alku
												else ed2.alku
											end
										else ed1.alku
									end
								else ooa.alku
							end
					end
			from sa.sa_koski_opiskeluoikeus oo
			inner join (select distinct oppija_oid from sa.temp_opiskelijavuodet_opiskeluoikeus_oidit) o on o.oppija_oid = oo.oppija_oid 
			inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
			left join sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			left join ANTERO.dw.d_opintojenrahoitus d1 on d1.koodi = ooa.opintojen_rahoitus
			--rahoitustieto viimeisimmästä läsnäolojaksosta
			left join ed_jaksot as ed1 on ed1.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and datediff(day,ed1.loppu,ooa.alku) = 1
			left join ANTERO.dw.d_opintojenrahoitus d2 on d2.koodi = ed1.opintojen_rahoitus
			left join ed_jaksot as ed2 on ed2.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and datediff(day,ed2.loppu,ed1.alku) = 1
			left join ANTERO.dw.d_opintojenrahoitus d3 on d3.koodi = ed2.opintojen_rahoitus
			left join ed_jaksot as ed3 on ed3.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and datediff(day,ed3.loppu,ed2.alku) = 1
			left join ANTERO.dw.d_opintojenrahoitus d4 on d4.koodi = ed3.opintojen_rahoitus
			where 1=1
			and (oo.koulutusmuoto = 'ammatillinenkoulutus' or (oo.koulutusmuoto = 'lukiokoulutus' and ps.suorituksen_tyyppi = 'lukionoppimaara') or oo.koulutusmuoto = 'perusopetuksenlisaopetus')
			and oo.sisaltyy_opiskeluoikeuteen_oid is null

			UNION
			--samana päivänä alkaneet
			select 
					oo.oppija_oid
				,ooa.opiskeluoikeus_oid
				,oo.alkamispaiva
				,paattymispaiva = cast(coalesce(oo.paattymispaiva,'9999-12-31') as datetime)
				,ooa.tila_alkanut
				,ooa.alku
				,ooa.loppu
				,ooa.tila
				,oo.koulutusmuoto
				,ooa.opiskeluoikeus_paattynyt
				,valiaikainen_kesk = case when ooa.tila = 'valiaikaisestikeskeytynyt' then 1 else 0 end
				,ed_tila_valiaikainen_kesk = case when ed1.tila =  'valiaikaisestikeskeytynyt' then 1 else 0 end
				,ed_tila_vos = case when coalesce(d2.sisaltyy_okm_perusrahoitus,d3.sisaltyy_okm_perusrahoitus,d4.sisaltyy_okm_perusrahoitus,1) = 1 then 1 else 0 end
				,opintojen_rahoitus_vos = coalesce(d1.sisaltyy_okm_perusrahoitus,d2.sisaltyy_okm_perusrahoitus,d3.sisaltyy_okm_perusrahoitus,d4.sisaltyy_okm_perusrahoitus,1) 
				,alkanut_samana_paivana = 1
				,ei_vos_minimi =
					case
						when d1.sisaltyy_okm_perusrahoitus=0 then
							case
								when d2.sisaltyy_okm_perusrahoitus=0 then
									case
										when d3.sisaltyy_okm_perusrahoitus=0 then
											case
												when d4.sisaltyy_okm_perusrahoitus=0 then ed3.alku
												else ed2.alku
											end
										else ed1.alku
									end
								else ooa.alku
							end
					end
			from sa.sa_koski_opiskeluoikeus oo
			inner join sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat o on o.opiskeluoikeus_oid_hyvaksytaan = oo.opiskeluoikeus_oid
			inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
			left join sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			left join ANTERO.dw.d_opintojenrahoitus d1 on d1.koodi = ooa.opintojen_rahoitus
			--rahoitustieto viimeisimmästä läsnäolojaksosta
			left join ed_jaksot as ed1 on ed1.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and datediff(day,ed1.loppu,ooa.alku) = 1
			left join ANTERO.dw.d_opintojenrahoitus d2 on d2.koodi = ed1.opintojen_rahoitus
			left join ed_jaksot as ed2 on ed2.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and datediff(day,ed2.loppu,ed1.alku) = 1
			left join ANTERO.dw.d_opintojenrahoitus d3 on d3.koodi = ed2.opintojen_rahoitus
			left join ed_jaksot as ed3 on ed3.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and datediff(day,ed3.loppu,ed2.alku) = 1
			left join ANTERO.dw.d_opintojenrahoitus d4 on d4.koodi = ed3.opintojen_rahoitus
			where 1=1
			and oo.sisaltyy_opiskeluoikeuteen_oid is null
	
		) oo_la on oo_la.oppija_oid = oo_a.oppija_oid					--sama oppija-oid
				and oo_la.opiskeluoikeus_oid != oo_a.opiskeluoikeus_oid	--eri opiskeluoikeus
				and (													--ammatillinen alkanut ennen nykyistä tai samana päivänä
				((oo_la.alkamispaiva < oo_a.alkamispaiva and oo_la.koulutusmuoto = 'ammatillinenkoulutus' and alkanut_samana_paivana = 0) or (oo_la.koulutusmuoto = 'ammatillinenkoulutus' and oo_la.opiskeluoikeus_oid=oo_a.sisaltyy_oid)) 
				or														--lukio alkanut ennen nykyistä tai samana päivänä
				(oo_la.alkamispaiva <= oo_a.alkamispaiva and oo_la.koulutusmuoto = 'lukiokoulutus' and alkanut_samana_paivana = 0) 
				or														--perusopetuksen lisäopetus alkanut ennen nykyistä tai samana päivänä
				(oo_la.alkamispaiva <= oo_a.alkamispaiva and oo_la.koulutusmuoto = 'perusopetuksenlisaopetus' and alkanut_samana_paivana = 0) 
				or
				(alkanut_samana_paivana = 1 and oo_la.alkamispaiva = oo_a.alkamispaiva)
				)
				and oo_la.paattymispaiva > oo_a.alkamispaiva			--ei ole päättynyt ennen nykyistä
				and oo_la.loppu >= ooa.alku and oo_la.alku <= ooa.loppu --aikajaksot menee päällekkäin
	
		cross apply (
			select
				nyk_alku_korjattu = cast((select MaxValue from dbo.Maximum (oo_a.pvm, ooa.alku, oo_la.alku)) as date)
				,nyk_loppu_korjattu = cast(
					case
						when oo_la.opiskeluoikeus_paattynyt = 1 and oo_la.loppu <= ooa.loppu then (select MinValue From dbo.Minimum (eomonth(oo_a.pvm), ooa.loppu, default))
						else (select MinValue From dbo.Minimum (eomonth(oo_a.pvm), ooa.loppu, oo_la.loppu))
					end 
				as date)
		) ca1

		WHERE 1=1
		--käynnissä olevat jaksot 
		and ooa.loppu >= oo_a.pvm and ooa.alku <= eomonth(oo_a.pvm)
		and ooa.tila in ('lasna','valmistunut','loma')
		and nyk_alku_korjattu <= nyk_loppu_korjattu

	) q

	--WHERE nyk_opiskeluoikeus_oid = '1.2.246.562.15.79249625876'

) q2

WHERE rnk = 1



GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_paatason_suoritus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_paatason_suoritus] AS' 
END
GO






ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_paatason_suoritus] as


DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_paatason_suoritus

SELECT
	 ps.opiskeluoikeus_oid
	,paatason_suoritus_id
	,ps.suorituksen_tyyppi
	,ps.koulutusmoduuli_koodiarvo
	,ps.koulutusmoduuli_koodisto
	,ps.tutkinto_koodiarvo
	,ps.osaamisala_koodiarvo
	,ps.suorituskieli_koodiarvo
	,koulutusluokitus_koodi = case when isnumeric(ps.koulutusmoduuli_koodiarvo)=1 and len(ps.koulutusmoduuli_koodiarvo)=6 then ps.koulutusmoduuli_koodiarvo else null end --k.koulutusluokitus_koodi
	,kustannusryhma_oa = okr.kustannusryhma_koodi
	,kustannusryhma_tutk = tkr.kustannusryhma_koodi
	--,kustannusryhma_tutk_uusi = tkr_u.kustannusryhma_koodi
	,ps.toimipiste_oid
	,ps.perusteenDiaarinumero

INTO sa.temp_opiskelijavuodet_paatason_suoritus

FROM (

	SELECT --distinct
		 pts.opiskeluoikeus_oid
		,pts.paatason_suoritus_id
		,pts.suorituksen_tyyppi
		,pts.koulutusmoduuli_koodiarvo 
		,pts.koulutusmoduuli_koodisto
		,pts.suorituskieli_koodiarvo
		,tutkinto_koodiarvo
		,osaamisala_koodiarvo
		,toimipiste_oid
		,perusteenDiaarinumero
		,oid.pvm
		,ROW_NUMBER() OVER (PARTITION BY pts.opiskeluoikeus_oid ORDER BY pts.suorituksen_tyyppi,osaamisala_koodiarvo,pts.koulutusmoduuli_koodiarvo) as rnk 
	FROM sa.sa_koski_paatason_suoritus pts
	INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = pts.opiskeluoikeus_oid
	--LEFT JOIN sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = pts.paatason_suoritus_id
	
) ps  
LEFT JOIN ANTERO.dw.d_koulutusluokitus k ON k.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo,'999904'), ps.tutkinto_koodiarvo)
--kustannusryhmä
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo and year(ps.pvm) between year(okr.alkupvm) and year(coalesce(okr.loppupvm,'9999-12-31'))
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(k.uusi_eat_koodi,k.koulutusluokitus_koodi) and year(ps.pvm) between year(tkr.alkupvm) and year(coalesce(tkr.loppupvm,'9999-12-31'))
--LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi tkr_u ON tkr_u.tutkinto_koodi = COALESCE(k.uusi_eat_koodi,k.koulutusluokitus_koodi)

WHERE ps.rnk = 1


CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200704-203941] ON [sa].[temp_opiskelijavuodet_paatason_suoritus]
(
	[opiskeluoikeus_oid] ASC
)
INCLUDE ( 	[suorituksen_tyyppi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]


GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]    Script Date: 6.3.2022 18:29:06 ******/
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

TRUNCATE TABLE sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat

;
WITH suorituksen_tyyppi AS (
	SELECT 
		 opiskeluoikeus_oid
		,suorituksen_Tyyppi
		,rnk
	FROM (
		SELECT 
			sa1.opiskeluoikeus_oid
			,suorituksen_tyyppi
			,RANK() OVER (PARTITION BY sa1.opiskeluoikeus_oid ORDER BY suorituksen_tyyppi, koulutusmoduuli_koodiarvo) rnk
		FROM sa.sa_koski_paatason_suoritus sa1
		join sa.sa_koski_opiskeluoikeus sa2 on sa2.opiskeluoikeus_oid=sa1.opiskeluoikeus_oid
		where sa2.koulutusmuoto = 'ammatillinenkoulutus'
	) q2
	WHERE rnk = 1
)

INSERT INTO sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat (oppija_oid, opiskeluoikeus_oid_hyvaksytaan)

SELECT DISTINCT
	oppija_oid
	,opiskeluoikeus_oid_hyvaksytaan = case when oid1 = oid_valittu then oid1 end

FROM (
	SELECT 
		 oo.oppija_oid
		,oid1
		,oid2
		,oid3
		,oid_valittu = 
		case 
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
		end

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
		inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa1 on ooa1.opiskeluoikeus_oid=oo_a1.opiskeluoikeus_oid and ooa1.tila='lasna'
		--valmistunut-tila (ei välttämättä löydy, siksi left join)
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa1b on ooa1b.opiskeluoikeus_oid=oo_a1.opiskeluoikeus_oid and ooa1b.tila='valmistunut'

	---TOINEN OPISKELUOIKEUS
		inner join sa.sa_koski_opiskeluoikeus oo_a2 on oo_a2.oppija_oid=oo_a1.oppija_oid and oo_a2.opiskeluoikeus_oid != oo_a1.opiskeluoikeus_oid and oo_a2.alkamispaiva = oo_a1.alkamispaiva
		--suorituksen tyyppi
		inner join suorituksen_tyyppi ps2 on ps2.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid		
		--läsnä-tilat
		inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa2 on ooa2.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid and ooa2.tila='lasna'	
		--valmistunut-tila (ei välttämättä löydy, siksi left join)												
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa2b on ooa2b.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid and ooa2b.tila='valmistunut'

	---KOLMAS OPISKELUOIKEUS	
		left join sa.sa_koski_opiskeluoikeus oo_a3 on oo_a3.oppija_oid=oo_a1.oppija_oid and oo_a3.opiskeluoikeus_oid != oo_a1.opiskeluoikeus_oid and oo_a3.opiskeluoikeus_oid != oo_a2.opiskeluoikeus_oid and oo_a3.alkamispaiva = oo_a1.alkamispaiva
		--suorituksen tyyppi
		left join suorituksen_tyyppi ps3 on ps3.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid	
		--läsnä-tilat 		
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa3 on ooa3.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid and ooa3.tila='lasna'		
		--valmistunut-tila 										
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa3b on ooa3b.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid and ooa3b.tila='valmistunut'

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

	join sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid=q.oid1

) q2

WHERE (case when oid1 = oid_valittu then oid1 end) is not null
--where (case when oid1 != oid_valittu then oid1 end) is not null


GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat] as

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_tutkinnon_osaa_pienemmat

SELECT distinct
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,tutkinto
	,tutkintotyyppi

INTO sa.temp_opiskelijavuodet_tutkinnon_osaa_pienemmat

FROM (

	SELECT 
		q.opiskeluoikeus_oid
		,q.paatason_suoritus_id
		,tutkinto = case when tutkinto_lkm > 1 then null else q.tutkinto end
		,tutkintotyyppi = nullif(right(concat('0',tutkintotyyppi),2),'0')
	FROM (

		SELECT 
			 ps.opiskeluoikeus_oid
			,ps.paatason_suoritus_id
			,tutkinto_lkm =  dense_rank() over (partition by ps.paatason_suoritus_id order by ep.tutkinto) + dense_rank() over (partition by ps.paatason_suoritus_id order by ep.tutkinto desc) - 1	
			,tutkinto = ep.tutkinto
			,tutkintotyyppi = max(cast(ep.tutkintotyyppi as int)) over (partition by ps.paatason_suoritus_id)
		FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo
		left join sa.temp_opiskelijavuodet_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		left join sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id
		left join (
			SELECT distinct
				tutkinnonosa_koodi
				,tutkinto = case when t_lkm > 1 then null else tutkintokoodi end
				,tutkintotyyppi = right(concat('0',tt_maks),2)
			FROM (
				SELECT 
					tutkinnonosa_koodi = t.koodiarvo
					,ep.tutkintokoodi
					,t_lkm = dense_rank() over (partition by t.koodiarvo order by ep.tutkintokoodi) + dense_rank() over (partition by t.koodiarvo order by ep.tutkintokoodi desc) - 1	
					,tt_maks = max(cast(nullif(kl.tutkintotyyppi_koodi,-1) as int)) over (partition by t.koodiarvo)
				FROM sa.sa_eperusteet_tutkinnonosat t
				LEFT JOIN sa.sa_eperusteet ep on ep.eperusteid=t.eperusteid
				LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=ep.tutkintokoodi
				WHERE ep.tutkintokoodi is not null
			) q
		) ep on ep.tutkinnonosa_koodi = os.liittyy_tutkinnonosaan_koodiarvo
	

		where 1=1
		and ps.suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
		and year(ooa.loppu) >= 2018 
		--and ooa.tila in ('loma','lasna','valmistunut')
		

	) q


) q2


GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot] AS

DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

;WITH cte AS (
	SELECT
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,opintojen_rahoitus --= case when tila = 'lasna' then opintojen_rahoitus end
	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)

--INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

SELECT

	 oo.oppija_oid
	,oo.opiskeluoikeus_oid as opiskeluoikeus_oid
	,oo.alkamispaiva
	,case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then 1 else 0 end as sisaltyy_toiseen
	,oo.oppilaitos_oid
	,oo.koulutustoimija_oid
	
	--,null as diaarinumero
	--,NULL /* replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo */ as diaarinumero_tutkinto_koodi

	/*, case
		when ps.osaamisala_koodiarvo is null then replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo
		else replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo+'_'+ps.osaamisala_koodiarvo
	 end */ 
	--NULL as diaarinumero_tutkinto_osaamisala_koodi

	,ooa.tila
	,ooa.alku
	,ooa.loppu
	,oppisopimus = ooa.oppisopimus_jossain_paatason_suorituksessa
	,coalesce(ooa.opintojen_rahoitus, ooa2.opintojen_rahoitus, ooa3.opintojen_rahoitus, ooa4.opintojen_rahoitus, ooa5.opintojen_rahoitus, ooa6.opintojen_rahoitus) as opintojen_rahoitus_koodi

	,CASE
		WHEN (erityinen_tuki=1 or hojks=1) and vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma') THEN 2						--Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht
		WHEN (erityinen_tuki=1 or hojks=1) and vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma') THEN 3							--Erityisopiskelija ilman erit. tehtävää; valmentava
		WHEN vaativan_erityisen_tuen_erityinen_tehtava=1 and ps.suorituksen_tyyppi not in ('telma','valma') and vaikeasti_vammainen=0 and vammainen_ja_avustaja=0 THEN 4	--Erit. tuen tehtävä; tutk.joht; erityisopiskelija
		WHEN ps.suorituksen_tyyppi not in ('telma','valma') and vaikeasti_vammainen=1 THEN 5																				--Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
		WHEN ps.suorituksen_tyyppi not in ('telma','valma') and vammainen_ja_avustaja=1 THEN 6																				--Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
		WHEN vaativan_erityisen_tuen_erityinen_tehtava=1 and ps.suorituksen_tyyppi in ('telma','valma') and vaikeasti_vammainen=0 and vammainen_ja_avustaja=0 THEN 7		--Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
		WHEN ps.suorituksen_tyyppi in ('telma','valma') and vaikeasti_vammainen=1 THEN 8																					--Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
		WHEN ps.suorituksen_tyyppi in ('telma','valma') and vammainen_ja_avustaja=1 THEN 9																					--Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
		WHEN erityinen_tuki=0 THEN 1																																	--Ei erityisopiskelija
		ELSE 9
	 END as erityisopetus_koodi
	 ,ooa.vankilaopetuksessa
	--,ps.paatason_suoritus_id

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

FROM sa.sa_koski_opiskeluoikeus oo
INNER JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
INNER JOIN (
	select
		opiskeluoikeus_oid
		,suorituksen_tyyppi
		--,paatason_suoritus_id
	from (
		select distinct 
			opiskeluoikeus_oid
			--,paatason_suoritus_id
			,suorituksen_tyyppi
			--,diaarinumero=perusteenDiaarinumero 
			,rnk=rank()over (partition by opiskeluoikeus_oid order by suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo)
		from sa.sa_koski_paatason_suoritus
	) q
	where rnk=1
) ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN sa.sa_koski_opiskeluoikeus oo2 ON oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and oo2.koulutustoimija_oid != oo.koulutustoimija_oid
--LEFT JOIN dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo)
--puuttuva rahoitus otetaan edellisestä läsnäolojaksosta AP 20.6.2019
LEFT JOIN cte as ooa2 on ooa2.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and DATEDIFF(DAY,ooa2.loppu, ooa.alku) = 1
LEFT JOIN cte as ooa3 on ooa3.opiskeluoikeus_oid = ooa2.opiskeluoikeus_oid and DATEDIFF(DAY,ooa3.loppu, ooa2.alku) = 1
LEFT JOIN cte as ooa4 on ooa4.opiskeluoikeus_oid = ooa3.opiskeluoikeus_oid and DATEDIFF(DAY,ooa4.loppu, ooa3.alku) = 1
--jos ei löydy edellisistä niin katsotaan myöhemmistä
LEFT JOIN cte as ooa5 on ooa5.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and DATEDIFF(DAY,ooa.loppu, ooa5.alku) = 1
LEFT JOIN cte as ooa6 on ooa6.opiskeluoikeus_oid = ooa5.opiskeluoikeus_oid and DATEDIFF(DAY,ooa5.loppu, ooa6.alku) = 1

WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
--and year(ooa.loppu) >= 2018
--AND (kl.tutkintotyyppi_koodi IN ('02','19','20') OR koulutusmoduuli_koodiarvo IN ('999901','999903')) --AP 17.10.2019 valma ja telma mukaan
--AND (ps.suorituksen_tyyppi <> 'nayttotutkintoonvalmistavakoulutus') --jhe 17.5.2019 Juhon meili:"Eli sun pitää pudottaa sieltä pois kaikki päätason suoritukset, joiden tyyppi on "nayttotutkintoonvalmistavakoulutus". Niistä ei tarvi katsoa ollenkaan osasuorituksia."

GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus] AS' 
END
GO





ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus] AS


-- jhe 20.3.2019, 23.4.2019, 25.4.2019, 30.4
-- tätä näkymää käytetään AMOS-suoritepäätöslaskennan suodattimena
-- tässä liputetut opiskeluoikeudet tai suorituksen osat jätetään pois sp-laskennasta..
--..kaksi filtteriä siis samassa näkymässä
-- Huom: tämä on VOS-laskennan raskain ajo !!!

TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]

SELECT 
	opiskeluoikeus_oid, 
    osasuoritus_id, 
    vaatimus,
	tieto 
FROM (
/* 14.10.2019 AP raportilla tehdään rajaus rahoitusmuodon mukaan, ei tarvita vielä tässä
	SELECT 
		--# 1  
        -- maksullisena palveluna järjestetty koulutus, rajaa pois nämä opiskeluoikeudet  
        -- CSCVIPUNEN-1383  
        opiskeluoikeus_oid, 
        osasuoritus_id, 
        'r1, rajaa pois nämä opiskeluoikeudet - CSCVIPUNEN-1383, maksullinen palvelu' AS vaatimus,
		'opiskeluoikeus' as tieto 
    FROM   (
		SELECT 
            --distinct  
            -- 21.3.2019 korvattu aiempi kysely Juho Mikkosen mallin mukaisella kyselyllä   
            oo.opiskeluoikeus_oid, 
            NULL AS osasuoritus_id 
		FROM koski_sa.sa.sa_koski_opiskeluoikeus AS oo 
        JOIN koski_sa.sa.sa_koski_opiskeluoikeus_aikajakso AS b ON oo.opiskeluoikeus_oid = b.opiskeluoikeus_oid 
        WHERE oo.koulutusmuoto = 'ammatillinenkoulutus' 
        AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL 
        AND ( 
                        -- vuosi-2 joulukuun viimeinen 'YYYY-12-31'   
			( b.loppu > Datefromparts(Year(Getdate()) - 2, 12, 31 
						) 
				AND 
				-- vuosi-1 joulukuun viimeinen 'YYYY-12-31  
				b.loppu < Datefromparts(Year(Getdate()) - 1, 12, 31 
						) ) 
			OR b.loppu IS NULL 
		) 
        AND b.alku < Datefromparts(Year(Getdate()) - 0, 1, 1) 
                    --kuluva vuosi tammikuun ensimmäinen 'YYYY-01-01'  
                    
		EXCEPT 

        SELECT 
			DISTINCT d.opiskeluoikeus_oid, 
			NULL AS osasuoritus_id 
        FROM koski_sa.sa.sa_koski_opiskeluoikeus AS d 
        JOIN koski_sa.sa.sa_koski_opiskeluoikeus_aikajakso AS e ON d.opiskeluoikeus_oid = e.opiskeluoikeus_oid 
        WHERE d.koulutusmuoto = 'ammatillinenkoulutus' 
        AND ( 
                        -- vuosi-2 joulukuun viimeinen 'YYYY-12-31'   
			(e.loppu > Datefromparts(Year(Getdate()) - 2, 12, 31) 
            AND e.loppu < Datefromparts(Year(Getdate()) - 1, 12, 31) 
                            -- vuosi-1 joulukuun viimeinen 'YYYY-12-31  
                             
            OR e.loppu IS NULL ) 
            AND e.alku < Datefromparts(Year(Getdate()) - 0, 1, 1) 
                        --kuluva vuosi tammikuun ensimmäinen 'YYYY-01-01'  
                           
			AND (e.opintojen_rahoitus <> '6' OR e.opintojen_rahoitus IS NULL ) 
		)
	) t1 

	UNION 
*/

--AP 8.12.2019 
    --# 2               
    -- koulutusvientinä järjestetty koulutus, rajaa pois nämä opiskeluoikeudet  
    -- CSCVIPUNEN-1384  
    -- 21.3.2019 Juhon uusi speksi vaihdettu sisempään kyselyyn, aikarajaukset muutettu kovakoodatusta dynaamisiksi /jhe
        
/*
	SELECT opiskeluoikeus_oid, 
		NULL                                   AS osasuoritus_id, 
        'r2, rajaa pois nämä opiskeluoikeudet - CSCVIPUNEN-1384, koulutusvienti' AS vaatimus,
		'opiskeluoikeus' as tieto 
	FROM   (
		SELECT 
			oo.opiskeluoikeus_oid 
        FROM koski_sa.sa.sa_koski_opiskeluoikeus AS oo 
        WHERE oo.koulutusmuoto = 'ammatillinenkoulutus' 
		--AP 8.12.2019 aikarajaukset otettu pois
  --      AND ( 
		--	( oo.paattymispaiva > Datefromparts(Year(Getdate()) - 2, 12, 31) 
  --                      -- vuosi-2 joulukuun viimeinen 'YYYY-12-31'   
                               
		--	AND oo.paattymispaiva < Datefromparts(Year(Getdate()) - 1, 12, 31) ) 
  --                          -- vuosi-1 joulukuun viimeinen 'YYYY-12-31'   
                                   
  --          OR oo.paattymispaiva IS NULL 
		--) 
		--AND oo.alkamispaiva < Datefromparts(Year(Getdate()) - 0, 1, 1) 
  --              --kuluva vuosi tammikuun ensimmäinen 'YYYY-01-01'  
        AND oo.lisatiedot_koulutusvienti = 1
	) t2 

	UNION 
*/


	--# 3, rajaa pois nämä osasuoritukset  
	-- opiskelu ei ole rahoituksen piirissä, päätellään data-kentän json-tiedosta  
	-- pudottaa pois tunnustetut tutkinnon osat tai osa-alueet (jotka ei rahoituksen piirissä) 
	-- tämäkin juho mikkosen speksi 19.3.2019  
	-- CSCVIPUNEN-1386  
	SELECT 
		opiskeluoikeus_oid, 
		osasuoritus_id
		,'r3, rajaa pois nämä osasuoritukset - CSCVIPUNEN-1386, json-tieto, rahoituksenPiirissa: false' AS vaatimus
		,'osasuoritus' as tieto 
	FROM sa.sa_koski_osasuoritus AS os
	where rahoituksen_piirissa = 0
  
	--UNION 
	--# 4, rajaa pois nämä osasuoritukset  
	--Lisämääreet 24.4.2019 palaverista, Juho Mikkonen, täsmennys meilissä 29.4 ja 30.4 
	--Yhteisten tutkinnonosien osa-alueiden suoritukset eivät kuulu 
	--..rahoituslaskennan kun kyse ammatillisen tutkinnnon osa-alueesta 
/*    SELECT t4.opiskeluoikeus_oid,  
            t4.osasuoritus_id,  
    'r4 - 29.4.2019 email, Juho Mikkonen: Rahoituksesta taas pudotetaan ne, joissa os.suorituksen_tyyppi = ammatillisentutkinnonosanosaalue.'
    AS vaatimus  
    FROM   (SELECT opiskeluoikeus_oid,  
                osasuoritus_id,  
                CASE  
                WHEN /*os.koulutusmoduuli_koodiarvo IN (  
                '101053', '101054', '101055', '101056',  
                '400012', '400013', '400014' )  
                AND*/ os.suorituksen_tyyppi =  
                    'ammatillisentutkinnonosanosaalue'  
            --    AND Year(os.arviointi_paiva) = Year(Getdate()) - 1  
            -- aikarajaus tehdään seuraavalla vaiheessa joka tapauksessa 
            THEN 1  
                ELSE 0  
                END AS ei_rahoiteta  
*/ 
	UNION
	--# 4, rajaa pois nämä osasuoritukset  
	SELECT 
		opiskeluoikeus_oid, 
		osasuoritus_id
		,'r4, rajaa pois nämä osasuoritukset - 29.4.2019 email, Juho Mikkonen: Rahoituksesta taas pudotetaan ne, joissa os.suorituksen_tyyppi = ammatillisentutkinnonosanosaalue.' AS vaatimus
		,'osasuoritus' as tieto 
	FROM sa.sa_koski_osasuoritus AS os
	WHERE suorituksen_tyyppi in ('ammatillisentutkinnonosanosaalue','ammatillisentutkinnonosaapienempikokonaisuus')

	UNION 
	--# 5, hylätyt suoritukset pois rahoituslaskennasta 
	SELECT 
		opiskeluoikeus_oid, 
		osasuoritus_id
		,'r5, rajaa pois nämä osasuoritukset - Kari Korhonen ja Seppo Hänninen, email 25.4.2019: hylätyt suoritukset pois rahoituslaskennasta' AS vaatimus
		,'osasuoritus' as tieto 
	FROM sa.sa_koski_osasuoritus AS os
	WHERE arviointi_hyvaksytty = 0
 
) t100 









GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] AS' 
END
GO




ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] @minVuosi int = 2018, @maxVuosi int = NULL AS

-- tässä suodatetaan pois ne osasuoritukset ja opiskeluoikeudet.. 
-- .. jotka nkymässä [dw].[v_amos_spl_liputa_ei_vos_rahoitettu_koulutus]..
-- .. liputettiin ei kuuluviksi amos vos-rahoituksen piiriin
-- tuodaan eperusteista laajuudet, logiikkaa ehkä vielä tarkistettava Sepon kanssa, jhe 30.4
-- lisätty aikarajaus ja arviointi_hyvaksytty rajaus jo tähän vaiheeseen


IF EXISTS (SELECT * FROM sys.indexes WHERE name='NonClusteredIndex-paataso_oid_osasuoritus' AND object_id = OBJECT_ID('sa.temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos'))
BEGIN
	DROP INDEX [NonClusteredIndex-paataso_oid_osasuoritus] ON [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]
END



TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]



SELECT 
	os.osasuoritus_id, 
	os.ylempi_osasuoritus_id, 
	coalesce(os2.koulutusmoduuli_koodisto,'') as koulutusmoduuli_koodisto_ylempi,
	os.paatason_suoritus_id, 
	os.opiskeluoikeus_oid, 
	os.suorituksen_tyyppi, 
	os.koulutusmoduuli_koodisto,
	-- jhe 30.4 tuodaan ep tietoja, tutkintokoodi ja laajuus, 1.5 kytkentä pois toistaseksi, hukkaa 5% riveistä
	-- seuraavalla tasolla korvataan yhdistelmäavaimen tutkintokoodi_tutkinnonosakoodi avulla kosken laajuustieto
	-- yhdistelmäavain siksi, että sama tutkinnonosa voi olla eri laajuinen eri tutkinnoissa 
	--,ep.tutkintokoodi as ep_tutkinto_koodi, 
   
	os.koulutusmoduuli_koodiarvo, 
	--jhe 10.5 lisätään numeerinen koodiarvo kenttä
	cast(
	case 
		when isnumeric(os.koulutusmoduuli_koodiarvo)= 1 and os.koulutusmoduuli_koodiarvo not like '0%' and os.koulutusmoduuli_koodiarvo not like '%.%' then os.koulutusmoduuli_koodiarvo
		else NULL 
	end as varchar) as koulutusmoduuli_koodiarvo_numeerinen, 
	os.koulutusmoduuli_laajuus_arvo, 
	os.koulutusmoduuli_laajuus_yksikko, 
	os.koulutusmoduuli_paikallinen, 
	os.koulutusmoduuli_pakollinen, 
	os.vahvistus_paiva, 
	os.arviointi_arvosana_koodiarvo, 
	os.arviointi_arvosana_koodisto, 
	os.arviointi_hyvaksytty, 
	os.arviointi_paiva, 
	os.nayton_arviointi_paiva, 
	case when eivos.osasuoritus_id is not null then 1 else 0 end as osasuoritus_hylataan,
	coalesce(oo2.koulutustoimija_oid, oo.koulutustoimija_oid) as koulutustoimija_oid,
	data = null --os.data

FROM sa.sa_koski_osasuoritus AS os 

LEFT JOIN sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid 
LEFT JOIN sa.sa_koski_opiskeluoikeus oo2 ON oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid --and oo2.opiskeluoikeus_oid is not null

--jhe 3.6.2019 eivos-suodatuksen korjaus
LEFT OUTER JOIN (
	SELECT distinct
		osasuoritus_id
	FROM sa.temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus
	WHERE tieto = 'osasuoritus'
) AS eivos ON os.osasuoritus_id = eivos.osasuoritus_id

--AP 23.6.2019 joinin muokkaus
--LEFT OUTER JOIN [dw].[d_amos_spl_koski_liputa_ei_vos_rahoitettu_koulutus] AS eivos ON eivos.osasuoritus_id = os.osasuoritus_id and eivos.tieto = 'osasuoritus'

--AP 1.8.2019 join jolla haetaan ylemmän osasuorituksen koulutusmoduuli_koodisto
LEFT JOIN sa.sa_koski_osasuoritus os2 ON os2.osasuoritus_id = os.ylempi_osasuoritus_id

WHERE 1=1
AND oo.koulutusmuoto = 'ammatillinenkoulutus'
AND year(os.arviointi_paiva) between @minVuosi and coalesce(@maxVuosi, 9999)
AND coalesce(os.koulutusmoduuli_laajuus_yksikko,6) = '6'



CREATE NONCLUSTERED INDEX [NonClusteredIndex-paataso_oid_osasuoritus] ON [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]
(
	[paatason_suoritus_id] ASC,
	[opiskeluoikeus_oid] ASC,
	[osasuoritus_id] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] AS' 
END
GO







ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] @minVuosi int = 2018, @maxVuosi int = NULL AS



--4 §
--Tutkintojen ja tutkinnon osien kustannusryhmän määräytyminen
--Tutkinnon osan kustannusryhmä määräytyy sen tutkinnon mukaisesti, johon tutkinnon osa tutkinnon perusteiden mukaisesti kuuluu.
--Ammatillisesta koulutuksesta annetun lain 13 §:n 2 momentissa tarkoitetut yhteiset tutkinnon osat kuuluvat kuitenkin kustannusryhmään 1.

--Jos tutkinnon osa voi tutkinnon perusteiden mukaisesti kuulua useaan tutkintoon, jotka kuuluvat eri kustannusryhmiin,
--tutkinnon osan kustannusryhmä määräytyy sen tutkinnon mukaisesti, jota opiskelija suorittaa.
--Jos opiskelijan tavoitteena on suorittaa vain tutkinnon osa tai osia, tässä momentissa tarkoitettu tutkinnon osa kuuluu kustannusryhmään 1.

-- Erityistä: neljällä tutkinnolla on kahteen kustannusryhmään kuuluvia osaamisaloja, joten niiden kustannusryhmiä ei haeta kr-taulusta,
-- ..poikkeavat osaamisalat liputetaan laatukontrollia varten sisemmässä kyselyssä, ulommassa kyselyssä..
-- .. kovakoodataan poikkeukset tutkinnon varsinaisesta kustannusryhmästä, case when t.osaamisala_koodiarvo in.....
-- 12.3 päivitetty Sepon lisäykset poikkeaviin osaamisalakoodeihin, meili torstai 7. maaliskuuta 2019 15.09
-- 13.3 toimipiste_nimi pudotettu pois, sisältää historiatietoa eli samalla oidilla voi olla useita nimiversioita, sotkee raportin
-- 2.4. kustannusryhmä liputettu poikkeavaksi jos ei suorita koko tutkintoa

DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

;WITH CTE AS (
	SELECT
		opiskeluoikeus_oid
		,sisaltyy_opiskeluoikeuteen_oid
		,lisatiedot_koulutusvienti
		,koulutustoimija_oid
		,vanha_koulutustoimija_oid
		,oppilaitos_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
	AND lisatiedot_koulutusvienti = 0
)

--INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

SELECT

	t.toimipiste_oid,
	t.oppilaitos_oid,
	t.koulutustoimija_oid,
	t.koulutustoimija_oid_hist,
	t.koulutustoimija_oid_pihvi,
	t.koulutustoimija_oid_pihvi_hist,
	t.opiskeluoikeus_oid,
	t.ylempi_opiskeluoikeus_oid,
	t.paatason_suoritus_id,
	coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi, koulutusmoduuli_koodiarvo) AS tutkinto_koodi, 
	osaamisala_koodiarvo, --t.osaamisala_koodiarvo,
	--tutkinto_ja_osaamisala_koodi, --t.tutkinto_ja_osaamisala_koodi,
	--atok.tutkinto_ja_osaamisala_koodi as eper_tutkinto_ja_osaamisala_koodi,

	t.diaarinumero,
	NULL as diaarinumero_tutkinto_koodi, -- t.diaarinumero+'_'+t.koulutusmoduuli_koodiarvo as diaarinumero_tutkinto_koodi,
	NULL as diaarinumero_tutkinto_ja_osaamisala_koodi, -- t.diaarinumero+'_'+t.tutkinto_ja_osaamisala_koodi  as diaarinumero_tutkinto_ja_osaamisala_koodi,
	t.suorituksen_tyyppi,
	t.suorituskieli_koodiarvo,

	case
		WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
		else coalesce(sa1.kustannusryhma_koodi, sa2.kustannusryhma_koodi)
	end 
	AS kustannusryhma_koodi,

	--atok.tutkinto_kustannusryhma_koodi AS alkup_kustannusryhmakoodi,
	t.suorittaa_koko_tutkintoa,
	kl.tutkintotyyppi_koodi,
	kl.tutkintotyyppi_fi,
	kl.koulutusluokitus_fi,
	t.vahvistus_paiva,
	t.vahvistus_paiva_muokattu
	,t.vahvistus_paiva_muokattu_kuori
	--,case
	--	WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
	--	else coalesce(sa1.kustannusryhma_koodi, sa3.kustannusryhma_koodi)
	--end 
	--AS kustannusryhma_koodi_uusi

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

FROM   (

	SELECT distinct
			
		diaarinumero = ps.perusteenDiaarinumero,
		ps.toimipiste_oid,
		oo.oppilaitos_oid,
		koulutustoimija_oid = coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid),
		koulutustoimija_oid_hist = case when so.koulutustoimija_oid is null then oo.vanha_koulutustoimija_oid else so.vanha_koulutustoimija_oid end,--coalesce(so.vanha_koulutustoimija_oid, oo.vanha_koulutustoimija_oid),
		koulutustoimija_oid_pihvi = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end,
		koulutustoimija_oid_pihvi_hist = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.vanha_koulutustoimija_oid else oo2.vanha_koulutustoimija_oid end,
		ps.opiskeluoikeus_oid,
		ylempi_opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid,
		ps.paatason_suoritus_id,
		suorittaa_koko_tutkintoa = 
			CASE
				WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
				ELSE 0
			END,
		ps.koulutusmoduuli_koodiarvo,
		ps.osaamisala_koodiarvo,
		tutkinto_ja_osaamisala_koodi = 
			CASE
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo <> '999904' THEN ps.koulutusmoduuli_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NOT NULL THEN ps.osaamisala_koodiarvo
			END,
		ps.suorituksen_tyyppi,
		ps.suorituskieli_koodiarvo,
		ps.vahvistus_paiva,
		vahvistus_paiva_muokattu = 
			CASE
				WHEN ps.vahvistus_paiva < oo.alkamispaiva THEN oo.alkamispaiva
				WHEN ps.vahvistus_paiva > oo.paattymispaiva THEN oo.paattymispaiva
				ELSE ps.vahvistus_paiva
			END,
		vahvistus_paiva_muokattu_kuori = 
			CASE
				WHEN ps.vahvistus_paiva < so.alkamispaiva THEN so.alkamispaiva
				WHEN ps.vahvistus_paiva > so.paattymispaiva THEN so.paattymispaiva
				ELSE ps.vahvistus_paiva
			END,
		rnk = RANK() OVER (PARTITION BY paatason_suoritus_id ORDER BY osaamisala_koodiarvo,(case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end))
	

	FROM CTE AS oo
	LEFT JOIN CTE AS oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid and oo2.koulutustoimija_oid != oo.koulutustoimija_oid
	LEFT JOIN sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN CTE AS so ON so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and so.koulutustoimija_oid != oo.koulutustoimija_oid
	WHERE ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
	--AND year(ps.vahvistus_paiva) between @minVuosi and coalesce(@maxVuosi, 9999)
				

) AS t

--LEFT JOIN (SELECT DISTINCT tutkinto_ja_osaamisala_koodi, tutkinto_kustannusryhma_koodi FROM dbo.kustannusryhma_tutkinto_ja_osaamisala) atok on atok.tutkinto_ja_osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma sa1 on sa1.osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi and year(vahvistus_paiva) between year(sa1.alkupvm)and year(coalesce(sa1.loppupvm,'9999-12-31'))
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = t.koulutusmoduuli_koodiarvo
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma sa2 on sa2.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) and year(vahvistus_paiva) between year(sa2.alkupvm) and year(coalesce(sa2.loppupvm,'9999-12-31'))
--LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi sa3 on sa3.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

WHERE rnk=1

GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 6.3.2022 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] AS' 
END
GO





ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] AS

-- ## Määritys OPH 7.3.2019, Korhonen, Hänninen Mikkonen -> Helminen ##
-- Logiikka: poimitaan osasuoritukset opiskeluoikeuksittain..
-- .. toiseen opiskeluoikeuteen sisältyvät suoritukset niputetaan emo-oikeuden eli ylemmän osasuorituksen alle
-- .. tätä varten on luotu uusi raportointikäsite "suoritustason_tunniste", jolla suoritusten kpl-määrä voidaan laskea
-- Aikarajaus tehdään arviointipäivän avulla, mutta tässä kyselyssä ei karsita rivejä, ainoastaan liputetaan osuminen raportointivuoteen..
-- .. varsinainen aikarajaus tehdään kun osasuoritus yhdistetään päätason tauluun, jonka vahvistus_paiva -arvo on vaihtoehtoinen hyväksymiskriteeri
-- Yhteinen tutkinnonosa liputetaan täällä myöhempää kustannusryhmittelyä varten


DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

;WITH CTE AS (
	SELECT
		opiskeluoikeus_oid
		,sisaltyy_opiskeluoikeuteen_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,vanha_koulutustoimija_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
)

--INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

SELECT
	oppilaitos_oid,
	koulutustoimija_oid,
	koulutustoimija_oid_hist,
	opiskeluoikeus_oid,
	ylempi_opiskeluoikeus_oid,
	paatason_suoritus_id,
	coalesce(
		CASE
			WHEN kuuluu_kaatoluokkaan = 1 THEN t.osasuoritus_id
			ELSE t.ylempi_osasuoritus_id
		END
	,t.osasuoritus_id) AS suoritustason_tunniste,
	arviointi_paiva,
	arviointi_paiva_muokattu,
	arviointi_paiva_muokattu_kuori,
	usean_tutkinnon_tutkinnonosa,
	usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
	kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma,
	tutkinto_johon_tutkinnonosa_kuuluu,
	osaamisala_johon_tutkinnonosa_kuuluu,
	yhteinen_tutkinnon_osa,
	--toisesta_tutkinnosta_sisallytetty_tutkinnonosa,
	kuuluu_kaatoluokkaan,
	koulutus_moduuli_laajuus_alle_yhden,
	koulutusmoduuli_koodiarvo,
	koulutusmoduuli_koodiarvo_paataso,
	koulutusmoduuli_koodiarvo_numeerinen,
	laajuus_puuttuu_eperusteista,

	COALESCE(
		CASE
			when laajuus_puuttuu_eperusteista=0 then isnull(ep_tutkinnonosa_laajuus, koulutusmoduuli_laajuus_arvo)
			--jos laajuus koskesta, hyväksytään vain sallituissa rajoissa
			when laajuus_puuttuu_eperusteista=1 and [koulutusmoduuli_laajuus_arvo] < 5 then 0
			when laajuus_puuttuu_eperusteista=1 and [koulutusmoduuli_laajuus_arvo] > 15 then 15
			when laajuus_puuttuu_eperusteista=2 and [koulutusmoduuli_laajuus_arvo] > 25 then 25
			when laajuus_puuttuu_eperusteista=3 then 0
			else [koulutusmoduuli_laajuus_arvo]
		END
	,ep_tutkinnonosa_laajuus, 0) AS koulutusmoduuli_laajuus_arvo

	,koulutusmoduuli_laajuus_arvo as koulutusmoduuli_laajuus_arvo_alkup
	,suorituksen_tyyppi
	,suorittaa_koko_tutkintoa
	--,usean_tutkinnon_tutkinnonosa_usea_kustannusryhma_uusi
	--,kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma_uusi

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

FROM   (

	SELECT 
		oo.oppilaitos_oid,
		coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid) AS koulutustoimija_oid,
		coalesce(so.vanha_koulutustoimija_oid, oo.vanha_koulutustoimija_oid) AS koulutustoimija_oid_hist,
		os.opiskeluoikeus_oid AS opiskeluoikeus_oid,
		coalesce(oo.sisaltyy_opiskeluoikeuteen_oid, '') AS ylempi_opiskeluoikeus_oid,
		os.paatason_suoritus_id,
		os.osasuoritus_id,
		os.ylempi_osasuoritus_id,
		os.arviointi_paiva,
		--AP 2.8.2019 tällä varmistetaan se, että arviointipäivä mappaantuu myöhemmin johonkin aikajaksoon
		arviointi_paiva_muokattu =
			CASE
				WHEN os.arviointi_paiva < oo.alkamispaiva THEN oo.alkamispaiva
				WHEN os.arviointi_paiva > oo.paattymispaiva THEN oo.paattymispaiva
				ELSE os.arviointi_paiva
			END,
		arviointi_paiva_muokattu_kuori =
			CASE
				WHEN os.arviointi_paiva < so.alkamispaiva THEN so.alkamispaiva
				WHEN os.arviointi_paiva > so.paattymispaiva THEN so.paattymispaiva
				ELSE os.arviointi_paiva
			END,
		os.arviointi_hyvaksytty,
		koulutus_moduuli_laajuus_alle_yhden = 
			CASE
				WHEN os.koulutusmoduuli_laajuus_arvo < 1 THEN 1
				ELSE 0
			END,
		os.koulutusmoduuli_laajuus_arvo,
		os.koulutusmoduuli_laajuus_yksikko,

		ep.tutkinnonosa_laajuus as ep_tutkinnonosa_laajuus,
		os.koulutusmoduuli_koodiarvo,
		coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) as koulutusmoduuli_koodiarvo_paataso,
		os.koulutusmoduuli_koodiarvo_numeerinen,
		--os.ep_usean_tutkinnon_tutkinnonosa,
		-- 10.5.2019 jhe, tämä liputus tarvitaan kustannusryhmän määrittelyssä, per Seppo H
		-- liputus tehdään eperusteita vasten, siellä tunnistetut tutkinnonosat tässä ykkösellä, muut nollalla
		coalesce(epu.kuuluu_useaan_tutkintoon,0) as usean_tutkinnon_tutkinnonosa,
		coalesce(epu.kuuluu_eri_kustannusryhmiin,0) as usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
		epu.kuuluu_useaan_tutkintoon_yksi_kustannusryhma as kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma,
		epu.tutkinto_koodi as tutkinto_johon_tutkinnonosa_kuuluu,
		nullif(epu.osaamisala_koodi,'0') AS osaamisala_johon_tutkinnonosa_kuuluu,

		yhteinen_tutkinnon_osa = 
			CASE
				WHEN os.koulutusmoduuli_koodiarvo IN (
				'101053', '101054', '101055', '101056',
				'400012', '400013', '400014' )
				AND os.koulutusmoduuli_koodisto = 'tutkinnonosat' THEN 1

				ELSE 0
			END,
		--toisesta_tutkinnosta_sisallytetty_tutkinnonosa =
		--	CASE
		--		WHEN os.data LIKE '%{_tutkinto_:%' THEN 1
		--		ELSE 0
		--	END,

		kuuluu_kaatoluokkaan = 
			CASE
				WHEN os.koulutusmoduuli_koodiarvo IN ( '1', '2' ) AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus' THEN 1
				ELSE 0
			END,

		---------------------
		--jhe 23.5.2019 Juho mikkosen speksi 21.5., so. suoritustyyppien laajuutta ei löydy eperusteista..
		--..käytetään koskeen kirjattua arvoa, tässä ensin ominaisuuden liputus:
		--AP 17.10.2019 muutettu Juhon uuden speksin mukaan

		laajuus_puuttuu_eperusteista = 
			CASE
				--yhteinen tutkinnonosa
				WHEN os.koulutusmoduuli_koodiarvo IN ('101053', '101054', '101055', '101056', '400012', '400013', '400014') AND os.koulutusmoduuli_koodisto = 'tutkinnonosat' THEN 1
				/*
				WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus' AND os.suorituksen_tyyppi = 'ammatillinenkorkeakouluopintoja' THEN 1
				WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus' AND os.suorituksen_tyyppi in ('ammatillinenlukionopintoja','ammatillinenmuitaopintovalmiuksiatukeviaopintoja','ammatillisentutkinnonosanosaalue')	THEN 2
				*/
				--kaatoluokka 
				WHEN os.koulutusmoduuli_koodiarvo IN ('1', '2')	AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus' THEN 3
				ELSE 0
			END

		,ps.suorituksen_tyyppi

		,suorittaa_koko_tutkintoa = case when ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 0 end

		--,usean_tutkinnon_tutkinnonosa_usea_kustannusryhma_uusi = coalesce(epu.kuuluu_eri_kustannusryhmiin_uusi,0)
		--,kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma_uusi = epu.kuuluu_useaan_tutkintoon_yksi_kustannusryhma_uusi


	FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] AS os
	LEFT JOIN (
		select
			suorituksen_tyyppi
			,paatason_suoritus_id
			,koulutusmoduuli_koodiarvo
		from (
			select distinct 
				paatason_suoritus_id
				,suorituksen_tyyppi
				,koulutusmoduuli_koodiarvo
				,rnk = rank() over (partition by paatason_suoritus_id order by suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo)
			from sa.sa_koski_paatason_suoritus
		) q
		where rnk=1
	) ps on ps.paatason_suoritus_id = os.paatason_suoritus_id
	LEFT JOIN CTE AS oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
	--AP 1.10.2019 ao join linkitettyjen oikeuksien järjestäjän hakemiseen
	LEFT JOIN CTE AS so on so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and so.koulutustoimija_oid != oo.koulutustoimija_oid
	--AP 23.6.2019 lisätty alla olevaan joiniin ehto rnk=1
	LEFT JOIN [dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet] as ep ON try_cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = ep.tutkinnonosa_koodi and rnk2=1
	--jhe 30.4 tuodaan ep:stä usean tutkinnonosan liputus
	LEFT JOIN [dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma] as epu ON try_cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = epu.tutkinnonosa_koodi and year(os.arviointi_paiva) between year(coalesce(epu.alkupvm,'1900-01-01')) and year(coalesce(epu.loppupvm,'9999-12-31'))

	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = ps.koulutusmoduuli_koodiarvo

	WHERE os.osasuoritus_hylataan = 0 
	AND kl.tutkintotyyppi_koodi IN ('02','19','20') --OR kl.koulutusluokitus_koodi IN ('999901','999903'))
	

) AS t

GO
USE ANTERO