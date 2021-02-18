USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_opiskelijat_laskentapaiva]    Script Date: 9.2.2021 8:34:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_laskentapaiva] AS

DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat

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


DROP TABLE IF EXISTS ANTERO.dw.f_koski_lukio_opiskelijat_laskentapaiva

SELECT DISTINCT [opiskeluoikeus_oid]
		  ,aloitusvuosi
		  ,aloituskuukausi
		  ,laskentapaiva
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
INTO ANTERO.dw.f_koski_lukio_opiskelijat_laskentapaiva
FROM(
SELECT [opiskeluoikeus_oid]
			,paivays AS laskentapaiva
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
	--	  ,[koulutusmoduuli_koodiarvo]
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
		  ,YEAR(paivays) - YEAR(syntymaaika) AS Ika
		 ,aidinkieli
		,kansalaisuus
		,syntymaaika
		,majoitus
		,sisaoppilaitosmainen_majoitus
		,jarj_tavoitetutkinto
		,rnk = rank() over (partition by opiskeluoikeus_oid, koulutustoimija_oid, paivays order by alkamispaiva, paivays, suorituksen_tyyppi)
		,yhdistelmatutkinto
	FROM (
		SELECT  oo.[opiskeluoikeus_oid]
		  ,oo.[sisaltyy_opiskeluoikeuteen_oid]
		  ,oo.alkamispaiva
		  ,ooa.tila_alkanut
		  ,ooa.loppu
			 ,YEAR(oo.alkamispaiva) AS aloitusvuosi
			,MONTH(oo.alkamispaiva) AS aloituskuukausi
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
		WHEN oo.koulutusmuoto IN ('diatutkintovaihe', 'diavalmistavavaihe') THEN 'Deutsche Internationale Abitur; Reifeprüfung'
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
		  ,Sukupuoli = (CASE WHEN CAST(SUBSTRING(henk.hetu,8,3) AS INT) % 2 = 1 THEN '1' WHEN CAST(SUBSTRING(henk.hetu,8,3) AS INT) % 2 = 0 THEN '2' ELSE '-1' END)
--		  ,Ika = YEAR(ooa.tila_alkanut) - YEAR(henk.syntymaaika)
		  ,temp_table.paivays
		  ,CASE 
			WHEN (paivays > ooa.alku AND ooa.loppu IS NULL AND ps.vahvistus_paiva IS NULL) THEN 1
			WHEN (paivays BETWEEN ooa.alku AND ooa.loppu) THEN 1
			ELSE 0 END AS kytkin_laskentapaiva
		,CASE WHEN henk.aidinkieli IS NULL THEN '-1' ELSE henk.aidinkieli END AS aidinkieli
		,CASE WHEN henk.kansalaisuus IS NULL THEN '-1' ELSE LEFT(henk.kansalaisuus, 3) END AS kansalaisuus
		,CASE WHEN henk.syntymaaika IS NULL THEN '-1' ELSE henk.syntymaaika END AS syntymaaika
		,ooa.majoitus
		,ooa.sisaoppilaitosmainen_majoitus
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
		WHEN d6.ammatillinen_koulutus_voimassa IS NULL THEN 'Ei yhdistelmätutkintoa'
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi = 'luva' THEN 'Lukio valm. ja ammatillinen'
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Kaksoistutkinto-opiskelija'
		ELSE 'Kolmoistutkinto-opiskelija'
		END
		AS yhdistelmatutkinto
	  --INTO Koski_SA.sa.sa_lukio_uudet_opiskelijat
	  FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	  LEFT JOIN ANTERO.dw.d_koulutusluokitus kl ON ps.koulutusmoduuli_koodiarvo = kl.koulutusluokitus_koodi
	  LEFT JOIN Koski_SA.sa.sa_koski_henkilo AS henk ON oo.oppija_oid = henk.oppija_oid
	  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS org ON oo.koulutustoimija_oid = org.organisaatio_oid
	  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS org2 ON oo.oppilaitos_oid = org2.organisaatio_oid
	  LEFT JOIN Koski_SA.sa.temp_amm_opisk_alkamispaivat d6
		ON d6.oppija_oid = oo.oppija_oid
		AND d6.aloitusvuosi = YEAR(oo.alkamispaiva)
	  CROSS JOIN (SELECT paivays FROM ANTERO.dw.d_kalenteri
					WHERE paiva = 20
					AND kuukausi = 9
					AND vuosi >= 2018
					AND paivays < GETDATE()) AS temp_table
	  WHERE ((ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 
										'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'luva', 'internationalschooldiplomavuosiluokka'))
				OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12')))
	  AND ooa.tila = 'lasna'

	  ) q1
	  WHERE kytkin_laskentapaiva = 1
	) q2
	WHERE rnk = 1



DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat


GO
USE ANTERO


