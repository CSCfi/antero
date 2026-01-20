USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_opintojen_kulku]    Script Date: 30.7.2025 8.46.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_f_koski_lukio_opintojen_kulku] AS

DROP TABLE IF EXISTS ANTERO.dw.f_koski_lukio_opintojen_kulku

SELECT DISTINCT 
	q.master_oid,
	q.opiskeluoikeus_oid,
	q.lopputulema,

    d_opintojen_kulku_kohortit_id = COALESCE(d1.id, -1),
    d_opintojen_kulku_priorisoitu_tilanne_id = COALESCE(d2.id, -1),
	d_opintojen_kulku_tarkastelujakso_id = COALESCE(d3.id, -1),
	d_koulutusluokitus_id = COALESCE(d4.id, -1),
	d_sukupuoli_id = COALESCE(d6.id, -1),
	d_ika_id = COALESCE(d7.id, -1),
	d_ika_aloittaessa_id = COALESCE(d8.id, -1),
	d_ika_paattyessa_id = COALESCE(d9.id, -1),
	d_kieli_aidinkieli_id = COALESCE(d14b.id, -1),
	d_maatjavaltiot2_kansalaisuus_id = COALESCE(d10.id, -1),
	d_organisaatioluokitus_jarj_id = COALESCE(d11.id, -1),
	d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id, -1),
	d_organisaatioluokitus_toimipiste_id = COALESCE(d13.id, -1),
	d_kieli_suorituskieli_id = COALESCE(d14.id, -1),
	d_lukio_oppimaara_man_id = COALESCE(d15.id, -1),
	d_alueluokitus_jarjestaja_id = COALESCE(d16.id, -1),
	d_alueluokitus_oppilaitos_id = COALESCE(d16b.id, -1),
	/*
	perusopetuksen_suoritusvuosi_keskiarvoluokka = coalesce(perusopetuksen_suoritusvuosi_keskiarvoluokka, -1),
	lahde_keskiarvoluokka,
	d_opintojen_kulku_keskiarvot_keskiarvoluokka_id = COALESCE(d18c.id, -1),
	yksilollistaminen_keskiarvoluokka,
	*/
	perusopetuksen_suoritusvuosi = coalesce(q.perusopetuksen_suoritusvuosi, -1),
	d_opintojen_kulku_keskiarvot_keskiarvo_kategoria_id = COALESCE(d17.id, -1),
	d_opintojen_kulku_keskiarvot_lukuaine_kategoria_id = COALESCE(d18.id, -1),
	d_opintojen_kulku_keskiarvot_keskiarvo_kvintiili_id = COALESCE(d19.id, -1),
	d_opintojen_kulku_keskiarvot_lukuaine_kvintiili_id = COALESCE(d20.id, -1),

	d_opintojen_kulku_vaihdokset_jarjestaja_id = COALESCE(d21.id, -1),
	d_opintojen_kulku_vaihdokset_oppilaitos_id = COALESCE(d22.id, -1),

	loadtime = CURRENT_TIMESTAMP

INTO ANTERO.dw.f_koski_lukio_opintojen_kulku

