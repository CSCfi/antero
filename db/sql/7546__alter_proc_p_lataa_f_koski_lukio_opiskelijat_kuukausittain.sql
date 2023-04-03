USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_opiskelijat_kuukausittain]    Script Date: 3.4.2023 12:32:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_kuukausittain] AS


DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu
DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_uudet
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat

SELECT DISTINCT 
	[opiskeluoikeus_oid]
	,koulutustoimija_oid
	,temp_cal.vuosi AS vuosi
	,temp_cal.kuukausi AS kuukausi
	,majoitus
	,sisaoppilaitosmainen_majoitus
	--,temp_cal.kytkin
	--,rnk = rank() over (partition by opiskeluoikeus_oid, koulutustoimija_oid order by vuosi, kuukausi)
INTO KOSKI_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu

FROM (

	SELECT DISTINCT 
		oo.[opiskeluoikeus_oid]
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
	
	WHERE (
		ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'luva', 'internationalschooldiplomavuosiluokka')
		OR tuva_jarjestamislupa = 'lukio'
		OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
	)
	AND ooa.tila = 'lasna'
	AND sisaltyy_opiskeluoikeuteen_oid IS NULL

) q1

LEFT JOIN (

	SELECT DISTINCT 
		[vuosi]
		,[kuukausi]
		,kytkin = 1
	FROM [ANTERO].[dw].[d_kalenteri]
	WHERE (vuosi >= 2018 AND vuosi < YEAR(GETDATE()))
	OR (vuosi = YEAR(GETDATE()) AND kuukausi < MONTH(GETDATE()))

) AS temp_cal ON (	 
	--ALKU
	(
		(temp_cal.vuosi = q1.alku_vuosi AND temp_cal.kuukausi >= q1.alku_kuukausi)
		OR (temp_cal.vuosi > q1.alku_vuosi )
	)
	AND
	--LOPPU
	(
		(temp_cal.vuosi = q1.loppu_vuosi AND temp_cal.kuukausi <= q1.loppu_kuukausi)
		OR (temp_cal.vuosi < q1.loppu_vuosi)
	)
)
WHERE kytkin = 1


SELECT DISTINCT 
	[opiskeluoikeus_oid]
	,[oppija_oid]
	,[koulutustoimija_oid]
	,vuosi
	,kuukausi
INTO Koski_SA.sa.temp_lukio_uudet

FROM (

	SELECT DISTINCT 
		oppija_oid
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
			--,CASE 
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

		WHERE (
			ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'luva', 'internationalschooldiplomavuosiluokka')
			OR tuva_jarjestamislupa = 'lukio'
			OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
		)
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

FROM (

	SELECT DISTINCT 
		oo.oppija_oid, 
		--oo.opiskeluoikeus_oid,
		--viimeisin_tila,
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

	WHERE-- YEAR(oo.alkamispaiva) >= 2018
	--AND YEAR(oo.alkamispaiva) <= 2020
	viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'eronnut', 'katsotaaneronneeksi', 'valmistunut')
	AND ps.suorituksen_tyyppi = 'ammatillinentutkinto'
	AND koulutusmuoto = 'ammatillinenkoulutus'
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
	
) q


DROP TABLE IF EXISTS ANTERO.dw.f_koski_lukio_opiskelijat_kuukausittain

