USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet]    Script Date: 30.8.2021 8:35:23 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet]    Script Date: 30.8.2021 8:35:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet] AS

DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet

SELECT DISTINCT oo.oppija_oid, oo.opiskeluoikeus_oid, oo.oppilaitos_oid, koulutusmuoto, koulutustoimija_oid, suorituksen_tyyppi, ooa.alku, ooa.loppu, tila
  					  ,tutkinto_koodi = 
						CASE
							WHEN LEN(ps.koulutusmoduuli_koodiarvo) > 6 THEN NULL 					
							WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppimaara' THEN '301101'
							WHEN oo.koulutusmuoto = 'ibtutkinto' THEN '301102'
							WHEN oo.koulutusmuoto = 'diatutkinto' THEN '301103'
							WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN '301101'
							WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN '301102'
							WHEN ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' THEN '301102'
							ELSE COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo) 
						END
			INTO Koski_SA.sa.temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet
			FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
			  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa 
				ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
			  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps 
				ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
				where koulutusmuoto IN ('ammatillinenkoulutus', 'diatutkinto', 'ibtutkinto', 'lukiokoulutus', 'internationalschool') AND
					ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus' AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL










GO


USE ANTERO