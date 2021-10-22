USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2b_peruspoiminnat]    Script Date: 30.8.2021 8:34:45 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_temp_koski_opintojen_kulku_2b_peruspoiminnat]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2b_peruspoiminnat]    Script Date: 30.8.2021 8:34:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_2b_peruspoiminnat] AS

/* Tämä proseduuri poimii koulutusmuodoittain perusjoukon. Tämä tehdään, jotta muisti riittää seuraavassa vaiheessa */

DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_ammatillinen
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_yleissivistava2aste
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_valmentava


-- Poimi perusjoukosta vain ammatilliset
SELECT * INTO Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_ammatillinen FROM [Koski_SA].[sa].[temp_opintojen_kulku_tarkastelupaivat_1]
WHERE koulutus_kytkin = 'ammatillinen'

-- Poimi perusjoukosta vain ammatilliset
SELECT * INTO Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_yleissivistava2aste FROM [Koski_SA].[sa].[temp_opintojen_kulku_tarkastelupaivat_1]
WHERE koulutus_kytkin = 'yleissivistava2aste'

-- Poimi perusjoukosta vain ammatilliset
SELECT * INTO Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_valmentava FROM [Koski_SA].[sa].[temp_opintojen_kulku_tarkastelupaivat_1]
WHERE koulutus_kytkin = 'ammatillinen_valmentava'


GO
USE ANTERO

