USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_4_koonti]    Script Date: 30.7.2025 8.29.55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_4_koonti] AS

DROP TABLE IF EXISTS sa.temp_opintojen_kulku_4_koonti_temp
DROP TABLE IF EXISTS sa.temp_opintojen_kulku_4_koonti

SELECT 
	[kohortti_vp]
	,[master_oid]
	,[opiskeluoikeus_oid]
	,[koulutus_kytkin]
	,[sarja]
	,tutkinto_koodi
	,oppimaara
	,suorituksen_tyyppi = NULL
	,ika
	,ika_aloittaessa
	,ika_paattyessa
	,priorisoitu_tilanne_koodi = priorisoitu_tilanne_yleissivistava_koodi
	,[vaihtanut_jarjestajaa]
	,vaihtanut_oppilaitosta
	,lopputulema
INTO sa.temp_opintojen_kulku_4_koonti_temp
FROM sa.temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste
UNION ALL
SELECT 
	[kohortti_vp]
	,[master_oid]
	,[opiskeluoikeus_oid]
	,[koulutus_kytkin]
	,[sarja]
	,tutkinto_koodi
	,oppimaara = NULL
	,suorituksen_tyyppi
	,ika
	,ika_aloittaessa
	,ika_paattyessa
	,priorisoitu_tilanne_koodi = priorisoitu_tilanne_amm_koodi
	,[vaihtanut_jarjestajaa]
	,vaihtanut_oppilaitosta
	,lopputulema
FROM sa.temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen


SELECT DISTINCT 
	q.[kohortti_vp]
	,q.[master_oid]
	,q.[opiskeluoikeus_oid]
	,ika
	,ika_aloittaessa
	,ika_paattyessa
	/*
	,perusopetuksen_suoritusvuosi_keskiarvoluokka
	,lahde_keskiarvoluokka
	,keskiarvoluokka
	,yksilollistaminen_keskiarvoluokka
	*/
	,perusopetuksen_suoritusvuosi
	,keskiarvo_kategoria
	,keskiarvo_lukuaineet_kategoria
	,keskiarvo_kvintiili_koodi 
	,keskiarvo_lukuaineet_kvintiili_koodi
	,kansalaisuus_koodi = LEFT(henk.kansalaisuus, 3)
	,sukupuoli_koodi = henk.sukupuoli
	,aidinkieli_koodi = henk.aidinkieli
	,q.[koulutus_kytkin]
	,[sarja]
	,q.tutkinto_koodi
	,q.oppimaara
	,q.suorituksen_tyyppi
	,priorisoitu_tilanne_koodi
	,[vaihtanut_jarjestajaa]
	,vaihtanut_oppilaitosta
	,lopputulema
	,oo.oppilaitos_oid
	,oo.koulutustoimija_oid
INTO sa.temp_opintojen_kulku_4_koonti
FROM sa.temp_opintojen_kulku_4_koonti_temp q
LEFT JOIN sa.sa_koski_opiskeluoikeus oo ON q.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN sa.sa_koski_henkilo_master henk ON oo.master_oid = henk.master_oid
LEFT JOIN sa.temp_koski_opintojen_kulku_2d_taustatiedot tausta 
  ON q.master_oid = tausta.master_oid 
  AND q.koulutus_kytkin = tausta.koulutus_kytkin 
  AND q.kohortti_vp = tausta.kohortti_vp

GO


