USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_3a_ammatillinen]    Script Date: 30.7.2025 8.27.36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_3a_ammatillinen]  AS

DROP TABLE IF EXISTS sa.temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen

SELECT DISTINCT
	kohortti_vp
	,[master_oid]
	,opiskeluoikeus_oid
	,koulutus_kytkin
	,suorituksen_tyyppi = case suorituksen_tyyppi when 'ammatillinentutkinto' then 1 when 'ammatillinentutkintoosittainen' then 2 end
	,tutkinto_koodi
	,oppimaara = NULL
	,ika
	,ika_aloittaessa
	,ika_paattyessa
	,alkamispaiva
	,paattymispaiva
	,lopputulema
	,sarja
	,priorisoitu_tilanne_amm_koodi
	,vaihtanut_jarjestajaa = case when priorisoitu_tilanne_amm_koodi = 8 then 8 else vaihtanut_jarjestajaa end --käytetään prion 8 selitettä myös vaihdoksille
	,vaihtanut_oppilaitosta = case when priorisoitu_tilanne_amm_koodi = 8 then 8 else vaihtanut_oppilaitosta end --käytetään prion 8 selitettä myös vaihdoksille

INTO sa.temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen

FROM (
	SELECT
		kohortti_vp
		,[master_oid]
		,opiskeluoikeus_oid
		,koulutus_kytkin
		,suorituksen_tyyppi
		,tutkinto_koodi
		,alkamispaiva
		,paattymispaiva
		,lopputulema
		,ika
		,ika_aloittaessa
		,ika_paattyessa
		,sarja
		,priorisoitu_tilanne_amm_koodi
		,vaihtanut_jarjestajaa = min(vaihtanut_jarjestajaa)
		,vaihtanut_oppilaitosta = min(vaihtanut_oppilaitosta)
	FROM (
		SELECT
			kohortti_vp
			,[master_oid]
			,opiskeluoikeus_oid
			,koulutus_kytkin
			,suorituksen_tyyppi
			,tutkinto_koodi
			,alkamispaiva
			,paattymispaiva
			,lopputulema
			,ika
			,ika_aloittaessa
			,ika_paattyessa
			,sarja
			,priorisoitu_tilanne_amm_koodi
			,min_priorisoitu_tilanne_amm_koodi --vaihdosten kytkemiseksi priorisointiin ylemmässä kyselyssä
				= min(priorisoitu_tilanne_amm_koodi) 
					over(partition by kohortti_vp,[master_oid],opiskeluoikeus_oid,koulutus_kytkin,tutkinto_koodi,alkamispaiva,paattymispaiva,lopputulema,ika,ika_aloittaessa,ika_paattyessa,sarja)
			,vaihtanut_jarjestajaa --= MIN(vaihtanut_jarjestajaa)
			,vaihtanut_oppilaitosta --= MIN(vaihtanut_oppilaitosta)
		FROM (
			SELECT 
				q1.kohortti_vp
				,q1.[master_oid]
				,q1.opiskeluoikeus_oid
				,q1.koulutus_kytkin
				,q1.suorituksen_tyyppi
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
						WHEN (taso1 = 'Valmistunut' AND q1.suorituksen_tyyppi = 'ammatillinentutkinto') --suor. tyyp. 1 tai 2 <-> amm. koko tutkinto tai osa/osia perusjoukon poiminnassa; valmistumisissa ja muissa opiskeluissa Kosken mukainen koodiarvo
							OR (valm.tutkinto_koodi = q1.tutkinto_koodi AND valm.suorituksen_tyyppi = 'ammatillinentutkinto' /*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva*/) 
							THEN 10
						WHEN q1.tutkinto_koodi != valm.tutkinto_koodi 
							AND valm.suorituksen_tyyppi = 'ammatillinentutkinto'
							/*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva*/ THEN 20
						WHEN (taso1 = 'Koulutus kesken' AND q1.suorituksen_tyyppi = 'ammatillinentutkinto') 
							OR (q1.tutkinto_koodi = uusi.tutkinto_koodi AND uusi.suorituksen_tyyppi = 'ammatillinentutkinto' AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt')) THEN 30
						WHEN q1.tutkinto_koodi != uusi.tutkinto_koodi AND uusi.suorituksen_tyyppi = 'ammatillinentutkinto' AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt') THEN 40
						WHEN (taso1 = 'Valmistunut' AND q1.suorituksen_tyyppi = 'ammatillinentutkintoosittainen') --suor. tyyp. 1 tai 2 <-> amm. koko tutkinto tai osa/osia perusjoukon poiminnassa; valmistumisissa ja muissa opiskeluissa Kosken mukainen koodiarvo
							OR valm.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' /*JUHAN TESTI, SIIRTO LOPUN RAJAUKSEEN: and valm.vahvistus_paiva BETWEEN q1.alkamispaiva AND tarkastuspaiva*/
							THEN 41
						WHEN (taso1 = 'Koulutus kesken' AND q1.suorituksen_tyyppi = 'ammatillinentutkintoosittainen') 
							OR (uusi.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt')) THEN 42
						WHEN valm.suorituksen_tyyppi in ('valma', 'telma', 'tuvakoulutuksensuoritus' /*valm.tuva_jarjestamislupa = 'ammatillinen'*/) THEN 43
						WHEN (uusi.suorituksen_tyyppi in ('valma', 'telma') OR uusi.tuva_jarjestamislupa = 'ammatillinen') AND uusi.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt') THEN 50
						WHEN uusi.suorituksen_tyyppi = 'muuammatillinenkoulutus' AND uusi.tila IN ('lasna', 'loma','valmistunut', 'valiaikaisestikeskeytynyt') THEN 70
						ELSE 80 --ei enää kaatoluokkaa 99, vaan ilmaistaan ekspliittisesti yllä mitkä kelpuutetaan
					END
				,vaihtanut_jarjestajaa =
					CASE
						WHEN taso1 = 'Valmistunut' then 0
						/*JUHAN TESTI*/ --WHEN valm.koulutustoimija_oid IS NULL AND uusi.koulutustoimija_oid IS NULL THEN 0
						WHEN q1.koulutustoimija_oid = valm.koulutustoimija_oid THEN 0
						WHEN q1.koulutustoimija_oid != valm.koulutustoimija_oid THEN 1
						WHEN taso1 = 'Koulutus kesken' then 0
						WHEN q1.koulutustoimija_oid = uusi.koulutustoimija_oid THEN 0
						WHEN q1.koulutustoimija_oid != uusi.koulutustoimija_oid THEN 1
						/*JUHAN TESTI*/ --else 1
						else 99
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
						/*JUHAN TESTI*/ --else 1
						else 99 
					END
			FROM sa.temp_opintojen_kulku_2a_poiminta_ammatillinen q1

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

		) q2

	) q3

	WHERE priorisoitu_tilanne_amm_koodi = min_priorisoitu_tilanne_amm_koodi
  
	GROUP BY kohortti_vp
		,[master_oid]
		,opiskeluoikeus_oid
		,sarja
		,priorisoitu_tilanne_amm_koodi
		,koulutus_kytkin
		,suorituksen_tyyppi
		,tutkinto_koodi
		,alkamispaiva
		,paattymispaiva
		,lopputulema
		,ika
		,ika_aloittaessa
		,ika_paattyessa

) q4

GO


