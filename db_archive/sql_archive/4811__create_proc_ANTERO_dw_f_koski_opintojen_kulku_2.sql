USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opintojen_kulku_2]    Script Date: 30.8.2021 8:54:19 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_amm_opintojen_kulku_2]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opintojen_kulku_2]    Script Date: 30.8.2021 8:54:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















CREATE PROCEDURE [dw].[p_lataa_f_koski_amm_opintojen_kulku_2] AS




DROP TABLE IF EXISTS ANTERO.dw.f_koski_amm_opintojen_kulku_2

SELECT DISTINCT 
	q.oppija_oid,
	q.opiskeluoikeus_oid,

    d_opintojen_kulku_kohortit_id = COALESCE(d1.id, -1),
    d_opintojen_kulku_priorisoitu_tilanne_id = COALESCE(d2.id, -1),
	d_opintojen_kulku_tarkastelujakso_id = COALESCE(d3.id, -1),
	d_koulutusluokitus_id = COALESCE(d4.id, -1),
	d_osaamisala_id = COALESCE(d5.id, -1),
	d_sukupuoli_id = COALESCE(d6.id, -1),
	d_ika_id = COALESCE(d7.id, -1),
	d_ika_aloittaessa_id = COALESCE(d8.id, -1),
	d_ika_paattyessa_id = COALESCE(d9.id, -1),
	d_maatjavaltiot2_kansalaisuus_id = COALESCE(d10.id, -1),
	d_organisaatioluokitus_jarj_id = COALESCE(d11.id, -1),
	d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id, -1),
	d_organisaatioluokitus_toimipiste_id = COALESCE(d13.id, -1),
	d_kieli_suorituskieli_id = COALESCE(d14.id, -1),
	d_alueluokitus_jarjestaja_id = COALESCE(d16.id, -1),
	loadtime = CURRENT_TIMESTAMP
	


INTO ANTERO.dw.f_koski_amm_opintojen_kulku_2
FROM Koski_SA.sa.temp_opintojen_kulku_4_koonti q
LEFT JOIN Koski_SA.sa.sa_koski_henkilo henk ON henk.oppija_oid = q.oppija_oid
LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_keskiarvot ka ON ka.oppija_oid = q.oppija_oid
LEFT JOIN ANTERO.dw.d_opintojen_kulku_kohortit d1 ON q.kohortti_vp = d1.kohortti_vp
LEFT JOIN ANTERO.dw.d_opintojen_kulku_priorisoitu_tilanne d2 ON d2.priorisoitu_tilanne_koodi = q.priorisoitu_tilanne_koodi AND d2.koulutus_kytkin = q.koulutus_kytkin 
LEFT JOIN ANTERO.dw.d_opintojen_kulku_tarkastelujakso d3 ON d3.sarja = q.sarja
LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_koodi = q.tutkinto_koodi
LEFT JOIN (SELECT * FROM Koski_SA.sa.sa_koski_paatason_suoritus WHERE suorituksen_tyyppi = 'ammatillinentutkinto') ps 
	ON ps.opiskeluoikeus_oid = q.opiskeluoikeus_oid
LEFT JOIN ANTERO.dw.d_osaamisala d5 ON d5.koodi = ps.osaamisala_koodiarvo
LEFT JOIN ANTERO.dw.d_sukupuoli d6 ON q.sukupuoli_koodi = d6.sukupuoli_koodi
LEFT JOIN ANTERO.dw.d_ika d7 ON q.ika = d7.ika_avain
LEFT JOIN ANTERO.dw.d_ika d8 ON q.ika_aloittaessa = d8.ika_avain
LEFT JOIN ANTERO.dw.d_ika d9 ON q.ika_paattyessa = d9.ika_avain
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d10 ON q.kansalaisuus_koodi = d10.maatjavaltiot2_koodi

LEFT JOIN ANTERO.dw.d_organisaatioluokitus d11 ON q.koulutustoimija_oid = d11.organisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d12 ON q.oppilaitos_oid = d12.organisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13 ON ps.toimipiste_oid = d13.organisaatio_oid
LEFT JOIN ANTERO.dw.d_kieli d14 ON ps.suorituskieli_koodiarvo = d14.kieli_koodi
LEFT JOIN ANTERO.dw.d_alueluokitus d16 ON d11.kunta_koodi = d16.kunta_koodi




WHERE q.koulutus_kytkin = 'ammatillinen' 






GO


USE ANTERO