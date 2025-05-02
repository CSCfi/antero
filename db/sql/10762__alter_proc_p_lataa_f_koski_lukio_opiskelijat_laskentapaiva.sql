USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_opiskelijat_laskentapaiva]    Script Date: 2.5.2025 14.04.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_laskentapaiva] AS

DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat

SELECT DISTINCT *
INTO Koski_SA.sa.temp_amm_opisk_alkamispaivat
FROM (
	SELECT DISTINCT oo.oppija_oid, 
	--	oo.opiskeluoikeus_oid,
	--	viimeisin_tila,
		YEAR(q2.alkamispaiva) AS aloitusvuosi,
		ammatillinen_koulutus_voimassa = 1
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
	--LEFT JOIN Koski_SA.sa.temp_amm_keskeytykset_kalenteri as kal ON oo.alkamispaiva = kal.paivays
	LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN (
		SELECT opiskeluoikeus_oid, alku AS alkamispaiva 
		FROM (
			SELECT oo.opiskeluoikeus_oid, oo.viimeisin_tila,
				alku,
				rnk = rank() over (partition by oo.opiskeluoikeus_oid order by ooa.alku)
			FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
			LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
			WHERE tila IN ('lasna', 'loma')
		) q1
		WHERE rnk = 1
	) q2 ON q2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'eronnut', 'katsotaaneronneeksi', 'valmistunut')
	AND ps.suorituksen_tyyppi = 'ammatillinentutkinto'
	AND koulutusmuoto = 'ammatillinenkoulutus'
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
) q


DROP TABLE IF EXISTS dw.f_koski_lukio_opiskelijat_laskentapaiva

SELECT DISTINCT 
	[opiskeluoikeus_oid]
	,tilastovuosi
	,tilastopaiva_20_1
	,tilastopaiva_20_9
	,aloitusvuosi
	,aloituskuukausi
	,[sisaltyy_opiskeluoikeuteen_oid]
	,[oppija_oid]
	,[oppilaitos_oid]
	,[koulutustoimija_oid]
	,[koulutusmuoto]
	,[koulutusmoduuli_koodiarvo]
	,suorituskieli_koodiarvo
	,[alkamispaiva]
	,[paattymispaiva]
	,oppimaara
	,suorituksen_tyyppi
	,tavoitetutkinto
	,[toimipiste_oid]
	,[toimipiste_nimi]
	,Sukupuoli
	,Ika
	,aidinkieli
	,kansalaisuus
	,syntymaaika
	,majoitus
	,sisaoppilaitosmainen_majoitus
	,jarj_tavoitetutkinto
	,yhdistelmatutkinto
	,oppivelvollinen
	
INTO dw.f_koski_lukio_opiskelijat_laskentapaiva

