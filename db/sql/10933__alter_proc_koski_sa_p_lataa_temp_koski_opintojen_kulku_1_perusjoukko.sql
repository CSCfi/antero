USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_1_perusjoukko]    Script Date: 30.7.2025 8.22.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_1_perusjoukko] AS

DROP TABLE IF EXISTS sa.temp_opintojen_kulku_kalenteri
DROP TABLE IF EXISTS sa.temp_opintojen_kulku_kohortti
DROP TABLE IF EXISTS sa.temp_opintojen_kulku_sarja_kytkin
DROP TABLE IF EXISTS sa.temp_opintojen_kulku_tarkastelupaivat_1


/* KALENTERIN TÄYDENNYS */

SELECT 
	*, 
	eka_tarkastuspaiva_vp = DATEADD(MONTH, 6, MAX(paivays) OVER (PARTITION BY kohortti_vp)),
	eka_tarkastuspaiva_vn = DATEADD(MONTH, 6, MAX(paivays) OVER (PARTITION BY kohortti_vn)),
	kohortti_fi = 
		case 
			when vuosipuolisko = 'H1' then CONCAT('1.1.', vuosi, ' - ', '30.6.', vuosi) 
			when vuosipuolisko = 'H2' then CONCAT('1.7.', vuosi, ' - ', '31.12.', vuosi) 			
		end
INTO sa.temp_opintojen_kulku_kalenteri
FROM (
	SELECT 
		*, 
		CONCAT(vuosi, '-', vuosipuolisko) AS kohortti_vp,
		CONCAT(vuosi, '-', vuosineljannes) AS kohortti_vn
	FROM (
		SELECT 
			[id]
			,[kalenteri_avain]
			,[paivays]
			,[vuosi]
			,[kuukausi]
			,[paiva]
			,CASE 
				WHEN kuukausi <= 6 THEN 'H1'
				WHEN kuukausi >= 7 THEN 'H2'
			END
			AS vuosipuolisko
			,CASE 
				WHEN kuukausi <= 3 THEN 'Q1'
				WHEN kuukausi <=6 THEN 'Q2'
				WHEN kuukausi <=9 THEN 'Q3'
				WHEN kuukausi <=12 THEN 'Q4'
			END
			AS vuosineljannes
		FROM [ANTERO].[dw].[d_kalenteri]
		WHERE vuosi BETWEEN 2018 AND YEAR(GETDATE())
	) q
) q2

 
/* TARKASTELUPÄIVIEN LATAUS */

SELECT 
	kohortti_vp, 
	sarja
INTO sa.temp_opintojen_kulku_sarja_kytkin
FROM (
	SELECT 
		*,
		eka_mahdollinen_paiva = DATEADD(MONTH, sarja * 6, vika_paiva_vp)
	FROM (
		SELECT DISTINCT 
			kohortti_vp ,
			eka_paiva_vp = MIN(paivays) OVER (PARTITION BY kohortti_vp),
			vika_paiva_vp = MAX(paivays) OVER (PARTITION BY kohortti_vp),
			sarja
		FROM (
			SELECT 
				*, 
				CONCAT(vuosi, '-', vuosipuolisko) AS kohortti_vp,
				CONCAT(vuosi, '-', vuosineljannes) AS kohortti_vn
			FROM (
				SELECT 
					[id]
					,[kalenteri_avain]
					,[paivays]
					,[vuosi]
					,[kuukausi]
					,[paiva]
					,CASE 
						WHEN kuukausi <= 6 THEN 'H1'
						WHEN kuukausi >= 7 THEN 'H2'
					END
					AS vuosipuolisko
					,CASE 
						WHEN kuukausi <= 3 THEN 'Q1'
						WHEN kuukausi <=6 THEN 'Q2'
						WHEN kuukausi <=9 THEN 'Q3'
						WHEN kuukausi <=12 THEN 'Q4'
					END
					AS vuosineljannes
				FROM [ANTERO].[dw].[d_kalenteri]
				WHERE vuosi BETWEEN 2018 AND YEAR(GETDATE())
			) q0
		) q1
		CROSS JOIN (
			SELECT TOP 100 id - 1 AS sarja 
			FROM ANTERO.dw.d_kalenteri 
			WHERE id != -1 
			ORDER BY id
		) q2
	) q3 
)q4
WHERE eka_mahdollinen_paiva <= GETDATE()


/* PERUSJOUKON POIMINTA */

