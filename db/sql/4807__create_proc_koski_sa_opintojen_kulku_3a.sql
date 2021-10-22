USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_3a_ammatillinen]    Script Date: 30.8.2021 8:37:18 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_temp_koski_opintojen_kulku_3a_ammatillinen]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_3a_ammatillinen]    Script Date: 30.8.2021 8:37:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_3a_ammatillinen]  AS

DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen


SELECT DISTINCT
 kohortti_vp
 ,[oppija_oid]
 ,opiskeluoikeus_oid
 ,koulutus_kytkin
 ,tutkinto_koodi
 ,ika
 ,ika_aloittaessa
 ,ika_paattyessa
 ,alkamispaiva
 ,paattymispaiva
 ,lopputulema
 ,sarja
 ,priorisoitu_tilanne_yleissivistava_koodi = NULL
 ,priorisoitu_tilanne_yleissivistava = NULL
 ,priorisoitu_tilanne_amm_koodi
 ,priorisoitu_tilanne_amm = 
		CASE
			WHEN priorisoitu_tilanne_amm_koodi = 1 THEN 'Valmistunut alkuperäisestä tutkinnosta'
			WHEN priorisoitu_tilanne_amm_koodi = 2 THEN 'Valmistunut toisesta ammatillisesta tutkinnosta'
			WHEN priorisoitu_tilanne_amm_koodi = 3 THEN 'Jatkaa alkuperäisessä tutkinnossa'
			WHEN priorisoitu_tilanne_amm_koodi = 4 THEN 'Jatkaa toisessa amm. tutkinnossa'
			WHEN priorisoitu_tilanne_amm_koodi = 5 THEN 'Jatkaa VALMA-koulutuksessa'
			WHEN priorisoitu_tilanne_amm_koodi = 6 THEN 'Jatkaa TELMA-koulutuksessa'
			WHEN priorisoitu_tilanne_amm_koodi = 7 THEN 'Jatkaa muussa ammatillisessa koulutuksessa'
			WHEN priorisoitu_tilanne_amm_koodi = 8 THEN 'Keskeyttänyt ammatillisen koulutuksen' 
			ELSE 'Tieto puuttuu' END
 ,priorisoitu_tilanne_valmentava_koodi = NULL
 ,priorisoitu_tilanne_valmentava = NULL
 ,vaihtanut_jarjestajaa
 ,vaihtanut_oppilaitosta
INTO Koski_SA.sa.temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen
FROM(
SELECT
 kohortti_vp
 ,[oppija_oid]
 ,opiskeluoikeus_oid
 ,koulutus_kytkin
 ,tutkinto_koodi
 ,alkamispaiva
 ,paattymispaiva
 ,lopputulema
 ,ika
 ,ika_aloittaessa
 ,ika_paattyessa
 ,sarja
 ,priorisoitu_tilanne_amm_koodi = MIN(priorisoitu_tilanne_amm_koodi)
 ,vaihtanut_jarjestajaa = MIN(vaihtanut_jarjestajaa)
 ,vaihtanut_oppilaitosta = MIN(vaihtanut_oppilaitosta)
FROM(
SELECT 
 q1.kohortti_vp
 ,q1.[oppija_oid]
 ,q1.opiskeluoikeus_oid
 ,q1.koulutus_kytkin
 ,q1.tutkinto_koodi
 ,q1.alkamispaiva
 ,q1.paattymispaiva
 ,q1.lopputulema
 ,ika
 ,ika_aloittaessa
 ,ika_paattyessa
 ,sarja
 ,tarkastuspaiva
 ,priorisoitu_tilanne_amm_koodi = 
		CASE
			WHEN taso1 = 'Valmistunut' OR (valm.tutkinto_koodi = q1.tutkinto_koodi and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva) THEN 1
			WHEN q1.tutkinto_koodi != valm.tutkinto_koodi and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva THEN 2
			WHEN taso1 = 'Koulutus kesken' OR (q1.tutkinto_koodi = uusi.tutkinto_koodi AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut')) THEN 3
			WHEN uusi.suorituksen_tyyppi = 'ammatillinentutkinto' AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') AND q1.tutkinto_koodi != uusi.tutkinto_koodi THEN 4
		--	WHEN uusi.suorituksen_tyyppi in ('valma', 'telma') AND uusi.tila IN ('lasna', 'loma') THEN 5
			WHEN uusi.suorituksen_tyyppi in ('valma') AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 5
			WHEN uusi.suorituksen_tyyppi in ('telma') AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 6
			WHEN uusi.suorituksen_tyyppi in ('muuammatillinenkoulutus','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') THEN 7
			WHEN uusi.koulutusmuoto != 'ammatillinenkoulutus' OR uusi.opiskeluoikeus_oid IS NULL OR uusi.tila is NULL THEN 8 
			ELSE 99 
		END
 ,vaihtanut_jarjestajaa =
		CASE
			WHEN taso1 = 'Valmistunut' then 0
			WHEN valm.koulutustoimija_oid IS NULL AND uusi.koulutustoimija_oid IS NULL THEN 0
			WHEN q1.koulutustoimija_oid = valm.koulutustoimija_oid THEN 0
			WHEN q1.koulutustoimija_oid != valm.koulutustoimija_oid THEN 1
			WHEN taso1 = 'Koulutus kesken' then 0
			WHEN q1.koulutustoimija_oid = uusi.koulutustoimija_oid THEN 0
			WHEN q1.koulutustoimija_oid != uusi.koulutustoimija_oid THEN 1
			else 1
		END
,vaihtanut_oppilaitosta = 
		CASE
			WHEN taso1 = 'Valmistunut' then 0
			WHEN valm.oppilaitos_oid IS NULL AND uusi.oppilaitos_oid IS NULL THEN 0
			WHEN q1.oppilaitos_oid = valm.oppilaitos_oid THEN 0
			WHEN q1.oppilaitos_oid != valm.oppilaitos_oid THEN 1
			WHEN taso1 = 'Koulutus kesken' then 0
			WHEN q1.oppilaitos_oid = uusi.oppilaitos_oid THEN 0
			WHEN q1.oppilaitos_oid != uusi.oppilaitos_oid THEN 1
			else 1 
		END
  FROM Koski_SA.sa.temp_opintojen_kulku_2a_poiminta_ammatillinen q1

  -- Join muihin valmistumisiin kuin alkuperäiseen
LEFT JOIN Koski_SA.sa.temp_koski_opintojen_kulku_2a_valmistumiset valm 
	ON valm.oppija_oid = q1.oppija_oid  AND valm.opiskeluoikeus_oid != q1.opiskeluoikeus_oid

  -- Join kaikkiin muihin toisen asteen opiskeluoikeuksiin
LEFT JOIN Koski_SA.sa.temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet uusi ON 
					uusi.oppija_oid = q1.oppija_oid AND
					uusi.opiskeluoikeus_oid != q1.opiskeluoikeus_oid AND q1.tarkastuspaiva BETWEEN uusi.alku AND COALESCE(uusi.loppu, '9999-01-01')

  ) q2
 
	GROUP BY  kohortti_vp
 ,[oppija_oid]
 ,opiskeluoikeus_oid
 ,sarja, koulutus_kytkin, tutkinto_koodi  ,ika
 ,ika_aloittaessa
 ,ika_paattyessa
 ,alkamispaiva
 ,paattymispaiva
 ,lopputulema) q3













GO


USE ANTERO