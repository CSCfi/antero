USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_lukio_paatason_suoritus]    Script Date: 22.10.2024 14:53:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_lukio_paatason_suoritus] AS

DROP TABLE IF EXISTS sa.sa_lukio_paatason_suoritus

SELECT
	a.opiskeluoikeus_oid
	,a.paatason_suoritus_id
	,a.suorituksen_tyyppi
	,a.tavoitetutkinto_koodi
	,a.tavoitetutkinto
	,a.oppimaara
	,a.koulutus
	,a.toimipiste_oid
	,a.suorituskieli_koodiarvo
	,a.vahvistus_paiva
	,a.alku
	,jarj_koulutus
	,jarj_tavoitetutkinto
	,a.rnk

INTO sa.sa_lukio_paatason_suoritus

FROM
(
	SELECT *, RANK() OVER (PARTITION BY opiskeluoikeus_oid ORDER BY suorituksen_tyyppi,tavoitetutkinto) as rnk 
	FROM
	(
		SELECT DISTINCT 
			 ps.opiskeluoikeus_oid
			,paatason_suoritus_id
			,suorituksen_tyyppi
			,tavoitetutkinto_koodi = 
				case 
					when ps.suorituksen_tyyppi = 'lukionoppimaara' then '301101'
					when oo.koulutusmuoto in ('ibtutkinto', 'internationalschool') then '301102'
					when oo.koulutusmuoto = 'diatutkinto' then '301103'
					when oo.koulutusmuoto = 'europeanschoolofhelsinki' then '301104'
				end
			,CASE
				WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 'Deutsche Internationale Abitur; Reifeprüfung'
				WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 'IB-tutkinto (International Baccalaureate)'
				WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
						AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 'IB-tutkinto (International Baccalaureate)'
				WHEN ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' THEN 'IB-tutkinto (International Baccalaureate)'
				WHEN oo.koulutusmuoto = 'europeanschoolofhelsinki' THEN 'EB-tutkinto (European Baccalaureate)'
				WHEN koulutusluokitus_fi IS NULL THEN 'Ei tutkintotavoitetta'
				WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 'Ylioppilastutkinto'
				WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 'Ei tutkintotavoitetta'
				WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_fi
				ELSE 'Ei tietoa' END
				AS tavoitetutkinto
			  --lisätty 'lukionaineopinnot'. JS 8.2.2023
			  ,CASE
				WHEN ps.suorituksen_tyyppi IN ('luva', 'tuvakoulutuksensuoritus') THEN 'Aineopiskelija (ei tutkintotavoitetta)'
				WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto'
				WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondarylower', 'europeanschoolofhelsinkivuosiluokkasecondaryupper', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe') THEN 'Ulkomainen tutkinto' 
				WHEN ps.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
				WHEN ps.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
				WHEN ps.suorituksen_tyyppi IN ('lukionoppiaineenoppimaara', 'lukionaineopinnot') THEN 'Aineopiskelija (ei tutkintotavoitetta)'
				WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
				ELSE 'Ei tietoa' END
				AS oppimaara
			  --nuorten/aikuisten aikuisten erottelu myös luva-/aineopiskelijoille. JS 8.2.2023
			  ,coalesce(ps.oppimaara, 'Ei tietoa')
				AS oppimaara2
			,CASE
				WHEN koulutusluokitus_fi IN ('Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN koulutusluokitus_fi
				ELSE 'Yleissivistävä lukiokoulutus' END
				AS koulutus
			,CASE
				WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 2
				WHEN oo.koulutusmuoto = 'europeanschoolofhelsinki' THEN 3
				WHEN oo.koulutusmuoto = 'ibtutkinto' THEN 4
				WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 4
				WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
						AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 4
				WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 4
				WHEN koulutusluokitus_fi IS NULL THEN 5
				WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 1
				WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 5
				WHEN [koulutusluokitus_fi] IS NOT NULL THEN 8
				ELSE 9 END
				AS jarj_tavoitetutkinto
			,CASE
				WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 2
				WHEN koulutusluokitus_fi = 'Tutkintokoulutukseen valmentava koulutus' THEN 3
				ELSE 1 END
				AS jarj_koulutus
			,toimipiste_oid
			,suorituskieli_koodiarvo
			,vahvistus_paiva
			,coalesce(alku.alku, ooa.alku) as alku
			,rnk1
		FROM sa.sa_koski_paatason_suoritus ps		
		
		JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		
		LEFT JOIN (
			SELECT *, rnk1 = RANK() OVER (PARTITION BY opiskeluoikeus_oid ORDER BY alku)
			FROM sa.sa_koski_opiskeluoikeus_aikajakso
			WHERE tila = 'lasna'
		) ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN (
			SELECT MIN(ps.suorituksen_alkamispaiva) as alku, oo.opiskeluoikeus_oid FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
			LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
			WHERE ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondaryupper' OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5') OR
				  (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '10') OR ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka'
			GROUP BY oo.opiskeluoikeus_oid
		) alku ON alku.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN ANTERO.dw.d_koulutusluokitus AS d5 ON ps.koulutusmoduuli_koodiarvo = d5.koulutusluokitus_koodi
		
		WHERE (
			ps.suorituksen_tyyppi IN ('ibtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper', 'preiboppimaara', 'lukionoppiaineenoppimaara', 'lukionaineopinnot', 'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'luva', 'internationalschooldiplomavuosiluokka')
			OR oo.tuva_jarjestamislupa = 'lukio'
			OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
			OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' AND ps.koulutusmoduuli_koodiarvo = 'S5')
			OR (ps.suorituksen_tyyppi = 'ebtutkinto' and alku.alku is not null) 
		)
		AND rnk1 = 1 
		
	) b

) a

GO

