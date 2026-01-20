USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_3b_yleissivistava]    Script Date: 30.7.2025 8.28.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_3b_yleissivistava] AS

DROP TABLE IF EXISTS sa.temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste

SELECT DISTINCT
	kohortti_vp
	,[master_oid]
	,opiskeluoikeus_oid
	,koulutus_kytkin
	,tutkinto_koodi
	,oppimaara
	,ika
	,ika_aloittaessa
	,ika_paattyessa
	,alkamispaiva
	,paattymispaiva
	,lopputulema
	,sarja
	,priorisoitu_tilanne_amm_koodi = NULL
	,priorisoitu_tilanne_amm = NULL
	,priorisoitu_tilanne_valmentava_koodi = NULL
	,priorisoitu_tilanne_valmentava = NULL
	,priorisoitu_tilanne_yleissivistava_koodi
	,priorisoitu_tilanne_yleissivistava = 
		CASE
			WHEN priorisoitu_tilanne_yleissivistava_koodi = 1 THEN 'Suorittanut aloitetun oppimäärän'
			WHEN priorisoitu_tilanne_yleissivistava_koodi = 2 THEN 'Suorittanut eri yleissiv. oppimäärän'
			WHEN priorisoitu_tilanne_yleissivistava_koodi = 3 THEN 'Jatkaa alkuperäisessä oppimäärässä'
			WHEN priorisoitu_tilanne_yleissivistava_koodi = 4 THEN 'Jatkaa toisessa yleissiv. oppimäärässä'
			WHEN priorisoitu_tilanne_yleissivistava_koodi = 5 THEN 'Suorittanut ammatillisen tutkinnon'
			WHEN priorisoitu_tilanne_yleissivistava_koodi = 6 THEN 'Jatkaa ammatillisessa koulutuksessa'
			WHEN priorisoitu_tilanne_yleissivistava_koodi = 8 THEN 'Keskeyttänyt toisen asteen'
			ELSE 'Tieto puuttuu' 
		END
	,vaihtanut_jarjestajaa = case when priorisoitu_tilanne_yleissivistava_koodi = 8 then 9 else vaihtanut_jarjestajaa end --käytetään prion 8 selitettä myös vaihdoksille
	,vaihtanut_oppilaitosta = case when priorisoitu_tilanne_yleissivistava_koodi = 8 then 9 else vaihtanut_oppilaitosta end --käytetään prion 8 selitettä myös vaihdoksille

INTO sa.temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste

