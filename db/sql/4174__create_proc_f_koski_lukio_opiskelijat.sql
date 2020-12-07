USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_opiskelijat_kuukausittain]    Script Date: 7.12.2020 7:47:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_lukio_opiskelijat_kuukausittain]

CREATE PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_kuukausittain] AS

DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu
DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_uudet
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat



SELECT DISTINCT [opiskeluoikeus_oid]
		  ,koulutustoimija_oid
		  ,temp_cal.vuosi AS vuosi
		  ,temp_cal.kuukausi AS kuukausi
		  ,majoitus
		  ,sisaoppilaitosmainen_majoitus
--		  ,temp_cal.kytkin
--		  ,rnk = rank() over (partition by opiskeluoikeus_oid, koulutustoimija_oid order by vuosi, kuukausi)
INTO KOSKI_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu
	FROM (
		SELECT DISTINCT oo.[opiskeluoikeus_oid]
		  ,COALESCE(org.organisaatio_oid, org2.ylaorganisaatio_oid) AS koulutustoimija_oid
		  ,YEAR(ooa.alku) AS alku_vuosi
		  ,MONTH(ooa.alku) AS alku_kuukausi
		  ,CASE WHEN ooa.loppu IS NULL THEN 9999 ELSE YEAR(ooa.loppu) END AS loppu_vuosi
		  ,CASE WHEN ooa.loppu IS NULL THEN 12 ELSE MONTH(ooa.loppu) END AS loppu_kuukausi
		  ,majoitus
		  ,sisaoppilaitosmainen_majoitus
	  FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid 
	  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS org ON oo.koulutustoimija_oid = org.organisaatio_oid
	  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS org2 ON oo.oppilaitos_oid = org2.organisaatio_oid
	   WHERE ((ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 
										'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'luva', 'internationalschooldiplomavuosiluokka'))
				OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12')))
	  AND ooa.tila = 'lasna'
	  AND sisaltyy_opiskeluoikeuteen_oid IS NULL
	  ) q1
	  LEFT JOIN (
			SELECT DISTINCT [vuosi]
				  ,[kuukausi]
				  ,kytkin = 1
			  FROM [ANTERO].[dw].[d_kalenteri]
			  WHERE (vuosi >= 2018 AND vuosi < YEAR(GETDATE()))
			  OR 
			  (vuosi = YEAR(GETDATE()) AND kuukausi < MONTH(GETDATE()))) 
			  AS temp_cal
			  ON (	-- ALKU 
					(
					(temp_cal.vuosi = q1.alku_vuosi AND temp_cal.kuukausi >= q1.alku_kuukausi)
					OR 
					(temp_cal.vuosi > q1.alku_vuosi ))

					AND
					--LOPPU
					(
					(temp_cal.vuosi = q1.loppu_vuosi AND temp_cal.kuukausi <= q1.loppu_kuukausi)
					OR
					(temp_cal.vuosi < q1.loppu_vuosi)))
	  
	  WHERE kytkin = 1



SELECT DISTINCT [opiskeluoikeus_oid]
		  ,[oppija_oid]
		  ,[koulutustoimija_oid]
		  ,vuosi
		  ,kuukausi
INTO Koski_SA.sa.temp_lukio_uudet
FROM(
SELECT DISTINCT oppija_oid
		,[opiskeluoikeus_oid]
		  ,vuosi
		  ,kuukausi
		  ,[koulutustoimija_oid]
		  ,rnk = rank() over (partition by oppija_oid, koulutustoimija_oid order by tila_alkanut)
	FROM (
		SELECT  oo.oppija_oid
		,oo.[opiskeluoikeus_oid]
		,COALESCE(org.organisaatio_oid, org2.ylaorganisaatio_oid) AS koulutustoimija_oid
		  ,ooa.tila_alkanut
		  ,YEAR(ooa.tila_alkanut) AS vuosi
		  ,MONTH(ooa.tila_alkanut) AS kuukausi
		 -- ,CASE 
			--WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN '301102'
			--WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
			--	AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN '301102'
			--WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN '301102'
			--ELSE ps.koulutusmoduuli_koodiarvo END
			--AS koulutusmoduuli_koodiarvo
	  FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS org ON oo.koulutustoimija_oid = org.organisaatio_oid
	  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS org2 ON oo.oppilaitos_oid = org2.organisaatio_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_henkilo AS henk ON oo.oppija_oid = henk.oppija_oid
	  WHERE ((ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 
										'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'luva', 'internationalschooldiplomavuosiluokka'))
				OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12')))
	  AND ooa.tila = 'lasna'
	  AND YEAR(oo.alkamispaiva) >= 2018
	  AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
	  ) q1
	) q2
WHERE rnk = 1

-- KAKSOISTUTKINTO-OPISKELIJAT
-- Katsotaan ammatillisen koulutuksen aloitusvuosia

SELECT DISTINCT *
INTO Koski_SA.sa.temp_amm_opisk_alkamispaivat
FROM(
SELECT DISTINCT oo.oppija_oid, 
--	oo.opiskeluoikeus_oid,
--	viimeisin_tila,
	YEAR(q2.alkamispaiva) AS aloitusvuosi,
	ammatillinen_koulutus_voimassa = 1
FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
--LEFT JOIN Koski_SA.sa.temp_amm_keskeytykset_kalenteri as kal ON oo.alkamispaiva = kal.paivays
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN (SELECT opiskeluoikeus_oid, alku AS alkamispaiva FROM (
		SELECT oo.opiskeluoikeus_oid, oo.viimeisin_tila,
		alku,
		rnk = rank() over (partition by oo.opiskeluoikeus_oid order by ooa.alku)
		FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		WHERE tila IN ('lasna', 'loma')) q1
		WHERE rnk = 1
		) q2 ON q2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
WHERE-- YEAR(oo.alkamispaiva) >= 2018
--AND YEAR(oo.alkamispaiva) <= 2020
 viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'eronnut', 'katsotaaneronneeksi', 'valmistunut')
AND ps.suorituksen_tyyppi = 'ammatillinentutkinto'
AND koulutusmuoto = 'ammatillinenkoulutus'
AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL) q


DROP TABLE IF EXISTS ANTERO.dw.f_koski_lukio_opiskelijat_kuukausittain
SELECT DISTINCT
		vt.[opiskeluoikeus_oid]
	  ,oo.oppija_oid
      ,vt.[vuosi]
      ,vt.[kuukausi]
	  ,lukukausi = 
		CASE 
			WHEN vt.kuukausi < 8 THEN 'Kevätlukukausi'
			WHEN vt.kuukausi >= 8 THEN 'Syyslukukausi'
			END
	  ,lukuvuosi = 
		CASE 
			WHEN vt.kuukausi < 8 THEN CONCAT(vt.vuosi - 1, '/', vt.vuosi)
			WHEN vt.kuukausi >= 8 THEN CONCAT(vt.vuosi, '/', vt.vuosi + 1)
			END
	  ,YEAR(oo.alkamispaiva) AS aloitusvuosi
	  ,MONTH(oo.alkamispaiva) AS aloituskuukausi
      ,vt.[koulutustoimija_oid]
	  ,ps.toimipiste_oid
	  ,oo.oppilaitos_oid
--	  ,ps.suorituksen_tyyppi
	  ,ps.suorituskieli_koodiarvo
	  ,oo.koulutusmuoto
--	  ,ps.koulutusmoduuli_koodiarvo
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
		WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 'Lukiokoulutukseen valmistava koulutus'
		ELSE 'Yleissivistävä lukiokoulutus' END
		AS koulutus

	  ,vt.majoitus
	  ,vt.sisaoppilaitosmainen_majoitus
	  ,CASE
		WHEN vt.kuukausi >= MONTH(henk.syntymaaika) THEN vt.vuosi - YEAR(henk.syntymaaika)
		ELSE vt.vuosi - YEAR(henk.syntymaaika) - 1 END
		AS ika
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
	  ,CASE WHEN henk.aidinkieli IS NULL THEN '-1' ELSE henk.aidinkieli END AS aidinkieli
	  ,CASE WHEN henk.kansalaisuus IS NULL THEN '-1' ELSE LEFT(henk.kansalaisuus, 3) END AS kansalaisuus
	  ,CASE WHEN henk.syntymaaika IS NULL THEN '-1' ELSE henk.syntymaaika END AS syntymaaika
	  ,Sukupuoli = (CASE WHEN CAST(SUBSTRING(henk.hetu,8,3) AS INT) % 2 = 1 THEN '2' WHEN CAST(SUBSTRING(henk.hetu,8,3) AS INT) % 2 = 0 THEN '1' ELSE NULL END)
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
	  ,CASE 
		WHEN uudet.oppija_oid IS NOT NULL THEN 1
		ELSE 0 END
		AS uusi_opiskelija
	  ,CASE 
		WHEN d6.ammatillinen_koulutus_voimassa IS NULL THEN 'Ei yhdistelmätutkintoa'
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi = 'luva' THEN 'Lukio valm. ja ammatillinen'
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Kaksoistutkinto-opiskelija'
		ELSE 'Kolmoistutkinto-opiskelija'
		END
		AS yhdistelmatutkinto
	  ,CASE 
		WHEN d6.ammatillinen_koulutus_voimassa IS NULL THEN 4
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi = 'luva' THEN 3
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 1
		ELSE 2
		END
		AS jarj_yhdistelmatutkinto
  INTO ANTERO.dw.f_koski_lukio_opiskelijat_kuukausittain
  FROM [Koski_SA].[sa].[temp_lukio_opiskelijat_kuukausi_valitaulu]  vt
	  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus AS oo 
		ON oo.opiskeluoikeus_oid = vt.opiskeluoikeus_oid AND vt.koulutustoimija_oid = oo.koulutustoimija_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_henkilo AS henk ON oo.oppija_oid = henk.oppija_oid
	  LEFT JOIN ANTERO.dw.d_koulutusluokitus AS d5 ON ps.koulutusmoduuli_koodiarvo = d5.koulutusluokitus_koodi
	  LEFT JOIN Koski_SA.sa.temp_lukio_uudet uudet
		ON  vt.opiskeluoikeus_oid = uudet.opiskeluoikeus_oid AND
		   vt.vuosi = uudet.vuosi AND
		   vt.kuukausi = uudet.kuukausi
	   LEFT JOIN Koski_SA.sa.temp_amm_opisk_alkamispaivat d6
		ON d6.oppija_oid = oo.oppija_oid
		AND d6.aloitusvuosi = YEAR(oo.alkamispaiva)
	   WHERE ((ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 
										'lukionoppimaara', 'diatutkintovaihe', 'luva', 'diavalmistavavaihe', 'internationalschooldiplomavuosiluokka'))
				OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12')))
			AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL

DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu
DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_uudet
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat









GO
USE ANTERO