FROM (

	SELECT 
		[opiskeluoikeus_oid]
		,tilastovuosi
		,tilastopaiva_20_1
		,tilastopaiva_20_9
		,[sisaltyy_opiskeluoikeuteen_oid]
		,alkamispaiva
		,aloitusvuosi
		,aloituskuukausi
		,[oppija_oid]
		,[oppilaitos_oid]
		,[oppilaitos_nimi]
		,[oppilaitos_kotipaikka]
		,[oppilaitosnumero]
		,[koulutustoimija_oid]
		,[koulutustoimija_nimi]
		,[koulutusmuoto]
		,[paattymispaiva]
		,[viimeisin_tila]
		--,[koulutusmoduuli_koodiarvo]
		,[lisatiedot_henkilostokoulutus]
		,[lisatiedot_koulutusvienti]
		,[lahdejarjestelma_koodiarvo]
		,[vanha_koulutustoimija_oid]
		,[vanha_koulutustoimija_nimi]
		,oppimaara
		,suorituksen_tyyppi
		,tavoitetutkinto
		,[koulutusmoduuli_koodisto]
		,[koulutusmoduuli_koodiarvo]
		,[koulutusmoduuli_koulutustyyppi]
		,[koulutusmoduuli_laajuus_arvo]
		,[koulutusmoduuli_laajuus_yksikko]
		,[vahvistus_paiva]
		,[arviointi_arvosana_koodiarvo]
		,[arviointi_arvosana_koodisto]
		,[arviointi_hyvaksytty]
		,[arviointi_paiva]
		,[toimipiste_oid]
		,[toimipiste_nimi]  
		,suorituskieli_koodiarvo
		,Sukupuoli
		,tilastovuosi - YEAR(syntymaaika) AS Ika
		,aidinkieli
		,kansalaisuus
		,syntymaaika
		,majoitus
		,sisaoppilaitosmainen_majoitus
		,jarj_tavoitetutkinto
		,rnk = rank() over (
			partition by opiskeluoikeus_oid, koulutustoimija_oid, tilastovuosi, tilastopaiva_20_9, tilastopaiva_20_1 
			order by alkamispaiva, jarj_tavoitetutkinto, suorituksen_tyyppi, koulutusmoduuli_koodiarvo
		)
		,yhdistelmatutkinto
		,oppivelvollinen

	FROM (

		SELECT  
			vuosi AS tilastovuosi
			,CASE 
				WHEN (kuukausi = 1 AND paivays BETWEEN CASE WHEN ooa.alku > lps.alku THEN ooa.alku ELSE lps.alku END AND ooa.loppu) THEN 1
				ELSE 0
			END AS tilastopaiva_20_1
			,CASE 
				WHEN (kuukausi = 9 AND paivays BETWEEN CASE WHEN ooa.alku > lps.alku THEN ooa.alku ELSE lps.alku END AND ooa.loppu) THEN 1
				ELSE 0
			END AS tilastopaiva_20_9
			,oo.[opiskeluoikeus_oid]
			,oo.[sisaltyy_opiskeluoikeuteen_oid]
			,CASE WHEN oo.alkamispaiva > lps.alku THEN oo.alkamispaiva ELSE lps.alku END as alkamispaiva
			,CASE WHEN ooa.tila_alkanut > lps.alku THEN ooa.tila_alkanut ELSE lps.alku END as tila_alkanut
			,ooa.loppu
			,YEAR(CASE WHEN oo.alkamispaiva > lps.alku THEN oo.alkamispaiva ELSE lps.alku END) AS aloitusvuosi
			,MONTH(CASE WHEN oo.alkamispaiva > lps.alku THEN oo.alkamispaiva ELSE lps.alku END) AS aloituskuukausi
			,oo.[oppija_oid]
			,oo.[oppilaitos_oid]
			,oo.[oppilaitos_nimi]
			,oo.[oppilaitos_kotipaikka]
			,oo.[oppilaitosnumero]
			,COALESCE(org.organisaatio_oid, org2.ylaorganisaatio_oid) AS koulutustoimija_oid
			,oo.[koulutustoimija_nimi]
			,oo.[koulutusmuoto]
			,oo.[paattymispaiva]
			,oo.[viimeisin_tila]
			,oo.[lisatiedot_henkilostokoulutus]
			,oo.[lisatiedot_koulutusvienti]
			,oo.[lahdejarjestelma_koodiarvo]
			,oo.[vanha_koulutustoimija_oid]
			,oo.[vanha_koulutustoimija_nimi]
			,CASE
				WHEN ps.suorituksen_tyyppi IN ('luva', 'tuvakoulutuksensuoritus') THEN 'Aineopiskelija (ei tutkintotavoitetta)'
				WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto'
				WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 'Ulkomainen tutkinto' 
				WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5' THEN 'Ulkomainen tutkinto'
				WHEN ps.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
				WHEN ps.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
				WHEN ps.suorituksen_tyyppi in ('lukionoppiaineenoppimaara', 'lukionaineopinnot') THEN 'Aineopiskelija (ei tutkintotavoitetta)'
				WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
				ELSE 'Ei tietoa' 
			END AS oppimaara
			,CASE
				WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 'Deutsche Internationale Abitur; Reifeprüfung'
				WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 'IB-tutkinto (International Baccalaureate)'
				WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
					AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 'IB-tutkinto (International Baccalaureate)'
				WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 'IB-tutkinto (International Baccalaureate)'
				WHEN ps.suorituksen_tyyppi IN ('ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 'EB-tutkinto (European Baccalaureate)'
				WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5' THEN 'EB-tutkinto (European Baccalaureate)'
				WHEN koulutusluokitus_fi IS NULL THEN 'Ei tutkintotavoitetta'
				WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 'Ylioppilastutkinto'
				WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 'Ei tutkintotavoitetta'
				WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_fi
				ELSE 'Ei tietoa' 
			END AS tavoitetutkinto
			,ps.suorituksen_tyyppi
			,ps.[koulutusmoduuli_koodisto]
			,ps.[koulutusmoduuli_koodiarvo]
			,ps.[koulutusmoduuli_koulutustyyppi]
			,ps.[koulutusmoduuli_laajuus_arvo]
			,ps.[koulutusmoduuli_laajuus_yksikko]
			,ps.[vahvistus_paiva]
			,ps.[arviointi_arvosana_koodiarvo]
			,ps.[arviointi_arvosana_koodisto]
			,ps.[arviointi_hyvaksytty]
			,ps.[arviointi_paiva]
			,ps.[toimipiste_oid]
			,ps.suorituskieli_koodiarvo
			,ps.[toimipiste_nimi]
			,Sukupuoli = coalesce(henk.sukupuoli, '-1')
			--,Ika = YEAR(ooa.tila_alkanut) - YEAR(henk.syntymaaika)
			,CASE WHEN henk.aidinkieli IS NULL THEN '-1' ELSE henk.aidinkieli END AS aidinkieli
			,CASE WHEN henk.kansalaisuus IS NULL THEN '-1' ELSE LEFT(henk.kansalaisuus, 3) END AS kansalaisuus
			,henk.syntymaaika --CASE WHEN henk.syntymaaika IS NULL THEN '-1' ELSE henk.syntymaaika END AS syntymaaika
			,ooa.majoitus
			,ooa.sisaoppilaitosmainen_majoitus
			,CASE
				WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 2
				WHEN ps.suorituksen_tyyppi IN ('ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 3
				WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5' THEN 3
				WHEN oo.koulutusmuoto = 'ibtutkinto' THEN 4
				WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 4
				WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
					AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 4
				WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 4
				WHEN koulutusluokitus_fi IS NULL THEN 5
				WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 1
				WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 5
				WHEN [koulutusluokitus_fi] IS NOT NULL THEN 8
				ELSE 9 
			END AS jarj_tavoitetutkinto
			,CASE 
				WHEN d6.ammatillinen_koulutus_voimassa IS NULL THEN 'Ei yhdistelmätutkintoa'
				WHEN d6.ammatillinen_koulutus_voimassa = 1
					AND ps.suorituksen_tyyppi IN ('luva', 'tuvakoulutuksensuoritus') THEN 'Lukio valm. ja ammatillinen'
				WHEN d6.ammatillinen_koulutus_voimassa = 1
					AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Kaksoistutkinto-opiskelija'
				ELSE 'Kolmoistutkinto-opiskelija'
			END AS yhdistelmatutkinto
			,CASE 
				WHEN ov.oppija_oid is not null THEN 1
				ELSE 0
			END AS oppivelvollinen

		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		LEFT JOIN (SELECT DISTINCT opiskeluoikeus_oid, alku FROM Koski_SA.sa.sa_lukio_paatason_suoritus) lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ooa.loppu >= lps.alku
		LEFT JOIN dw.d_koulutusluokitus kl ON ps.koulutusmoduuli_koodiarvo = kl.koulutusluokitus_koodi
		LEFT JOIN Koski_SA.sa.sa_koski_henkilo AS henk ON oo.oppija_oid = henk.oppija_oid
		LEFT JOIN dw.d_organisaatioluokitus AS org ON oo.koulutustoimija_oid = org.organisaatio_oid
		LEFT JOIN dw.d_organisaatioluokitus AS org2 ON oo.oppilaitos_oid = org2.organisaatio_oid
		LEFT JOIN (
			SELECT MIN(ps.suorituksen_alkamispaiva) as alku, oo.opiskeluoikeus_oid 
			FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
			LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
			WHERE ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondaryupper' 
			OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5') 
			OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '10') 
			OR ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka'
			GROUP BY oo.opiskeluoikeus_oid
		) alku ON alku.opiskeluoikeus_oid = oo.opiskeluoikeus_oid

		LEFT JOIN Koski_SA.sa.temp_amm_opisk_alkamispaivat d6
			ON d6.oppija_oid = oo.oppija_oid
			AND d6.aloitusvuosi = YEAR(oo.alkamispaiva)

		CROSS JOIN (	
			SELECT paivays, vuosi, kuukausi
			FROM dw.d_kalenteri
			WHERE paiva = 20
			AND kuukausi in (1, 9)
			AND vuosi >= 2018
			AND paivays < GETDATE()
		) AS temp_table

		LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov on ov.oppija_oid = oo.oppija_oid and paivays between ov.alkuPvm and ov.loppuPvm

		WHERE (
			ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 'lukionaineopinnot', 'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'luva', 'internationalschooldiplomavuosiluokka', 'europeanschoolofhelsinkivuosiluokkasecondaryupper')
			OR tuva_jarjestamislupa = 'lukio'
			OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5')
			OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
			OR (ps.suorituksen_tyyppi = 'ebtutkinto' and alku.alku is not null)
		)
		AND ooa.tila = 'lasna'
		AND NOT EXISTS (
			SELECT 1 FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
			WHERE oo.koulutusmuoto != 'tuva'
			AND tuvat.oppija_oid = oo.oppija_oid
			AND temp_table.paivays between tuvat.alku and tuvat.loppu
		)

	) q1

	WHERE tilastopaiva_20_9 = 1 OR tilastopaiva_20_1 = 1
	
) q2
	
WHERE rnk = 1


DROP TABLE Koski_SA.sa.temp_amm_opisk_alkamispaivat

GO
