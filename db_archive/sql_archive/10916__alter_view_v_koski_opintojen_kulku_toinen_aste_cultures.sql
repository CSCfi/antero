USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_opintojen_kulku_toinen_aste_cultures]    Script Date: 30.7.2025 7.49.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER    VIEW [dw].[v_koski_opintojen_kulku_toinen_aste_cultures] AS 

SELECT  --top 0 --DISTINCT
	CONCAT(d1.paiva, '.', d1.kuukausi, '. - ', d2.paiva, '.', d2.kuukausi, '.', d2.vuosi) as aloitusajankohta_fi,
	CONCAT(d1.paiva, '.', d1.kuukausi, '. - ', d2.paiva, '.', d2.kuukausi, '.', d2.vuosi) as aloitusajankohta_sv,
	CASE 
		WHEN f.aika_vuosina is null THEN 'Viimeisin tilanne (edellisen kuukauden lopussa)'
		WHEN f.aika_vuosina = 0 THEN 'Aloitusajankohta'
		WHEN f.aika_vuosina = 1 THEN '1 vuosi aloituspäivästä'
		ELSE CONCAT(aika_vuosina, ' vuotta aloituspäivästä')
	END as tarkastelujakso_fi,
	CASE 
		WHEN f.aika_vuosina is null THEN 'Senaste status (i slutet av föregående månad)'
		WHEN f.aika_vuosina = 0 THEN 'Begynnelsetid'
		ELSE CONCAT(f.aika_vuosina, ' år från begynnelsedatum')
	END as tarkastelujakso_sv,

	f.master_oid as apusarake_oppija_oid,
	CASE WHEN d2.vuosi = 2018 THEN 1 ELSE 0 END as apusarake_2018,

	d7.sukupuoli_fi as sukupuoli_fi,
	d7.sukupuoli_sv as sukupuoli_sv,
	d8.ikaryhma6_fi as ika_aloittaessa_fi,
	d8.ikaryhma6_sv as ika_aloittaessa_sv,
	d9.maanosa1_fi as kansalaisuus_ryhma_fi,
	d9.maanosa1_sv as kansalaisuus_ryhma_sv,
	d10.kieliryhma2_fi as aidinkieli_ryhma_fi,
	d10.kieliryhma2_sv as aidinkieli_ryhma_sv,
	d11.kytkin_fi as suorittanut_perusopetuksen_oppimaaran_fi,
	d11.kytkin_sv as suorittanut_perusopetuksen_oppimaaran_sv,
	d32.kytkin_fi as oppivelvollinen_alkamispaivana_fi,
	d32.kytkin_sv as oppivelvollinen_alkamispaivana_sv,
	d33.kytkin_fi as oppivelvollinen_tarkasteluhetki_fi,
	d33.kytkin_sv as oppivelvollinen_tarkasteluhetki_sv,
	d35.kytkin_fi as kotikunta_manner_suomessa_tarkasteluhetki_fi,
	d35.kytkin_sv as kotikunta_manner_suomessa_tarkasteluhetki_sv,
	d38.kytkin_fi as perusop_suor_tilastovuoden_kevaana_fi,
	d38.kytkin_sv as perusop_suor_tilastovuoden_kevaana_sv,

	d15.kytkin_fi as valmistunut_alkuperaisesta_koko_tutkintoon_johtavasta_koulutuksesta_fi,
	d15.kytkin_sv as valmistunut_alkuperaisesta_koko_tutkintoon_johtavasta_koulutuksesta_sv,
	d16.kytkin_fi as valmistunut_muusta_koko_tutkintoon_johtavasta_koulutuksesta_fi,
	d16.kytkin_sv as valmistunut_muusta_koko_tutkintoon_johtavasta_koulutuksesta_sv,
	d17.kytkin_fi as jatkaa_alkuperaisessa_koko_tutkintoon_johtavassa_koulutuksessa_fi,
	d17.kytkin_sv as jatkaa_alkuperaisessa_koko_tutkintoon_johtavassa_koulutuksessa_sv,
	d18.kytkin_fi as jatkaa_muussa_koko_tutkintoon_johtavassa_koulutuksessa_fi,
	d18.kytkin_sv as jatkaa_muussa_koko_tutkintoon_johtavassa_koulutuksessa_sv,
	d21.kytkin_fi as jatkaa_alkuperaisessa_valmentavassa_koulutuksessa_fi,
	d21.kytkin_sv as jatkaa_alkuperaisessa_valmentavassa_koulutuksessa_sv,
	d22.kytkin_fi as jatkaa_muussa_valmentavassa_koulutuksessa_fi,
	d22.kytkin_sv as jatkaa_muussa_valmentavassa_koulutuksessa_sv,
	d23.kytkin_fi as valmistunut_ammatillisen_tutkinnon_osan_osien_koulutuksesta_fi,
	d23.kytkin_sv as valmistunut_ammatillisen_tutkinnon_osan_osien_koulutuksesta_sv,
	d24.kytkin_fi as jatkaa_ammatillisen_tutkinnon_osan_osien_koulutuksessa_fi,
	d24.kytkin_sv as jatkaa_ammatillisen_tutkinnon_osan_osien_koulutuksessa_sv,
	d30.kytkin_fi as ei_valmistunut_eika_edella_mainituissa_koulutuksissa_fi,
	d30.kytkin_sv as ei_valmistunut_eika_edella_mainituissa_koulutuksissa_sv,
	d12.priorisoitu_tilanne_fi as priorisoitu_tilanne_fi,
	d12.priorisoitu_tilanne_se as priorisoitu_tilanne_sv,

	d3.selite_fi as suorituksen_tyyppi_tarkasteluhetki_fi,
	d3.selite_sv as suorituksen_tyyppi_tarkasteluhetki_sv,
	d4.selite_fi as alkuperainen_suorituksen_tyyppi_fi,
	d4.selite_fi as alkuperainen_suorituksen_tyyppi_sv,
	d14a.koulutusalataso1_fi as alkuperainen_koulutusala_taso_1_fi,
	d14a.koulutusalataso1_sv as alkuperainen_koulutusala_taso_1_sv,
	d14a.koulutusalataso2_fi as alkuperainen_koulutusala_taso_2_fi,
	d14a.koulutusalataso2_sv as alkuperainen_koulutusala_taso_2_sv,
	d14a.koulutusalataso3_fi as alkuperainen_koulutusala_taso_3_fi,
	d14a.koulutusalataso3_sv as alkuperainen_koulutusala_taso_3_sv,
	d14a.koulutusluokitus_fi as alkuperainen_tutkinto_fi,
	d14a.koulutusluokitus_sv as alkuperainen_tutkinto_sv,
	d31a.selite_fi as alkuperainen_koulutustyyppi_fi,
	d31a.selite_sv as alkuperainen_koulutustyyppi_sv,
	CASE
		WHEN f.oppimaara_alkuperainen = 1 THEN 'Nuorten oppimäärä'
		WHEN f.oppimaara_alkuperainen = 2 THEN 'Aikuisten oppimäärä'
		WHEN f.oppimaara_alkuperainen = 3 THEN 'Ulkomainen tutkinto'
		ELSE 'Tieto puuttuu'
	END as alkuperainen_oppimaara_fi,
	CASE
		WHEN f.oppimaara_alkuperainen = 1 THEN 'Lärokursen för unga'
		WHEN f.oppimaara_alkuperainen = 2 THEN 'Lärokursen för vuxna'
		WHEN f.oppimaara_alkuperainen = 3 THEN 'Utländsk examen'
		ELSE 'Information saknas'
	END as alkuperainen_oppimaara_sv,
	
	d5.selite_fi as koulutusmuoto_tarkasteluhetki_fi,
	d5.selite_sv as koulutusmuoto_tarkasteluhetki_sv,
	d6.selite_fi as alkuperainen_koulutusmuoto_fi,
	d6.selite_sv as alkuperainen_koulutusmuoto_sv,
	d14b.koulutusalataso1_fi as koulutusala_taso_1_tarkasteluhetki_fi,
	d14b.koulutusalataso1_sv as koulutusala_taso_1_tarkasteluhetki_sv,
	d14b.koulutusalataso2_fi as koulutusala_taso_2_tarkasteluhetki_fi,
	d14b.koulutusalataso2_sv as koulutusala_taso_2_tarkasteluhetki_sv,
	d14b.koulutusalataso3_fi as koulutusala_taso_3_tarkasteluhetki_fi,
	d14b.koulutusalataso3_sv as koulutusala_taso_3_tarkasteluhetki_sv,
	d14b.koulutusluokitus_fi as tutkinto_tarkasteluhetki_fi,
	d14b.koulutusluokitus_sv as tutkinto_tarkasteluhetki_sv,
	d31b.selite_fi as koulutustyyppi_tarkasteluhetki_fi,
	d31b.selite_sv as koulutustyyppi_tarkasteluhetki_sv,
	CASE
		WHEN f.oppimaara = 1 THEN 'Nuorten oppimäärä'
		WHEN f.oppimaara = 2 THEN 'Aikuisten oppimäärä'
		WHEN f.oppimaara = 3 THEN 'Ulkomainen tutkinto'
		ELSE 'Tieto puuttuu'
	END as oppimaara_tarkasteluhetki_fi,
	CASE
		WHEN f.oppimaara_alkuperainen = 1 THEN 'Lärokursen för unga'
		WHEN f.oppimaara_alkuperainen = 2 THEN 'Lärokursen för vuxna'
		WHEN f.oppimaara_alkuperainen = 3 THEN 'Utländsk examen'
		ELSE 'Information saknas'
	END as oppimaara_tarkasteluhetki_sv,

	d13.selite_fi as aloitettu_koulutus_fi,
	d13.selite_sv as aloitettu_koulutus_sv,
	d34.erityisopetus_ryhma_fi as erityisopetus_aloitettu_koulutus_fi,
	d34.erityisopetus_ryhma_sv as erityisopetus_aloitettu_koulutus_sv,

	d36a.organisaatio_fi as alkuperainen_koulutuksen_jarjestaja_fi,
	d36a.organisaatio_sv as alkuperainen_koulutuksen_jarjestaja_sv,
	d37a.organisaatio_fi as koulutuksen_jarjestaja_tarkasteluhetki_fi,
	d37a.organisaatio_sv as koulutuksen_jarjestaja_tarkasteluhetki_sv,
	d36b.organisaatio_fi as alkuperainen_oppilaitos_fi,
	d36b.organisaatio_sv as alkuperainen_oppilaitos_sv,
	d37b.organisaatio_fi as oppilaitos_tarkasteluhetki_fi,
	d37b.organisaatio_sv as oppilaitos_tarkasteluhetki_sv,
	d36c.organisaatio_fi as alkuperainen_toimipiste_fi,
	d36c.organisaatio_sv as alkuperainen_toimipiste_sv,
	d37c.organisaatio_fi as toimipiste_tarkasteluhetki_fi,
	d37c.organisaatio_sv as toimipiste_tarkasteluhetki_sv,
	d39a.maakunta_fi as alkuperaisen_koulutuksen_jarjestajan_maakunta_fi,
	d39a.maakunta_sv as alkuperaisen_koulutuksen_jarjestajan_maakunta_sv,
	d39b.maakunta_fi as koulutuksen_jarjestajan_maakunta_tarkasteluhetki_fi,
	d39b.maakunta_sv as koulutuksen_jarjestajan_maakunta_tarkasteluhetki_sv,
	d40a.maakunta_fi as alkuperaisen_oppilaitoksen_maakunta_fi,
	d40a.maakunta_sv as alkuperaisen_oppilaitoksen_maakunta_sv,
	d40b.maakunta_fi as oppilaitoksen_maakunta_tarkasteluhetki_fi,
	d40b.maakunta_sv as oppilaitoksen_maakunta_tarkasteluhetki_sv,
	d39a.kunta_fi as alkuperaisen_koulutuksen_jarjestajan_kunta_fi,
	d39a.kunta_sv as alkuperaisen_koulutuksen_jarjestajan_kunta_sv,
	d39b.kunta_fi as koulutuksen_jarjestajan_kunta_tarkasteluhetki_fi,
	d39b.kunta_sv as koulutuksen_jarjestajan_kunta_tarkasteluhetki_sv,
	d40a.kunta_fi as alkuperaisen_oppilaitoksen_kunta_fi,
	d40a.kunta_sv as alkuperaisen_oppilaitoksen_kunta_sv,
	d40b.kunta_fi as oppilaitoksen_kunta_tarkasteluhetki_fi,
	d40b.kunta_sv as oppilaitoksen_kunta_tarkasteluhetki_sv,
	d36a.oppilaitoksenopetuskieli_fi as alkuperaisen_koulutuksen_jarjestajan_opetuskieli_fi,
	d36a.oppilaitoksenopetuskieli_sv as alkuperaisen_koulutuksen_jarjestajan_opetuskieli_sv,
	d37a.oppilaitoksenopetuskieli_fi as koulutuksen_jarjestajan_opetuskieli_tarkasteluhetki_fi,
	d37a.oppilaitoksenopetuskieli_sv as koulutuksen_jarjestajan_opetuskieli_tarkasteluhetki_sv,
	d36b.oppilaitoksenopetuskieli_fi as alkuperaisen_oppilaitoksen_opetuskieli_fi,
	d36b.oppilaitoksenopetuskieli_sv as alkuperaisen_oppilaitoksen_opetuskieli_sv,
	d37b.oppilaitoksenopetuskieli_fi as oppilaitoksen_opetuskieli_tarkasteluhetki_fi,
	d37b.oppilaitoksenopetuskieli_sv as oppilaitoksen_opetuskieli_tarkasteluhetki_sv,

	d14a.koulutusluokitus_koodi as koodit_alkuperainen_tutkinto,
	d14b.koulutusluokitus_koodi as koodit_tutkinto_tarkasteluhetki,
	d36a.organisaatio_koodi as koodit_alkuperainen_koulutuksen_jarjestaja,
	d37a.organisaatio_koodi as koodit_koulutuksen_jarjestaja_tarkasteluhetki,
	d36b.organisaatio_koodi as koodit_alkuperainen_oppilaitos,
	d37b.organisaatio_koodi as koodit_oppilaitos_tarkasteluhetki,

	d13.jarjestys as jarjestys_aloitettu_koulutus,
	f.tilanne as jarjestys_priorisoitu_tilanne,
	f.alku as jarjestys_aloitusajankohta,
	COALESCE(f.aika_vuosina, 99) as jarjestys_tarkastelujakso,
	d7.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
	d8.jarjestys_ikaryhma6 as jarjestys_ika_aloittaessa,
	d9.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus_ryhma,
	d10.jarjestys_kieliryhma2 as jarjestys_aidinkieli_ryhma,
	d11.jarjestys_kytkin_koodi as jarjestys_suorittanut_perusopetuksen_oppimaaran,
	d15.jarjestys_kytkin_koodi as jarjestys_valmistunut_alkuperaisesta_koko_tutkintoon_johtavasta_koulutuksesta,
	d16.jarjestys_kytkin_koodi as jarjestys_valmistunut_muusta_koko_tutkintoon_johtavasta_koulutuksesta,
	d17.jarjestys_kytkin_koodi as jarjestys_jatkaa_alkuperaisessa_koko_tutkintoon_johtavassa_koulutuksessa,
	d18.jarjestys_kytkin_koodi as jarjestys_jatkaa_muussa_koko_tutkintoon_johtavassa_koulutuksessa,
	d21.jarjestys_kytkin_koodi as jarjestys_jatkaa_alkuperaisessa_valmentavassa_koulutuksessa,
	d22.jarjestys_kytkin_koodi as jarjestys_jatkaa_muussa_valmentavassa_koulutuksessa,
	d23.jarjestys_kytkin_koodi as jarjestys_valmistunut_ammatillisen_tutkinnon_osan_osien_koulutuksesta,
	d24.jarjestys_kytkin_koodi as jarjestys_jatkaa_ammatillisen_tutkinnon_osan_osien_koulutuksessa,
	d30.jarjestys_kytkin_koodi as jarjestys_ei_valmistunut_eika_edella_mainituissa_koulutuksissa,
	d34.jarjestys_erityisopetus_ryhma as jarjestys_erityisopetus_aloitettu_koulutus,
	d14a.jarjestys_koulutusalataso1_koodi as jarjestys_alkuperainen_koulutusala_taso_1,
	d14a.jarjestys_koulutusalataso2_koodi as jarjestys_alkuperainen_koulutusala_taso_2,
	d14a.jarjestys_koulutusalataso3_koodi as jarjestys_alkuperainen_koulutusala_taso_3,
	d14b.jarjestys_koulutusalataso1_koodi as jarjestys_koulutusala_taso_1_tarkasteluhetki,
	d14b.jarjestys_koulutusalataso2_koodi as jarjestys_koulutusala_taso_2_tarkasteluhetki,
	d14b.jarjestys_koulutusalataso3_koodi as jarjestys_koulutusala_taso_3_tarkasteluhetki,
	d31a.jarjestys as jarjestys_alkuperainen_koulutustyyppi,
	d31b.jarjestys as jarjestys_koulutustyyppi_tarkasteluhetki,
	f.oppimaara_alkuperainen as jarjestys_alkuperainen_oppimaara,
	f.oppimaara as jarjestys_oppimaara_tarkasteluhetki,
	d39a.jarjestys_maakunta_koodi as jarjestys_alkuperaisen_koulutuksen_jarjestajan_maakunta,
	d39b.jarjestys_maakunta_koodi as jarjestys_koulutuksen_jarjestajan_maakunta_tarkasteluhetki,
	d40a.jarjestys_maakunta_koodi as jarjestys_alkuperaisen_oppilaitoksen_maakunta,
	d40b.jarjestys_maakunta_koodi as jarjestys_oppilaitoksen_maakunta_tarkasteluhetki

