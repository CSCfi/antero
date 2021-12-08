USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa__koski_opintojen_kulku_koko]    Script Date: 11.11.2021 23:04:14 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa__koski_opintojen_kulku_koko]
GO

/****** Object:  StoredProcedure [dw].[p_lataa__koski_opintojen_kulku_koko]    Script Date: 11.11.2021 23:04:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa__koski_opintojen_kulku_koko] AS

--jätetty osan muutoksista yhteyteen toistaiseksi kommentti JUHAN TESTI, lisäksi mm. lukion oppimäärä lisätty ja vaihdokset kytketty priorisointiin. - CSC Juha 7.12.2021

EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_1_perusjoukko
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_2a_valmistumiset
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_2b_peruspoiminnat
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_2d_taustatiedot
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_3a_ammatillinen
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_3b_yleissivistava
-- EXEC Koski_SA.sa.p_lataa_koski_opintojen_kulku_3c_valmentava
EXEC Koski_SA.sa.p_lataa_temp_koski_opintojen_kulku_4_koonti

EXEC ANTERO.dw.p_lataa_f_koski_amm_opintojen_kulku_2
EXEC ANTERO.dw.p_lataa_f_koski_lukio_opintojen_kulku

DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_opintojen_kulku_2a_valmistumiset
DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet
DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_opintojen_kulku_2d_taustatiedot
DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_perusaste_keskiarvot
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_ammatillinen
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_valmentava
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_yleissivistava2aste
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_4_koonti_temp
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_kalenteri
--DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_keskiarvot
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_kohortti
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_sarja_kytkin
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_tarkastelupaivat_1




GO


