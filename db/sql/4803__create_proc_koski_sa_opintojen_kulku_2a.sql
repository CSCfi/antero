USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2a_valmistumiset]    Script Date: 30.8.2021 8:34:04 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_temp_koski_opintojen_kulku_2a_valmistumiset]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2a_valmistumiset]    Script Date: 30.8.2021 8:34:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_2a_valmistumiset] AS
DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_opintojen_kulku_2a_valmistumiset

SELECT DISTINCT oo.oppija_oid, oo.opiskeluoikeus_oid, oo.oppilaitos_oid, koulutustoimija_oid, koulutusmoduuli_koodiarvo, vahvistus_paiva
  					  ,tutkinto_koodi = 
						CASE
							WHEN LEN(ps.koulutusmoduuli_koodiarvo) > 6 THEN NULL 
							
							WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppimaara' THEN '301101'
							WHEN oo.koulutusmuoto = 'ibtutkinto' THEN '301102'
							WHEN oo.koulutusmuoto = 'diatutkinto' THEN '301103'
							WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN '301101'
						--	WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND aps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN '301102'
							WHEN ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' THEN '301102'
							ELSE COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo) 
						END
				INTO Koski_SA.sa.temp_koski_opintojen_kulku_2a_valmistumiset
				FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
				WHERE ps.suorituksen_tyyppi IN ('ammatillinentutkinto', 'lukionoppimaara', 'ibtutkinto', 'internationalschooldiplomavuosiluokka', 'diatutkintovaihe')
				AND oo.viimeisin_tila = 'valmistunut'
				AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
				AND ps.vahvistus_paiva is not null



GO
USE ANTERO

