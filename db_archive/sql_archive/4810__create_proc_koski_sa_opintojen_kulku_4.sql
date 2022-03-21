USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_4_koonti]    Script Date: 30.8.2021 8:38:31 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_temp_koski_opintojen_kulku_4_koonti]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_4_koonti]    Script Date: 30.8.2021 8:38:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














CREATE PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_4_koonti] AS

DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_4_koonti_temp
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_4_koonti

SELECT [kohortti_vp]
      ,[oppija_oid]
      ,[opiskeluoikeus_oid]
      ,[koulutus_kytkin]
      ,[sarja]
	  ,tutkinto_koodi
	  ,ika
	  ,ika_aloittaessa
	  ,ika_paattyessa
	  ,priorisoitu_tilanne_koodi = COALESCE(priorisoitu_tilanne_yleissivistava_koodi, priorisoitu_tilanne_amm_koodi, priorisoitu_tilanne_valmentava_koodi)
      ,[vaihtanut_jarjestajaa]
	  ,vaihtanut_oppilaitosta
INTO Koski_SA.sa.temp_opintojen_kulku_4_koonti_temp
FROM Koski_SA.sa.temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen
UNION
SELECT [kohortti_vp]
      ,[oppija_oid]
      ,[opiskeluoikeus_oid]
      ,[koulutus_kytkin]
      ,[sarja]
	  ,tutkinto_koodi
	  ,ika
	  ,ika_aloittaessa
	  ,ika_paattyessa
	  ,priorisoitu_tilanne_koodi = COALESCE(priorisoitu_tilanne_yleissivistava_koodi, priorisoitu_tilanne_amm_koodi, priorisoitu_tilanne_valmentava_koodi)
      ,[vaihtanut_jarjestajaa]
	  ,vaihtanut_oppilaitosta 
	  FROM Koski_SA.sa.temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste




SELECT DISTINCT [kohortti_vp]
      ,q.[oppija_oid]
      ,q.[opiskeluoikeus_oid]
	  ,ika
	  ,ika_aloittaessa
	  ,ika_paattyessa
	  ,kansalaisuus_koodi = LEFT(kansalaisuus, 3)
	  ,sukupuoli_koodi = henk.sukupuoli
      ,[koulutus_kytkin]
      ,[sarja]
	  ,q.tutkinto_koodi
	  ,priorisoitu_tilanne_koodi
      ,[vaihtanut_jarjestajaa]
	  ,vaihtanut_oppilaitosta
	  ,oo.oppilaitos_oid
	  ,oo.koulutustoimija_oid
INTO Koski_SA.sa.temp_opintojen_kulku_4_koonti
FROM Koski_SA.sa.temp_opintojen_kulku_4_koonti_temp q
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON q.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_koski_henkilo henk ON oo.oppija_oid = henk.oppija_oid





GO


USE ANTERO