SELECT DISTINCT *
INTO sa.temp_opintojen_kulku_kohortti
FROM (

	SELECT 
		perus.master_oid, 
		perus.opiskeluoikeus_oid,
		perus.koulutus_kytkin,
		kal.kohortti_vp, 
		perus.alkamispaiva,
		oo.paattymispaiva,
		oo.koulutusmuoto,
		oo.koulutustoimija_oid,
		oo.oppilaitos_oid,
		ps.suorituksen_tyyppi,
		oo.viimeisin_tila,
		lopputulema = 
			CASE
				WHEN viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt') THEN 'Koulutus kesken'
				WHEN viimeisin_tila IN ('eronnut', 'katsotaaneronneeksi','peruutettu') THEN 'Eronnut'
				WHEN viimeisin_tila IN ('valmistunut') AND ps.vahvistus_paiva IS NOT NULL THEN 'Valmistunut'
			END,
		tutkinto_koodi = 
			CASE
				--WHEN LEN(ps.koulutusmoduuli_koodiarvo) > 6 THEN NULL 
				WHEN koulutus_kytkin = 'ammatillinen' THEN COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo)
				WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppimaara' THEN '301101'
				WHEN oo.koulutusmuoto = 'ibtutkinto' THEN '301102'
				WHEN oo.koulutusmuoto = 'diatutkinto' THEN '301103'
				WHEN ps.suorituksen_tyyppi IN ('ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN '301104'
				WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5' THEN '301104'
				-- WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN '301101'
				WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN '301102'
				WHEN ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' THEN '301102'
				ELSE COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo) 
			END,
		oppimaara = 
			CASE
				--WHEN suorituksen_tyyppi = 'luva' THEN 'aineopiskelija'
				WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'ulk_tutkinto'
				WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 'ulk_tutkinto' 
				WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5' THEN 'ulk_tutkinto'
				WHEN ps.[oppimaara] = 'nuortenops' THEN oppimaara
				WHEN ps.[oppimaara] = 'aikuistenops' THEN oppimaara
				--WHEN suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'aineopiskelija'
				WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'ulk_tutkinto'
				ELSE 'tietopuuttuu' 
			END,
		rnk = rank() over (
			partition by perus.master_oid, koulutus_kytkin, case when koulutus_kytkin='ammatillinen' then ps.suorituksen_tyyppi end, kal.kohortti_vp 
			order by perus.alkamispaiva, oo.alkamispaiva, ps.suorituksen_alkamispaiva, ps.suorituksen_tyyppi, oo.opiskeluoikeus_oid, perus.paatason_suoritus_id
		)

	FROM (	
		
		SELECT 
			master_oid,
			opiskeluoikeus_oid, 
			paatason_suoritus_id,
			alku AS alkamispaiva,
			koulutus_kytkin

		FROM (
			
			SELECT 
				oo.master_oid, 
				oo.opiskeluoikeus_oid,
				paatason_suoritus_id = coalesce(lps.paatason_suoritus_id, ps.paatason_suoritus_id),
				coalesce(lps.alku, ooa.alku) as alku,
				koulutus_kytkin = 
					CASE
						WHEN ps.suorituksen_tyyppi = 'valma' OR oo.tuva_jarjestamislupa = 'ammatillinen' THEN 'ammatillinen_valmentava'
						WHEN koulutusmuoto = 'ammatillinenkoulutus' AND ps.suorituksen_tyyppi IN ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') then 'ammatillinen'
						WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'internationalschooldiplomavuosiluokka', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper')
							OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
							OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' AND ps.koulutusmoduuli_koodiarvo = 'S5') 
							THEN 'yleissivistava2aste' 
					END,
				rnk = rank() over (partition by oo.opiskeluoikeus_oid, oo.koulutusmuoto order by coalesce(lps.alku, ooa.alku))
			
			FROM sa.sa_koski_opiskeluoikeus oo
			LEFT JOIN sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
			LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			LEFT JOIN sa.sa_lukio_paatason_suoritus lps ON lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and oo.koulutusmuoto in ('europeanschoolofhelsinki', 'internationalschool') and lps.rnk = 1
			
			WHERE tila IN ('lasna', 'loma') 
			AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus' 
			AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
			AND NOT (ps.suorituksen_tyyppi = 'ebtutkinto' and lps.opiskeluoikeus_oid is null)
			AND NOT EXISTS (
				SELECT 1 
				FROM sa.tuva_lasna_loma_jaksot tuvat 
				WHERE oo.koulutusmuoto != 'tuva'
				AND tuvat.master_oid = oo.master_oid
				AND coalesce(lps.alku, ooa.alku) between tuvat.alku and tuvat.loppu
			)
		) q1

		WHERE rnk = 1 
		AND koulutus_kytkin IN ('ammatillinen_valmentava', 'ammatillinen', 'yleissivistava2aste')

	) perus
	LEFT JOIN sa.temp_opintojen_kulku_kalenteri as kal ON kal.paivays = perus.alkamispaiva
	LEFT JOIN sa.sa_koski_paatason_suoritus ps ON ps.paatason_suoritus_id = perus.paatason_suoritus_id
	LEFT JOIN sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = perus.opiskeluoikeus_oid

	WHERE YEAR(perus.alkamispaiva) >= 2018
	AND YEAR(perus.alkamispaiva) <= YEAR(GETDATE())
	-- AND viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'eronnut', 'katsotaaneronneeksi', 'valmistunut')
) q

