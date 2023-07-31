USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet]    Script Date: 31.7.2023 16:38:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet] AS


DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet

SELECT DISTINCT 
	oo.oppija_oid, 
	oo.opiskeluoikeus_oid, 
	oo.oppilaitos_oid, 
	koulutusmuoto, 
	tuva_jarjestamislupa,
	koulutustoimija_oid, 
	suorituksen_tyyppi, 
	ooa.alku, 
	ooa.loppu, 
	tila,
	tutkinto_koodi = 
		CASE
			WHEN LEN(ps.koulutusmoduuli_koodiarvo) > 6 THEN NULL 					
			WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppimaara' THEN '301101'
			WHEN oo.koulutusmuoto = 'ibtutkinto' THEN '301102'
			WHEN oo.koulutusmuoto = 'diatutkinto' THEN '301103'
			WHEN ps.suorituksen_tyyppi IN ('ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN '301104'
			WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5' THEN '301104'
			--WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN '301101'
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
		END
		
	INTO Koski_SA.sa.temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet

	FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid

	WHERE (
		koulutusmuoto IN ('ammatillinenkoulutus', 'diatutkinto', 'ibtutkinto', 'lukiokoulutus', 'internationalschool', 'europeanschoolofhelsinki')  --'luva'
		OR tuva_jarjestamislupa = 'ammatillinen' --'lukio'
	)
	AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus' 
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL



GO

USE [ANTERO]