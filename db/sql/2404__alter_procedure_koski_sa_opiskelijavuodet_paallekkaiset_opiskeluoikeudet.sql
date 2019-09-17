USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 17.9.2019 16:09:28 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 17.9.2019 16:09:28 ******/
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
			where (oo.koulutusmuoto = 'ammatillinenkoulutus' or (oo.koulutusmuoto = 'lukiokoulutus' and ps.suorituksen_tyyppi = 'lukionoppimaara') or oo.koulutusmuoto = 'perusopetuksenlisaopetus')
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
				or														--perusopetuksen lisäopetus alkanut ennen nykyistä tai samana päivänä
				(oo_la.alkamispaiva <= oo_a.alkamispaiva and oo_la.koulutusmuoto = 'perusopetuksenlisaopetus' and alkanut_samana_paivana = 0) 
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
USE ANTERO