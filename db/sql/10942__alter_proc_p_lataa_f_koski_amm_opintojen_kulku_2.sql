USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opintojen_kulku_2]    Script Date: 30.7.2025 8.45.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opintojen_kulku_2] AS

DROP TABLE IF EXISTS dw.f_koski_amm_opintojen_kulku_2

SELECT DISTINCT 
	q.master_oid,
	q.opiskeluoikeus_oid,
	q.lopputulema,

    d_opintojen_kulku_kohortit_id = COALESCE(d1.id, -1),
    d_opintojen_kulku_priorisoitu_tilanne_id = COALESCE(d2.id, -1),
	d_opintojen_kulku_tarkastelujakso_id = COALESCE(d3.id, -1),
	d_koulutusluokitus_id = COALESCE(d4.id, -1),
	d_suorituksen_tyyppi_id = COALESCE(d0.id, -1),
	d_osaamisala_id = COALESCE(d5.id, -1),
	d_sukupuoli_id = COALESCE(d6.id, -1),
	d_ika_id = COALESCE(d7.id, -1),
	d_ika_aloittaessa_id = COALESCE(d8.id, -1),
	d_ika_paattyessa_id = COALESCE(d9.id, -1),
	d_kieli_aidinkieli_id = COALESCE(d10.id, -1),
	d_maatjavaltiot2_kansalaisuus_id = COALESCE(d11.id, -1),
	d_organisaatioluokitus_jarj_id = COALESCE(d12.id, -1),
	d_organisaatioluokitus_oppilaitos_id = COALESCE(d13.id, -1),
	d_organisaatioluokitus_toimipiste_id = COALESCE(d14.id, -1),
	d_kieli_suorituskieli_id = COALESCE(d15.id, -1),
	d_alueluokitus_jarjestaja_id = COALESCE(d16.id, -1),
	d_alueluokitus_oppilaitos_id = COALESCE(d17.id, -1),
	/*
	perusopetuksen_suoritusvuosi_keskiarvoluokka = coalesce(perusopetuksen_suoritusvuosi_keskiarvoluokka, -1),
	lahde_keskiarvoluokka,
	d_opintojen_kulku_keskiarvot_keskiarvoluokka_id = COALESCE(d19c.id, -1),
	yksilollistaminen_keskiarvoluokka,
	*/
	perusopetuksen_suoritusvuosi = coalesce(perusopetuksen_suoritusvuosi, -1),
	d_opintojen_kulku_keskiarvot_kategoria_id = COALESCE(d18.id, -1),
	d_opintojen_kulku_keskiarvot_lukuaine_kategoria_id = COALESCE(d19.id, -1),
	d_opintojen_kulku_keskiarvot_keskiarvo_kvintiili_id = COALESCE(d20.id, -1),
	d_opintojen_kulku_keskiarvot_lukuaine_kvintiili_id = COALESCE(d21.id, -1),

	d_opintojen_kulku_vaihdokset_jarjestaja_id = COALESCE(d22.id, -1),
	d_opintojen_kulku_vaihdokset_oppilaitos_id = COALESCE(d23.id, -1),

	loadtime = CURRENT_TIMESTAMP

INTO dw.f_koski_amm_opintojen_kulku_2

FROM Koski_SA.sa.temp_opintojen_kulku_4_koonti q
LEFT JOIN dw.d_opintojen_kulku_kohortit d1 ON q.kohortti_vp = d1.kohortti_vp
LEFT JOIN dw.d_opintojen_kulku_priorisoitu_tilanne d2 ON d2.priorisoitu_tilanne_koodi = q.priorisoitu_tilanne_koodi AND d2.koulutus_kytkin = q.koulutus_kytkin 
LEFT JOIN dw.d_opintojen_kulku_tarkastelujakso d3 ON d3.sarja = q.sarja
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_koodi = q.tutkinto_koodi
LEFT JOIN dw.d_suorituksen_tyyppi d0 ON d0.koodi = q.suorituksen_tyyppi
LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps ON ps.opiskeluoikeus_oid = q.opiskeluoikeus_oid
LEFT JOIN dw.d_osaamisala d5 ON d5.koodi = ps.osaamisala_koodiarvo
LEFT JOIN dw.d_sukupuoli d6 ON q.sukupuoli_koodi = d6.sukupuoli_koodi
LEFT JOIN dw.d_ika d7 ON q.ika = d7.ika_avain
LEFT JOIN dw.d_ika d8 ON q.ika_aloittaessa = d8.ika_avain
LEFT JOIN dw.d_ika d9 ON q.ika_paattyessa = d9.ika_avain
LEFT JOIN dw.d_kieli d10 ON q.aidinkieli_koodi = d10.kieli_koodi
LEFT JOIN dw.d_maatjavaltiot2 d11 ON q.kansalaisuus_koodi = d11.maatjavaltiot2_koodi

LEFT JOIN dw.d_organisaatioluokitus d12 ON q.koulutustoimija_oid = d12.organisaatio_oid
LEFT JOIN dw.d_organisaatioluokitus d13 ON q.oppilaitos_oid = d13.organisaatio_oid
LEFT JOIN dw.d_organisaatioluokitus d14 ON ps.toimipiste_oid = d14.organisaatio_oid
LEFT JOIN dw.d_kieli d15 ON ps.suorituskieli_koodiarvo = d15.kieli_koodi
LEFT JOIN dw.d_alueluokitus d16 ON d12.kunta_koodi = d16.kunta_koodi
LEFT JOIN dw.d_alueluokitus d17 ON d13.kunta_koodi = d17.kunta_koodi

LEFT JOIN dw.d_opintojen_kulku_keskiarvot d18 ON d18.keskiarvo_koodi = q.keskiarvo_kategoria AND d18.tyyppi='keskiarvo'
LEFT JOIN dw.d_opintojen_kulku_keskiarvot d19 ON d19.keskiarvo_koodi = q.keskiarvo_lukuaineet_kategoria AND d19.tyyppi='keskiarvo' 
--LEFT JOIN dw.d_opintojen_kulku_keskiarvot d19c ON d19c.keskiarvo_koodi = q.keskiarvoluokka AND d19c.tyyppi='keskiarvo' 
LEFT JOIN dw.d_opintojen_kulku_keskiarvot d20 ON d20.keskiarvo_koodi = q.[keskiarvo_kvintiili_koodi] AND d20.tyyppi='kvintiili' 
LEFT JOIN dw.d_opintojen_kulku_keskiarvot d21 ON d21.keskiarvo_koodi = q.[keskiarvo_lukuaineet_kvintiili_koodi] AND d21.tyyppi='kvintiili'

LEFT JOIN dw.d_opintojen_kulku_vaihdokset d22 ON q.vaihtanut_jarjestajaa = d22.vaihdos_koodi AND d22.vaihdos_tyyppi = 'jarjestaja'
LEFT JOIN dw.d_opintojen_kulku_vaihdokset d23 ON q.vaihtanut_oppilaitosta = d23.vaihdos_koodi AND d23.vaihdos_tyyppi = 'oppilaitos'

WHERE q.koulutus_kytkin = 'ammatillinen' 

GO


