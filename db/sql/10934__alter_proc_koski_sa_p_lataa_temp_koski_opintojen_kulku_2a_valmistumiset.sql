USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2a_valmistumiset]    Script Date: 30.7.2025 8.24.03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_2a_valmistumiset] AS

DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_opintojen_kulku_2a_valmistumiset

SELECT DISTINCT 
	oo.master_oid
	,oo.opiskeluoikeus_oid
	,oo.oppilaitos_oid
	,koulutustoimija_oid
	,koulutusmoduuli_koodiarvo
	,vahvistus_paiva
	,suorituksen_tyyppi
  	,tutkinto_koodi = 
		CASE
			WHEN LEN(ps.koulutusmoduuli_koodiarvo) > 6 THEN NULL 				
			WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppimaara' THEN '301101'
			WHEN oo.koulutusmuoto = 'ibtutkinto' THEN '301102'
			WHEN oo.koulutusmuoto = 'diatutkinto' THEN '301103'
			WHEN ps.suorituksen_tyyppi IN ('ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN '301104'
		--	WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN '301101'
		--	WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND aps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN '301102'
			WHEN ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' THEN '301102'
			ELSE COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo) 
		END
	,oppimaara = 
		CASE
			--WHEN suorituksen_tyyppi = 'luva' THEN 'aineopiskelija'
			WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'ulk_tutkinto'
			WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 'ulk_tutkinto' 
			WHEN ps.[oppimaara] = 'nuortenops' THEN oppimaara
			WHEN ps.[oppimaara] = 'aikuistenops' THEN oppimaara
			--WHEN suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'aineopiskelija'
			WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'ulk_tutkinto'
			ELSE 'tietopuuttuu' 
		END
INTO Koski_SA.sa.temp_koski_opintojen_kulku_2a_valmistumiset

FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid

WHERE (
	ps.suorituksen_tyyppi IN ('ammatillinentutkinto', 'ammatillinentutkintoosittainen', 'lukionoppimaara', 'ibtutkinto', 'internationalschooldiplomavuosiluokka', 'diatutkintovaihe', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper')
	OR tuva_jarjestamislupa = 'ammatillinen' --'luva','lukio'
)
AND oo.viimeisin_tila = 'valmistunut'
AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
AND ps.vahvistus_paiva is not null
AND NOT EXISTS (
	SELECT 1 
	FROM sa.tuva_lasna_loma_jaksot tuvat 
	WHERE ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen'
	AND tuvat.master_oid = oo.master_oid
	AND ps.vahvistus_paiva between tuvat.alku and tuvat.loppu
)

GO


