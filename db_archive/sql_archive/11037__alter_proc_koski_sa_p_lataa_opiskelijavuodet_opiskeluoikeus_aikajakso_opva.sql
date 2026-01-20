USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 28.1.2025 12.29.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROC [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva] @pv decimal(4,1) = null AS

--declare pvm as date
--declare eomonth(dateadd(month,-1,pvm)) as date
declare @maxPV as decimal(4,1)

--set pvm = '2018-08-01'
--set eomonth(dateadd(month,-1,pvm)) = eomonth(dateadd(month,-1,pvm))
set @maxPV = coalesce(@pv, 182.5) --toistaiseksi rinnakkaisraporttia varten kutsutaan parametrin arvolla 0


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
	,lasna_pv_hyv = (hyvaksytaan) *
		(CASE
			WHEN opva_hyv_hist + opva_summa_kertyma >= @maxPV then opva_nyk
			ELSE
				CASE
					WHEN opva_hyv_hist + opva_summa_kertyma + opva_nyk > @maxPV THEN opva_hyv_hist + opva_summa_kertyma + opva_nyk - @maxPV
					ELSE 0.0
				END
		END)
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
		,aiempi_koulutusmuoto
		,aiempi_tuva_jarjestamislupa
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
			,aiempi_koulutusmuoto
			,aiempi_tuva_jarjestamislupa
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
				,aiempi_koulutusmuoto
				,aiempi_tuva_jarjestamislupa
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
					,osa_aikaisuus = case when ooa.tila = 'loma' then coalesce(sa2.osa_aikaisuus, sa3.osa_aikaisuus, sa4.osa_aikaisuus, ooa.osa_aikaisuus) else ooa.osa_aikaisuus end
					,vankilaopetuksessa
					,oppisopimus_jossain_paatason_suorituksessa 
					,opiskeluvalmiuksia_tukevat_opinnot
					,alkanut_samana_paivana_hylataan = null --case when hyl.opiskeluoikeus_oid_hylataan is not null then 1 else 0 end
					--,toisen_opiskeluoikeuden_sisalla = case when oo_l.toisen_opiskeluoikeuden_sisalla = 1 then 1 else 0 end
					,aiempi_koulutusmuoto = coalesce(oo_l.aiempi_koulutusmuoto,'')
					,aiempi_tuva_jarjestamislupa
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
