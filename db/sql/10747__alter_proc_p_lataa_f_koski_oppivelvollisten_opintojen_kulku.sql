USE [ANTERO]
GO

/******  Object:  StoredProcedure [dw].[p_lataa_f_koski_oppivelvollisten_opintojen_kulku]    Script Date: 15.4.2025 12.53.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_koski_oppivelvollisten_opintojen_kulku] AS

-- Parametrien alustus

-- Aloitetun koulutuksen alkamispäivämäärän alaraja
DECLARE @alkuPvm date = '2021-07-01'
DECLARE @loppuPvm date = '2021-12-31'
-- Viimeinen ajanhetki, jolta aloittaneiden koulutustietoja haetaan
DECLARE @loppuPvmFinal date = EOMONTH(DATEADD(MONTH, -1, GETDATE()))
-- Parametri määrittää tarkastelujaksojen maksimimäärän (5 vuotta)
DECLARE @tarkastelujaksot float = 11
-- Parametriin tallenetaan tarkastelujaksojen todellinen maksimi
DECLARE @maxjaksot int
-- Parametriin tallennetaan tarkastelujaksojen lopullinen määrä
DECLARE @jaksot int

TRUNCATE TABLE dw.f_koski_oppivelvollisten_opintojen_kulku

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset_opintojen_kulku]

SELECT * INTO [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset_opintojen_kulku] 
FROM (
	SELECT 
		 h.[master_oid]
		,[syntymaaika]
		,[aidinkieli]
		,[kansalaisuus] = LEFT([kansalaisuus], 3)
		,[sukupuoli]
		,ts.vahvistus_paiva as tutkinto_suoritettu
		,po.oppilaitos_oid as perusopetuksen_oppilaitos_oid
		,po.vahvistus_paiva as perusopetus_suoritettu
		,poa.alku_pvm as perusopetus_alkanut
		,ov.alkuPvm as ov_alkuPvm
		,ov.loppuPvm as ov_loppuPvm
	-- käytetään esi_ja_perusopetus-taulua, jotta saadaan myös heinäkuu 2021 mukaan
	FROM Koski_SA.sa.sa_oppivelvolliset_esi_ja_perusopetus ov 
	LEFT JOIN [Koski_SA].[sa].[sa_koski_henkilo] h on ov.oppija_oid = h.oppija_oid
	-- Toisen asteen tutkinto suoritettu
	LEFT JOIN Koski_SA.sa.toisen_asteen_tutkinnot ts on ts.master_oid = h.master_oid and ts.rnk = 1
	-- Perusopetus suoritettu
	LEFT JOIN (
		SELECT DISTINCT 
			oo.master_oid, 
			oo.oppilaitos_oid, 
			oo.opiskeluoikeus_oid,
			vahvistus_paiva_min = MIN(ps.vahvistus_paiva) OVER(PARTITION BY oo.master_oid),
			ps.vahvistus_paiva
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		WHERE ps.vahvistus_paiva is not null 
		and (
			ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara')
			OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') 
			OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4')
		)
	) po on po.master_oid = h.master_oid AND po.vahvistus_paiva = po.vahvistus_paiva_min
	-- Perusopetus alkanut
	LEFT JOIN (
		SELECT 
			oo.master_oid, 
			MIN(CASE WHEN oo.koulutusmuoto in ('internationalschool', 'europeanschoolofhelsinki') THEN ps.suorituksen_alkamispaiva ELSE ooa.alku END) as alku_pvm
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ooa.tila in ('lasna', 'loma')
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		WHERE ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara', 'internationalschoolmypvuosiluokka', 'internationalschoolpypvuosiluokka', 'europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') 
		and ps.koulutusmoduuli_koodiarvo != 'explorer'
		GROUP BY oo.master_oid
	) poa on poa.master_oid = h.master_oid
	WHERE h.turvakielto = 0 and ov.loppuPvm >= '2021-07-01' 
) e

WHILE @loppuPvm <= GETDATE()

BEGIN
	
	-- Mahdolliset tarkastelujaksot koko kohortille pyöristettynä alaspäin lähimpään kokonaislukuun. 
	SET @maxjaksot = FLOOR(DATEDIFF(DAY, @loppuPvm, @loppuPvmFinal) / 365.25 * 2) + 1

	-- Jos mahdollisia tarkastelujaksoja on yhtä paljon tai enemmän mitä @tarkastelujaksot parametriin on määritetty, käytetään @tarkastelujaksot parametrin arvoa
	IF @maxjaksot >= @tarkastelujaksot
		SET @jaksot = @tarkastelujaksot;
	-- Jos mahdollisia tarkastelujaksoja on vähemmän mitä @tarkastelujaksot parametriin on määritetty, käytetään @maxjaksot parametrin arvoa
	ELSE
		SET @jaksot = @maxjaksot;

	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset
	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku
	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa

	SELECT * INTO Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset 
	FROM (
		SELECT DISTINCT er.* 
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset_opintojen_kulku] er
		INNER JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.master_oid = er.master_oid
		INNER JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= @loppuPvm  and ooa.loppu >= @alkuPvm
		WHERE YEAR(@loppuPvm) - YEAR(er.syntymaaika) BETWEEN 16 and 18
	) f

	SELECT * INTO Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa 
	FROM (
		SELECT DISTINCT
			r.master_oid, kh.muutto_pvm, kh.poismuutto_pvm, 1 as kotikunta_mannersuomessa
		FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset r
		LEFT JOIN Koski_SA.sa.sa_koski_kotikuntahistoria kh on kh.master_oid = r.master_oid
		LEFT JOIN ANTERO.dw.d_alueluokitus d on d.kunta_koodi = kh.kotikunta
		WHERE d.mannersuomessa = 1
	) f

	SELECT DISTINCT
		f.master_oid,
		f.opiskeluoikeus_oid,
		f.oppivelvollisen_toiminta,
		@alkuPvm as alku,
		@loppuPvm as loppu,
		f.alkamispaiva,
		f.koulutusmoduuli_koodiarvo,
		f.suorituksen_tyyppi,
		f.koulutusmuoto,
		f.suorittanut_perusopetuksen,
		f.pidennetty_oppivelvollisuus,
		f.perusopetuksen_oppimaaran_yksilollistaminen,
		f.erityisopetus
	INTO Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku
	FROM (
		SELECT DISTINCT 
			f.master_oid,
			f.opiskeluoikeus_oid,
			f.koulutusmuoto,
			f.alkamispaiva,
			f.koulutusmoduuli_koodiarvo,
			f.suorituksen_tyyppi,
			f.suorittanut_perusopetuksen,
			f.pidennetty_oppivelvollisuus,
			perusopetuksen_oppimaaran_yksilollistaminen =
				CASE
					WHEN pk.opiskelee_toiminta_alueittain = 1 and f.alkamispaiva >= pk.vahvistus_paiva THEN 1
					WHEN pk.oppiaineita_yksilollistetty_lkm >= 10 and f.alkamispaiva >= pk.vahvistus_paiva THEN 2
					WHEN pk.oppiaineita_yksilollistetty_lkm >= 5 and f.alkamispaiva >= pk.vahvistus_paiva THEN 3
					WHEN pk.oppiaineita_yksilollistetty_lkm >= 1 and f.alkamispaiva >= pk.vahvistus_paiva THEN 4
					WHEN pk.oppiaineita_yksilollistetty_lkm = 0 and pk.keskiarvo is not null and f.alkamispaiva >= pk.vahvistus_paiva THEN 5
					WHEN f.alkamispaiva < pk.vahvistus_paiva or pk.oppija_oid is null THEN -1
					ELSE 6
				END,
			eo.erityisopetus,
			oppivelvollisen_toiminta,
			oppivelvollisen_toiminta_min = MIN(f.oppivelvollisen_toiminta) OVER (PARTITION BY f.master_oid),
			ranki = 
				RANK() OVER (
					PARTITION BY f.master_oid, f.oppivelvollisen_toiminta 
					ORDER BY 
						CASE
							WHEN f.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN 2 
							ELSE 1
						END,
						f.alkamispaiva,  
						f.opiskeluoikeus_oid
				),
			ranki_st = 
				RANK() OVER (
					PARTITION BY f.master_oid, f.opiskeluoikeus_oid 
					ORDER BY 
						coalesce(f.oppivelvollisen_toiminta,99), 
						coalesce(f.suoritus_alku, cast('9999-12-31' as date)),
						CASE 
							WHEN f.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaaranalkuvaihe', 'diavalmistavavaihe', 'preiboppimaara', 'internationalschoolmypvuosiluokka') THEN 2 
							ELSE 1 
						END
				)

		FROM (
			SELECT DISTINCT
				ooa.opiskeluoikeus_oid,
				ov2.pidennetty_oppivelvollisuus,
				CASE 
					WHEN aps.opiskeluoikeus_oid is not null THEN aps.tutkinto_koodi
					WHEN lps.tavoitetutkinto = 'Deutsche Internationale Abitur; Reifeprüfung' THEN '301103'
					WHEN lps.tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN '301102'
					WHEN lps.tavoitetutkinto = 'Ylioppilastutkinto' THEN '301101'
					WHEN lps.tavoitetutkinto = 'EB-tutkinto (European Baccalaureate)' THEN '301104'
					WHEN lps.tavoitetutkinto = 'Ei tutkintotavoitetta' THEN '-1'
					ELSE ps.koulutusmoduuli_koodiarvo
				END AS koulutusmoduuli_koodiarvo,
				ps.suorituksen_tyyppi,
				oo.koulutusmuoto,
				ov.[master_oid],
				aika.alku as alkamispaiva,
				coalesce(aps.suorituksen_alkamispaiva,lps.alku, ps.suorituksen_alkamispaiva) as suoritus_alku,
				CASE
					WHEN aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
					WHEN lps.tavoitetutkinto is not null and lps.tavoitetutkinto != 'Ei tutkintotavoitetta' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
					WHEN ps.suorituksen_tyyppi <> 'ammatillinentutkintoosittainen' and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 4
					WHEN ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 5
				END AS oppivelvollisen_toiminta,
				CASE WHEN ov.perusopetus_suoritettu is null or ov.perusopetus_suoritettu > aika.alku THEN 0 ELSE 1 END as suorittanut_perusopetuksen
			FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset ov
			INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.master_oid = ov.master_oid
			OUTER APPLY (
				SELECT 
					MIN(
						case 
							when lps0.suorituksen_tyyppi IN ('internationalschooldiplomavuosiluokka', 'internationalschoolmypvuosiluokka') then lps0.alku
							when ps0.suorituksen_tyyppi IN ('europeanschoolofhelsinkivuosiluokkasecondaryupper', 'ebtutkinto') THEN ps0.suorituksen_alkamispaiva
							else o.alku 
						end
					) as alku
				FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] o
				LEFT JOIN Koski_SA.sa.sa_lukio_paatason_suoritus lps0 on lps0.opiskeluoikeus_oid = o.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps0 on ps0.opiskeluoikeus_oid = o.opiskeluoikeus_oid
				WHERE o.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and o.tila in ('lasna', 'loma')
			) aika
			LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa 
				on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= @loppuPvm and ooa.loppu >= @alkuPvm and ooa.loppu > aika.alku
			LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
			LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			INNER JOIN Koski_SA.sa.sa_oppivelvolliset ov2 on ov2.oppija_oid = ov.master_oid and aika.alku BETWEEN LEAST(ov2.alkuPvm, @alkuPvm) and ov2.loppuPvm
			WHERE oo.sisaltyy_opiskeluoikeuteen_oid is null
			and ooa.tila != 'katsotaaneronneeksi' 
			and aika.alku BETWEEN @alkuPvm and @loppuPvm 
			and aika.alku BETWEEN ov.ov_alkuPvm and ov.ov_loppuPvm
			and (
				oo.koulutusmuoto not in ('aikuistenperusopetus', 'perusopetus', 'internationalschool', 'europeanschoolofhelsinki') 
				or (oo.koulutusmuoto in ('internationalschool', 'europeanschoolofhelsinki') and lps.opiskeluoikeus_oid is not null)
			)
			AND (
				ooa.opiskeluoikeus_oid is null 
				OR NOT EXISTS (
					SELECT 1 
					FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
					WHERE oo.koulutusmuoto != 'tuva'
					AND tuvat.master_oid = oo.master_oid
					AND aika.alku between tuvat.alku and tuvat.loppu
				)
			)

			UNION ALL

			SELECT DISTINCT
				ooa.opiskeluoikeus_oid,
				ov2.pidennetty_oppivelvollisuus,
				ps.koulutusmoduuli_koodiarvo AS koulutusmoduuli_koodiarvo,
				ps.suorituksen_tyyppi,
				oo.koulutusmuoto,
				ov.master_oid,
				aika.alku as alkamispaiva,
				ps.suorituksen_alkamispaiva as suoritus_alku,
				CASE
					WHEN (
						ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe') 
						or (
							ps.suorituksen_tyyppi in ('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') 
							and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9')
						) 
						or (
							ps.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') 
							and ps.koulutusmoduuli_koodiarvo <> 'S5'
						)
					) 
					and ooa.tila in ('lasna', 'loma') 
					and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 6
				END AS oppivelvollisen_toiminta,
				CASE WHEN ov.perusopetus_suoritettu is null or ov.perusopetus_suoritettu > aika.alku THEN 0 ELSE 1 END as suorittanut_perusopetuksen
			FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset ov
			INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.master_oid = ov.master_oid
			OUTER APPLY (
				SELECT 
					MIN(
						case 
							when ps0.suorituksen_tyyppi IN ('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka', 'europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ps0.koulutusmoduuli_koodiarvo not in ('explorer', '10', '11', '12', 'S5') then ps0.suorituksen_alkamispaiva
							else o.alku 
						end
					) as alku
				FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] o
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps0 on ps0.opiskeluoikeus_oid = o.opiskeluoikeus_oid
				WHERE o.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and o.tila in ('lasna', 'loma')
			) aika
			LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa 
				on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= @loppuPvm and ooa.loppu >= @alkuPvm and ooa.loppu > aika.alku
			LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
			INNER JOIN Koski_SA.sa.sa_oppivelvolliset ov2 on ov2.oppija_oid = ov.master_oid and aika.alku BETWEEN LEAST(ov2.alkuPvm, @alkuPvm) and ov2.loppuPvm
			WHERE ooa.tila != 'katsotaaneronneeksi' 
			and aika.alku BETWEEN @alkuPvm and @loppuPvm 
			and aika.alku BETWEEN ov.ov_alkuPvm and ov.ov_loppuPvm
			and ov.perusopetus_alkanut = aika.alku 
			and oo.koulutusmuoto in ('aikuistenperusopetus', 'perusopetus', 'internationalschool', 'europeanschoolofhelsinki')
			and (
				ooa.opiskeluoikeus_oid is null
				OR NOT EXISTS (
					SELECT 1 
					FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
					WHERE oo.koulutusmuoto != 'tuva'
					AND tuvat.master_oid = oo.master_oid
					AND aika.alku between tuvat.alku and tuvat.loppu
				)
			)
		) f
		LEFT JOIN Koski_SA.sa.perusopetuksen_paattotodistuksen_keskiarvot pk on pk.oppija_oid = f.master_oid and pk.rnk = 1
		OUTER APPLY (
			SELECT
				erityisopetus =
					MAX(
						CASE				
							WHEN (ooa2.erityinen_tuki = 1 or ooa2.hojks = 1) and ooa2.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps2.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
							WHEN (ooa2.erityinen_tuki = 1 or ooa2.hojks = 1) and ooa2.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps2.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
							WHEN ooa2.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps2.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vaikeasti_vammainen = 0 and ooa2.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
							WHEN ps2.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
							WHEN ps2.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
							WHEN ooa2.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps2.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vaikeasti_vammainen = 0 and ooa2.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
							WHEN ps2.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
							WHEN ps2.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
							WHEN ooa2.erityinen_tuki = 0 THEN 1 --Ei erityisopiskelija
							ELSE -1
						END
					)
			FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa2
			LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps2 on ooa2.opiskeluoikeus_oid = ps2.opiskeluoikeus_oid
			WHERE ooa2.opiskeluoikeus_oid = f.opiskeluoikeus_oid
		) eo
	) f 
	WHERE oppivelvollisen_toiminta = oppivelvollisen_toiminta_min and ranki = 1 and oppivelvollisen_toiminta < 7 and ranki_st = 1

	-- Temp-taulun pudotus
	DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_tarkastelujaksot 

	-- Pudotettuun temp-tauluun tarkastelupäivämäärät opiskeluoikeuksittain
	SELECT
		f.*,
		km.kotikunta_mannersuomessa,
		CASE WHEN ov.oppija_oid is null THEN 1 ELSE 0 END as oppivelvollisuus_paattynyt,
		CASE WHEN kesk.master_oid is null THEN 0 ELSE 1 END as keskeyttanyt_valpas
	INTO Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_tarkastelujaksot 
	FROM (
		SELECT 
			ov.master_oid,
			ov.opiskeluoikeus_oid,
			ov.alkamispaiva,
			ov.koulutusmuoto,
			ov.suorituksen_tyyppi,
			ov.oppivelvollisen_toiminta,
			DATEADD(MONTH, jaksot.n * 6, ov.alkamispaiva) AS tarkastelu_pvm,
			jaksot.n * 0.5 AS aika_vuosina
		FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku ov
		-- Tarkastelujaksojen generointi
		CROSS JOIN (
			SELECT TOP (@jaksot) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n
			-- Taululla ei ole merkitystä. Siinä on vain oltava @jaksot määrä rivejä 
			FROM ANTERO.dw.d_organisaatioluokitus
		) jaksot
		UNION ALL
		-- Edellisen kuukauden viimeinen päivä
		SELECT DISTINCT
			ov.master_oid,
			ov.opiskeluoikeus_oid,
			ov.alkamispaiva,
			ov.koulutusmuoto,
			ov.suorituksen_tyyppi,
			ov.oppivelvollisen_toiminta,
			@loppuPvmFinal AS tarkastelu_pvm,
			NULL as aika_vuosina
		FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku ov
	) f
	LEFT JOIN Koski_SA.sa.sa_oppivelvolliset_esi_ja_perusopetus ov on ov.oppija_oid = f.master_oid and f.tarkastelu_pvm between ov.alkuPvm and ov.loppuPvm
	LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa km on km.master_oid = f.master_oid and f.tarkastelu_pvm between km.muutto_pvm and km.poismuutto_pvm
	LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytys] kesk on kesk.master_oid = f.master_oid and kesk.peruttu = 0 and f.tarkastelu_pvm between kesk.alku and coalesce(kesk.loppu, '9999-01-01')
		
	
	-- Temp-taulun pudotus
	DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_opiskelutiedot
	
	/* 
	Ladataan pudotettuun temp-tauluun kaikkien kohorttiin kuuluvien lasna- ja lomajaksot alkamispäivästä viimeiseen 
	tarkastelupäivään (+ edellisen kuukauden loppu). Valmistumiset alkamispäivän ja edellisen kuukauden lopun väliltä.
	*/
	SELECT DISTINCT
		ov.opiskeluoikeus_oid as opiskeluoikeus_oid_alkuperainen,
		ov.master_oid,
		ooa.opiskeluoikeus_oid,
		coalesce(ps.suorituksen_tyyppi,'ylioppilastutkinto') as suorituksen_tyyppi,
		oo.koulutusmuoto,
		oo.oppivelvollisuuden_suorittamiseen_kelpaava,
		coalesce(ooa.alku, ooy.alku) as alku,
		coalesce(ooa.loppu, ooy.alku) as loppu,
		CASE 
			coalesce(ooa.tila,ooy.tila_koodiarvo)
			WHEN 'valmistunut' THEN 1
			WHEN 'valiaikaisestikeskeytynyt' THEN 3
			ELSE 2
		END as tila,
		CASE
			WHEN oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and ps.suorituksen_tyyppi in ('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9') THEN 6
			WHEN oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and ps.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ps.koulutusmoduuli_koodiarvo <> 'S5' THEN 6
			WHEN oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and aps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
			WHEN oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' or ooy.oppija_oid is not null THEN 2
			WHEN oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and ps.suorituksen_tyyppi in ('telma','valma','luva','tuvakoulutuksensuoritus','perusopetuksenlisaopetus', 'perusopetukseenvalmistavaopetus','vstmaahanmuuttajienkotoutumiskoulutus','vstoppivelvollisillesuunnattukoulutus') THEN 3
			WHEN oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and aps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN 4
			WHEN oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'nuortenperusopetuksenoppiaineenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe') THEN 5
			ELSE 7
		END as koulutus,
		ps.suorituksen_alkamispaiva,
		ps.vahvistus_paiva as suorituksen_vahvistuspaiva
	INTO Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_opiskelutiedot
	FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku ov
	INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.master_oid = ov.master_oid and sisaltyy_opiskeluoikeuteen_oid is null
	-- Ylioppilastutkinnon suoritukset aloituspäivän ja edellisen kuukauden lopun väliltä.
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_ytr ooy on oo.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid and ooy.alku BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and ooy.tila_koodiarvo = 'valmistunut'
	-- Muut valmistumiset aloituspäivän ja edellisen kuukauden lopun väliltä.
	LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and 
		(
			(ov.alkamispaiva <= ooa.loppu and DATEADD(month,6*(@jaksot-1),ov.alkamispaiva) >= ooa.alku and ooa.tila in ('lasna', 'loma', 'valiaikaisestikeskeytynyt')) OR 
			(@loppuPvmFinal BETWEEN ooa.alku and ooa.loppu and ooa.tila in ('lasna', 'loma', 'valiaikaisestikeskeytynyt')) OR
			-- Ei lukion oppimäärän suorituksia eikä alkamispäivänä suoritettuja tutkintoja. 
			(ooa.alku BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and ooa.tila = 'valmistunut' and oo.koulutusmuoto <> 'lukiokoulutus')
		)
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_lukio_paatason_suoritus lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus aps on aps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE 
	-- Lasna- ja lomajaksot sekä valmistumiset ja väliaikaiset keskeyttämiset.
	coalesce(ooa.tila, ooy.tila_koodiarvo) in ('lasna', 'loma','valmistunut','valiaikaisestikeskeytynyt')

	INSERT INTO Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_opiskelutiedot
	SELECT DISTINCT
		ov.opiskeluoikeus_oid as opiskeluoikeus_oid_alkuperainen,
		ov.master_oid,
		ps.opiskeluoikeus_oid,
		ps.suorituksen_tyyppi,
		oo.koulutusmuoto,
		oo.oppivelvollisuuden_suorittamiseen_kelpaava,
		ps.vahvistus_paiva as alku,
		ps.vahvistus_paiva as loppu,
		1 as tila,
		6 as koulutus,
		ps.suorituksen_alkamispaiva,
		ps.vahvistus_paiva as suorituksen_vahvistuspaiva
	FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku ov
	INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.master_oid = ov.master_oid and sisaltyy_opiskeluoikeuteen_oid is null
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE 
	ps.suorituksen_tyyppi in ('internationalschoolmypvuosiluokka','europeanschoolofhelsinkivuosiluokkasecondarylower') and 
	ps.koulutusmoduuli_koodiarvo in ('9', 'S4') AND ps.vahvistus_paiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and
	oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 

	CREATE NONCLUSTERED INDEX [NC_idx__temp_opintojen_kulku_oppivelvolliset_opiskelutiedot]
	ON [Koski_SA].[sa].[temp_opintojen_kulku_oppivelvolliset_opiskelutiedot] ([opiskeluoikeus_oid_alkuperainen])
	INCLUDE ([suorituksen_tyyppi],[oppivelvollisuuden_suorittamiseen_kelpaava],[alku],[loppu],[tila],[koulutus],[suorituksen_alkamispaiva],[suorituksen_vahvistuspaiva])

	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne

	SELECT
		master_oid,
		tarkastelu_pvm,
		valm_alk_koko_tutk_joht_koul,
		valm_muu_koko_tutk_joht_koul,
		jatk_alk_koko_tutk_joht_koul,
		jatk_muu_koko_tutk_joht_koul,
		valm_alk_valm_koul,
		valm_muu_valm_koul,
		jatk_alk_valm_koul,
		jatk_muu_valm_koul,
		valm_amm_tutk_osa_koul,
		jatk_amm_tutk_osa_koul,
		valm_per_op_koul,
		jatk_per_op_koul,
		koul_jok_ei_kelp_ov_suor,
		keskeyttanyt,
		CASE
			WHEN jatk_alk_koko_tutk_joht_koul + jatk_muu_koko_tutk_joht_koul + jatk_alk_valm_koul + jatk_muu_valm_koul + jatk_amm_tutk_osa_koul + jatk_per_op_koul + keskeyttanyt  > 0 THEN 0
			ELSE keskeyttanyt_valpas
		END as keskeyttanyt_valpas,
		CASE 
			WHEN jatk_alk_koko_tutk_joht_koul + jatk_muu_koko_tutk_joht_koul + jatk_alk_valm_koul + jatk_muu_valm_koul + jatk_amm_tutk_osa_koul + jatk_per_op_koul + keskeyttanyt + keskeyttanyt_valpas > 0 THEN 0
			ELSE 1
		END as ei_koulutuksessa
	INTO Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne 
	FROM (
		SELECT 
			f.master_oid,
			f.tarkastelu_pvm,
			MAX(f.valm_alk_koko_tutk_joht_koul) as valm_alk_koko_tutk_joht_koul,
			MAX(f.valm_muu_koko_tutk_joht_koul) as valm_muu_koko_tutk_joht_koul,
			MAX(f.jatk_alk_koko_tutk_joht_koul) as jatk_alk_koko_tutk_joht_koul,
			MAX(f.jatk_muu_koko_tutk_joht_koul) as jatk_muu_koko_tutk_joht_koul,
			MAX(f.valm_alk_valm_koul) as valm_alk_valm_koul,
			MAX(f.valm_muu_valm_koul) as valm_muu_valm_koul,
			MAX(f.jatk_alk_valm_koul) as jatk_alk_valm_koul,
			MAX(f.jatk_muu_valm_koul) as jatk_muu_valm_koul,
			MAX(f.valm_amm_tutk_osa_koul) as valm_amm_tutk_osa_koul,
			MAX(f.jatk_amm_tutk_osa_koul) as jatk_amm_tutk_osa_koul,
			MAX(f.valm_per_op_koul) as valm_per_op_koul,
			MAX(f.jatk_per_op_koul) as jatk_per_op_koul,
			MAX(f.koul_jok_ei_kelp_ov_suor) as koul_jok_ei_kelp_ov_suor,
			MAX(keskeyttanyt) as keskeyttanyt,
			MAX(keskeyttanyt_valpas) as keskeyttanyt_valpas
		FROM (
			SELECT
				ov.master_oid,
				ov.tarkastelu_pvm,
				CASE 
					WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ot.koulutus = 2 and ot.tila = 1 THEN 1
					WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi = 'ammatillinentutkinto' and ot.koulutus = 1 and ot.tila = 1 THEN 1
					ELSE 0
				END as valm_alk_koko_tutk_joht_koul,
				CASE 
					WHEN (ov.suorituksen_tyyppi = 'ammatillinentutkinto' or ov.oppivelvollisen_toiminta <> 3) and ot.koulutus = 2 and ot.tila = 1 THEN 1
					WHEN ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ot.koulutus = 1 and ot.tila = 1 THEN 1
					ELSE 0
				END as valm_muu_koko_tutk_joht_koul,
				CASE 
					WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ot.koulutus = 2 and ot.tila = 2 THEN 1
					WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi = 'ammatillinentutkinto' and ot.koulutus = 1 and ot.tila = 2 THEN 1
					ELSE 0
				END as jatk_alk_koko_tutk_joht_koul,
				CASE 
					WHEN (ov.suorituksen_tyyppi = 'ammatillinentutkinto' or ov.oppivelvollisen_toiminta <> 3) and ot.koulutus = 2 and ot.tila = 2 THEN 1
					WHEN ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ot.koulutus = 1 and ot.tila = 2 THEN 1
					ELSE 0
				END as jatk_muu_koko_tutk_joht_koul,
				CASE 
					WHEN ot.koulutus = 3 and ov.suorituksen_tyyppi = ot.suorituksen_tyyppi and ot.tila = 1 THEN 1 
					ELSE 0
				END as valm_alk_valm_koul,
				CASE 
					WHEN ot.koulutus = 3 and ot.tila = 1 THEN 1
					ELSE 0
				END as valm_muu_valm_koul,
				CASE 
					WHEN ot.koulutus = 3 and ov.suorituksen_tyyppi = ot.suorituksen_tyyppi and ot.tila = 2 THEN 1 
					ELSE 0
				END as jatk_alk_valm_koul,
				CASE 
					WHEN ot.koulutus = 3 and ot.tila = 2 THEN 1
					ELSE 0
				END as jatk_muu_valm_koul,
				CASE 
					WHEN ot.koulutus = 4 and ot.tila = 1 THEN 1 
					ELSE 0
				END as valm_amm_tutk_osa_koul,
				CASE 
					WHEN ot.koulutus = 4 and ot.tila = 2 THEN 1
					ELSE 0
				END as jatk_amm_tutk_osa_koul,
				CASE 
					WHEN ot.tila = 1 and ot.koulutus in (5,6) THEN 1
					ELSE 0
				END as valm_per_op_koul,
				CASE 
					WHEN ot.tila = 2 and (ot.koulutus = 5 or (ot.koulutus = 6 and ov.tarkastelu_pvm BETWEEN ot.suorituksen_alkamispaiva and ot.suorituksen_vahvistuspaiva)) THEN 1
					ELSE 0
				END as jatk_per_op_koul,
				CASE 
					WHEN ot.tila = 2 and ot.oppivelvollisuuden_suorittamiseen_kelpaava = 0 THEN 1
					ELSE 0
				END as koul_jok_ei_kelp_ov_suor,
				CASE
					WHEN ot.tila = 3 and ot.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
					ELSE 0
				END as keskeyttanyt,
				coalesce(keskeyttanyt_valpas,0) as keskeyttanyt_valpas
			FROM Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_tarkastelujaksot ov
			LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_opiskelutiedot ot on ov.opiskeluoikeus_oid = ot.opiskeluoikeus_oid_alkuperainen and (ov.tarkastelu_pvm BETWEEN ot.alku and ot.loppu or (ot.tila = 1 and ot.alku <= ov.tarkastelu_pvm))
			WHERE 
			NOT EXISTS (
				SELECT 1 
				FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
				WHERE ot.koulutusmuoto != 'tuva'
				AND ot.tila in (2,3)
				AND tuvat.master_oid = ov.master_oid
				AND ov.tarkastelu_pvm between tuvat.alku and tuvat.loppu
			)
		) f
		GROUP BY f.master_oid, tarkastelu_pvm
	) f
	
	INSERT INTO dw.f_koski_oppivelvollisten_opintojen_kulku
	SELECT 
		master_oid,
		alku,
		loppu,
		opiskeluoikeus_alkuperainen,
		opiskeluoikeus_oid,
		tilanne,
		tilanne_prio,
		aika_vuosina,
		suorituksen_tyyppi_alkuperainen,
		CASE WHEN tilanne_prio = 16 THEN NULL ELSE suorituksen_tyyppi END as suorituksen_tyyppi,
		koulutusmuoto_alkuperainen,
		CASE WHEN tilanne_prio = 16 THEN NULL ELSE koulutusmuoto END as koulutusmuoto,
		aloitettu_koulutus,
		d_sukupuoli_id,
		d_maatjavaltiot2_kansalaisuus_id,
		d_aidinkieli_id,
		d_ika_id,
		d_kytkin_suorittanut_perusopetuksen_id,
		d_kytkin_oppivelvollisuus_paattynyt_id,
		d_pidennetty_oppivelvollisuus_id,
		d_perusopetuksen_oppimaaran_yksilollistaminen_id,
		d_kytkin_kotikunta_mannersuomessa_id,
		d_erityisopetus_aloitettu_koulutus_id,
		d_kytkin_valm_alk_koko_tutk_joht_koul_id,
		d_kytkin_valm_muu_koko_tutk_joht_koul_id,
		d_kytkin_jatk_alk_koko_tutk_joht_koul_id,
		d_kytkin_jatk_muu_koko_tutk_joht_koul_id,
		d_kytkin_valm_alk_valm_koul_id,
		d_kytkin_valm_muu_valm_koul_id,
		d_kytkin_jatk_alk_valm_koul_id,
		d_kytkin_jatk_muu_valm_koul_id,
		d_kytkin_valm_amm_tutk_osa_koul_id,
		d_kytkin_jatk_amm_tutk_osa_koul_id,
		d_kytkin_valm_per_op_koul_id,
		d_kytkin_jatk_per_op_koul_id,
		d_kytkin_koul_jok_ei_kelp_ov_suor_id,
		d_kytkin_ei_koul_id,
		d_kytkin_kesk_ov_suor_val_id,
		d_kytkin_kesk_ov_suor_val_valpas_id,
		GETDATE() as loadtime,
		'ETL: p_lataa_f_koski_oppivelvollisten_opintojen_kulku' as source,
		SUSER_SNAME() as username

	FROM (
		SELECT
			s.master_oid,
			s.alku,
			s.loppu,
			s.opiskeluoikeus_alkuperainen,
			s.opiskeluoikeus_oid,
			s.tilanne,
			tilanne_prio = MIN(s.tilanne) OVER(PARTITION BY s.master_oid, s.aika_vuosina),
			s.aika_vuosina,
			s.suorituksen_tyyppi_alkuperainen,
			s.suorituksen_tyyppi,
			s.koulutusmuoto_alkuperainen,
			s.koulutusmuoto,
			s.aloitettu_koulutus,
			s.d_sukupuoli_id,
			s.d_maatjavaltiot2_kansalaisuus_id,
			s.d_aidinkieli_id,
			s.d_ika_id,
			s.d_kytkin_suorittanut_perusopetuksen_id,
			s.d_kytkin_oppivelvollisuus_paattynyt_id,
			s.d_pidennetty_oppivelvollisuus_id,
			s.d_perusopetuksen_oppimaaran_yksilollistaminen_id,
			s.d_erityisopetus_aloitettu_koulutus_id,
			s.d_kytkin_valm_alk_koko_tutk_joht_koul_id,
			s.d_kytkin_valm_muu_koko_tutk_joht_koul_id,
			s.d_kytkin_jatk_alk_koko_tutk_joht_koul_id,
			s.d_kytkin_jatk_muu_koko_tutk_joht_koul_id,
			s.d_kytkin_valm_alk_valm_koul_id,
			s.d_kytkin_valm_muu_valm_koul_id,
			s.d_kytkin_jatk_alk_valm_koul_id,
			s.d_kytkin_jatk_muu_valm_koul_id,
			s.d_kytkin_valm_amm_tutk_osa_koul_id,
			s.d_kytkin_jatk_amm_tutk_osa_koul_id,
			s.d_kytkin_valm_per_op_koul_id,
			s.d_kytkin_jatk_per_op_koul_id,
			s.d_kytkin_koul_jok_ei_kelp_ov_suor_id,
			s.d_kytkin_ei_koul_id,
			s.d_kytkin_kesk_ov_suor_val_id,
			s.d_kytkin_kesk_ov_suor_val_valpas_id,
			s.d_kytkin_kotikunta_mannersuomessa_id,
			ranki_st = 
				RANK() OVER (
					PARTITION BY s.master_oid, s.opiskeluoikeus_oid, s.tilanne, s.aika_vuosina
					ORDER BY 
						CASE 
							WHEN s.suorituksen_tyyppi_alkuperainen = s.suorituksen_tyyppi THEN 1 
							ELSE 2 
						END, 
						CASE
							WHEN s.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaaranalkuvaihe', 'diavalmistavavaihe', 'preiboppimaara', 'internationalschoolmypvuosiluokka', 'europeanschoolofhelsinkivuosiluokkaprimary') THEN 2 
							ELSE 1 
						END, 
						s.suorituksen_tyyppi
				)

		FROM (
			SELECT DISTINCT
				s1.master_oid,
				s1.alku,
				s1.loppu,
				CASE 
					WHEN (s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi = 'ammatillinentutkinto') or s1.oppivelvollisen_toiminta = 5 THEN 1
					WHEN s1.oppivelvollisen_toiminta = 3 THEN 2
					WHEN s1.oppivelvollisen_toiminta = 4 THEN 3
					WHEN s1.oppivelvollisen_toiminta = 6 THEN 4
				END as aloitettu_koulutus,
				s1.opiskeluoikeus_oid as opiskeluoikeus_alkuperainen,
				s2.opiskeluoikeus_oid,
				CASE
					-- Suorittanut tutkinnon alkuperäisellä sektorilla (ammatillinen/lukio)
					WHEN s2.tila = 1 and s2.koulutus = 1 and s1.suorituksen_tyyppi = 'ammatillinentutkinto' and s1.oppivelvollisen_toiminta = 3 THEN 1
					WHEN s2.tila = 1 and s2.koulutus = 2 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and s1.oppivelvollisen_toiminta = 3 THEN 1
					-- Suorittanut tutkinnon toisella sektorilla
					WHEN s2.tila = 1 and s2.koulutus in (1,2) THEN 2
					-- Jatkaa alkuperäisellä sektorilla (koko tutkintoon johtava koulutus)
					WHEN s2.tila = 2 and s2.koulutus = 1 and s1.suorituksen_tyyppi = 'ammatillinentutkinto' and s1.oppivelvollisen_toiminta = 3 THEN 3
					WHEN s2.tila = 2 and s2.koulutus = 2 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and s1.oppivelvollisen_toiminta = 3 THEN 3
					-- Jatkaa toisella sektorilla (koko tutkintoon johtava koulutus)
					WHEN s2.tila = 2 and s2.koulutus in (1,2) THEN 4
					-- Valmistunut alkuperäisestä valmentavasta koulutuksesta
					WHEN s2.tila = 1 and s2.koulutus = 3 and s2.suorituksen_tyyppi = s1.suorituksen_tyyppi THEN 5
					-- Valmistunut toisesta valmentavasta koulutuksesta
					WHEN s2.tila = 1 and s2.koulutus = 3 THEN 6
					-- Jatkaa alkuperäisessä valmentavassa koulutuksessa
					WHEN s2.tila = 2 and s2.koulutus = 3 and s2.suorituksen_tyyppi = s1.suorituksen_tyyppi THEN 7
					-- Jatkaa toisessa valmentavassa koulutuksessa
					WHEN s2.tila = 2 and s2.koulutus = 3 THEN 8
					-- Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta
					WHEN s2.tila = 1 and s2.koulutus = 4 THEN 9
					-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa
					WHEN s2.tila = 2 and s2.koulutus = 4 THEN 10
					-- Valmistunut perusopetuksen oppimäärän koulutuksesta
					WHEN s2.tila = 1 and s2.koulutus in (5,6)  THEN 11
					-- Jatkaa perusopetuksen oppimäärän koulutuksessa
					WHEN s2.tila = 2 and s2.koulutus in (5,6) THEN 12
					-- Vapautettu
					WHEN v.master_oid is not null THEN 13
					-- Keskeyttänyt ja koulutuksessa
					WHEN s2.tila = 3 and s2.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 14
					-- Keskeyttänyt, ei koulutuksessa
					WHEN s3.keskeyttanyt_valpas = 1 THEN 15
					-- Ei oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa
					ELSE 16
				END as tilanne,
				tj.aika_vuosina,
				s1.suorituksen_tyyppi as suorituksen_tyyppi_alkuperainen,
				s2.suorituksen_tyyppi,
				s1.koulutusmuoto as koulutusmuoto_alkuperainen,
				s2.koulutusmuoto,
				coalesce(d1.id, -1) as d_sukupuoli_id,
				coalesce(d2.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
				coalesce(d3.id, -1) as d_aidinkieli_id,
				coalesce(d4.id, -1) as d_ika_id,
				coalesce(d5.id, -1) as d_kytkin_suorittanut_perusopetuksen_id,
				coalesce(d6.id, -1) as d_kytkin_oppivelvollisuus_paattynyt_id,
				coalesce(d23.id, -1) as d_pidennetty_oppivelvollisuus_id,
				coalesce(d24.id, -1) as d_perusopetuksen_oppimaaran_yksilollistaminen_id,
				coalesce(d26.id, -1) as d_kytkin_kotikunta_mannersuomessa_id,
				coalesce(d25.id, -1) as d_erityisopetus_aloitettu_koulutus_id,

				-- Tilanteet ilman priorisointia
				d7.id as d_kytkin_valm_alk_koko_tutk_joht_koul_id,
				d8.id as d_kytkin_valm_muu_koko_tutk_joht_koul_id,
				d9.id as d_kytkin_jatk_alk_koko_tutk_joht_koul_id,
				d10.id as d_kytkin_jatk_muu_koko_tutk_joht_koul_id,
				d11.id as d_kytkin_valm_alk_valm_koul_id,
				d12.id as d_kytkin_valm_muu_valm_koul_id,
				d13.id as d_kytkin_jatk_alk_valm_koul_id,
				d14.id as d_kytkin_jatk_muu_valm_koul_id,
				d15.id as d_kytkin_valm_amm_tutk_osa_koul_id,
				d16.id as d_kytkin_jatk_amm_tutk_osa_koul_id,
				d17.id as d_kytkin_valm_per_op_koul_id,
				d18.id as d_kytkin_jatk_per_op_koul_id,
				d19.id as d_kytkin_koul_jok_ei_kelp_ov_suor_id,
				d20.id as d_kytkin_ei_koul_id,
				d21.id as d_kytkin_kesk_ov_suor_val_id,
				d22.id as d_kytkin_kesk_ov_suor_val_valpas_id
			-- Aloitushetki
			FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku s1
			-- Tarkasteluajankohta
			LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_tarkastelujaksot tj on tj.opiskeluoikeus_oid = s1.opiskeluoikeus_oid
			LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_opiskelutiedot s2 on s1.opiskeluoikeus_oid = s2.opiskeluoikeus_oid_alkuperainen and (tj.tarkastelu_pvm BETWEEN s2.alku and s2.loppu or (s2.tila = 1 and s2.alku <= tj.tarkastelu_pvm))
			-- Vapautetut
			LEFT JOIN Koski_SA.sa.sa_valpas_oppivelvollisuudesta_vapautetut v on v.master_oid = s1.master_oid and tj.tarkastelu_pvm <= v.vapautettu
			-- Henkilötiedot
			LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = s1.master_oid
			LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = h.sukupuoli
			LEFT JOIN dw.d_maatjavaltiot2 d2 on d2.maatjavaltiot2_koodi = LEFT(h.kansalaisuus, 3)
			LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = h.aidinkieli
			LEFT JOIN dw.d_ika d4 on d4.ika_avain = YEAR(s1.alkamispaiva) - YEAR(h.syntymaaika)
			LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = s1.suorittanut_perusopetuksen
			LEFT JOIN dw.d_pidennetty_oppivelvollisuus d23 on d23.koodi = s1.pidennetty_oppivelvollisuus
			LEFT JOIN dw.d_perusopetuksen_oppimaaran_yksilollistaminen d24 on d24.koodi = s1.perusopetuksen_oppimaaran_yksilollistaminen and d24.luokittelu = 2
			-- Muut
			LEFT JOIN dw.d_erityisopetus d25 on d25.erityisopetus_koodi = s1.erityisopetus
			-- Tilanteet ilman priorisointia
			LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne s3 on s1.master_oid = s3.master_oid and s3.tarkastelu_pvm = tj.tarkastelu_pvm
			LEFT JOIN dw.d_kytkin d6 on d6.kytkin_koodi = tj.oppivelvollisuus_paattynyt
			LEFT JOIN dw.d_kytkin d7 on d7.kytkin_koodi = s3.valm_alk_koko_tutk_joht_koul
			LEFT JOIN dw.d_kytkin d8 on d8.kytkin_koodi = s3.valm_muu_koko_tutk_joht_koul
			LEFT JOIN dw.d_kytkin d9 on d9.kytkin_koodi = s3.jatk_alk_koko_tutk_joht_koul
			LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi = s3.jatk_muu_koko_tutk_joht_koul
			LEFT JOIN dw.d_kytkin d11 on d11.kytkin_koodi = s3.valm_alk_valm_koul
			LEFT JOIN dw.d_kytkin d12 on d12.kytkin_koodi = s3.valm_muu_valm_koul
			LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = s3.jatk_alk_valm_koul
			LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = s3.jatk_muu_valm_koul
			LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = s3.valm_amm_tutk_osa_koul
			LEFT JOIN dw.d_kytkin d16 on d16.kytkin_koodi = s3.jatk_amm_tutk_osa_koul
			LEFT JOIN dw.d_kytkin d17 on d17.kytkin_koodi = s3.valm_per_op_koul
			LEFT JOIN dw.d_kytkin d18 on d18.kytkin_koodi = s3.jatk_per_op_koul
			LEFT JOIN dw.d_kytkin d19 on d19.kytkin_koodi = s3.koul_jok_ei_kelp_ov_suor
			LEFT JOIN dw.d_kytkin d20 on d20.kytkin_koodi = s3.ei_koulutuksessa
			LEFT JOIN dw.d_kytkin d21 on d21.kytkin_koodi = s3.keskeyttanyt
			LEFT JOIN dw.d_kytkin d22 on d22.kytkin_koodi = s3.keskeyttanyt_valpas
			LEFT JOIN dw.d_kytkin d26 on d26.kytkin_koodi = tj.kotikunta_mannersuomessa
			WHERE 
			-- Ei huomioida tuvan aikaisia muita koulutuksia
			NOT EXISTS (
				SELECT 1 
				FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
				WHERE s2.koulutusmuoto != 'tuva' and s2.tila in (2,3)
				AND tuvat.master_oid = s1.master_oid
				AND tj.tarkastelu_pvm between tuvat.alku and tuvat.loppu
			)
		) s 
	) s 
	WHERE s.tilanne = s.tilanne_prio and ranki_st = 1

	SET @alkuPvm = DATEADD(DAY, 1, @loppuPvm)
	SET @loppuPvm = EOMONTH(DATEADD(MONTH, 6, @loppuPvm))

END

DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_tarkastelujaksot 
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvolliset_esirajaukset_opintojen_kulku
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_oppivelvolliset_opiskelutiedot

GO

USE [ANTERO]