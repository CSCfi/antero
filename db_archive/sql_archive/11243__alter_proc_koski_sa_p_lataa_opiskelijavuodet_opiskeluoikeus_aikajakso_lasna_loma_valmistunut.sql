USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_loma_valmistunut] AS

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_loma_valmistunut

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
	pvm
	,ooa.opiskeluoikeus_oid
	,ooa.tila
	,tila_alkanut = cast(null as date)
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
	,sisaltyy_toiseen_opiskeluoikeuteen 
	,aiempi_koulutusmuoto
	,aiempi_tuva_jarjestamislupa
	,valiaikainen_keskeytys
	,lasna_loma_valmistunut_pv_hyv = 
		case 
			when sisaltyy_toiseen_opiskeluoikeuteen = 1 
				 or alkanut_samana_paivana_hylataan = 1
				 or (valiaikainen_keskeytys = 0 and ed_paattynyt = 0)
				 then 0.0
			else 
				osa_aikaisuus / 100.0 
				* (
					datediff(
						day
						,(select maxValue from dbo.Maximum (pvm, alku, default))
						,(select minValue from dbo.Minimum (eomonth(pvm), loppu, default))
					) 
					+ 1
				)
		end
	,lasna_loma_valmistunut_pv_hyv_ei_muokattu = 
		 osa_aikaisuus / 100.0 
		 * (
			datediff(
				day
				,(select maxValue from dbo.Maximum (pvm, alku_ei_muokattu, default))
				,(select minValue from dbo.Minimum (eomonth(pvm), loppu_ei_muokattu, default))
			) 
			+ 1
		)

INTO sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_loma_valmistunut

FROM ( 

	SELECT
		sa1.opiskeluoikeus_oid
		,sa1.tila
		,alku = ca.alku
		,loppu = ca.loppu
		,alku_ei_muokattu = ca.alku_ei_muokattu
		,loppu_ei_muokattu = ca.loppu_ei_muokattu
		,ed_alku = oo_l.alku
		,ed_loppu = oo_l.loppu
		,opintojen_rahoitus = coalesce(
			case when sa1.tila = 'lasna' then sa1.opintojen_rahoitus end
			,sa2.opintojen_rahoitus, sa3.opintojen_rahoitus, sa4.opintojen_rahoitus
			,sa1.opintojen_rahoitus
		)
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
		,osa_aikaisuus = coalesce(
			case when sa1.tila = 'valmistunut' then 100 end
			,case when sa1.tila = 'lasna' then sa1.osa_aikaisuus end
			,sa2.osa_aikaisuus, sa3.osa_aikaisuus, sa4.osa_aikaisuus
			,sa1.osa_aikaisuus
		)
		,vankilaopetuksessa
		,oppisopimus_jossain_paatason_suorituksessa
		,opiskeluvalmiuksia_tukevat_opinnot
		,aiempi_koulutusmuoto = case when oo_l.aiempi_tuva_jarjestamislupa is not null then 'tuva' else coalesce(oo_l.aiempi_koulutusmuoto,'') end
		,aiempi_tuva_jarjestamislupa
		,valiaikainen_keskeytys
		,ed_paattynyt
		,ed_valmistunut
		,oid.alkanut_samana_paivana_hylataan
		,oid.sisaltyy_toiseen_opiskeluoikeuteen
		,oid.pvm

	FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid	
	LEFT JOIN [sa].[sa_koski_opiskeluoikeus_aikajakso] sa1 on sa1.opiskeluoikeus_oid = oid.opiskeluoikeus_oid
	LEFT JOIN ed_jaksot sa2 on sa2.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and datediff(day,sa2.loppu,sa1.tila_alkanut) = 1
	LEFT JOIN ed_jaksot sa3 on sa3.opiskeluoikeus_oid = sa2.opiskeluoikeus_oid and datediff(day,sa3.loppu,sa2.alku) = 1
	LEFT JOIN ed_jaksot sa4 on sa4.opiskeluoikeus_oid = sa3.opiskeluoikeus_oid and datediff(day,sa4.loppu,sa3.alku) = 1
	LEFT JOIN (
		SELECT 
			opiskeluoikeus_oid
			,aiempi_koulutusmuoto = min(aiempi_koulutusmuoto)
			,aiempi_tuva_jarjestamislupa = min(aiempi_tuva_jarjestamislupa)
			,alku
			,alku_tod
			,loppu = max(loppu)
			,ed_paattyi
			,sisaltyy_opiskeluoikeuteen
			,valiaikainen_keskeytys
			,ed_paattynyt
			,ed_valmistunut
		FROM sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet
		GROUP BY 
			opiskeluoikeus_oid
			,alku
			,alku_tod
			,ed_paattyi
			,sisaltyy_opiskeluoikeuteen
			,valiaikainen_keskeytys
			,ed_paattynyt
			,ed_valmistunut
	) oo_l on oo_l.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and oo_l.alku between sa1.alku and sa1.loppu

	CROSS APPLY (
		SELECT
			alku = (select maxValue from dbo.Maximum (pvm, sa1.alku, case when ed_valmistunut=1 then dateadd(day, 1, ed_paattyi) when ed_paattynyt=1 then ed_paattyi else oo_l.alku end)),
			alku_ei_muokattu = (select maxValue from dbo.Maximum (pvm, coalesce(oo_l.alku_tod, sa1.alku), default)),
			loppu = (select minValue from dbo.Minimum (eomonth(pvm), sa1.loppu, oo_l.loppu)),
			loppu_ei_muokattu = (select minValue from dbo.Minimum (eomonth(pvm), coalesce(oo_l.loppu, sa1.loppu), default))
	) ca

	WHERE sa1.tila in ('lasna','loma','valmistunut') 
	AND (sa1.alku <= eomonth(pvm) and sa1.loppu >= pvm)
	AND NOT (oid.sisaltyy_toiseen_opiskeluoikeuteen = 1 and coalesce(oo_l.sisaltyy_opiskeluoikeuteen, 1) = 0)
	
) ooa 

				
CREATE NONCLUSTERED INDEX [NC__temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_loma_valmistunut] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_loma_valmistunut]
(
	[opiskeluoikeus_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]

GO
