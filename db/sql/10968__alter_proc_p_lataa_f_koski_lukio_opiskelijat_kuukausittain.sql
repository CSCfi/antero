USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_opiskelijat_kuukausittain]    Script Date: 30.7.2025 10.39.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_kuukausittain] AS

DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu
DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_uudet
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat


--opiskelijat
SELECT DISTINCT 
	[opiskeluoikeus_oid]
	,koulutustoimija_oid
	,temp_cal.vuosi AS vuosi
	,temp_cal.kuukausi AS kuukausi
	,majoitus
	,sisaoppilaitosmainen_majoitus
	--,temp_cal.kytkin
	--,rnk = rank() over (partition by opiskeluoikeus_oid, koulutustoimija_oid order by vuosi, kuukausi)
INTO Koski_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu
FROM (
	SELECT DISTINCT 
		oo.master_oid
		,oo.[opiskeluoikeus_oid]
		,oo.koulutusmuoto
		,COALESCE(org.organisaatio_oid, org2.ylaorganisaatio_oid) AS koulutustoimija_oid
		,CASE WHEN ooa.alku > ps.alku THEN ooa.alku ELSE ps.alku END AS alku_pvm
		,CASE WHEN ooa.alku > ps.alku THEN YEAR(ooa.alku) ELSE YEAR(ps.alku) END AS alku_vuosi
		,CASE WHEN ooa.alku > ps.alku THEN MONTH(ooa.alku) ELSE MONTH(ps.alku) END AS alku_kuukausi
		,COALESCE(ooa.loppu, '9999-12-31') AS loppu_pvm
		,CASE WHEN ooa.loppu IS NULL THEN 9999 ELSE YEAR(ooa.loppu) END AS loppu_vuosi
		,CASE WHEN ooa.loppu IS NULL THEN 12 ELSE MONTH(ooa.loppu) END AS loppu_kuukausi
		,majoitus
		,sisaoppilaitosmainen_majoitus
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	INNER JOIN Koski_SA.sa.sa_lukio_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ooa.loppu >= ps.alku
	LEFT JOIN dw.d_organisaatioluokitus AS org ON oo.koulutustoimija_oid = org.organisaatio_oid
	LEFT JOIN dw.d_organisaatioluokitus AS org2 ON oo.oppilaitos_oid = org2.organisaatio_oid		   
	WHERE ooa.tila = 'lasna' 
	AND sisaltyy_opiskeluoikeuteen_oid IS NULL
) q1
LEFT JOIN (
	SELECT DISTINCT 
		[vuosi]
		,[kuukausi]
		,[pvm] = datefromparts(vuosi, kuukausi, 1)
		,kytkin = 1
	FROM [dw].[d_kalenteri]
	WHERE (vuosi >= 2018 AND vuosi < YEAR(GETDATE()))
	OR (vuosi = YEAR(GETDATE()) AND kuukausi < MONTH(GETDATE()))
) AS temp_cal 
	ON ((temp_cal.vuosi = q1.alku_vuosi AND temp_cal.kuukausi >= q1.alku_kuukausi)	OR (temp_cal.vuosi > q1.alku_vuosi))
	AND ((temp_cal.vuosi = q1.loppu_vuosi AND temp_cal.kuukausi <= q1.loppu_kuukausi) OR (temp_cal.vuosi < q1.loppu_vuosi))
WHERE kytkin = 1
AND NOT EXISTS (
	SELECT * FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat 
	WHERE q1.koulutusmuoto != 'tuva'
	and tuvat.master_oid = q1.master_oid
	and tuvat.alku <= eomonth(temp_cal.pvm) and tuvat.loppu >= temp_cal.pvm
	and tuvat.alku <= q1.loppu_pvm and tuvat.loppu >= q1.alku_pvm
)


--uudet
SELECT DISTINCT 
	[opiskeluoikeus_oid]
	,[master_oid]
	,[koulutustoimija_oid]
	,vuosi
	,kuukausi
INTO Koski_SA.sa.temp_lukio_uudet
FROM (
	SELECT DISTINCT 
		master_oid
		,[opiskeluoikeus_oid]
		,vuosi
		,kuukausi
		,[koulutustoimija_oid]
		,rnk = rank() over (partition by master_oid, koulutustoimija_oid order by tila_alkanut)
	FROM (
		SELECT 
			oo.master_oid
			,oo.[opiskeluoikeus_oid]
			,oo.koulutusmuoto
			,COALESCE(org.organisaatio_oid, org2.ylaorganisaatio_oid) AS koulutustoimija_oid
			,ooa.tila_alkanut 
			,CASE WHEN ooa.tila_alkanut >= ps.alku THEN ooa.tila_alkanut ELSE ps.alku END AS alku
			,CASE WHEN ooa.tila_alkanut >= ps.alku THEN YEAR(ooa.tila_alkanut) ELSE YEAR(ps.alku) END AS vuosi
			,CASE WHEN ooa.tila_alkanut >= ps.alku THEN MONTH(ooa.tila_alkanut) ELSE MONTH(ps.alku) END AS kuukausi
			--,CASE 
				--WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN '301102'
				--WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
				--	AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN '301102'
				--WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN '301102'
				--ELSE ps.koulutusmoduuli_koodiarvo END
			--AS koulutusmoduuli_koodiarvo
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		INNER JOIN Koski_SA.sa.sa_lukio_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ooa.loppu >= ps.alku
		LEFT JOIN dw.d_organisaatioluokitus AS org ON oo.koulutustoimija_oid = org.organisaatio_oid
		LEFT JOIN dw.d_organisaatioluokitus AS org2 ON oo.oppilaitos_oid = org2.organisaatio_oid
		LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master AS henk ON oo.master_oid = henk.master_oid
		WHERE ooa.tila = 'lasna'
		AND YEAR(oo.alkamispaiva) >= 2018
		AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
	) q1
	WHERE NOT EXISTS (
		SELECT * FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat 
		WHERE q1.koulutusmuoto != 'tuva'
		and tuvat.master_oid = q1.master_oid
		and q1.alku between tuvat.alku and tuvat.loppu
	)
) q2
WHERE rnk = 1