FROM (
	SELECT
		kohortti_vp
		,[master_oid]
		,opiskeluoikeus_oid
		,koulutus_kytkin
		,tutkinto_koodi
		,oppimaara
		,ika
		,ika_aloittaessa
		,ika_paattyessa
		,alkamispaiva
		,paattymispaiva
		,lopputulema
		,sarja
		,priorisoitu_tilanne_yleissivistava_koodi
		,vaihtanut_jarjestajaa = MIN(vaihtanut_jarjestajaa)
		,vaihtanut_oppilaitosta = MIN(vaihtanut_oppilaitosta)
	FROM (
		SELECT
			kohortti_vp
			,[master_oid]
			,opiskeluoikeus_oid
			,koulutus_kytkin
			,tutkinto_koodi
			,oppimaara
			,ika
			,ika_aloittaessa
			,ika_paattyessa
			,alkamispaiva
			,paattymispaiva
			,lopputulema
			,sarja
			,priorisoitu_tilanne_yleissivistava_koodi 
			,min_priorisoitu_tilanne_yleissivistava_koodi --vaihdosten kytkemiseksi priorisointiin ylemmässä kyselyssä
				= min(priorisoitu_tilanne_yleissivistava_koodi) 
					over(partition by kohortti_vp,[master_oid],opiskeluoikeus_oid,koulutus_kytkin,tutkinto_koodi,oppimaara,ika,ika_aloittaessa,ika_paattyessa,alkamispaiva,paattymispaiva,lopputulema,sarja)
			,vaihtanut_jarjestajaa --= MIN(vaihtanut_jarjestajaa)
			,vaihtanut_oppilaitosta --= MIN(vaihtanut_oppilaitosta)
		FROM (
			SELECT 
				q1.kohortti_vp
				,q1.[master_oid]
				,q1.opiskeluoikeus_oid
				,q1.koulutus_kytkin
				,q1.tutkinto_koodi
				,q1.oppimaara
				,q1.ika
				,q1.ika_aloittaessa
				,q1.ika_paattyessa
				,q1.alkamispaiva
				,q1.paattymispaiva
				,q1.lopputulema
				,sarja
				,tarkastuspaiva
				,vaihtanut_jarjestajaa =
					CASE
						WHEN taso1 = 'Valmistunut' then 0
						--WHEN valm.koulutustoimija_oid IS NULL AND uusi.koulutustoimija_oid IS NULL THEN 0
						WHEN q1.koulutustoimija_oid = valm.koulutustoimija_oid THEN 0
						WHEN q1.koulutustoimija_oid != valm.koulutustoimija_oid THEN 1
						WHEN taso1 = 'Koulutus kesken' then 0
						WHEN q1.koulutustoimija_oid = uusi.koulutustoimija_oid THEN 0
						WHEN q1.koulutustoimija_oid != uusi.koulutustoimija_oid THEN 1
						/*JUHAN TESTI*/ 
						else 99 --else 1
					END
				,vaihtanut_oppilaitosta = 
					CASE
						WHEN taso1 = 'Valmistunut' then 0
						/*JUHAN TESTI*/ --WHEN valm.oppilaitos_oid IS NULL AND uusi.oppilaitos_oid IS NULL THEN 0
						WHEN q1.oppilaitos_oid = valm.oppilaitos_oid THEN 0
						WHEN q1.oppilaitos_oid != valm.oppilaitos_oid THEN 1
						WHEN taso1 = 'Koulutus kesken' then 0
						WHEN q1.oppilaitos_oid = uusi.oppilaitos_oid THEN 0	
						WHEN q1.oppilaitos_oid != uusi.oppilaitos_oid THEN 1
						/*JUHAN TESTI*/ 
						else 99 --else 1 
					END
				,priorisoitu_tilanne_yleissivistava_koodi = 
					/*JUHAN TESTI, MUUTETAAN VERTAILU OPPIMÄÄRÄÄN TUTKINNON SIJAAN*/
					CASE
						WHEN taso1 = 'Valmistunut' OR (q1.oppimaara = valm.oppimaara /*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva*/) then 1
						WHEN q1.oppimaara != valm.oppimaara /*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva*/ 
							AND /*JUHAN TESTI: uusi->valm*/valm.tutkinto_koodi IN ('301101', '301102', '301103', '301104') THEN 2
						WHEN taso1 = 'Koulutus kesken' OR (q1.oppimaara = uusi.oppimaara AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut')) THEN 3
						WHEN q1.oppimaara != uusi.oppimaara AND uusi.tutkinto_koodi IN ('301101', '301102', '301103', '301104') AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 4
						WHEN /*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva AND */
							valm.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 5
						WHEN (uusi.suorituksen_tyyppi IN ('ammatillinentutkinto', 'ammatillinentutkintoosittainen' 
							--, 'muuammatillinenkoulutus','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus','valma','telma') OR uusi.tuva_jarjestamislupa = 'ammatillinen'
							)) AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 6
						ELSE 8 /*JUHAN TESTI, MYÖS EI-TUTKINTOKOULUTUKSEEN SIIRTYMINEN SIIS TULKITAAN KESKEYTYKSEKSI*/
						--WHEN uusi.opiskeluoikeus_oid IS NULL /*JUHAN TESTI*/ OR uusi.tila IS NULL OR uusi.tila NOT IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 8 
						--ELSE 99 
					END
					/*CASE
						WHEN taso1 = 'Valmistunut' OR (valm.tutkinto_koodi = q1.tutkinto_koodi /*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva*/) then 1
						WHEN q1.tutkinto_koodi != valm.tutkinto_koodi /*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva*/ 
								AND /*JUHAN TESTI: uusi->valm*/valm.tutkinto_koodi IN ('301101', '301102', '301103') THEN 2
						WHEN taso1 = 'Koulutus kesken' OR (q1.tutkinto_koodi = uusi.tutkinto_koodi AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut')) THEN 3
						WHEN q1.tutkinto_koodi != uusi.tutkinto_koodi AND uusi.tutkinto_koodi IN ('301101', '301102', '301103') AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 4
						WHEN /*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva AND */valm.tutkinto_koodi NOT IN ('301101', '301102', '301103') THEN 5
						WHEN uusi.suorituksen_tyyppi IN ('ammatillinentutkinto', 'ammatillinentutkintoosittainen' /*JUHAN TESTI*/, 'muuammatillinenkoulutus','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 6
						WHEN uusi.opiskeluoikeus_oid IS NULL /*JUHAN TESTI*/ OR uusi.tila IS NULL OR uusi.tila NOT IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 8 
						ELSE 99 
					END*/
			FROM [sa].[temp_opintojen_kulku_2a_poiminta_yleissivistava2aste] q1

			-- Join muihin valmistumisiin kuin alkuperäiseen
			LEFT JOIN sa.temp_koski_opintojen_kulku_2a_valmistumiset valm 
				ON valm.master_oid = q1.master_oid 
				AND valm.opiskeluoikeus_oid != q1.opiskeluoikeus_oid
				/*JUHAN TESTI*/ AND valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND q1.tarkastuspaiva 

			-- tuvat seuraavaa liitosta varten
			LEFT JOIN sa.tuva_lasna_loma_jaksot tuvat 
				ON tuvat.master_oid = q1.master_oid
				AND q1.tarkastuspaiva BETWEEN tuvat.alku AND tuvat.loppu

			-- Join kaikkiin muihin toisen asteen opiskeluoikeuksiin
			LEFT JOIN sa.temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet uusi 
				ON uusi.master_oid = q1.master_oid 
				AND uusi.opiskeluoikeus_oid != q1.opiskeluoikeus_oid 
				AND q1.tarkastuspaiva BETWEEN uusi.alku AND COALESCE(uusi.loppu, '9999-01-01')
				AND (
					uusi.koulutusmuoto = 'tuva'
					OR tuvat.master_oid is null
				)

			WHERE koulutus_kytkin = 'yleissivistava2aste'

		) q2
	
	) q3

	WHERE priorisoitu_tilanne_yleissivistava_koodi = min_priorisoitu_tilanne_yleissivistava_koodi

	GROUP BY kohortti_vp
		,[master_oid]
		,opiskeluoikeus_oid
		,sarja
		,priorisoitu_tilanne_yleissivistava_koodi
		,koulutus_kytkin
		,tutkinto_koodi
		,oppimaara
		,ika
		,ika_aloittaessa
		,ika_paattyessa
		,alkamispaiva
		,paattymispaiva
		,lopputulema

) q4

GO


