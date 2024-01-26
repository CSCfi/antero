USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_4_koonti]    Script Date: 10.1.2023 18:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_4_koonti] AS


DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_4_koonti_temp
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_4_koonti

SELECT [kohortti_vp]
      ,[oppija_oid]
      ,[opiskeluoikeus_oid]
      ,[koulutus_kytkin]
      ,[sarja]
	  ,tutkinto_koodi
	  ,oppimaara
	  ,ika
	  ,ika_aloittaessa
	  ,ika_paattyessa
	  ,priorisoitu_tilanne_koodi = COALESCE(priorisoitu_tilanne_yleissivistava_koodi, priorisoitu_tilanne_amm_koodi, priorisoitu_tilanne_valmentava_koodi)
      ,[vaihtanut_jarjestajaa]
	  ,vaihtanut_oppilaitosta
	  ,lopputulema
INTO Koski_SA.sa.temp_opintojen_kulku_4_koonti_temp

FROM Koski_SA.sa.temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste
UNION SELECT [kohortti_vp]
      ,[oppija_oid]
      ,[opiskeluoikeus_oid]
      ,[koulutus_kytkin]
      ,[sarja]
	  ,tutkinto_koodi
	  ,oppimaara = NULL
	  ,ika
	  ,ika_aloittaessa
	  ,ika_paattyessa
	  ,priorisoitu_tilanne_koodi = COALESCE(priorisoitu_tilanne_yleissivistava_koodi, priorisoitu_tilanne_amm_koodi, priorisoitu_tilanne_valmentava_koodi)
      ,[vaihtanut_jarjestajaa]
	  ,vaihtanut_oppilaitosta
	  ,lopputulema
	  FROM Koski_SA.sa.temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen



SELECT DISTINCT 
q.[kohortti_vp]
      ,q.[oppija_oid]
      ,q.[opiskeluoikeus_oid]
	  ,ika
	  ,ika_aloittaessa
	  ,ika_paattyessa
	  ,perusopetuksen_suoritusvuosi
	  ,peruskoulu_keskiarvo_kategoria_koodi 
	  ,keskiarvo_kvintiili_koodi 
	  ,keskiarvo_lukuaineet_kvintiili_koodi 
	  ,peruskoulu_keskiarvo_lukuaineet_kategoria = jarj_peruskoulu_keskiarvo_lukuaineet_kategoria
	  ,kansalaisuus_koodi = LEFT(henk.kansalaisuus, 3)
	  ,sukupuoli_koodi = henk.sukupuoli
	  ,aidinkieli_koodi = henk.aidinkieli
      ,q.[koulutus_kytkin]
      ,[sarja]
	  ,q.tutkinto_koodi
	  ,q.oppimaara
	  ,priorisoitu_tilanne_koodi
      ,[vaihtanut_jarjestajaa]
	  ,vaihtanut_oppilaitosta
	  ,lopputulema
	  ,oo.oppilaitos_oid
	  ,oo.koulutustoimija_oid
INTO Koski_SA.sa.temp_opintojen_kulku_4_koonti

FROM Koski_SA.sa.temp_opintojen_kulku_4_koonti_temp q
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON q.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_koski_henkilo henk ON oo.oppija_oid = henk.oppija_oid
LEFT JOIN Koski_SA.sa.temp_koski_opintojen_kulku_2d_taustatiedot tausta 
  ON q.oppija_oid = tausta.oppija_oid AND q.koulutus_kytkin = tausta.koulutus_kytkin AND q.kohortti_vp = tausta.kohortti_vp



