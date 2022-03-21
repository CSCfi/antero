USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_lukio_paatason_suoritus]    Script Date: 22.12.2021 11:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_lukio_paatason_suoritus] AS


TRUNCATE TABLE sa.sa_lukio_paatason_suoritus

INSERT INTO sa.sa_lukio_paatason_suoritus

SELECT
	 a.opiskeluoikeus_oid
	,a.paatason_suoritus_id
	,a.suorituksen_tyyppi
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
FROM
(
SELECT *, RANK() OVER (PARTITION BY opiskeluoikeus_oid ORDER BY suorituksen_tyyppi,tavoitetutkinto) as rnk 
FROM
(
	SELECT DISTINCT 
		 ps.opiskeluoikeus_oid
		,paatason_suoritus_id
		,suorituksen_tyyppi
	--	,koulutusmoduuli_koodiarvo
		,CASE
			WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 'Deutsche Internationale Abitur; Reifeprüfung'
			WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 'IB-tutkinto (International Baccalaureate)'
			WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
					AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 'IB-tutkinto (International Baccalaureate)'
			WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 'IB-tutkinto (International Baccalaureate)'
			WHEN koulutusluokitus_fi IS NULL THEN 'Ei tutkintotavoitetta'
			WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 'Ylioppilastutkinto'
			WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus') THEN 'Ei tutkintotavoitetta'
			WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_fi
			ELSE 'Ei tietoa' END
			AS tavoitetutkinto
		  ,CASE
			WHEN ps.suorituksen_tyyppi = 'luva' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
			WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto'
			WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe') THEN 'Ulkomainen tutkinto' 
			WHEN ps.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
			WHEN ps.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
			WHEN ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
			WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
			ELSE 'Ei tietoa' END
			AS oppimaara
		,CASE
			WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 'Lukiokoulutukseen valmistava koulutus'
			ELSE 'Yleissivistävä lukiokoulutus' END
			AS koulutus
		,CASE
			WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 2
			WHEN oo.koulutusmuoto = 'ibtutkinto' THEN 3
			WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 3
			WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
					AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 3
			WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 3
			WHEN koulutusluokitus_fi IS NULL THEN 4
			WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 1
			WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus') THEN 4
			WHEN [koulutusluokitus_fi] IS NOT NULL THEN 8
			ELSE 9 END
			AS jarj_tavoitetutkinto
		,CASE
			WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 2
			ELSE 1 END
			AS jarj_koulutus
		,toimipiste_oid
		,suorituskieli_koodiarvo = 
			case 
				when ps.suorituskieli_koodiarvo	in ('EN', 'FR', 'RI', 'SV', 'SE', 'DE', 'FI', 'RU', 'VK') then ps.suorituskieli_koodiarvo
				else 'XX'
			end	
		,vahvistus_paiva
		,alku
		,rnk1

	FROM sa.sa_koski_paatason_suoritus ps		
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	LEFT JOIN (SELECT * ,
				rnk1 = RANK() OVER (PARTITION BY opiskeluoikeus_oid ORDER BY alku)
				FROM
				sa.sa_koski_opiskeluoikeus_aikajakso
				WHERE tila = 'lasna') ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN ANTERO.dw.d_koulutusluokitus AS d5 ON ps.koulutusmoduuli_koodiarvo = d5.koulutusluokitus_koodi
	  WHERE ((ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 
										'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'luva', 'internationalschooldiplomavuosiluokka'))
				OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12')))
		AND rnk1 = 1

) b  ) a