FROM [dw].[f_koski_opintojen_kulku_toinen_aste] f
LEFT JOIN dw.d_kalenteri d1 on d1.kalenteri_avain = f.alku
LEFT JOIN dw.d_kalenteri d2 on d2.kalenteri_avain = f.loppu
LEFT JOIN dw.d_koski_suorituksen_tyyppi d3 on d3.koodi = coalesce(f.suorituksen_tyyppi , '-1')
LEFT JOIN dw.d_koski_suorituksen_tyyppi d4 on d4.koodi = f.suorituksen_tyyppi_alkuperainen 
LEFT JOIN dw.d_koski_koulutusmuoto d5 on d5.koodi = coalesce(f.koulutusmuoto, '-1')
LEFT JOIN dw.d_koski_koulutusmuoto d6 on d6.koodi = f.koulutusmuoto_alkuperainen
LEFT JOIN dw.d_sukupuoli d7 on d7.id = f.d_sukupuoli_id
LEFT JOIN dw.d_ika d8 on d8.id = f.d_ika_id
LEFT JOIN dw.d_maatjavaltiot2 d9 on d9.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN dw.d_kieli d10 on d10.id = f.d_aidinkieli_id
LEFT JOIN dw.d_kytkin d11 on d11.id = f.d_kytkin_suorittanut_perusopetuksen_id
LEFT JOIN dw.d_opintojen_kulku_priorisoitu_tilanne d12 on d12.priorisoitu_tilanne_koodi = f.tilanne_prio and d12.koulutus_kytkin = 'toinen_aste'
LEFT JOIN dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus d13 on d13.koodi = f.aloitettu_koulutus
LEFT JOIN dw.d_koulutusluokitus d14a on d14a.id = f.d_koulutusluokitus_alkuperainen_id
LEFT JOIN dw.d_koulutusluokitus d14b on d14b.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_koulutustyyppi d31a on d31a.koodi = coalesce(d14a.koulutustyyppi_koodi,-1)
LEFT JOIN dw.d_koulutustyyppi d31b on d31b.koodi = coalesce(d14b.koulutustyyppi_koodi,-1)
LEFT JOIN dw.d_kytkin d15 on d15.id = f.d_kytkin_valm_alk_koko_tutk_joht_koul_id
LEFT JOIN dw.d_kytkin d16 on d16.id = f.d_kytkin_valm_muu_koko_tutk_joht_koul_id
LEFT JOIN dw.d_kytkin d17 on d17.id = f.d_kytkin_jatk_alk_koko_tutk_joht_koul_id
LEFT JOIN dw.d_kytkin d18 on d18.id = f.d_kytkin_jatk_muu_koko_tutk_joht_koul_id
LEFT JOIN dw.d_kytkin d21 on d21.id = f.d_kytkin_jatk_alk_valm_koul_id
LEFT JOIN dw.d_kytkin d22 on d22.id = f.d_kytkin_jatk_muu_valm_koul_id
LEFT JOIN dw.d_kytkin d23 on d23.id = f.d_kytkin_valm_amm_tutk_osa_koul_id
LEFT JOIN dw.d_kytkin d24 on d24.id = f.d_kytkin_jatk_amm_tutk_osa_koul_id
LEFT JOIN dw.d_kytkin d30 on d30.kytkin_koodi = CASE WHEN d15.kytkin_koodi + d16.kytkin_koodi + d17.kytkin_koodi + d18.kytkin_koodi + d21.kytkin_koodi + d22.kytkin_koodi + d23.kytkin_koodi + d24.kytkin_koodi > 0 THEN 1 ELSE 0 END
LEFT JOIN dw.d_kytkin d32 on d32.id = f.d_kytkin_oppivelvollinen_alkamispaivana_id
LEFT JOIN dw.d_kytkin d33 on d33.id = f.d_kytkin_oppivelvollinen_id
LEFT JOIN dw.d_erityisopetus d34 on d34.id = f.d_erityisopetus_aloitettu_koulutus_id
LEFT JOIN dw.d_kytkin d35 on d35.id = f.d_kytkin_kotikunta_mannersuomessa_id
LEFT JOIN dw.d_organisaatioluokitus d36a on d36a.id = f.d_organisaatioluokitus_koulutuksen_jarjestaja_alkuperainen_id
LEFT JOIN dw.d_organisaatioluokitus d36b on d36b.id = f.d_organisaatioluokitus_oppilaitos_alkuperainen_id
LEFT JOIN dw.d_organisaatioluokitus d36c on d36c.id = f.d_organisaatioluokitus_toimipiste_alkuperainen_id
LEFT JOIN dw.d_organisaatioluokitus d37a on d37a.id = f.d_organisaatioluokitus_koulutuksen_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d37b on d37b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d37c on d37c.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_kytkin d38 on d38.id = f.d_kytkin_perusop_suor_aloitusvuoden_kevaana_id
LEFT JOIN dw.d_alueluokitus d39a on d39a.kunta_koodi = d36a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d39b on d39b.kunta_koodi = d37a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d40a on d40a.kunta_koodi = d36b.kunta_koodi
LEFT JOIN dw.d_alueluokitus d40b on d40b.kunta_koodi = d37b.kunta_koodi


GO


