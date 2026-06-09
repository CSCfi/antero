USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_amm_opiskelijat_valitaulu] AS

DECLARE @alkuPvm as date, @loppuPvm as date

SET @alkuPvm = '2018-01-01'
SET @loppuPvm = EOMONTH(@alkuPvm)

DROP TABLE IF EXISTS sa.temp_amm_koski_opiskeluoikeus
DROP TABLE IF EXISTS sa.temp_amm_eka_lasna_jakso
DROP TABLE IF EXISTS sa.temp_amm_naytto_opisk

SELECT 
	oo.opiskeluoikeus_oid, 
	oo.master_oid,
	oo.koulutustoimija_oid,
	oo.oppilaitos_oid,
	oo.lisatiedot_henkilostokoulutus,
	oo.lisatiedot_koulutusvienti,
	oo.alkamispaiva
INTO sa.temp_amm_koski_opiskeluoikeus
FROM sa.sa_koski_opiskeluoikeus oo
WHERE (oo.koulutusmuoto = 'ammatillinenkoulutus' or oo.tuva_jarjestamislupa = 'ammatillinen') AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL

SELECT 
	 ooa1.opiskeluoikeus_oid
	,alku = min(ooa1.alku)
	,loppu = min(ooa1.loppu)
INTO sa.temp_amm_eka_lasna_jakso
FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa1
WHERE ooa1.tila in ('lasna','loma')
GROUP BY ooa1.opiskeluoikeus_oid

--tulkitaan suoraan näyttöön tulleeksi jos osa-aikaisuus aina 0 tai ainoa tila valmistunut
SELECT 
	opiskeluoikeus_oid
	,naytto = case when max(coalesce(osa_aikaisuus,0)) = 0 or max(case when tila='valmistunut' then 0 else 1 end) = 0 then 1 else 0 end
INTO sa.temp_amm_naytto_opisk
FROM sa.sa_koski_opiskeluoikeus_aikajakso
GROUP BY opiskeluoikeus_oid


TRUNCATE TABLE [dbo].[amm_opiskelijat_valitaulu]

WHILE @alkuPvm <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)

