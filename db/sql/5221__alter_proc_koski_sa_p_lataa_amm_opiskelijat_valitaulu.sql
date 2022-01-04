USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_amm_opiskelijat_valitaulu]    Script Date: 14.12.2021 14:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_amm_opiskelijat_valitaulu] AS

DECLARE @alkuPvm as date, @loppuPvm as date

SET @alkuPvm = '2018-01-01'
SET @loppuPvm = EOMONTH(@alkuPvm)


--EXEC [sa].[p_lataa_amm_paatason_suoritus]

WHILE @alkuPvm <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)

BEGIN
	
	DELETE FROM [dbo].[amm_opiskelijat_valitaulu] WHERE vuosi = YEAR(@alkuPvm) and kuukausi = MONTH(@alkuPvm)
	
	
	;WITH 
	
	sopimusjaksot AS (
		SELECT distinct 
			 opiskeluoikeus_oid
			,sopimusmuoto
		FROM [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2]
		where alku <= @loppuPvm AND coalesce(loppu,'9999-12-31') >= @alkuPvm
	)

	,eka_lasna_jakso AS (
		SELECT 
			 ooa1.opiskeluoikeus_oid
			,alku = min(ooa1.alku)
			,loppu = min(ooa1.loppu)
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa1
		WHERE ooa1.tila in ('lasna','loma')
		GROUP BY ooa1.opiskeluoikeus_oid
	)
	
	--tulkitaan suoraan näyttöön tulleeksi jos osa-aikaisuus aina 0 tai ainoa tila valmistunut
	,naytto_opisk AS (
		SELECT 
			 opiskeluoikeus_oid
			,naytto = case when max(coalesce(osa_aikaisuus,0)) = 0 or max(case when tila='valmistunut' then 0 else 1 end) = 0 then 1 else 0 end
		FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso
		GROUP BY opiskeluoikeus_oid
	)
	--muut opiskeluoikeudet samalla järjestäjällä
	,aiempi_oikeus_sama_jarj AS (
		SELECT distinct
			 opiskeluoikeus_oid
			,aiempi_perus = case when kytkin_perus = 1 and ehto_perus = 1 then 1 else 0 end
			,aiempi_rahoitus = case when kytkin_rahoitus = 1 and ehto_rahoitus = 1 then 1 else 0 end
			,r_per = rank() over (partition by opiskeluoikeus_oid order by ehto_perus desc,kytkin_perus desc)
			,r_rah = rank() over (partition by opiskeluoikeus_oid order by ehto_rahoitus desc,kytkin_rahoitus desc)
		FROM (

			SELECT
				 oo1.opiskeluoikeus_oid
				--perus
				,kytkin_perus = case when ll.opiskeluoikeus_oid is not null then 1 else 0 end
				,ehto_perus = 
					case
						when (case when ps1.suorituksen_tyyppi in ('valma','telma') then 1 else 0 end)=(case when ps2.suorituksen_tyyppi in ('valma','telma') then 1 else 0 end) then 1
						else 0
					end
				--rahoitus
				,kytkin_rahoitus = case when ooa_m.kytkin is not null then 1 else 0 end
				,ehto_rahoitus = 
					case 
						when ps2.suorituksen_tyyppi not in ('muuammatillinenkoulutus','nayttotutkintoonvalmistavakoulutus','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') then 1
						else 0
					end
			FROM sa.sa_koski_opiskeluoikeus oo1
			LEFT JOIN sa.sa_koski_henkilo h1 on h1.oppija_oid = oo1.oppija_oid
			LEFT JOIN sa.sa_amm_paatason_suoritus ps1 on ps1.opiskeluoikeus_oid = oo1.opiskeluoikeus_oid and ps1.rnk = 1

			LEFT JOIN (
				SELECT
					oo.*
					,h.hetu
				FROM sa.sa_koski_opiskeluoikeus oo
				JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
			) oo2 on coalesce(oo2.hetu, oo2.oppija_oid) = coalesce(h1.hetu, h1.oppija_oid)	
										and oo2.opiskeluoikeus_oid != oo1.opiskeluoikeus_oid 
										and oo2.sisaltyy_opiskeluoikeuteen_oid is null
										and year(coalesce(oo2.paattymispaiva, '9999-12-31')) >= year(@alkuPvm)
										and oo2.koulutusmuoto = 'ammatillinenkoulutus'

			LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki jl1 on jl1.oid_avain = oo1.koulutustoimija_oid
			LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki jl2 on jl2.oid_avain = oo2.koulutustoimija_oid

			LEFT JOIN sa.sa_amm_paatason_suoritus ps2 on ps2.opiskeluoikeus_oid = oo2.opiskeluoikeus_oid 
														and ps2.rnk = 1
														and (
															case	
																when (case when coalesce(ps1.suorituksen_alkamispaiva,'9999-12-31') < oo1.alkamispaiva then ps1.suorituksen_alkamispaiva else oo1.alkamispaiva end) >= coalesce(jl2.voimaan_alkaen,'9999-12-31') and jl1.oid_amos_spl = jl2.oid_amos_spl then 1
																when (case when coalesce(ps1.suorituksen_alkamispaiva,'9999-12-31') < oo1.alkamispaiva then ps1.suorituksen_alkamispaiva else oo1.alkamispaiva end) < coalesce(jl2.voimaan_alkaen,'9999-12-31') and oo1.koulutustoimija_oid = oo2.koulutustoimija_oid then 1
																else 0
															end
														) = 1

			LEFT JOIN sa.sa_koski_opiskeluoikeus oo3 on oo3.opiskeluoikeus_oid = ps2.opiskeluoikeus_oid 
														and (case when coalesce(ps2.suorituksen_alkamispaiva,'9999-12-31') < oo2.alkamispaiva then ps2.suorituksen_alkamispaiva else oo2.alkamispaiva end) < (case when coalesce(ps1.suorituksen_alkamispaiva,'9999-12-31') < oo1.alkamispaiva then ps1.suorituksen_alkamispaiva else oo1.alkamispaiva end)
			
			--suoraan näyttöön tulleiden suodatus
			LEFT JOIN naytto_opisk n_o on n_o.opiskeluoikeus_oid = oo3.opiskeluoikeus_oid and n_o.naytto = 0

			--lasna/loma tila
			LEFT JOIN (select opiskeluoikeus_oid from Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso where tila in ('lasna','loma')) ll on ll.opiskeluoikeus_oid = n_o.opiskeluoikeus_oid
			
			--ekan kuukauden rahoitusmuoto
			LEFT JOIN (select distinct opiskeluoikeus_oid,alku,loppu,kytkin=0 from Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso where opintojen_rahoitus in ('1','10','11','12')) ooa_m on ooa_m.opiskeluoikeus_oid = ll.opiskeluoikeus_oid and month(ooa_m.alku)=month(oo3.alkamispaiva) and year(ooa_m.alku)=year(oo3.alkamispaiva)

			WHERE 1=1	
		
		) q
		
	) 

	INSERT INTO [dbo].[amm_opiskelijat_valitaulu] 

	SELECT --distinct
		vuosi
		,kuukausi
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,erityisopetus = 
			case				
				when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and q.suorituksen_tyyppi not in ('telma','valma') then 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and q.suorituksen_tyyppi in ('telma','valma') then 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
				when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and q.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				when q.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen = 1 then 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				when q.suorituksen_tyyppi not in ('telma','valma') and ooa.vammainen_ja_avustaja = 1 then 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and q.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				when q.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen = 1 then 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				when q.suorituksen_tyyppi in ('telma','valma') and ooa.vammainen_ja_avustaja = 1 then 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
				when ooa.erityinen_tuki = 0 then 1 --Ei erityisopiskelija
				else -1
			end
		,opintojen_rahoitus = ooa.opintojen_rahoitus
		,majoitus =
			case					
				when ooa.majoitus = 1 then 2
				when ooa.sisaoppilaitosmainen_majoitus = 1 then 3
				when ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 then 4
				else 1
			end
		,q.tutkinto_koodi
		,q.osaamisala_koodiarvo
		,q.suorituskieli_koodiarvo
		,oppisopimus
		,koulutussopimus
		,q.toimipiste_oid
		,q.oppilaitos_oid
		,q.koulutustoimija_oid
		,henkilostokoulutus
		,q.suorituksen_tyyppi
		,uusi = 
			case
				when n_o.naytto = 0 and oo2.opiskeluoikeus_oid is null then 
					case 
						when q.alkamispaiva between @alkuPvm and @loppuPvm then 1
						--alkanut väliaikaisella keskeytyksellä
						when ooa2.alku between @alkuPvm and @loppuPvm and q.alkamispaiva = q.op_alkamispaiva then 1 
						else 0 
					end
				else 0
			end
		,uusi_rahoitus = 
			case 
				when n_o.naytto = 0 and oo3.opiskeluoikeus_oid is null and q.suor_tyyppi_rahoitus = 1 and coalesce(ooa.opintojen_rahoitus,ooab.opintojen_rahoitus) in ('1','10','11','12') then 
					case 
						when q.alkamispaiva between @alkuPvm and @loppuPvm then 1 
						--alkanut väliaikaisella keskeytyksellä
						when ooa2.alku between @alkuPvm and @loppuPvm and year(ooa2.alku) = year(q.alkamispaiva) and q.alkamispaiva = q.op_alkamispaiva then 1 
						else 0 
					end
				else 0 
			end
		,q.oppija_oid
		,q.opiskeluoikeus_oid
			
	FROM (
		SELECT 
	 
			 vuosi = YEAR(@alkuPvm)
			,kuukausi = MONTH(@alkuPvm)

			,sukupuoli = (case when CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 then '1' when CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 then '2' end)
			,aidinkieli = h.aidinkieli
			,ika = YEAR(@alkuPvm) - YEAR(h.syntymaaika) 
			,kansalaisuus = LEFT(kansalaisuus, 3)
		
			,ps.tutkinto_koodi
			,ps.osaamisala_koodiarvo
			,ps.suorituskieli_koodiarvo
			,oppisopimus = case when os.opiskeluoikeus_oid is not null then 1 else 0 end 
			,koulutussopimus = case when ks.opiskeluoikeus_oid is not null then 1 else 0 end 
			,ps.toimipiste_oid
			,ps.suorituksen_tyyppi
			,suor_tyyppi_rahoitus = case when ps.suorituksen_tyyppi in ('ammatillinentutkinto','ammatillinentutkintoosittainen','valma','telma') then 1 else 0 end

			,oo.oppilaitos_oid
			,oo.koulutustoimija_oid
			,henkilostokoulutus = oo.lisatiedot_henkilostokoulutus
			,oo.oppija_oid
			,oo.opiskeluoikeus_oid
			,alkamispaiva = case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end
			,op_alkamispaiva = oo.alkamispaiva
	
		FROM [sa].[sa_koski_opiskeluoikeus] oo
		JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
		JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ps.rnk = 1
		LEFT JOIN (select * from sopimusjaksot where sopimusmuoto like '%oppisopimu%') os on os.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
		LEFT JOIN (select * from sopimusjaksot where sopimusmuoto = 'Koulutussopimus') ks on ks.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
					
		WHERE 1=1
		AND oo.koulutusmuoto = 'ammatillinenkoulutus'
		AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL

	) q
	
	--aikajaksot
	LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = q.opiskeluoikeus_oid 
	--opintojen rahoitus katsotaan varmuuden vuoksi myös seuraavasta jaksosta (jos alkaa lomalla tms.)
	LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooab on ooab.opiskeluoikeus_oid = q.opiskeluoikeus_oid and datediff(day,ooa.loppu,ooab.tila_alkanut)=1
						
	--muut opiskeluoikeudet samalla järjestäjällä
	LEFT JOIN aiempi_oikeus_sama_jarj oo2 on oo2.opiskeluoikeus_oid = q.opiskeluoikeus_oid and oo2.r_per = 1 and oo2.aiempi_perus = 1

	--muut opiskeluoikeudet samalla järjestäjällä (rahoitus)
	LEFT JOIN aiempi_oikeus_sama_jarj oo3 on oo3.opiskeluoikeus_oid = q.opiskeluoikeus_oid and oo3.r_rah = 1 and oo3.aiempi_rahoitus = 1

	--suoraan näyttöön
	LEFT JOIN naytto_opisk n_o on n_o.opiskeluoikeus_oid = q.opiskeluoikeus_oid

	--eka läsnäjakso
	LEFT JOIN eka_lasna_jakso ooa2 on ooa2.opiskeluoikeus_oid = q.opiskeluoikeus_oid

	WHERE ooa.tila in ('lasna','loma') and
	(case 
		--Suoritus alkanut mutta opiskeluoikeus ei. Aikajakson kohdistus ensimmäiseen läsnä-jaksoon.
		when q.op_alkamispaiva > @loppuPvm and q.alkamispaiva <= @loppuPvm and month(ooa.alku) = month(ooa2.alku) and year(ooa.alku) = year(ooa2.alku) then 1
		--Aikajakso tarkastelukuukauden aikana
		when ooa.alku <= @loppuPvm and ooa.loppu >= @alkuPvm then 1
		else 0
	end) = 1


	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)


END
