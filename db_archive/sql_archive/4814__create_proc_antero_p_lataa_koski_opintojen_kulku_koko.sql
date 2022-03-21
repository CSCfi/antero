USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_koski_opintojen_kulku_koko]    Script Date: 30.8.2021 12:54:00 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_koski_opintojen_kulku_koko]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_koski_opintojen_kulku_koko]    Script Date: 30.8.2021 12:54:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [sa].[p_lataa_koski_opintojen_kulku_koko] AS

EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_1_perusjoukko
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_2a_valmistumiset
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_2b_peruspoiminnat
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_2d_taustatiedot
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_3a_ammatillinen
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_3b_yleissivistava
-- EXEC Koski_SA.sa.p_lataa_koski_opintojen_kulku_3c_valmentava


EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_4_koonti
-- tämän taulun voi pudottaa, jos kaikki on ok.
-- DROP TABLE IF EXISTS temp_opintojen_kulku_4_koonti


DROP TABLE IF EXISTS temp_koski_opintojen_kulku_2a_valmistumiset
DROP TABLE IF EXISTS temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet
DROP TABLE IF EXISTS temp_koski_opintojen_kulku_2d_taustatiedot
DROP TABLE IF EXISTS temp_koski_perusaste_keskiarvot
DROP TABLE IF EXISTS temp_opintojen_kulku_2a_poiminta_ammatillinen
DROP TABLE IF EXISTS temp_opintojen_kulku_2a_poiminta_valmentava
DROP TABLE IF EXISTS temp_opintojen_kulku_2a_poiminta_yleissivistava2aste
DROP TABLE IF EXISTS temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen
DROP TABLE IF EXISTS temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste

DROP TABLE IF EXISTS temp_opintojen_kulku_kalenteri
DROP TABLE IF EXISTS temp_opintojen_kulku_keskiarvot
DROP TABLE IF EXISTS temp_opintojen_kulku_kohortti
DROP TABLE IF EXISTS temp_opintojen_kulku_sarja_kytkin
DROP TABLE IF EXISTS temp_opintojen_kulku_tarkastelupaivat_1


-- DROP TABLE IF EXISTS temp_opintojen_kulku_4_koonti




GO

USE ANTERO