SELECT DISTINCT
	vt.[opiskeluoikeus_oid]
	,oo.oppija_oid
	,vt.[vuosi]
	,vt.[kuukausi]
	,lukukausi = 
	CASE 
		WHEN vt.kuukausi < 8 THEN 'Kev�tlukukausi'
		WHEN vt.kuukausi >= 8 THEN 'Syyslukukausi'
	END
	,lukuvuosi = 
		CASE 
			WHEN vt.kuukausi < 8 THEN CONCAT(vt.vuosi - 1, '/', vt.vuosi)
			WHEN vt.kuukausi >= 8 THEN CONCAT(vt.vuosi, '/', vt.vuosi + 1)
		END
	,YEAR(oo.alkamispaiva) AS aloitusvuosi
	,MONTH(oo.alkamispaiva) AS aloituskuukausi
	,aloitusajankohta = coalesce(cast(year(oo.alkamispaiva) as varchar) + '/' + right('0' + cast(month(oo.alkamispaiva) as varchar), 2), '-1')
	,aloitus_kuukauden_aikana_1_0 = 
		case
			when year(oo.alkamispaiva) = vt.vuosi and month(oo.alkamispaiva) = vt.kuukausi then 1
			else 0
		end
	,vt.[koulutustoimija_oid]
	,ps.toimipiste_oid
	,oo.oppilaitos_oid
	--,ps.suorituksen_tyyppi
	,suorituskieli_koodiarvo
	,oo.koulutusmuoto
	--,ps.koulutusmoduuli_koodiarvo
	,CASE
		WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 'Deutsche Internationale Abitur; Reifepr�fung'
		WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 'IB-tutkinto (International Baccalaureate)'
		WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
				AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 'IB-tutkinto (International Baccalaureate)'
		WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 'IB-tutkinto (International Baccalaureate)'
		WHEN koulutusluokitus_fi IS NULL THEN 'Ei tutkintotavoitetta'
		WHEN [koulutusluokitus_fi] = 'Lukion oppim��r�' THEN 'Ylioppilastutkinto'
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppim��r�', 'Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 'Ei tutkintotavoitetta'
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_fi
		ELSE 'Ei tietoa' 
	END AS tavoitetutkinto
	,CASE
		WHEN koulutusluokitus_fi IN ('Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN koulutusluokitus_fi
		ELSE 'Yleissivist�v� lukiokoulutus' 
	END AS koulutus
	,vt.majoitus
	,vt.sisaoppilaitosmainen_majoitus
	,vt.vuosi - YEAR(henk.syntymaaika) AS ika
	--lis�tty 'lukionaineopinnot'. MK 15.3.2023
	,CASE
		WHEN ps.suorituksen_tyyppi IN ('luva', 'tuvakoulutuksensuoritus') THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto'
		WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe') THEN 'Ulkomainen tutkinto' 
		WHEN ps.[oppimaara] = 'nuortenops' THEN 'Nuorten oppim��r�'
		WHEN ps.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppim��r�'
		WHEN ps.suorituksen_tyyppi IN ('lukionoppiaineenoppimaara', 'lukionaineopinnot') THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
		ELSE 'Ei tietoa' 
	END AS oppimaara
	,CASE WHEN henk.aidinkieli IS NULL THEN '-1' ELSE henk.aidinkieli END AS aidinkieli
	,CASE WHEN henk.kansalaisuus IS NULL THEN '-1' ELSE LEFT(henk.kansalaisuus, 3) END AS kansalaisuus
	,CASE WHEN henk.syntymaaika IS NULL THEN '-1' ELSE henk.syntymaaika END AS syntymaaika
	,Sukupuoli = henk.sukupuoli
	,CASE
		WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 2
		WHEN oo.koulutusmuoto = 'ibtutkinto' THEN 3
		WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 3
		WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
			AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 3
		WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 3
		WHEN koulutusluokitus_fi IS NULL THEN 4
		WHEN [koulutusluokitus_fi] = 'Lukion oppim��r�' THEN 1
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppim��r�', 'Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 4
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN 8
		ELSE 9 
	END AS jarj_tavoitetutkinto
	,CASE WHEN koulutusluokitus_fi IN ('Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 2 ELSE 1 END AS jarj_koulutus
	,CASE WHEN uudet.oppija_oid IS NOT NULL THEN 1 ELSE 0 END AS uusi_opiskelija
	,CASE 
		WHEN d6.ammatillinen_koulutus_voimassa IS NULL THEN 'Ei yhdistelm�tutkintoa'
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi IN ('luva', 'tuvakoulutuksensuoritus') THEN 'Lukio valm. ja ammatillinen'
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Kaksoistutkinto-opiskelija'
		ELSE 'Kolmoistutkinto-opiskelija'
	END AS yhdistelmatutkinto
	,CASE 
		WHEN d6.ammatillinen_koulutus_voimassa IS NULL THEN 4
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi IN ('luva', 'tuvakoulutuksensuoritus') THEN 3
		WHEN d6.ammatillinen_koulutus_voimassa = 1
			AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 1
		ELSE 2
	END AS jarj_yhdistelmatutkinto
	,eronnut = case when ero.opiskeluoikeus_oid Is null then 0 else 1 end
	,jatkaa_kj = COALESCE(ero.jatkaa_kj, 0)
	,jatkaa_oppilaitos = COALESCE(ero.jatkaa_oppilaitos, 0)
	,jatkaa_tutkintotyyppi = COALESCE(ero.jatkaa_tutkintotyyppi, 0)
	,jatkaa_ammatillinen = COALESCE(ero.jatkaa_ammatillinen, 0)
	,jatkaa_yleissivistava = COALESCE(ero.jatkaa_yleissivistava, 0)
	,jatkaa_valmentava = COALESCE(ero.jatkaa_valmentava, 0)
	,jatkaa_lukio_valmentava = COALESCE(ero.jatkaa_lukio_valmentava, 0)
	,jatkaa_amm_valmentava = COALESCE(ero.jatkaa_amm_valmentava, 0)
	,jatkaa_muu_ammatillinen = COALESCE(ero.jatkaa_muu_ammatillinen, 0)
	,jatkaa_amm_tutkintokoulutus = COALESCE(ero.jatkaa_amm_tutkintokoulutus, 0)
	,[jatkaa_oppimaara] = COALESCE(ero.jatkaa_oppimaara, 0)
	,[vaihto_oppimaara] = COALESCE(ero.vaihto_oppimaara, 0)
	,[jatkaa_aikuistenops] = COALESCE(ero.jatkaa_aikuistenops, 0)
	,[jatkaa_nuortenops] = COALESCE(ero.jatkaa_nuortenops, 0)
	,[jatkaa_lukioaine] = COALESCE(ero.jatkaa_lukioaine, 0)
	,[jatkaa_lukio_ulkomainen] = COALESCE(ero.jatkaa_lukio_ulkomainen, 0)
	,d_keskeyttaminen_vaiheittainen_id = COALESCE(kvaih.id, -1)
	--CSCVIPUNEN-3345 15.3.2023
	,CASE
		WHEN d7.maakunta_koodi IS NULL THEN -1
		WHEN (d7.maakunta_koodi IN ('21', '-1', '98')) THEN 0
		ELSE 1
	END AS kotikunta_manner_suomessa
	,CASE
		WHEN ((d7.maakunta_koodi NOT IN ('21', '-1', '98') AND d7.maakunta_koodi IS NOT NULL) AND --Kotikunta Manner-Suomessa
			 (oovap.vapautettu IS NULL OR (oovap.vapautettu > DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1) AND oovap.mitatoity = '9999-01-01')) AND --Ei vapautusta oppivelvollisuudesta
			 ((vt.vuosi-YEAR(henk.syntymaaika) >= 7 AND FLOOR(DATEDIFF(DAY, henk.syntymaaika, DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1)) / 365.25)< 18) OR --Henkil� on yli 7-vuotias, mutta alle 18-vuotias
			 (vt.vuosi-YEAR(henk.syntymaaika) < 7 AND (ooa.pidennetty_oppivelvollisuus = 1 AND DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1) BETWEEN ooa.alku AND ooa.loppu))) AND --Henkil� on alle 7-vuotias, mutta tarkastelup�iv�n� Koski-opiskeluoikeusdatan mukaan pidennetyn oppivelvollisuuden piiriss�
			 (spvm.tutkinto_suoritettu > DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1) OR spvm.tutkinto_suoritettu IS NULL)) THEN 1 --Henkil� ei ole suorittanut ylioppilastutkintoa tai ammatillista tutkintoa
		ELSE 0
	END AS oppivelvollinen
	--CSCVIPUNEN-3345 15.3.2023