WHERE rnk = 1


SELECT DISTINCT
	q.master_oid,
	q.opiskeluoikeus_oid,
	q.koulutus_kytkin,
	q.kohortti_vp,
	q.alkamispaiva,
	q.paattymispaiva,
	q.viimeisin_tila,
	q.alku_tarkastus,
	q.tarkastuspaiva,
	q.sarja,
	q.tutkinto_koodi,
	q.oppimaara,
	q.suorituksen_tyyppi,
	q.koulutustoimija_oid,
	q.oppilaitos_oid,
	lopputulema,
	h.sukupuoli,
	h.aidinkieli,
	ika = YEAR(tarkastuspaiva) - YEAR(h.syntymaaika),
	ika_aloittaessa = YEAR(q.alkamispaiva) - YEAR(h.syntymaaika),
	ika_paattyessa = 
		CASE 
			WHEN q.lopputulema IN ('Valmistunut', 'Eronnut') THEN YEAR(q.paattymispaiva) - YEAR(h.syntymaaika)
			ELSE NULL 
		END,
	kansalaisuus = LEFT(kansalaisuus, 3),
	ooa.tila,
	COALESCE(ooa.tila, q.viimeisin_tila) AS taso2,
	CASE 
		/*JUHAN TESTI*/
		WHEN COALESCE(ooa.tila, q.viimeisin_tila) IN (/*'lasna', 'loma', 'valiaikaisestikeskeytynyt', */'valmistunut') THEN 'Valmistunut'
		WHEN COALESCE(ooa.tila, q.viimeisin_tila) IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt'/*, 'valmistunut'*/) THEN 'Koulutus kesken'
		--WHEN COALESCE(ooa.tila, q.viimeisin_tila) IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 'Koulutus kesken'
		WHEN COALESCE(ooa.tila, q.viimeisin_tila) IN ('eronnut', 'katsotaaneronneeksi', 'peruutettu') THEN 'Eronnut'
	END
	AS taso1

INTO sa.temp_opintojen_kulku_tarkastelupaivat_1

FROM (	
	
	SELECT DISTINCT 
		koh.master_oid,
		koh.opiskeluoikeus_oid,
		koh.koulutus_kytkin,
		koh.alkamispaiva,
		tutkinto_koodi,
		oppimaara,
		suorituksen_tyyppi,
		oppilaitos_oid,
		koulutustoimija_oid,
		lopputulema,
		viimeisin_tila,
		COALESCE(koh.paattymispaiva, '9999-01-01') AS paattymispaiva,
		koh.kohortti_vp,
		sarja  AS sarja,
		alku_tarkastus = 
			CASE 
				WHEN sarja IN (0, 1) THEN alkamispaiva
				ELSE DATEADD(month, (sarja - 1) * 6, alkamispaiva)
			END,
		tarkastuspaiva = DATEADD(month, sarja * 6, alkamispaiva)

	FROM sa.temp_opintojen_kulku_kohortti koh
	LEFT JOIN sa.temp_opintojen_kulku_sarja_kytkin kytkin ON kytkin.kohortti_vp = koh.kohortti_vp

	WHERE YEAR(alkamispaiva) >= 2018
	AND kytkin.kohortti_vp IS NOT NULL

) q

LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa ON q.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid AND q.tarkastuspaiva BETWEEN ooa.alku AND ooa.loppu
LEFT JOIN sa.sa_koski_henkilo_master h ON h.master_oid = q.master_oid 

GO


