USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 30.7.2025 15.21.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet] AS

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet;

WITH ed_jaksot AS (
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
		,master_oid
		,opiskeluoikeus_oid = nyk_opiskeluoikeus_oid
		,paallekkainen_opiskeluoikeus_oid = opiskeluoikeus_oid
		,aiempi_koulutusmuoto 
		,aiempi_tuva_jarjestamislupa
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
			,oo_a.master_oid
			,oo_la.opiskeluoikeus_oid
			,aiempi_koulutusmuoto = coalesce(oo_la.koulutusmuoto,'')
			,aiempi_tuva_jarjestamislupa = oo_la.tuva_jarjestamislupa
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
				oo.master_oid
				,ooa.opiskeluoikeus_oid
				,oo.alkamispaiva
				,paattymispaiva = cast(coalesce(oo.paattymispaiva,'9999-12-31') as datetime)
				,ooa.tila_alkanut
				,ooa.alku
				,ooa.loppu
				,ooa.tila
				,oo.koulutusmuoto
				,oo.tuva_jarjestamislupa
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
			inner join (select distinct master_oid from sa.temp_opiskelijavuodet_opiskeluoikeus_oidit) o on o.master_oid = oo.master_oid 
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
			and (
				oo.koulutusmuoto = 'ammatillinenkoulutus' 
				or oo.koulutusmuoto = 'tuva'
				or (oo.koulutusmuoto = 'lukiokoulutus' and ps.suorituksen_tyyppi = 'lukionoppimaara') 
				or oo.koulutusmuoto = 'perusopetuksenlisaopetus'
			)
			and oo.sisaltyy_opiskeluoikeuteen_oid is null

			UNION

			--samana päivänä alkaneet
			select 
				oo.master_oid
				,ooa.opiskeluoikeus_oid
				,oo.alkamispaiva
				,paattymispaiva = cast(coalesce(oo.paattymispaiva,'9999-12-31') as datetime)
				,ooa.tila_alkanut
				,ooa.alku
				,ooa.loppu
				,ooa.tila
				,oo.koulutusmuoto
				,oo.tuva_jarjestamislupa
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
	
		) oo_la on oo_la.master_oid = oo_a.master_oid				--sama oppija
			and oo_la.opiskeluoikeus_oid != oo_a.opiskeluoikeus_oid	--eri opiskeluoikeus
			and 
			(														--ammatillinen sis. ammatillisen TUVA alkanut ennen nykyistä tai samana päivänä
				(
					(
						oo_la.alkamispaiva < oo_a.alkamispaiva 
						and (oo_la.koulutusmuoto = 'ammatillinenkoulutus' or oo_la.tuva_jarjestamislupa = 'ammatillinen') 
						and alkanut_samana_paivana = 0
					) 
					or 
					(
						(oo_la.koulutusmuoto = 'ammatillinenkoulutus' or oo_la.tuva_jarjestamislupa = 'ammatillinen') 
						and oo_la.opiskeluoikeus_oid=oo_a.sisaltyy_oid
					)
				) 
				or													--lukion TUVA alkanut ennen nykyistä tai samana päivänä
				(oo_la.alkamispaiva <= oo_a.alkamispaiva and oo_la.tuva_jarjestamislupa = 'lukio' and alkanut_samana_paivana = 0) 
				or													--perusopetuksen TUVA alkanut ennen nykyistä tai samana päivänä
				(oo_la.alkamispaiva <= oo_a.alkamispaiva and oo_la.tuva_jarjestamislupa = 'perusopetus' and alkanut_samana_paivana = 0) 
				or													--lukio alkanut ennen nykyistä tai samana päivänä
				(oo_la.alkamispaiva <= oo_a.alkamispaiva and oo_la.koulutusmuoto = 'lukiokoulutus' and alkanut_samana_paivana = 0) 
				or													--perusopetuksen lisäopetus alkanut ennen nykyistä tai samana päivänä
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

) q2

WHERE rnk = 1

GO