--KAKSOISTUTKINTO-OPISKELIJAT (Katsotaan ammatillisen koulutuksen aloitusvuosia)
SELECT DISTINCT *
INTO Koski_SA.sa.temp_amm_opisk_alkamispaivat
FROM (
	SELECT DISTINCT 
		oo.master_oid, 
		--oo.opiskeluoikeus_oid,
		--viimeisin_tila,
		YEAR(q2.alkamispaiva) AS aloitusvuosi,
		ammatillinen_koulutus_voimassa = 1
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
	--LEFT JOIN Koski_SA.sa.temp_amm_keskeytykset_kalenteri as kal ON oo.alkamispaiva = kal.paivays
	LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN (
		SELECT 
			opiskeluoikeus_oid, 
			alku AS alkamispaiva 
		FROM (
			SELECT 
				oo.opiskeluoikeus_oid, 
				oo.viimeisin_tila, 
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


--varsinainen faktalataus
DROP TABLE IF EXISTS dw.f_koski_lukio_opiskelijat_kuukausittain

SELECT DISTINCT
	vt.[opiskeluoikeus_oid]
	,oo.master_oid
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
	,YEAR(lps.alku) AS aloitusvuosi
	,MONTH(lps.alku) AS aloituskuukausi
	,aloitusajankohta = coalesce(cast(year(lps.alku) as varchar) + '/' + right('0' + cast(month(lps.alku) as varchar), 2), '-1')
	,aloitus_kuukauden_aikana_1_0 = 
		case
			when year(lps.alku) = vt.vuosi and month(lps.alku) = vt.kuukausi then 1
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
		WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 'Deutsche Internationale Abitur; Reifeprüfung'
		WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 'IB-tutkinto (International Baccalaureate)'
		WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
				AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 'IB-tutkinto (International Baccalaureate)'
		WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 'IB-tutkinto (International Baccalaureate)'
		WHEN ps.suorituksen_tyyppi IN ('ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 'EB-tutkinto (European Baccalaureate)'
		WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' AND ps.koulutusmoduuli_koodiarvo = 'S5' THEN 'EB-tutkinto (European Baccalaureate)'
		WHEN koulutusluokitus_fi IS NULL THEN 'Ei tutkintotavoitetta'
		WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 'Ylioppilastutkinto'
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 'Ei tutkintotavoitetta'
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_fi
		ELSE 'Ei tietoa' 
	END AS tavoitetutkinto
	,CASE
		WHEN koulutusluokitus_fi IN ('Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN koulutusluokitus_fi
		ELSE 'Yleissivistävä lukiokoulutus' 
	END AS koulutus
	,vt.majoitus
	,vt.sisaoppilaitosmainen_majoitus
	,vt.vuosi - YEAR(henk.syntymaaika) AS ika
	--lisätty 'lukionaineopinnot'. MK 15.3.2023
	,CASE
		WHEN ps.suorituksen_tyyppi IN ('luva', 'tuvakoulutuksensuoritus') THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto'
		WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 'Ulkomainen tutkinto' 
		WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' AND ps.koulutusmoduuli_koodiarvo = 'S5' THEN 'Ulkomainen tutkinto'
		WHEN ps.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
		WHEN ps.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
		WHEN ps.suorituksen_tyyppi IN ('lukionoppiaineenoppimaara', 'lukionaineopinnot') THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
		ELSE 'Ei tietoa' 
	END AS oppimaara
	,CASE WHEN henk.aidinkieli IS NULL THEN '-1' ELSE henk.aidinkieli END AS aidinkieli
	,CASE WHEN henk.kansalaisuus IS NULL THEN '-1' ELSE LEFT(henk.kansalaisuus, 3) END AS kansalaisuus
	,CASE WHEN henk.syntymaaika IS NULL THEN '-1' ELSE cast(henk.syntymaaika as nvarchar) END AS syntymaaika
	,Sukupuoli = henk.sukupuoli
	,d_alueluokitus_kotikunta_id = coalesce(d7.id, -1)
	,CASE
		WHEN oo.koulutusmuoto IN ('diatutkinto') THEN 2
		WHEN oo.koulutusmuoto = 'ibtutkinto' THEN 4
		WHEN ps.suorituksen_tyyppi = 'preiboppimaara' THEN 4
		WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' 
			AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN 4
		WHEN ps.suorituksen_tyyppi =  'internationalschooldiplomavuosiluokka' THEN 4
		WHEN ps.suorituksen_tyyppi IN ('ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 3
		WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' AND ps.koulutusmoduuli_koodiarvo = 'S5' THEN 3
		WHEN koulutusluokitus_fi IS NULL THEN 5
		WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 1
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 5
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN 8
		ELSE 9 
	END AS jarj_tavoitetutkinto
	,CASE WHEN koulutusluokitus_fi IN ('Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN 2 ELSE 1 END AS jarj_koulutus
	,CASE WHEN uudet.master_oid IS NOT NULL THEN 1 ELSE 0 END AS uusi_opiskelija
	,CASE 
		WHEN d6.ammatillinen_koulutus_voimassa IS NULL THEN 'Ei yhdistelmätutkintoa'
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
	--poistettaneen, kun CSCVIPUNEN-2602 valmis
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
	--
	,d_keskeyttaminen_opiskelijan_toiminta_id = d8.id

	--CSCVIPUNEN-3345 15.3.2023
	,CASE
		WHEN d7.maakunta_koodi IS NULL THEN -1
		WHEN (d7.maakunta_koodi IN ('21', '-1', '98')) THEN 0
		ELSE 1
	END AS kotikunta_manner_suomessa
	,CASE
		WHEN ov.master_oid is not null THEN 1
		ELSE 0
	END AS oppivelvollinen
	--

INTO dw.f_koski_lukio_opiskelijat_kuukausittain

FROM [Koski_SA].[sa].[temp_lukio_opiskelijat_kuukausi_valitaulu] vt
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = vt.opiskeluoikeus_oid AND vt.koulutustoimija_oid = oo.koulutustoimija_oid
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master henk ON oo.master_oid = henk.master_oid
LEFT JOIN dw.d_koulutusluokitus d5 ON ps.koulutusmoduuli_koodiarvo = d5.koulutusluokitus_koodi
LEFT JOIN Koski_SA.sa.temp_lukio_uudet uudet ON vt.opiskeluoikeus_oid = uudet.opiskeluoikeus_oid AND vt.vuosi = uudet.vuosi AND vt.kuukausi = uudet.kuukausi
LEFT JOIN Koski_SA.sa.temp_amm_opisk_alkamispaivat d6 ON d6.master_oid = oo.master_oid AND d6.aloitusvuosi = YEAR(oo.alkamispaiva)
--poistettaneen, kun CSCVIPUNEN-2602 valmis
LEFT JOIN Koski_SA.dbo.toisen_asteen_keskeyttaneet ero ON vt.opiskeluoikeus_oid = ero.opiskeluoikeus_oid AND vt.kuukausi = ero.kuukausi AND vt.vuosi = ero.vuosi
LEFT JOIN dw.d_keskeyttaminen_vaiheittainen kvaih ON kvaih.keskeyttaminen_vaiheittainen_koodi = ero.keskeyttaminen_vaiheittainen_koodi
--
LEFT JOIN Koski_SA.dbo.toisen_asteen_keskeyttaneet_unpvt kesk ON vt.opiskeluoikeus_oid = kesk.opiskeluoikeus_oid AND vt.kuukausi = kesk.kuukausi AND vt.vuosi = kesk.vuosi
JOIN dw.d_keskeyttaminen_opiskelijan_toiminta d8 ON d8.keskeyttaminen_opiskelijan_toiminta_koodi = COALESCE(kesk.keskeyttaminen_kategoria, 'ei_eronnut') AND d8.kuutioon_lukio = 1
--
LEFT JOIN dw.d_alueluokitus d7 ON henk.kotikunta = d7.kunta_koodi
LEFT JOIN (SELECT DISTINCT opiskeluoikeus_oid, alku FROM Koski_SA.sa.sa_lukio_paatason_suoritus ps) lps ON lps.opiskeluoikeus_oid = vt.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov ON ov.master_oid = oo.master_oid and DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1) BETWEEN ov.alkuPvm and ov.loppuPvm

--lisätty 'lukionaineopinnot'. MK 15.3.2023
WHERE (
	ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 'lukionaineopinnot', 'lukionoppimaara', 'diatutkintovaihe', 'luva', 'diavalmistavavaihe', 'internationalschooldiplomavuosiluokka', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper')
	OR tuva_jarjestamislupa = 'lukio'
	OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' AND ps.koulutusmoduuli_koodiarvo = 'S5')
	OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
)
AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL


DROP TABLE Koski_SA.sa.temp_lukio_opiskelijat_kuukausi_valitaulu
DROP TABLE Koski_SA.sa.temp_lukio_uudet
DROP TABLE Koski_SA.sa.temp_amm_opisk_alkamispaivat

GO


