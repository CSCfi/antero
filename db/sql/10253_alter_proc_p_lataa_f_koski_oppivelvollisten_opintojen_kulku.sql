USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_oppivelvollisten_opintojen_kulku]    Script Date: 18.10.2024 14:16:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_koski_oppivelvollisten_opintojen_kulku] AS

DECLARE @alkuPvm date = '2021-07-01'
DECLARE @loppuPvm date = '2021-12-31'
DECLARE @loppuPvmFinal date = EOMONTH(DATEADD(MONTH, -1, GETDATE()))
DECLARE @loppuPvmB date
DECLARE @tj int
DECLARE @i float


TRUNCATE TABLE dw.f_koski_oppivelvollisten_opintojen_kulku

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset_opintojen_kulku]

SELECT * INTO [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset_opintojen_kulku] 
FROM (
	SELECT 
		 h.[oppija_oid]
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
	LEFT JOIN Koski_SA.sa.toisen_asteen_tutkinnot ts on ts.oppija_oid = h.oppija_oid and ts.rnk = 1
	-- Perusopetus suoritettu
	LEFT JOIN (
		SELECT DISTINCT 
			oo.oppija_oid, 
			oo.oppilaitos_oid, 
			oo.opiskeluoikeus_oid,
			vahvistus_paiva_min = MIN(ps.vahvistus_paiva) OVER(PARTITION BY oo.oppija_oid),
			ps.vahvistus_paiva
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		WHERE ps.vahvistus_paiva is not null 
		and (
			ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara')
			OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') 
			OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4')
		)
	) po on po.oppija_oid = h.oppija_oid AND po.vahvistus_paiva = po.vahvistus_paiva_min
	-- Perusopetus alkanut
	LEFT JOIN (
		SELECT 
			oo.oppija_oid, 
			MIN(CASE WHEN oo.koulutusmuoto in ('internationalschool', 'europeanschoolofhelsinki') THEN ps.suorituksen_alkamispaiva ELSE ooa.alku END) as alku_pvm
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ooa.tila in ('lasna', 'loma')
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		WHERE ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara', 'internationalschoolmypvuosiluokka', 'internationalschoolpypvuosiluokka', 'europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') 
		and ps.koulutusmoduuli_koodiarvo != 'explorer'
		GROUP BY oo.oppija_oid
	) poa on poa.oppija_oid = h.oppija_oid
	WHERE h.turvakielto = 0 and ov.loppuPvm >= '2021-07-01'
) e


WHILE @loppuPvm <= GETDATE()