INTO ANTERO.dw.f_koski_lukio_opiskelijat_kuukausittain
	
FROM [Koski_SA].[sa].[temp_lukio_opiskelijat_kuukausi_valitaulu] vt

LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus AS oo 
	ON oo.opiskeluoikeus_oid = vt.opiskeluoikeus_oid AND vt.koulutustoimija_oid = oo.koulutustoimija_oid
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_koski_henkilo AS henk ON oo.oppija_oid = henk.oppija_oid
LEFT JOIN ANTERO.dw.d_koulutusluokitus AS d5 ON ps.koulutusmoduuli_koodiarvo = d5.koulutusluokitus_koodi
LEFT JOIN Koski_SA.sa.temp_lukio_uudet uudet
	ON vt.opiskeluoikeus_oid = uudet.opiskeluoikeus_oid 
	AND vt.vuosi = uudet.vuosi 
	AND vt.kuukausi = uudet.kuukausi
LEFT JOIN Koski_SA.sa.temp_amm_opisk_alkamispaivat d6
	ON d6.oppija_oid = oo.oppija_oid
	AND d6.aloitusvuosi = YEAR(oo.alkamispaiva)
LEFT JOIN Koski_SA.dbo.toisen_asteen_keskeyttaneet ero 
	ON vt.opiskeluoikeus_oid = ero.opiskeluoikeus_oid
	AND vt.kuukausi = ero.kuukausi
	AND vt.vuosi = ero.vuosi
LEFT JOIN ANTERO.dw.d_keskeyttaminen_vaiheittainen kvaih ON kvaih.keskeyttaminen_vaiheittainen_koodi = ero.keskeyttaminen_vaiheittainen_koodi
--CSCVIPUNEN-3345 15.3.2023
LEFT JOIN ANTERO.dw.d_alueluokitus d7 ON henk.kotikunta = d7.kunta_koodi
LEFT JOIN Koski_SA.sa.sa_valpas_oppivelvollisuudesta_vapautetut oovap ON oo.oppija_oid = oovap.oppija_oid
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON vt.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid AND DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1) BETWEEN ooa.alku AND ooa.loppu
LEFT JOIN (
	SELECT
	oo.oppija_oid,
	MIN(ps.vahvistus_paiva) as tutkinto_suoritettu
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	WHERE oo.paattymispaiva is not null AND oo.viimeisin_tila = 'valmistunut' AND
	((ps.suorituksen_tyyppi in('ammatillinentutkinto','ibtutkinto','lukionoppimaara','diatutkintovaihe')) OR
	(ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' AND ps.koulutusmoduuli_koodiarvo = '12')) AND
	oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1
	GROUP BY oo.oppija_oid
) spvm on spvm.oppija_oid = oo.oppija_oid
--CSCVIPUNEN-3345 15.3.2023

--lis�tty 'lukionaineopinnot'. MK 15.3.2023
WHERE (
	ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 'lukionaineopinnot', 'lukionoppimaara', 'diatutkintovaihe', 'luva', 'diavalmistavavaihe', 'internationalschooldiplomavuosiluokka')
	OR tuva_jarjestamislupa = 'lukio'
	OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
)
AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL


DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu
DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_uudet
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat











GO