FROM Koski_SA.sa.temp_opintojen_kulku_4_koonti q
LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master henk ON henk.master_oid = q.master_oid
LEFT JOIN ANTERO.dw.d_opintojen_kulku_kohortit d1 ON q.kohortti_vp = d1.kohortti_vp
LEFT JOIN ANTERO.dw.d_opintojen_kulku_priorisoitu_tilanne d2 ON d2.priorisoitu_tilanne_koodi = q.priorisoitu_tilanne_koodi AND d2.koulutus_kytkin = q.koulutus_kytkin 
LEFT JOIN ANTERO.dw.d_opintojen_kulku_tarkastelujakso d3 ON d3.sarja = q.sarja
LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_koodi = q.tutkinto_koodi
LEFT JOIN Koski_SA.sa.sa_lukio_paatason_suoritus ps ON ps.opiskeluoikeus_oid = q.opiskeluoikeus_oid
/*
--JUHAN TESTI, POISTETTU OPPIMÄÄRÄ TÄSTÄ PÄÄTTELYITä VARTEN KAIKKIIN EDELTÄVIIN POIMINTOIHIN, MUUTETTU MYÖS d15-JOIN
LEFT JOIN (
	SELECT DISTINCT 
		opiskeluoikeus_oid, 
		/*oppimaara = 
			CASE
				--WHEN suorituksen_tyyppi = 'luva' THEN 'aineopiskelija'
				WHEN suorituksen_tyyppi LIKE 'internati%' THEN 'ulk_tutkinto'
				WHEN suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe') THEN 'ulk_tutkinto' 
				WHEN [oppimaara] = 'nuortenops' THEN oppimaara
				WHEN [oppimaara] = 'aikuistenops' THEN oppimaara
				--WHEN suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'aineopiskelija'
				WHEN [oppimaara] = 'Ulkomainen tutkinto' THEN 'ulk_tutkinto'
			ELSE 'tietopuuttuu' END,*/						
		toimipiste_oid,
		suorituskieli_koodiarvo  
		FROM Koski_SA.sa.sa_koski_paatason_suoritus
		WHERE --suorituksen_tyyppi != 'luva' AND suorituksen_tyyppi != 'lukionoppiaineenoppimaara' AND 
		suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppimaara', 'diatutkintovaihe', 'diavalmistavavaihe', 'internationalschooldiplomavuosiluokka')
		  OR (suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
) ps ON ps.opiskeluoikeus_oid = q.opiskeluoikeus_oid
*/
LEFT JOIN ANTERO.dw.d_sukupuoli d6 ON q.sukupuoli_koodi = d6.sukupuoli_koodi
LEFT JOIN ANTERO.dw.d_ika d7 ON q.ika = d7.ika_avain
LEFT JOIN ANTERO.dw.d_ika d8 ON q.ika_aloittaessa = d8.ika_avain
LEFT JOIN ANTERO.dw.d_ika d9 ON q.ika_paattyessa = d9.ika_avain
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d10 ON q.kansalaisuus_koodi = d10.maatjavaltiot2_koodi
LEFT JOIN ANTERO.dw.d_kieli d14b ON q.aidinkieli_koodi = d14b.kieli_koodi

LEFT JOIN ANTERO.dw.d_organisaatioluokitus d11 ON q.koulutustoimija_oid = d11.organisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d12 ON q.oppilaitos_oid = d12.organisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13 ON ps.toimipiste_oid = d13.organisaatio_oid
LEFT JOIN ANTERO.dw.d_kieli d14 ON ps.suorituskieli_koodiarvo = d14.kieli_koodi
LEFT JOIN ANTERO.dw.d_lukio_oppimaara_man d15 ON d15.oppimaara_tunniste = q.oppimaara --ps.oppimaara
LEFT JOIN ANTERO.dw.d_alueluokitus d16 ON d11.kunta_koodi = d16.kunta_koodi
LEFT JOIN ANTERO.dw.d_alueluokitus d16b ON d12.kunta_koodi = d16b.kunta_koodi

LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d17 ON d17.keskiarvo_koodi = q.keskiarvo_kategoria AND d17.tyyppi='keskiarvo'
LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d18 ON d18.keskiarvo_koodi = q.keskiarvo_lukuaineet_kategoria AND d18.tyyppi='keskiarvo' 
--LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d18c ON d18c.keskiarvo_koodi = q.keskiarvoluokka AND d18c.tyyppi='keskiarvo'
LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d19 ON d19.keskiarvo_koodi = q.[keskiarvo_kvintiili_koodi] AND d19.tyyppi='kvintiili' 
LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d20 ON d20.keskiarvo_koodi = q.[keskiarvo_lukuaineet_kvintiili_koodi] AND d20.tyyppi='kvintiili'

LEFT JOIN ANTERO.dw.d_opintojen_kulku_vaihdokset d21 ON q.vaihtanut_jarjestajaa = d21.vaihdos_koodi AND d21.vaihdos_tyyppi = 'jarjestaja'
LEFT JOIN ANTERO.dw.d_opintojen_kulku_vaihdokset d22 ON q.vaihtanut_oppilaitosta = d22.vaihdos_koodi AND d22.vaihdos_tyyppi = 'oppilaitos'

WHERE q.koulutus_kytkin = 'yleissivistava2aste' AND q.oppimaara IN ('nuortenops', 'aikuistenops', 'ulk_tutkinto')

GO