BEGIN	

	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset
	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku
	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa

	SELECT * INTO Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset 
	FROM (
		SELECT DISTINCT er.* 
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset_opintojen_kulku] er
		INNER JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.oppija_oid = er.oppija_oid
		INNER JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= @loppuPvm  and ooa.loppu >= @alkuPvm
		WHERE YEAR(@loppuPvm) - YEAR(er.syntymaaika) BETWEEN 16 and 18
	) f

	SELECT * INTO Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa 
	FROM (
		SELECT DISTINCT
			r.oppija_oid, kh.muutto_pvm, kh.poismuutto_pvm, 1 as kotikunta_mannersuomessa
		FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset r
		LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = r.oppija_oid
		LEFT JOIN Koski_SA.sa.sa_koski_kotikuntahistoria kh on kh.master_oid = h.master_oid
		LEFT JOIN ANTERO.dw.d_alueluokitus d on d.kunta_koodi = kh.kotikunta
		WHERE d.mannersuomessa = 1
	) f

	SELECT DISTINCT
		f.oppija_oid,
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
			f.oppija_oid,
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
			oppivelvollisen_toiminta_min = MIN(f.oppivelvollisen_toiminta) OVER (PARTITION BY f.oppija_oid),
			ranki = 
				RANK() OVER (
					PARTITION BY f.oppija_oid, f.oppivelvollisen_toiminta 
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
					PARTITION BY f.oppija_oid, f.opiskeluoikeus_oid 
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
				ov.[oppija_oid],
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
			INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = ov.oppija_oid
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
			INNER JOIN Koski_SA.sa.sa_oppivelvolliset ov2 on ov2.oppija_oid = ov.oppija_oid and aika.alku BETWEEN ov2.alkuPvm and ov2.loppuPvm
			WHERE ooa.tila != 'katsotaaneronneeksi' 
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
					AND tuvat.oppija_oid = oo.oppija_oid
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
				ov.[oppija_oid],
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
			INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = ov.oppija_oid
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
			INNER JOIN Koski_SA.sa.sa_oppivelvolliset ov2 on ov2.oppija_oid = ov.oppija_oid and aika.alku BETWEEN ov2.alkuPvm and ov2.loppuPvm
			WHERE ooa.tila != 'katsotaaneronneeksi' 
			and aika.alku BETWEEN @alkuPvm and @loppuPvm 
			and aika.alku BETWEEN ov.ov_alkuPvm and ov.ov_loppuPvm
			and ov.perusopetus_alkanut = aika.alku 
			and oo.koulutusmuoto in ('aikuistenperusopetus', 'perusopetus', 'internationalschool', 'europeanschoolofhelsinki')
			AND (
				ooa.opiskeluoikeus_oid is null
				OR NOT EXISTS (
					SELECT 1 
					FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
					WHERE oo.koulutusmuoto != 'tuva'
					AND tuvat.oppija_oid = oo.oppija_oid
					AND aika.alku between tuvat.alku and tuvat.loppu
				)
			)
		) f
		LEFT JOIN Koski_SA.sa.perusopetuksen_paattotodistuksen_keskiarvot pk on pk.oppija_oid = f.oppija_oid and pk.rnk = 1
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


	SET @loppuPvmB = @loppuPvm
	SET @tj = 0
	SET @i = 0

	WHILE @loppuPvmB <= @loppuPvmFinal
	
	BEGIN

		DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_B

		SELECT * INTO Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_B 
		FROM (
			SELECT DISTINCT 
				f.oppija_oid,
				f.opiskeluoikeus_oid,
				f.koulutusmuoto,
				f.koulutusmoduuli_koodiarvo,
				f.suorituksen_tyyppi,
				f.oppivelvollisen_toiminta,
				f.oppivelvollisuus_paattynyt,
				f.kotikunta_mannersuomessa,
				oppivelvollisen_toiminta_min = MIN(f.oppivelvollisen_toiminta) OVER (PARTITION BY f.oppija_oid),
				ranki = 
					RANK() OVER (
						PARTITION BY f.oppija_oid, f.oppivelvollisen_toiminta
						ORDER BY
							CASE 
								WHEN f.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN 3
								WHEN f.suorituksen_tyyppi = s.suorituksen_tyyppi THEN 1
								ELSE 2
							END,
							f.alkamispaiva, 
							f.opiskeluoikeus_oid
					)
			
			FROM (
				SELECT DISTINCT
					ooa.opiskeluoikeus_oid,
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
					ov.[oppija_oid],
					oo.alkamispaiva,
					po.perusopetuksen_oppimaara_suoritettu_pvm,
					CASE 
						WHEN po.perusopetuksen_oppimaara_suoritettu_pvm is null or DATEADD(month,@tj,ov.alkamispaiva) < po.perusopetuksen_oppimaara_suoritettu_pvm THEN 0
						ELSE 1
					END as suorittanut_perusopetuksen_oppimaaran,
					CASE
						WHEN aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
						WHEN lps.tavoitetutkinto is not null and lps.tavoitetutkinto != 'Ei tutkintotavoitetta' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
						WHEN ps.suorituksen_tyyppi not in ('ammatillinentutkintoosittainen','europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and oo.koulutusmuoto not in ('perusopetus', 'aikuistenperusopetus')
						and not (ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9'))
						and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 4
						WHEN ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 5
						WHEN ((ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'nuortenperusopetuksenoppiaineenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or 
							 (ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9')) or
							 (ps.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ps.koulutusmoduuli_koodiarvo <> 'S5')) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 6
						WHEN vov.vapautettu is not null THEN 8 
						WHEN (ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1) THEN 9
						WHEN kesk.peruttu = 0 THEN 10
						WHEN ooa.tila in ('lasna', 'loma') THEN 11
						WHEN ooa.tila in ('valmistunut','hyvaksytystisuoritettu') THEN 12
						WHEN ooa.tila in ('katsotaaneronneeksi', 'eronnut') or (ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 0) THEN 13
						WHEN ooa.opiskeluoikeus_oid is null THEN 14
					END AS oppivelvollisen_toiminta,
					CASE
						WHEN kesk.peruttu = 0 and ooa.opiskeluoikeus_oid is null THEN 1
						ELSE 0
					END as keskeyttanyt,
					CASE
						WHEN ov2.oppija_oid is null THEN 1
						ELSE 0
					END as oppivelvollisuus_paattynyt,
					coalesce(khs.kotikunta_mannersuomessa,0) as kotikunta_mannersuomessa
				FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku ov
				LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov2 on ov.oppija_oid = ov2.oppija_oid and DATEADD(month,@tj,ov.alkamispaiva) BETWEEN ov2.alkuPvm AND ov2.loppuPvm 
				INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = ov.oppija_oid
				LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa 
					on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= DATEADD(month,@tj,ov.alkamispaiva) and ooa.loppu >= DATEADD(month,@tj,ov.alkamispaiva)
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid 
				LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa khs on khs.oppija_oid = ov.oppija_oid and DATEADD(month,@tj,ov.alkamispaiva) BETWEEN khs.muutto_pvm and khs.poismuutto_pvm		
				OUTER APPLY (
					SELECT * FROM (
						SELECT 
							k.oppija_oid, 
							coalesce(kh.peruttu, k.peruttu) as peruttu, 
							MAX(coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime))) OVER (PARTITION BY k.oppija_oid) as luotuMax,
							coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime)) as luotu
						FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytys] k
						LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytyshistoria] kh on kh.ov_keskeytys_uuid = k.uuid
						WHERE coalesce(kh.alku, k.alku) <= DATEADD(month,@tj,ov.alkamispaiva) 
						and (coalesce(kh.loppu, k.loppu) > DATEADD(month,@tj,ov.alkamispaiva) or coalesce(kh.loppu, k.loppu) is null) 
						and coalesce(case when cast(left(kh.muutos_tehty,18) as date) = cast(kh.luotu as date) and cast(left(kh.muutos_tehty,18) as date) > kh.alku then kh.alku else cast(left(kh.muutos_tehty,18) as date) end, cast(case when k.luotu > k.alku then k.alku else k.luotu end as date)) <= DATEADD(month,@tj,ov.alkamispaiva)
					) kesk WHERE kesk.oppija_oid = ov.oppija_oid and kesk.luotu = kesk.luotuMax
				) kesk
				LEFT JOIN (
					SELECT
						oo.oppija_oid,
						min(ps.vahvistus_paiva) as perusopetuksen_oppimaara_suoritettu_pvm
					FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
					LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
					WHERE ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara') 
					OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') 
					OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4')
					GROUP BY oo.oppija_oid
				) po on po.oppija_oid = ov.oppija_oid
				LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuudesta_vapautetut] vov on vov.oppija_oid = ov.oppija_oid and cast(vov.mitatoity as date) <> cast('9999-01-01' as date) and vov.vapautettu <= DATEADD(month,@tj,ov.alkamispaiva)
				WHERE ooa.opiskeluoikeus_oid is null
				OR NOT EXISTS (
					SELECT 1 
					FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
					WHERE oo.koulutusmuoto != 'tuva'
					AND tuvat.oppija_oid = oo.oppija_oid
					AND DATEADD(month,@tj,ov.alkamispaiva) between tuvat.alku and tuvat.loppu
				)
			) f
			LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku s on s.oppija_oid = f.oppija_oid
		) f 
		WHERE oppivelvollisen_toiminta = oppivelvollisen_toiminta_min and ranki = 1


		DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne

		SELECT
			oppija_oid,
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
				f.oppija_oid,
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
					ov.oppija_oid,
					CASE 
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and aps.suorituksen_tyyppi = 'ammatillinentutkinto' and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and oo.viimeisin_tila = 'valmistunut' THEN 1
						WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and oo.viimeisin_tila = 'valmistunut' and oo.koulutusmuoto <> 'lukiokoulutus' THEN 1 
						WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ytr.opiskeluoikeus_oid is not null THEN 1
						ELSE 0
					END as valm_alk_koko_tutk_joht_koul,
					CASE 
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and oo.viimeisin_tila = 'valmistunut' and oo.koulutusmuoto <> 'lukiokoulutus'  THEN 1
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and ytr.opiskeluoikeus_oid is not null THEN 1
						WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and aps.suorituksen_tyyppi = 'ammatillinentutkinto' and aps.vahvistus_paiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) THEN 1
						WHEN ov.oppivelvollisen_toiminta <> 3 and ((lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and oo.koulutusmuoto <> 'lukiokoulutus') or aps.suorituksen_tyyppi = 'ammatillinentutkinto') and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and oo.viimeisin_tila = 'valmistunut' THEN 1
						ELSE 0
					END as valm_muu_koko_tutk_joht_koul,
					CASE 
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa_aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila IN ('lasna', 'loma') THEN 1
						WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ooa_lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and ooa.tila IN ('lasna', 'loma') THEN 1
						ELSE 0
					END as jatk_alk_koko_tutk_joht_koul,
					CASE 
						WHEN ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ooa_aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila IN ('lasna', 'loma') THEN 1
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa_lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and ooa.tila IN ('lasna', 'loma') THEN 1
						WHEN ov.oppivelvollisen_toiminta <> 3 and ((ooa_aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila IN ('lasna', 'loma')) or (ooa_lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and ooa.tila IN ('lasna', 'loma'))) THEN 1
						ELSE 0
					END as jatk_muu_koko_tutk_joht_koul,
					CASE 
						WHEN ov.oppivelvollisen_toiminta = 4 and ov.suorituksen_tyyppi = ps.suorituksen_tyyppi and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and oo.viimeisin_tila = 'valmistunut' and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1 
						ELSE 0
					END as valm_alk_valm_koul,
					CASE 
						WHEN (lps.opiskeluoikeus_oid is null or lps.suorituksen_tyyppi in ('luva', 'tuvakoulutuksensuoritus')) and oo.koulutusmuoto not in ('europeanschoolofhelsinki','aikuistenperusopetus','perusopetus','internationalschool') and (aps.suorituksen_tyyppi is null or aps.suorituksen_tyyppi not in ('ammatillinentutkinto','ammatillinentutkintoosittainen')) and ov.suorituksen_tyyppi <> ps.suorituksen_tyyppi and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and oo.viimeisin_tila = 'valmistunut' and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
						ELSE 0
					END as valm_muu_valm_koul,
					CASE 
						WHEN ov.oppivelvollisen_toiminta = 4 and ov.suorituksen_tyyppi = ooa_ps.suorituksen_tyyppi and ooa.tila IN ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1 
						ELSE 0
					END as jatk_alk_valm_koul,
					CASE 
						WHEN (lps.opiskeluoikeus_oid is null or lps.suorituksen_tyyppi in ('luva', 'tuvakoulutuksensuoritus')) and oo.koulutusmuoto not in ('europeanschoolofhelsinki','aikuistenperusopetus','perusopetus','internationalschool') and (aps.suorituksen_tyyppi is null or aps.suorituksen_tyyppi not in ('ammatillinentutkinto','ammatillinentutkintoosittainen')) and ov.suorituksen_tyyppi <> ooa_ps.suorituksen_tyyppi and ooa.tila IN ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
						ELSE 0
					END as jatk_muu_valm_koul,
					CASE 
						WHEN aps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and oo.viimeisin_tila = 'valmistunut' and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1 
						ELSE 0
					END as valm_amm_tutk_osa_koul,
					CASE 
						WHEN ooa_aps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and ooa.tila IN ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
						ELSE 0
					END as jatk_amm_tutk_osa_koul,
					CASE 
						WHEN (oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and oo.viimeisin_tila = 'valmistunut' and ps.suorituksen_tyyppi in('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara')) or (ps.vahvistus_paiva between ov.alkamispaiva and DATEADD(month,@tj,ov.alkamispaiva) and ((ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4'))) THEN 1
						ELSE 0
					END as valm_per_op_koul,
					CASE 
						WHEN ((ooa_ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'nuortenperusopetuksenoppiaineenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or (ooa_ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ooa_ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9') and(ooa_ps.vahvistus_paiva is null or ooa_ps.vahvistus_paiva between ov.alkamispaiva and DATEADD(month,@tj,ov.alkamispaiva))) or (ooa_ps.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ooa_ps.koulutusmoduuli_koodiarvo <> 'S5' and (ooa_ps.vahvistus_paiva is null or ooa_ps.vahvistus_paiva between ov.alkamispaiva and DATEADD(month,@tj,ov.alkamispaiva)))) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and ooa.tila IN ('lasna', 'loma') THEN 1
						ELSE 0
					END as jatk_per_op_koul,
					CASE 
						WHEN ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 0 THEN 1
						ELSE 0
					END as koul_jok_ei_kelp_ov_suor,
					CASE
						WHEN ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
						ELSE 0
					END as keskeyttanyt,
					CASE
						WHEN kesk.peruttu = 0 THEN 1
						ELSE 0
					END as keskeyttanyt_valpas
				FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku ov
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.oppija_oid = ov.oppija_oid
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and DATEADD(month,@tj,ov.alkamispaiva) between ooa.alku and ooa.loppu
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus aps on aps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_lukio_paatason_suoritus lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ooa_ps on ooa_ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ooa_aps on ooa_aps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_lukio_paatason_suoritus ooa_lps on ooa_lps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ytr on ytr.oppija_oid = ov.oppija_oid and ytr.alku between DATEADD(day,1,ov.alkamispaiva) and DATEADD(month,@tj,ov.alkamispaiva) and ytr.tila_koodiarvo = 'valmistunut'
				OUTER APPLY (
					SELECT * FROM (
						SELECT 
							k.oppija_oid, 
							coalesce(kh.peruttu, k.peruttu) as peruttu, 
							MAX(coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime))) OVER (PARTITION BY k.oppija_oid) as luotuMax,
							coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime)) as luotu
						FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytys] k
						LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytyshistoria] kh on kh.ov_keskeytys_uuid = k.uuid
						WHERE coalesce(kh.alku, k.alku) <= DATEADD(month,@tj,ov.alkamispaiva) 
						and (coalesce(kh.loppu, k.loppu) > DATEADD(month,@tj,ov.alkamispaiva) or coalesce(kh.loppu, k.loppu) is null) 
						and coalesce(case when cast(left(kh.muutos_tehty,18) as date) = cast(kh.luotu as date) and cast(left(kh.muutos_tehty,18) as date) > kh.alku then kh.alku else cast(left(kh.muutos_tehty,18) as date) end, cast(case when k.luotu > k.alku then k.alku else k.luotu end as date)) <= DATEADD(month,@tj,ov.alkamispaiva)
					) kesk WHERE kesk.oppija_oid = ov.oppija_oid and kesk.luotu = kesk.luotuMax
				) kesk
				WHERE ooa.opiskeluoikeus_oid is null 
				OR NOT EXISTS (
					SELECT 1 
					FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
					WHERE oo.koulutusmuoto != 'tuva'
					AND tuvat.oppija_oid = oo.oppija_oid
					AND DATEADD(month,@tj,ov.alkamispaiva) between tuvat.alku and tuvat.loppu
				)
			) f
			GROUP BY f.oppija_oid
		) f


		INSERT INTO dw.f_koski_oppivelvollisten_opintojen_kulku
		SELECT 
			oppija_oid,
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
				s.oppija_oid,
				s.alku,
				s.loppu,
				s.opiskeluoikeus_alkuperainen,
				s.opiskeluoikeus_oid,
				s.tilanne,
				tilanne_prio = MIN(s.tilanne) OVER(PARTITION BY s.oppija_oid),
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
						PARTITION BY s.oppija_oid, s.opiskeluoikeus_oid, s.tilanne 
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
					s1.oppija_oid,
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
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' and s1.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
						WHEN s1.oppivelvollisen_toiminta = 3 and v_lps_th.opiskeluoikeus_oid is not null and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') THEN 1
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') and ytr.opiskeluoikeus_oid is not null THEN 1
						-- Suorittanut tutkinnon toisella sektorilla
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 2
						WHEN v_lps_th.tavoitetutkinto is not null THEN 2
						WHEN ytr.opiskeluoikeus_oid is not null THEN 2
						-- Jatkaa alkuperäisellä sektorilla (koko tutkintoon johtava koulutus)
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and ah_aps_th.opiskeluoikeus_oid is not null THEN 3
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 3
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and ah_lps_th.opiskeluoikeus_oid is not null THEN 3
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN 3
						-- Jatkaa toisella sektorilla (koko tutkintoon johtava koulutus)
						WHEN s2.oppivelvollisen_toiminta = 3 THEN 4
						-- Valmistunut alkuperäisestä valmentavasta koulutuksesta
						WHEN s1.oppivelvollisen_toiminta = 4 and v_oo_th.opiskeluoikeus_oid is not null and (s1.suorituksen_tyyppi = v_ps_th.suorituksen_tyyppi) THEN 5
						-- Valmistunut toisesta valmentavasta koulutuksesta
						WHEN v_oo_th.opiskeluoikeus_oid is not null and v_ps_th.suorituksen_tyyppi <> 'ammatillinentutkintoosittainen' and v_oo_th.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and v_oo_th.koulutusmuoto not in ('perusopetus', 'aikuistenperusopetus') THEN 6
						-- Jatkaa alkuperäisessä valmentavassa koulutuksessa
						WHEN s1.oppivelvollisen_toiminta = 4 and s2.oppivelvollisen_toiminta = 4 and s1.suorituksen_tyyppi = s2.suorituksen_tyyppi THEN 7
						-- Jatkaa toisessa valmentavassa koulutuksessa
						WHEN s1.suorituksen_tyyppi <> s2.suorituksen_tyyppi and s2.oppivelvollisen_toiminta = 4 THEN 8
						-- Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN 9
						-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 5 THEN 10
						-- Valmistunut perusopetuksen oppimäärän koulutuksesta
						WHEN v_ps_th.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara') or v_ps_this.suorituksen_tyyppi is not null THEN 11
						-- Jatkaa perusopetuksen oppimäärän koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 6 THEN 12
						-- Muut 
						WHEN s2.oppivelvollisen_toiminta = 8 THEN 13
						WHEN s2.oppivelvollisen_toiminta = 9 THEN 14
						WHEN s2.oppivelvollisen_toiminta = 10 THEN 15
						WHEN s2.oppivelvollisen_toiminta = 11 THEN 16
						ELSE 16
					END as tilanne,
					@i as aika_vuosina,
					s1.suorituksen_tyyppi as suorituksen_tyyppi_alkuperainen,
					CASE
						-- Suorittanut tutkinnon alkuperäisellä sektorilla (ammatillinen/lukio)
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' and s1.suorituksen_tyyppi = 'ammatillinentutkinto' THEN v_aps_th.suorituksen_tyyppi
						WHEN s1.oppivelvollisen_toiminta = 3 and v_lps_th.opiskeluoikeus_oid is not null and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') THEN v_lps_th.suorituksen_tyyppi
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') and ytr.opiskeluoikeus_oid is not null THEN 'ylioppilastutkinto'
						-- Suorittanut tutkinnon toisella sektorilla
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' THEN v_aps_th.suorituksen_tyyppi
						WHEN v_lps_th.tavoitetutkinto is not null THEN v_lps_th.suorituksen_tyyppi
						WHEN ytr.opiskeluoikeus_oid is not null THEN 'ylioppilastutkinto'
						-- Jatkaa alkuperäisellä sektorilla (koko tutkintoon johtava koulutus)
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and ah_aps_th.opiskeluoikeus_oid is not null THEN ah_aps_th.suorituksen_tyyppi
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi = 'ammatillinentutkinto' THEN s2.suorituksen_tyyppi
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and ah_lps_th.opiskeluoikeus_oid is not null THEN ah_lps_th.suorituksen_tyyppi
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN s2.suorituksen_tyyppi
						-- Jatkaa toisella sektorilla (koko tutkintoon johtava koulutus)
						WHEN s2.oppivelvollisen_toiminta = 3 THEN s2.suorituksen_tyyppi
						-- Valmistunut alkuperäisestä valmentavasta koulutuksesta
						WHEN s1.oppivelvollisen_toiminta = 4 and v_oo_th.opiskeluoikeus_oid is not null and (s1.suorituksen_tyyppi = v_ps_th.suorituksen_tyyppi) THEN v_ps_th.suorituksen_tyyppi
						-- Valmistunut toisesta valmentavasta koulutuksesta
						WHEN v_oo_th.opiskeluoikeus_oid is not null and v_ps_th.suorituksen_tyyppi <> 'ammatillinentutkintoosittainen' and v_oo_th.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and v_oo_th.koulutusmuoto not in ('perusopetus', 'aikuistenperusopetus') THEN v_ps_th.suorituksen_tyyppi
						-- Jatkaa alkuperäisessä valmentavassa koulutuksessa
						WHEN s1.oppivelvollisen_toiminta = 4 and s2.oppivelvollisen_toiminta = 4 and s1.suorituksen_tyyppi = s2.suorituksen_tyyppi THEN s2.suorituksen_tyyppi 
						-- Jatkaa toisessa valmentavassa koulutuksessa
						WHEN s1.suorituksen_tyyppi <> s2.suorituksen_tyyppi and s2.oppivelvollisen_toiminta = 4 THEN s2.suorituksen_tyyppi 
						-- Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN v_aps_th.suorituksen_tyyppi
						-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 5 THEN s2.suorituksen_tyyppi
						-- Valmistunut perusopetuksen oppimäärän koulutuksesta
						WHEN v_ps_th.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara') THEN v_ps_th.suorituksen_tyyppi
						WHEN v_ps_this.suorituksen_tyyppi is not null THEN v_ps_this.suorituksen_tyyppi
						-- Jatkaa perusopetuksen oppimäärän koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 6 THEN s2.suorituksen_tyyppi
						-- Muut 
						ELSE s2.suorituksen_tyyppi
					END as suorituksen_tyyppi,
					s1.koulutusmuoto as koulutusmuoto_alkuperainen,
					CASE
						-- Suorittanut tutkinnon alkuperäisellä sektorilla (ammatillinen/lukio)
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' and s1.suorituksen_tyyppi = 'ammatillinentutkinto' THEN v_oo_th.koulutusmuoto
						WHEN v_lps_th.opiskeluoikeus_oid is not null and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') THEN v_oo_th.koulutusmuoto
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') and ytr.opiskeluoikeus_oid is not null THEN 'ylioppilastutkinto'
						-- Suorittanut tutkinnon toisella sektorilla
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' THEN v_oo_th.koulutusmuoto
						WHEN v_lps_th.tavoitetutkinto is not null THEN v_oo_th.koulutusmuoto
						WHEN ytr.opiskeluoikeus_oid is not null THEN 'ylioppilastutkinto'
						-- Jatkaa alkuperäisellä sektorilla (koko tutkintoon johtava koulutus)
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and ah_aps_th.opiskeluoikeus_oid is not null THEN ah_oo_th.koulutusmuoto
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi = 'ammatillinentutkinto' THEN s2.koulutusmuoto
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and ah_lps_th.opiskeluoikeus_oid is not null THEN ah_oo_th.koulutusmuoto
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN s2.koulutusmuoto
						-- Jatkaa toisella sektorilla (koko tutkintoon johtava koulutus)
						WHEN s2.oppivelvollisen_toiminta = 3 THEN s2.koulutusmuoto
						-- Valmistunut alkuperäisestä valmentavasta koulutuksesta
						WHEN s1.oppivelvollisen_toiminta = 4 and v_oo_th.opiskeluoikeus_oid is not null and (s1.suorituksen_tyyppi = v_ps_th.suorituksen_tyyppi) THEN v_oo_th.koulutusmuoto
						-- Valmistunut toisesta valmentavasta koulutuksesta
						WHEN v_oo_th.opiskeluoikeus_oid is not null and v_ps_th.suorituksen_tyyppi <> 'ammatillinentutkintoosittainen' and v_oo_th.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and v_oo_th.koulutusmuoto not in ('perusopetus', 'aikuistenperusopetus') THEN v_oo_th.koulutusmuoto
						-- Jatkaa alkuperäisessä valmentavassa koulutuksessa
						WHEN s1.oppivelvollisen_toiminta = 4 and s2.oppivelvollisen_toiminta = 4 and s1.suorituksen_tyyppi = s2.suorituksen_tyyppi THEN s2.koulutusmuoto
						-- Jatkaa toisessa valmentavassa koulutuksessa
						WHEN s1.suorituksen_tyyppi <> s2.suorituksen_tyyppi and s2.oppivelvollisen_toiminta = 4 THEN s2.koulutusmuoto 
						-- Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN v_oo_th.koulutusmuoto
						-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 5 THEN s2.koulutusmuoto
						-- Valmistunut perusopetuksen oppimäärän koulutuksesta
						WHEN v_ps_th.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara') THEN v_oo_th.koulutusmuoto
						WHEN v_ps_this.suorituksen_tyyppi is not null THEN v_oo_this.koulutusmuoto
						-- Jatkaa perusopetuksen oppimäärän koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 6 THEN s2.koulutusmuoto
						-- Muut 
						ELSE s2.koulutusmuoto
					END as koulutusmuoto,
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
				LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_B s2 on s1.oppija_oid = s2.oppija_oid
				-- Aloitushetken opiskeluoikeus tarkasteluhetkenä
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ah_ooa_th on s1.opiskeluoikeus_oid = ah_ooa_th.opiskeluoikeus_oid and ah_ooa_th.alku <= DATEADD(month,@tj,s1.alkamispaiva) and ah_ooa_th.loppu >= DATEADD(month,@tj,s1.alkamispaiva) and ah_ooa_th.tila in ('lasna','loma')
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus ah_oo_th on ah_oo_th.opiskeluoikeus_oid = ah_ooa_th.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] ah_aps_th on ah_aps_th.opiskeluoikeus_oid = ah_oo_th.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] ah_lps_th on ah_lps_th.opiskeluoikeus_oid = ah_oo_th.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ah_ps_th on ah_ps_th.opiskeluoikeus_oid = ah_oo_th.opiskeluoikeus_oid
				-- Valmistumiset aloitusajankohdan ja tarkasteluhetken välillä
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus v_oo_th on v_oo_th.oppija_oid = s1.oppija_oid and v_oo_th.viimeisin_tila = 'valmistunut' and v_oo_th.paattymispaiva BETWEEN DATEADD(day, 1, s1.alkamispaiva) and DATEADD(month,@tj,s1.alkamispaiva) and v_oo_th.oppivelvollisuuden_suorittamiseen_kelpaava = 1
				LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] v_aps_th on v_aps_th.opiskeluoikeus_oid = v_oo_th.opiskeluoikeus_oid and v_aps_th.suorituksen_tyyppi in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen')
				LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] v_lps_th on v_lps_th.opiskeluoikeus_oid = v_oo_th.opiskeluoikeus_oid and v_lps_th.tavoitetutkinto <> 'Ei tutkintotavoitetta' and v_oo_th.koulutusmuoto <> 'lukiokoulutus'
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] v_ps_th on v_ps_th.opiskeluoikeus_oid = v_oo_th.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus v_oo_this on v_oo_this.oppija_oid = s1.oppija_oid and v_oo_this.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and v_oo_this.koulutusmuoto in ('internationalschool', 'europeanschoolofhelsinki')
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] v_ps_this on v_ps_this.opiskeluoikeus_oid = v_oo_this.opiskeluoikeus_oid and ((v_ps_this.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and v_ps_this.koulutusmoduuli_koodiarvo = '9') or (v_ps_this.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and v_ps_this.koulutusmoduuli_koodiarvo = 'S4')) and v_ps_this.vahvistus_paiva BETWEEN DATEADD(day, 1, s1.alkamispaiva) and DATEADD(month,@tj,s1.alkamispaiva)
				LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ytr on ytr.oppija_oid = s1.oppija_oid and ytr.alku between DATEADD(day, 1, s1.alkamispaiva) and DATEADD(month,@tj,s1.alkamispaiva) and ytr.tila_koodiarvo = 'valmistunut'
				-- Henkilötiedot
				LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = s1.oppija_oid
				LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = h.sukupuoli
				LEFT JOIN dw.d_maatjavaltiot2 d2 on d2.maatjavaltiot2_koodi = LEFT(h.kansalaisuus, 3)
				LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = h.aidinkieli
				LEFT JOIN dw.d_ika d4 on d4.ika_avain = YEAR(s1.alkamispaiva) - YEAR(h.syntymaaika)
				LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = s1.suorittanut_perusopetuksen
				LEFT JOIN dw.d_kytkin d6 on d6.kytkin_koodi = s2.oppivelvollisuus_paattynyt
				LEFT JOIN dw.d_pidennetty_oppivelvollisuus d23 on d23.koodi = s1.pidennetty_oppivelvollisuus
				LEFT JOIN dw.d_perusopetuksen_oppimaaran_yksilollistaminen d24 on d24.koodi = s1.perusopetuksen_oppimaaran_yksilollistaminen and d24.luokittelu = 2
				LEFT JOIN dw.d_kytkin d26 on d26.kytkin_koodi = s2.kotikunta_mannersuomessa
				-- Muut
				LEFT JOIN dw.d_erityisopetus d25 on d25.erityisopetus_koodi = s1.erityisopetus
				-- Tilanteet ilman priorisointia
				LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne s3 on s1.oppija_oid = s3.oppija_oid
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
			) s 
		) s 
		WHERE s.tilanne = s.tilanne_prio and ranki_st = 1
		
		SET @loppuPvmB = EOMONTH(DATEADD(MONTH, 6, @loppuPvmB))
		SET @tj += 6
		SET @i += 0.5

	END

	-- Edellisen kuukauden loppu

	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_B 

	SELECT * INTO Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_B 
		FROM (
			SELECT DISTINCT 
				f.oppija_oid,
				f.opiskeluoikeus_oid,
				f.koulutusmuoto,
				f.koulutusmoduuli_koodiarvo,
				f.suorituksen_tyyppi,
				f.oppivelvollisen_toiminta,
				f.oppivelvollisuus_paattynyt,
				f.kotikunta_mannersuomessa,
				oppivelvollisen_toiminta_min = MIN(f.oppivelvollisen_toiminta) OVER (PARTITION BY f.oppija_oid),
				ranki = 
					RANK() OVER (
						PARTITION BY f.oppija_oid, f.oppivelvollisen_toiminta
						ORDER BY
							CASE 
								WHEN f.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN 3
								WHEN f.suorituksen_tyyppi = s.suorituksen_tyyppi THEN 1
								ELSE 2
							END,
							f.alkamispaiva, 
							f.opiskeluoikeus_oid
					)
			
			FROM (
				SELECT DISTINCT
					ooa.opiskeluoikeus_oid,
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
					ov.[oppija_oid],
					oo.alkamispaiva,
					po.perusopetuksen_oppimaara_suoritettu_pvm,
					CASE 
						WHEN po.perusopetuksen_oppimaara_suoritettu_pvm is null or @loppuPvmFinal < po.perusopetuksen_oppimaara_suoritettu_pvm THEN 0
						ELSE 1
					END as suorittanut_perusopetuksen_oppimaaran,
					CASE
						WHEN aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
						WHEN lps.tavoitetutkinto is not null and lps.tavoitetutkinto != 'Ei tutkintotavoitetta' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
						WHEN ps.suorituksen_tyyppi not in ('ammatillinentutkintoosittainen','europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and oo.koulutusmuoto not in ('perusopetus', 'aikuistenperusopetus')
						and not (ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9'))
						and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 4
						WHEN ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 5
						WHEN ((ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'nuortenperusopetuksenoppiaineenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or 
							 (ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9')) or
							 (ps.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ps.koulutusmoduuli_koodiarvo <> 'S5')) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 6
						WHEN vov.vapautettu is not null THEN 8 
						WHEN (ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1) THEN 9
						WHEN kesk.peruttu = 0 THEN 10
						WHEN ooa.tila in ('lasna', 'loma') THEN 11
						WHEN ooa.tila in ('valmistunut','hyvaksytystisuoritettu') THEN 12
						WHEN ooa.tila in ('katsotaaneronneeksi', 'eronnut') or (ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 0) THEN 13
						WHEN ooa.opiskeluoikeus_oid is null THEN 14
					END AS oppivelvollisen_toiminta,
					CASE
						WHEN kesk.peruttu = 0 and ooa.opiskeluoikeus_oid is null THEN 1
						ELSE 0
					END as keskeyttanyt,
					CASE
						WHEN ov2.oppija_oid is null THEN 1
						ELSE 0
					END as oppivelvollisuus_paattynyt,
					coalesce(khs.kotikunta_mannersuomessa,0) as kotikunta_mannersuomessa
				FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku ov
				LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov2 on ov.oppija_oid = ov2.oppija_oid and @loppuPvmFinal BETWEEN ov2.alkuPvm AND ov2.loppuPvm 
				INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = ov.oppija_oid
				LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa 
					on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= @loppuPvmFinal and ooa.loppu >= @loppuPvmFinal
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid 
				LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa khs on khs.oppija_oid = ov.oppija_oid and @loppuPvmFinal BETWEEN khs.muutto_pvm and khs.poismuutto_pvm		
				OUTER APPLY (
					SELECT * FROM (
						SELECT 
							k.oppija_oid, 
							coalesce(kh.peruttu, k.peruttu) as peruttu, 
							MAX(coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime))) OVER (PARTITION BY k.oppija_oid) as luotuMax,
							coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime)) as luotu
						FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytys] k
						LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytyshistoria] kh on kh.ov_keskeytys_uuid = k.uuid
						WHERE coalesce(kh.alku, k.alku) <= @loppuPvmFinal 
						and (coalesce(kh.loppu, k.loppu) > @loppuPvmFinal or coalesce(kh.loppu, k.loppu) is null) 
						and coalesce(case when cast(left(kh.muutos_tehty,18) as date) = cast(kh.luotu as date) and cast(left(kh.muutos_tehty,18) as date) > kh.alku then kh.alku else cast(left(kh.muutos_tehty,18) as date) end, cast(case when k.luotu > k.alku then k.alku else k.luotu end as date)) <= @loppuPvmFinal
					) kesk WHERE kesk.oppija_oid = ov.oppija_oid and kesk.luotu = kesk.luotuMax
				) kesk
				LEFT JOIN (
					SELECT
						oo.oppija_oid,
						min(ps.vahvistus_paiva) as perusopetuksen_oppimaara_suoritettu_pvm
					FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
					LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
					WHERE ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara') 
					OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') 
					OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4')
					GROUP BY oo.oppija_oid
				) po on po.oppija_oid = ov.oppija_oid
				LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuudesta_vapautetut] vov on vov.oppija_oid = ov.oppija_oid and cast(vov.mitatoity as date) <> cast('9999-01-01' as date) and vov.vapautettu <= @loppuPvmFinal
				WHERE ooa.opiskeluoikeus_oid is null
				OR NOT EXISTS (
					SELECT 1 
					FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
					WHERE oo.koulutusmuoto != 'tuva'
					AND tuvat.oppija_oid = oo.oppija_oid
					AND @loppuPvmFinal between tuvat.alku and tuvat.loppu
				)
			) f
			LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku s on s.oppija_oid = f.oppija_oid
		) f 
		WHERE oppivelvollisen_toiminta = oppivelvollisen_toiminta_min and ranki = 1


		DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne

		SELECT
			oppija_oid,
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
				f.oppija_oid,
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
					ov.oppija_oid,
					CASE 
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and aps.suorituksen_tyyppi = 'ammatillinentutkinto' and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and oo.viimeisin_tila = 'valmistunut' THEN 1
						WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and oo.viimeisin_tila = 'valmistunut' and oo.koulutusmuoto <> 'lukiokoulutus' THEN 1 
						WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ytr.opiskeluoikeus_oid is not null THEN 1
						ELSE 0
					END as valm_alk_koko_tutk_joht_koul,
					CASE 
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and oo.viimeisin_tila = 'valmistunut' and oo.koulutusmuoto <> 'lukiokoulutus'  THEN 1
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and ytr.opiskeluoikeus_oid is not null THEN 1
						WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and aps.suorituksen_tyyppi = 'ammatillinentutkinto' and aps.vahvistus_paiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal THEN 1
						WHEN ov.oppivelvollisen_toiminta <> 3 and ((lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and oo.koulutusmuoto <> 'lukiokoulutus') or aps.suorituksen_tyyppi = 'ammatillinentutkinto') and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and oo.viimeisin_tila = 'valmistunut' THEN 1
						ELSE 0
					END as valm_muu_koko_tutk_joht_koul,
					CASE 
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa_aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila IN ('lasna', 'loma') THEN 1
						WHEN ov.oppivelvollisen_toiminta = 3 and ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ooa_lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and ooa.tila IN ('lasna', 'loma') THEN 1
						ELSE 0
					END as jatk_alk_koko_tutk_joht_koul,
					CASE 
						WHEN ov.suorituksen_tyyppi <> 'ammatillinentutkinto' and ooa_aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila IN ('lasna', 'loma') THEN 1
						WHEN ov.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa_lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and ooa.tila IN ('lasna', 'loma') THEN 1
						WHEN ov.oppivelvollisen_toiminta <> 3 and ((ooa_aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila IN ('lasna', 'loma')) or (ooa_lps.tavoitetutkinto <> 'Ei tutkintotavoitetta' and ooa.tila IN ('lasna', 'loma'))) THEN 1
						ELSE 0
					END as jatk_muu_koko_tutk_joht_koul,
					CASE 
						WHEN ov.oppivelvollisen_toiminta = 4 and ov.suorituksen_tyyppi = ps.suorituksen_tyyppi and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and oo.viimeisin_tila = 'valmistunut' and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1 
						ELSE 0
					END as valm_alk_valm_koul,
					CASE 
						WHEN (lps.opiskeluoikeus_oid is null or lps.suorituksen_tyyppi in ('luva', 'tuvakoulutuksensuoritus')) and oo.koulutusmuoto not in ('europeanschoolofhelsinki','aikuistenperusopetus','perusopetus','internationalschool') and (aps.suorituksen_tyyppi is null or aps.suorituksen_tyyppi not in ('ammatillinentutkinto','ammatillinentutkintoosittainen')) and ov.suorituksen_tyyppi <> ps.suorituksen_tyyppi and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and oo.viimeisin_tila = 'valmistunut' and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
						ELSE 0
					END as valm_muu_valm_koul,
					CASE 
						WHEN ov.oppivelvollisen_toiminta = 4 and ov.suorituksen_tyyppi = ooa_ps.suorituksen_tyyppi and ooa.tila IN ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1 
						ELSE 0
					END as jatk_alk_valm_koul,
					CASE 
						WHEN (lps.opiskeluoikeus_oid is null or lps.suorituksen_tyyppi in ('luva', 'tuvakoulutuksensuoritus')) and oo.koulutusmuoto not in ('europeanschoolofhelsinki','aikuistenperusopetus','perusopetus','internationalschool') and (aps.suorituksen_tyyppi is null or aps.suorituksen_tyyppi not in ('ammatillinentutkinto','ammatillinentutkintoosittainen')) and ov.suorituksen_tyyppi <> ooa_ps.suorituksen_tyyppi and ooa.tila IN ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
						ELSE 0
					END as jatk_muu_valm_koul,
					CASE 
						WHEN aps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and oo.viimeisin_tila = 'valmistunut' and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1 
						ELSE 0
					END as valm_amm_tutk_osa_koul,
					CASE 
						WHEN ooa_aps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and ooa.tila IN ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
						ELSE 0
					END as jatk_amm_tutk_osa_koul,
					CASE 
						WHEN (oo.paattymispaiva BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and oo.viimeisin_tila = 'valmistunut' and ps.suorituksen_tyyppi in('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara')) or (ps.vahvistus_paiva between ov.alkamispaiva and @loppuPvmFinal and ((ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4'))) THEN 1
						ELSE 0
					END as valm_per_op_koul,
					CASE 
						WHEN ((ooa_ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'nuortenperusopetuksenoppiaineenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or (ooa_ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ooa_ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9') and(ooa_ps.vahvistus_paiva is null or ooa_ps.vahvistus_paiva between ov.alkamispaiva and @loppuPvmFinal)) or (ooa_ps.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ooa_ps.koulutusmoduuli_koodiarvo <> 'S5' and (ooa_ps.vahvistus_paiva is null or ooa_ps.vahvistus_paiva between ov.alkamispaiva and @loppuPvmFinal))) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and ooa.tila IN ('lasna', 'loma') THEN 1
						ELSE 0
					END as jatk_per_op_koul,
					CASE 
						WHEN ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 0 THEN 1
						ELSE 0
					END as koul_jok_ei_kelp_ov_suor,
					CASE
						WHEN ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
						ELSE 0
					END as keskeyttanyt,
					CASE
						WHEN kesk.peruttu = 0 THEN 1
						ELSE 0
					END as keskeyttanyt_valpas
				FROM Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku ov
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.oppija_oid = ov.oppija_oid
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and @loppuPvmFinal between ooa.alku and ooa.loppu
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus aps on aps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_lukio_paatason_suoritus lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ooa_ps on ooa_ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ooa_aps on ooa_aps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_lukio_paatason_suoritus ooa_lps on ooa_lps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ytr on ytr.oppija_oid = ov.oppija_oid and ytr.alku between DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and ytr.tila_koodiarvo = 'valmistunut'
				OUTER APPLY (
					SELECT * FROM (
						SELECT 
							k.oppija_oid, 
							coalesce(kh.peruttu, k.peruttu) as peruttu, 
							MAX(coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime))) OVER (PARTITION BY k.oppija_oid) as luotuMax,
							coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime)) as luotu
						FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytys] k
						LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytyshistoria] kh on kh.ov_keskeytys_uuid = k.uuid
						WHERE coalesce(kh.alku, k.alku) <= @loppuPvmFinal 
						and (coalesce(kh.loppu, k.loppu) > @loppuPvmFinal or coalesce(kh.loppu, k.loppu) is null) 
						and coalesce(case when cast(left(kh.muutos_tehty,18) as date) = cast(kh.luotu as date) and cast(left(kh.muutos_tehty,18) as date) > kh.alku then kh.alku else cast(left(kh.muutos_tehty,18) as date) end, cast(case when k.luotu > k.alku then k.alku else k.luotu end as date)) <= @loppuPvmFinal
					) kesk WHERE kesk.oppija_oid = ov.oppija_oid and kesk.luotu = kesk.luotuMax
				) kesk
				WHERE ooa.opiskeluoikeus_oid is null 
				OR NOT EXISTS (
					SELECT 1 
					FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
					WHERE oo.koulutusmuoto != 'tuva'
					AND tuvat.oppija_oid = oo.oppija_oid
					AND @loppuPvmFinal between tuvat.alku and tuvat.loppu
				)
			) f
			GROUP BY f.oppija_oid
		) f

		INSERT INTO dw.f_koski_oppivelvollisten_opintojen_kulku
		SELECT 
			oppija_oid,
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
				s.oppija_oid,
				s.alku,
				s.loppu,
				s.opiskeluoikeus_alkuperainen,
				s.opiskeluoikeus_oid,
				s.tilanne,
				tilanne_prio = MIN(s.tilanne) OVER(PARTITION BY s.oppija_oid),
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
				s.d_kytkin_kotikunta_mannersuomessa_id,
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
				ranki_st = 
					RANK() OVER (
						PARTITION BY s.oppija_oid, s.opiskeluoikeus_oid, s.tilanne 
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
					s1.oppija_oid,
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
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' and s1.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
						WHEN s1.oppivelvollisen_toiminta = 3 and v_lps_th.opiskeluoikeus_oid is not null and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') THEN 1
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') and ytr.opiskeluoikeus_oid is not null THEN 1
						-- Suorittanut tutkinnon toisella sektorilla
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 2
						WHEN v_lps_th.tavoitetutkinto is not null THEN 2
						WHEN ytr.opiskeluoikeus_oid is not null THEN 2
						-- Jatkaa alkuperäisellä sektorilla (koko tutkintoon johtava koulutus)
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and ah_aps_th.opiskeluoikeus_oid is not null THEN 3
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 3
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and ah_lps_th.opiskeluoikeus_oid is not null THEN 3
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN 3
						-- Jatkaa toisella sektorilla (koko tutkintoon johtava koulutus)
						WHEN s2.oppivelvollisen_toiminta = 3 THEN 4
						-- Valmistunut alkuperäisestä valmentavasta koulutuksesta
						WHEN s1.oppivelvollisen_toiminta = 4 and v_oo_th.opiskeluoikeus_oid is not null and (s1.suorituksen_tyyppi = v_ps_th.suorituksen_tyyppi) THEN 5
						-- Valmistunut toisesta valmentavasta koulutuksesta
						WHEN v_oo_th.opiskeluoikeus_oid is not null and v_ps_th.suorituksen_tyyppi <> 'ammatillinentutkintoosittainen' and v_oo_th.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and v_oo_th.koulutusmuoto not in ('perusopetus', 'aikuistenperusopetus') THEN 6
						-- Jatkaa alkuperäisessä valmentavassa koulutuksessa
						WHEN s1.oppivelvollisen_toiminta = 4 and s2.oppivelvollisen_toiminta = 4 and s1.suorituksen_tyyppi = s2.suorituksen_tyyppi THEN 7
						-- Jatkaa toisessa valmentavassa koulutuksessa
						WHEN s1.suorituksen_tyyppi <> s2.suorituksen_tyyppi and s2.oppivelvollisen_toiminta = 4 THEN 8
						-- Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN 9
						-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 5 THEN 10
						-- Valmistunut perusopetuksen oppimäärän koulutuksesta
						WHEN v_ps_th.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara') or v_ps_this.suorituksen_tyyppi is not null THEN 11
						-- Jatkaa perusopetuksen oppimäärän koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 6 THEN 12
						-- Muut 
						WHEN s2.oppivelvollisen_toiminta = 8 THEN 13
						WHEN s2.oppivelvollisen_toiminta = 9 THEN 14
						WHEN s2.oppivelvollisen_toiminta = 10 THEN 15
						WHEN s2.oppivelvollisen_toiminta = 11 THEN 16
						ELSE 16
					END as tilanne,
					NULL as aika_vuosina,
					s1.suorituksen_tyyppi as suorituksen_tyyppi_alkuperainen,
					CASE
						-- Suorittanut tutkinnon alkuperäisellä sektorilla (ammatillinen/lukio)
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' and s1.suorituksen_tyyppi = 'ammatillinentutkinto' THEN v_aps_th.suorituksen_tyyppi
						WHEN s1.oppivelvollisen_toiminta = 3 and v_lps_th.opiskeluoikeus_oid is not null and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') THEN v_lps_th.suorituksen_tyyppi
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') and ytr.opiskeluoikeus_oid is not null THEN 'ylioppilastutkinto'
						-- Suorittanut tutkinnon toisella sektorilla
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' THEN v_aps_th.suorituksen_tyyppi
						WHEN v_lps_th.tavoitetutkinto is not null THEN v_lps_th.suorituksen_tyyppi
						WHEN ytr.opiskeluoikeus_oid is not null THEN 'ylioppilastutkinto'
						-- Jatkaa alkuperäisellä sektorilla (koko tutkintoon johtava koulutus)
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and ah_aps_th.opiskeluoikeus_oid is not null THEN ah_aps_th.suorituksen_tyyppi
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi = 'ammatillinentutkinto' THEN s2.suorituksen_tyyppi
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and ah_lps_th.opiskeluoikeus_oid is not null THEN ah_lps_th.suorituksen_tyyppi
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN s2.suorituksen_tyyppi
						-- Jatkaa toisella sektorilla (koko tutkintoon johtava koulutus)
						WHEN s2.oppivelvollisen_toiminta = 3 THEN s2.suorituksen_tyyppi
						-- Valmistunut alkuperäisestä valmentavasta koulutuksesta
						WHEN s1.oppivelvollisen_toiminta = 4 and v_oo_th.opiskeluoikeus_oid is not null and (s1.suorituksen_tyyppi = v_ps_th.suorituksen_tyyppi) THEN v_ps_th.suorituksen_tyyppi
						-- Valmistunut toisesta valmentavasta koulutuksesta
						WHEN v_oo_th.opiskeluoikeus_oid is not null and v_ps_th.suorituksen_tyyppi <> 'ammatillinentutkintoosittainen' and v_oo_th.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and v_oo_th.koulutusmuoto not in ('perusopetus', 'aikuistenperusopetus') THEN v_ps_th.suorituksen_tyyppi
						-- Jatkaa alkuperäisessä valmentavassa koulutuksessa
						WHEN s1.oppivelvollisen_toiminta = 4 and s2.oppivelvollisen_toiminta = 4 and s1.suorituksen_tyyppi = s2.suorituksen_tyyppi THEN s2.suorituksen_tyyppi 
						-- Jatkaa toisessa valmentavassa koulutuksessa
						WHEN s1.suorituksen_tyyppi <> s2.suorituksen_tyyppi and s2.oppivelvollisen_toiminta = 4 THEN s2.suorituksen_tyyppi 
						-- Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN v_aps_th.suorituksen_tyyppi
						-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 5 THEN s2.suorituksen_tyyppi
						-- Valmistunut perusopetuksen oppimäärän koulutuksesta
						WHEN v_ps_th.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara') THEN v_ps_th.suorituksen_tyyppi
						WHEN v_ps_this.suorituksen_tyyppi is not null THEN v_ps_this.suorituksen_tyyppi
						-- Jatkaa perusopetuksen oppimäärän koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 6 THEN s2.suorituksen_tyyppi
						-- Muut 
						ELSE s2.suorituksen_tyyppi
					END as suorituksen_tyyppi,
					s1.koulutusmuoto as koulutusmuoto_alkuperainen,
					CASE
						-- Suorittanut tutkinnon alkuperäisellä sektorilla (ammatillinen/lukio)
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' and s1.suorituksen_tyyppi = 'ammatillinentutkinto' THEN v_oo_th.koulutusmuoto
						WHEN v_lps_th.opiskeluoikeus_oid is not null and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') THEN v_oo_th.koulutusmuoto
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi not in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') and ytr.opiskeluoikeus_oid is not null THEN 'ylioppilastutkinto'
						-- Suorittanut tutkinnon toisella sektorilla
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkinto' THEN v_oo_th.koulutusmuoto
						WHEN v_lps_th.tavoitetutkinto is not null THEN v_oo_th.koulutusmuoto
						WHEN ytr.opiskeluoikeus_oid is not null THEN 'ylioppilastutkinto'
						-- Jatkaa alkuperäisellä sektorilla (koko tutkintoon johtava koulutus)
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and ah_aps_th.opiskeluoikeus_oid is not null THEN ah_oo_th.koulutusmuoto
						WHEN s1.suorituksen_tyyppi = 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi = 'ammatillinentutkinto' THEN s2.koulutusmuoto
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and ah_lps_th.opiskeluoikeus_oid is not null THEN ah_oo_th.koulutusmuoto
						WHEN s1.oppivelvollisen_toiminta = 3 and s1.suorituksen_tyyppi <> 'ammatillinentutkinto' and s2.oppivelvollisen_toiminta = 3 and s2.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN s2.koulutusmuoto
						-- Jatkaa toisella sektorilla (koko tutkintoon johtava koulutus)
						WHEN s2.oppivelvollisen_toiminta = 3 THEN s2.koulutusmuoto
						-- Valmistunut alkuperäisestä valmentavasta koulutuksesta
						WHEN s1.oppivelvollisen_toiminta = 4 and v_oo_th.opiskeluoikeus_oid is not null and (s1.suorituksen_tyyppi = v_ps_th.suorituksen_tyyppi) THEN v_oo_th.koulutusmuoto
						-- Valmistunut toisesta valmentavasta koulutuksesta
						WHEN v_oo_th.opiskeluoikeus_oid is not null and v_ps_th.suorituksen_tyyppi <> 'ammatillinentutkintoosittainen' and v_oo_th.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and v_oo_th.koulutusmuoto not in ('perusopetus', 'aikuistenperusopetus') THEN v_oo_th.koulutusmuoto
						-- Jatkaa alkuperäisessä valmentavassa koulutuksessa
						WHEN s1.oppivelvollisen_toiminta = 4 and s2.oppivelvollisen_toiminta = 4 and s1.suorituksen_tyyppi = s2.suorituksen_tyyppi THEN s2.koulutusmuoto
						-- Jatkaa toisessa valmentavassa koulutuksessa
						WHEN s1.suorituksen_tyyppi <> s2.suorituksen_tyyppi and s2.oppivelvollisen_toiminta = 4 THEN s2.koulutusmuoto 
						-- Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta
						WHEN v_aps_th.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN v_oo_th.koulutusmuoto
						-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 5 THEN s2.koulutusmuoto
						-- Valmistunut perusopetuksen oppimäärän koulutuksesta
						WHEN v_ps_th.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara') THEN v_oo_th.koulutusmuoto
						WHEN v_ps_this.suorituksen_tyyppi is not null THEN v_oo_this.koulutusmuoto
						-- Jatkaa perusopetuksen oppimäärän koulutuksessa
						WHEN s2.oppivelvollisen_toiminta = 6 THEN s2.koulutusmuoto
						-- Muut 
						ELSE s2.koulutusmuoto
					END as koulutusmuoto,
					coalesce(d1.id, -1) as d_sukupuoli_id,
					coalesce(d2.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
					coalesce(d3.id, -1) as d_aidinkieli_id,
					coalesce(d4.id, -1) as d_ika_id,
					coalesce(d5.id, -1) as d_kytkin_suorittanut_perusopetuksen_id,
					coalesce(d6.id, -1) as d_kytkin_oppivelvollisuus_paattynyt_id,
					coalesce(d23.id, -1) as d_pidennetty_oppivelvollisuus_id,
					coalesce(d24.id, -1) as d_perusopetuksen_oppimaaran_yksilollistaminen_id,
					coalesce(d25.id, -1) as d_erityisopetus_aloitettu_koulutus_id,
					coalesce(d26.id, -1) as d_kytkin_kotikunta_mannersuomessa_id,

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
				LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_B s2 on s1.oppija_oid = s2.oppija_oid
				-- Aloitushetken opiskeluoikeus tarkasteluhetkenä
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ah_ooa_th on s1.opiskeluoikeus_oid = ah_ooa_th.opiskeluoikeus_oid and ah_ooa_th.alku <= @loppuPvmFinal and ah_ooa_th.loppu >= @loppuPvmFinal and ah_ooa_th.tila in ('lasna','loma')
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus ah_oo_th on ah_oo_th.opiskeluoikeus_oid = ah_ooa_th.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] ah_aps_th on ah_aps_th.opiskeluoikeus_oid = ah_oo_th.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] ah_lps_th on ah_lps_th.opiskeluoikeus_oid = ah_oo_th.opiskeluoikeus_oid
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ah_ps_th on ah_ps_th.opiskeluoikeus_oid = ah_oo_th.opiskeluoikeus_oid
				-- Valmistumiset aloitusajankohdan ja tarkasteluhetken välillä
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus v_oo_th on v_oo_th.oppija_oid = s1.oppija_oid and v_oo_th.viimeisin_tila = 'valmistunut' and v_oo_th.paattymispaiva BETWEEN DATEADD(day, 1, s1.alkamispaiva) and @loppuPvmFinal and v_oo_th.oppivelvollisuuden_suorittamiseen_kelpaava = 1
				LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] v_aps_th on v_aps_th.opiskeluoikeus_oid = v_oo_th.opiskeluoikeus_oid and v_aps_th.suorituksen_tyyppi in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen')
				LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] v_lps_th on v_lps_th.opiskeluoikeus_oid = v_oo_th.opiskeluoikeus_oid and v_lps_th.tavoitetutkinto <> 'Ei tutkintotavoitetta' and v_oo_th.koulutusmuoto <> 'lukiokoulutus'
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] v_ps_th on v_ps_th.opiskeluoikeus_oid = v_oo_th.opiskeluoikeus_oid
				LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus v_oo_this on v_oo_this.oppija_oid = s1.oppija_oid and v_oo_this.oppivelvollisuuden_suorittamiseen_kelpaava = 1 and v_oo_this.koulutusmuoto in ('internationalschool', 'europeanschoolofhelsinki')
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] v_ps_this on v_ps_this.opiskeluoikeus_oid = v_oo_this.opiskeluoikeus_oid and ((v_ps_this.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and v_ps_this.koulutusmoduuli_koodiarvo = '9') or (v_ps_this.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and v_ps_this.koulutusmoduuli_koodiarvo = 'S4')) and v_ps_this.vahvistus_paiva BETWEEN DATEADD(day, 1, s1.alkamispaiva) and @loppuPvmFinal
				LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ytr on ytr.oppija_oid = s1.oppija_oid and ytr.alku between DATEADD(day, 1, s1.alkamispaiva) and @loppuPvmFinal and ytr.tila_koodiarvo = 'valmistunut'
				-- Henkilötiedot
				LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = s1.oppija_oid
				LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = h.sukupuoli
				LEFT JOIN dw.d_maatjavaltiot2 d2 on d2.maatjavaltiot2_koodi = LEFT(h.kansalaisuus, 3)
				LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = h.aidinkieli
				LEFT JOIN dw.d_ika d4 on d4.ika_avain = YEAR(s1.alkamispaiva) - YEAR(h.syntymaaika)
				LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = s1.suorittanut_perusopetuksen
				LEFT JOIN dw.d_kytkin d6 on d6.kytkin_koodi = s2.oppivelvollisuus_paattynyt
				LEFT JOIN dw.d_pidennetty_oppivelvollisuus d23 on d23.koodi = s1.pidennetty_oppivelvollisuus
				LEFT JOIN dw.d_perusopetuksen_oppimaaran_yksilollistaminen d24 on d24.koodi = s1.perusopetuksen_oppimaaran_yksilollistaminen and d24.luokittelu = 2
				LEFT JOIN dw.d_kytkin d26 on d26.kytkin_koodi = s2.kotikunta_mannersuomessa
				-- Muut
				LEFT JOIN dw.d_erityisopetus d25 on d25.erityisopetus_koodi = s1.erityisopetus
				-- Tilanteet ilman priorisointia
				LEFT JOIN Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne s3 on s1.oppija_oid = s3.oppija_oid
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
			) s 
		) s 
		WHERE s.tilanne = s.tilanne_prio and ranki_st = 1

	SET @alkuPvm = DATEADD(DAY, 1, @loppuPvm)
	SET @loppuPvm = EOMONTH(DATEADD(MONTH, 6, @loppuPvm))

END

DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_tilanne
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_B
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_rajaukset
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvolliset_esirajaukset_opintojen_kulku
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_opintojen_kulku_kotikunta_mannersuomessa

GO