BEGIN

	DROP TABLE IF EXISTS sa.temp_amm_opiskelijat_sopimusjaksot
	
	SELECT DISTINCT 
		 opiskeluoikeus_oid
		,sopimusmuoto
	INTO sa.temp_amm_opiskelijat_sopimusjaksot
	FROM [sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2]
	WHERE alku <= @loppuPvm AND coalesce(loppu,'9999-12-31') >= @alkuPvm

	IF MONTH(@alkuPvm) = 1
	BEGIN

		DROP TABLE IF EXISTS sa.temp_amm_aiempi_oikeus_sama_jarj

		--muut opiskeluoikeudet samalla järjestäjällä
		SELECT DISTINCT
			 opiskeluoikeus_oid
			,aiempi_perus = case when kytkin_perus = 1 and ehto_perus = 1 then 1 else 0 end
			,r_per = rank() over (partition by opiskeluoikeus_oid order by ehto_perus desc, kytkin_perus desc)
		INTO sa.temp_amm_aiempi_oikeus_sama_jarj
		FROM (

			SELECT
				oo1.opiskeluoikeus_oid
				--perus
				,kytkin_perus = case when ll.opiskeluoikeus_oid is not null then 1 else 0 end
				,ehto_perus = 
					case
						when (case when ps1.suorituksen_tyyppi in ('valma','telma','tuvakoulutuksensuoritus') then 1 else 0 end)
							=(case when ps2.suorituksen_tyyppi in ('valma','telma','tuvakoulutuksensuoritus') then 1 else 0 end) then 1
						else 0
					end
			FROM sa.sa_koski_opiskeluoikeus oo1
			LEFT JOIN sa.sa_amm_paatason_suoritus ps1 on ps1.opiskeluoikeus_oid = oo1.opiskeluoikeus_oid and ps1.rnk = 1

			LEFT JOIN sa.sa_koski_opiskeluoikeus oo2
				on oo2.master_oid = oo1.master_oid
				and oo2.opiskeluoikeus_oid != oo1.opiskeluoikeus_oid 
				and oo2.sisaltyy_opiskeluoikeuteen_oid is null
				and year(coalesce(oo2.paattymispaiva, '9999-12-31')) >= year(@alkuPvm)
				and (oo2.koulutusmuoto = 'ammatillinenkoulutus' or oo2.tuva_jarjestamislupa = 'ammatillinen')

			LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki jl1 on jl1.oid_avain = oo1.koulutustoimija_oid
			LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki jl2 on jl2.oid_avain = oo2.koulutustoimija_oid

			LEFT JOIN sa.sa_amm_paatason_suoritus ps2 
				on ps2.opiskeluoikeus_oid = oo2.opiskeluoikeus_oid 
				and ps2.rnk = 1
				and (
					case	
						when (case when coalesce(ps1.suorituksen_alkamispaiva,'9999-12-31') < oo1.alkamispaiva then ps1.suorituksen_alkamispaiva else oo1.alkamispaiva end) >= coalesce(jl2.voimaan_alkaen,'9999-12-31') and jl1.oid_amos_spl = jl2.oid_amos_spl then 1
						when (case when coalesce(ps1.suorituksen_alkamispaiva,'9999-12-31') < oo1.alkamispaiva then ps1.suorituksen_alkamispaiva else oo1.alkamispaiva end) < coalesce(jl2.voimaan_alkaen,'9999-12-31') and oo1.koulutustoimija_oid = oo2.koulutustoimija_oid then 1
						else 0
					end
				) = 1

			LEFT JOIN sa.sa_koski_opiskeluoikeus oo3 
				on oo3.opiskeluoikeus_oid = ps2.opiskeluoikeus_oid 
				and (case when coalesce(ps2.suorituksen_alkamispaiva,'9999-12-31') < oo2.alkamispaiva then ps2.suorituksen_alkamispaiva else oo2.alkamispaiva end) < (case when coalesce(ps1.suorituksen_alkamispaiva,'9999-12-31') < oo1.alkamispaiva then ps1.suorituksen_alkamispaiva else oo1.alkamispaiva end)
			
			--suoraan näyttöön tulleiden suodatus
			LEFT JOIN sa.temp_amm_naytto_opisk n_o on n_o.opiskeluoikeus_oid = oo3.opiskeluoikeus_oid and n_o.naytto = 0

			--lasna/loma tila
			LEFT JOIN (select opiskeluoikeus_oid from sa.sa_koski_opiskeluoikeus_aikajakso where tila in ('lasna','loma')) ll on ll.opiskeluoikeus_oid = n_o.opiskeluoikeus_oid
			
		) q
	
	END

	INSERT INTO [dbo].[amm_opiskelijat_valitaulu] 

	SELECT --distinct
		vuosi
		,kuukausi
		,op_alkamispaiva
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,kotikunta
		,erityisopetus = 
			case				
				when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and q.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') then 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and q.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') then 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
				when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and q.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				when q.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 then 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				when q.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 then 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and q.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				when q.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 then 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				when q.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 then 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
				when ooa.erityinen_tuki = 0 then 1 --Ei erityisopiskelija
				else -1
			end
		,ooa.opintojen_rahoitus
		,q.koulutusvienti
		,majoitus =
			case					
				when ooa.majoitus = 1 then 2
				when ooa.sisaoppilaitosmainen_majoitus = 1 then 3
				when ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 then 4
				else 1
			end
		,q.tutkinto_koodi
		,q.osaamisala_koodiarvo
		,q.tutkintonimike_koodiarvo
		,q.suorituskieli_koodiarvo
		,oppisopimus
		,koulutussopimus
		,q.toimipiste_oid
		,q.oppilaitos_oid
		,q.koulutustoimija_oid
		,q.hankintakoulutuksen_toimipiste_oid
		,q.hankintakoulutuksen_oppilaitos_oid
		,q.hankintakoulutuksen_koulutustoimija_oid
		,q.hankintakoulutus
		,q.henkilostokoulutus
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
		,uusi_rahoitus = null 
		
		,q.master_oid
		,q.opiskeluoikeus_oid
		,q.oppivelvollinen
		,tilastopaiva_20_9 =
			case
				when kuukausi = 9 AND DATEFROMPARTS(vuosi, kuukausi, 20) BETWEEN ooa.alku AND COALESCE(ooa.loppu, '9999-01-01') THEN 1
				else 0
			end 
			
	FROM (
		
		SELECT 
			 vuosi = YEAR(@alkuPvm)
			,kuukausi = MONTH(@alkuPvm)

			,h.sukupuoli
			,h.aidinkieli
			,ika = YEAR(@alkuPvm) - YEAR(h.syntymaaika) 
			,kansalaisuus = LEFT(h.kansalaisuus, 3)
			,h.kotikunta
		
			,ps.tutkinto_koodi
			,pso.osaamisala_koodiarvo
			,pst.tutkintonimike_koodiarvo
			,ps.suorituskieli_koodiarvo
			,oppisopimus = case when os.opiskeluoikeus_oid is not null then 1 else 0 end 
			,koulutussopimus = case when ks.opiskeluoikeus_oid is not null then 1 else 0 end 
			,ps.suorituksen_tyyppi
			
			,ps.toimipiste_oid
			,oo.oppilaitos_oid
			,oo.koulutustoimija_oid
			,hankintakoulutuksen_toimipiste_oid = oo_hk.toimipiste_oid
			,hankintakoulutuksen_oppilaitos_oid = oo_hk.oppilaitos_oid
			,hankintakoulutuksen_koulutustoimija_oid = oo_hk.koulutustoimija_oid
			,hankintakoulutus = case when oo_hk.koulutustoimija_oid is not null then 1 else 0 end
			,henkilostokoulutus = oo.lisatiedot_henkilostokoulutus
			,koulutusvienti = oo.lisatiedot_koulutusvienti
			,oo.master_oid
			,oo.opiskeluoikeus_oid
			,alkamispaiva = case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end
			,op_alkamispaiva = oo.alkamispaiva
			-- Oppivelvollisuus kuukauden ensimmaisena paivana
			,oppivelvollinen = case when ov.master_oid is not null then 1 else 0 end
	
		FROM sa.temp_amm_koski_opiskeluoikeus oo
		JOIN sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
		JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ps.rnk = 1
		OUTER APPLY (
			SELECT 
				MIN(pso.osaamisala_koodiarvo) as osaamisala_koodiarvo
			FROM sa.sa_koski_paatason_suoritus_osaamisala pso
			WHERE pso.paatason_suoritus_id = ps.paatason_suoritus_id
		) pso
		LEFT JOIN sa.sa_koski_paatason_suoritus_tutkintonimike pst on pst.paatason_suoritus_id = ps.paatason_suoritus_id
		LEFT JOIN (
			SELECT
				sisaltyy_opiskeluoikeuteen_oid
				,oo.opiskeluoikeus_oid
				,koulutustoimija_oid
				,oppilaitos_oid
				,toimipiste_oid
				,rnk = row_number() over (partition by sisaltyy_opiskeluoikeuteen_oid order by alkamispaiva desc, viimeisin_tila desc, oo.opiskeluoikeus_oid)
			FROM sa.sa_koski_opiskeluoikeus oo
			JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ps.rnk = 1
			WHERE oo.sisaltyy_opiskeluoikeuteen_oid is not null
		) oo_hk on oo_hk.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid and oo_hk.rnk = 1
		LEFT JOIN sa.temp_amm_opiskelijat_sopimusjaksot os on os.sopimusmuoto like '%oppisopimu%' and os.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
		LEFT JOIN sa.temp_amm_opiskelijat_sopimusjaksot ks on ks.sopimusmuoto = 'Koulutussopimus' and ks.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
		LEFT JOIN sa.sa_oppivelvolliset ov on ov.master_oid = oo.master_oid and @alkuPvm BETWEEN ov.alkuPvm and ov.loppuPvm

	) q
	
	--aikajaksot
	LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = q.opiskeluoikeus_oid 
	--opintojen rahoitus katsotaan varmuuden vuoksi myös seuraavasta jaksosta (jos alkaa lomalla tms.)
	LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooab on ooab.opiskeluoikeus_oid = q.opiskeluoikeus_oid and datediff(day,ooa.loppu,ooab.tila_alkanut)=1
						
	--muut opiskeluoikeudet samalla järjestäjällä
	LEFT JOIN sa.temp_amm_aiempi_oikeus_sama_jarj oo2 on oo2.opiskeluoikeus_oid = q.opiskeluoikeus_oid and oo2.r_per = 1 and oo2.aiempi_perus = 1

	--suoraan näyttöön
	LEFT JOIN sa.temp_amm_naytto_opisk n_o on n_o.opiskeluoikeus_oid = q.opiskeluoikeus_oid

	--eka läsnäjakso
	LEFT JOIN sa.temp_amm_eka_lasna_jakso ooa2 on ooa2.opiskeluoikeus_oid = q.opiskeluoikeus_oid

	WHERE ooa.tila in ('lasna','loma')
	AND ooa.alku <= @loppuPvm and ooa.loppu >= @alkuPvm
	AND NOT EXISTS (
		SELECT 1 
		FROM sa.tuva_lasna_loma_jaksot tuvat
		WHERE q.suorituksen_tyyppi != 'tuvakoulutuksensuoritus'
		AND tuvat.master_oid = q.master_oid
		AND tuvat.alku <= @loppuPvm and tuvat.loppu >= @alkuPvm 
		AND tuvat.alku <= ooa.loppu and tuvat.loppu >= ooa.alku
	)


	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)

END


DROP TABLE sa.temp_amm_koski_opiskeluoikeus
DROP TABLE sa.temp_amm_opiskelijat_sopimusjaksot
DROP TABLE sa.temp_amm_eka_lasna_jakso
DROP TABLE sa.temp_amm_naytto_opisk
DROP TABLE sa.temp_amm_aiempi_oikeus_sama_jarj

GO
