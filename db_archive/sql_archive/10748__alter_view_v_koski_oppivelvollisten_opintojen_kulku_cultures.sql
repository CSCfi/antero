USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_oppivelvollisten_opintojen_kulku_cultures]    Script Date: 15.4.2025 10.32.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_koski_oppivelvollisten_opintojen_kulku_cultures] AS 

SELECT DISTINCT
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

	d7.sukupuoli_fi as sukupuoli_fi,
	d7.sukupuoli_sv as sukupuoli_sv,
	d8.ika_fi as ika_aloittaessa_fi,
	d8.ika_sv as ika_aloittaessa_sv,
	d9.maanosa1_fi as kansalaisuus_fi,
	d9.maanosa1_sv as kansalaisuus_sv,
	d10.kieliryhma2_fi as aidinkieli_ryhma_fi,
	d10.kieliryhma2_sv as aidinkieli_ryhma_sv,
	d11.kytkin_fi as suorittanut_perusopetuksen_oppimaaran_fi,
	d11.kytkin_sv as suorittanut_perusopetuksen_oppimaaran_sv,
	d32.selite_fi as pidennetty_oppivelvollisuus_fi,
	d32.selite_sv as pidennetty_oppivelvollisuus_sv,
	d33.selite_fi as perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus_fi,
	d33.selite_sv as perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus_sv,
	d35.kytkin_fi as kotikunta_manner_suomessa_tarkasteluhetki_fi,
	d35.kytkin_sv as kotikunta_manner_suomessa_tarkasteluhetki_sv,

	d14.kytkin_fi as oppivelvollisuus_paattynyt_fi,
	d14.kytkin_sv as oppivelvollisuus_paattynyt_sv,
	d15.kytkin_fi as valmistunut_alkuperaisesta_koko_tutkintoon_johtavasta_koulutuksesta_fi,
	d15.kytkin_sv as valmistunut_alkuperaisesta_koko_tutkintoon_johtavasta_koulutuksesta_sv,
	d16.kytkin_fi as valmistunut_muusta_koko_tutkintoon_johtavasta_koulutuksesta_fi,
	d16.kytkin_sv as valmistunut_muusta_koko_tutkintoon_johtavasta_koulutuksesta_sv,
	d17.kytkin_fi as jatkaa_alkuperaisessa_koko_tutkintoon_johtavassa_koulutuksessa_fi,
	d17.kytkin_sv as jatkaa_alkuperaisessa_koko_tutkintoon_johtavassa_koulutuksessa_sv,
	d18.kytkin_fi as jatkaa_muussa_koko_tutkintoon_johtavassa_koulutuksessa_fi,
	d18.kytkin_sv as jatkaa_muussa_koko_tutkintoon_johtavassa_koulutuksessa_sv,
	d19.kytkin_fi as valmistunut_alkuperaisesta_valmentavasta_koulutuksesta_fi,
	d19.kytkin_sv as valmistunut_alkuperaisesta_valmentavasta_koulutuksesta_sv,
	d20.kytkin_fi as valmistunut_muusta_valmentavasta_koulutuksesta_fi,
	d20.kytkin_sv as valmistunut_muusta_valmentavasta_koulutuksesta_sv,
	d21.kytkin_fi as jatkaa_alkuperaisessa_valmentavassa_koulutuksessa_fi,
	d21.kytkin_sv as jatkaa_alkuperaisessa_valmentavassa_koulutuksessa_sv,
	d22.kytkin_fi as jatkaa_muussa_valmentavassa_koulutuksessa_fi,
	d22.kytkin_sv as jatkaa_muussa_valmentavassa_koulutuksessa_sv,
	d23.kytkin_fi as valmistunut_ammatillisen_tutkinnon_osan_osien_koulutuksesta_fi,
	d23.kytkin_sv as valmistunut_ammatillisen_tutkinnon_osan_osien_koulutuksesta_sv,
	d24.kytkin_fi as jatkaa_ammatillisen_tutkinnon_osan_osien_koulutuksessa_fi,
	d24.kytkin_sv as jatkaa_ammatillisen_tutkinnon_osan_osien_koulutuksessa_sv,
	d25.kytkin_fi as valmistunut_perusopetuksen_oppimaaran_koulutuksesta_fi,
	d25.kytkin_sv as valmistunut_perusopetuksen_oppimaaran_koulutuksesta_sv,
	d26.kytkin_fi as jatkaa_perusopetuksen_oppimaaran_koulutuksessa_fi,
	d26.kytkin_sv as jatkaa_perusopetuksen_oppimaaran_koulutuksessa_sv,
	d27.kytkin_fi as koulutuksessa_joka_ei_kelpaa_oppivelvollisuuden_suorittamiseen_fi,
	d27.kytkin_sv as koulutuksessa_joka_ei_kelpaa_oppivelvollisuuden_suorittamiseen_sv,
	d28.kytkin_fi as ei_opiskeluoikeutta_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_ei_paatosta_oppivelvollisuuden_fi,
	d28.kytkin_sv as ei_opiskeluoikeutta_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_ei_paatosta_oppivelvollisuuden_sv,
	d29.kytkin_fi as opiskeluoikeus_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_paatos_oppivelvollisuuden_fi,
	d29.kytkin_sv as opiskeluoikeus_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_paatos_oppivelvollisuuden_sv,
	d30.kytkin_fi as oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_fi,
	d30.kytkin_sv as oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_sv,
	d31.kytkin_fi as ei_opiskeluoikeutta_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_paatos_oppivelvollisuuden_fi,
	d31.kytkin_sv as ei_opiskeluoikeutta_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_paatos_oppivelvollisuuden_sv,
	
	d12.priorisoitu_tilanne_fi as priorisoitu_tilanne_fi,
	d12.priorisoitu_tilanne_se as priorisoitu_tilanne_sv,
	d3.selite_fi as suorituksen_tyyppi_tarkasteluhetki_fi,
	d3.selite_sv as suorituksen_tyyppi_tarkasteluhetki_sv,
	d4.selite_fi as alkuperainen_suorituksen_tyyppi_fi,
	d4.selite_fi as alkuperainen_suorituksen_tyyppi_sv,
	
	d5.selite_fi as koulutusmuoto_tarkasteluhetki_fi,
	d5.selite_sv as koulutusmuoto_tarkasteluhetki_sv,
	d6.selite_fi as alkuperainen_koulutusmuoto_fi,
	d6.selite_sv as alkuperainen_koulutusmuoto_sv,

	d13.selite_fi as aloitettu_koulutus_fi,
	d13.selite_sv as aloitettu_koulutus_sv,
	d34.erityisopetus_ryhma_fi as erityisopetus_aloitettu_koulutus_fi,
	d34.erityisopetus_ryhma_sv as erityisopetus_aloitettu_koulutus_sv,

	d13.jarjestys as jarjestys_aloitettu_koulutus,
	f.tilanne as jarjestys_priorisoitu_tilanne,
	f.alku as jarjestys_aloitusajankohta,
	COALESCE(f.aika_vuosina, 99) as jarjestys_tarkastelujakso,
	d7.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
	d9.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus,
	d10.jarjestys_kieliryhma2 as jarjestys_aidinkieli,
	d11.jarjestys_kytkin_koodi as jarjestys_suorittanut_perusopetuksen_oppimaaran,
	d14.jarjestys_kytkin_koodi as jarjestys_oppivelvollisuus_paattynyt,
	d15.jarjestys_kytkin_koodi as jarjestys_valmistunut_alkuperaisesta_koko_tutkintoon_johtavasta_koulutuksesta,
	d16.jarjestys_kytkin_koodi as jarjestys_valmistunut_muusta_koko_tutkintoon_johtavasta_koulutuksesta,
	d17.jarjestys_kytkin_koodi as jarjestys_jatkaa_alkuperaisessa_koko_tutkintoon_johtavassa_koulutuksessa,
	d18.jarjestys_kytkin_koodi as jarjestys_jatkaa_muussa_koko_tutkintoon_johtavassa_koulutuksessa,
	d19.jarjestys_kytkin_koodi as jarjestys_valmistunut_alkuperaisesta_valmentavasta_koulutuksesta,
	d20.jarjestys_kytkin_koodi as jarjestys_valmistunut_muusta_valmentavasta_koulutuksesta,
	d21.jarjestys_kytkin_koodi as jarjestys_jatkaa_alkuperaisessa_valmentavassa_koulutuksessa,
	d22.jarjestys_kytkin_koodi as jarjestys_jatkaa_muussa_valmentavassa_koulutuksessa,
	d23.jarjestys_kytkin_koodi as jarjestys_valmistunut_ammatillisen_tutkinnon_osan_osien_koulutuksesta,
	d24.jarjestys_kytkin_koodi as jarjestys_jatkaa_ammatillisen_tutkinnon_osan_osien_koulutuksessa,
	d25.jarjestys_kytkin_koodi as jarjestys_valmistunut_perusopetuksen_oppimaaran_koulutuksesta,
	d26.jarjestys_kytkin_koodi as jarjestys_jatkaa_perusopetuksen_oppimaaran_koulutuksessa,
	d27.jarjestys_kytkin_koodi as jarjestys_koulutuksessa_joka_ei_kelpaa_oppivelvollisuuden_suorittamiseen,
	d28.jarjestys_kytkin_koodi as jarjestys_ei_opiskeluoikeutta_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_ei_paatosta_oppivelvollisuuden,
	d29.jarjestys_kytkin_koodi as jarjestys_opiskeluoikeus_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_paatos_oppivelvollisuuden,
	d30.jarjestys_kytkin_koodi as jarjestys_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa,
	d31.jarjestys_kytkin_koodi as jarjestys_ei_opiskeluoikeutta_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_paatos_oppivelvollisuuden,
	d32.jarjestys as jarjestys_pidennetty_oppivelvollisuus,
	d33.jarjestys as jarjestys_perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus,
	d34.jarjestys_erityisopetus_ryhma as jarjestys_erityisopetus_aloitettu_koulutus

FROM [dw].[f_koski_oppivelvollisten_opintojen_kulku] f
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
LEFT JOIN dw.d_opintojen_kulku_priorisoitu_tilanne d12 on d12.priorisoitu_tilanne_koodi = f.tilanne_prio and d12.koulutus_kytkin = 'oppivelvolliset'
LEFT JOIN dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus d13 on d13.koodi = f.aloitettu_koulutus
LEFT JOIN dw.d_kytkin d14 on d14.id = f.d_kytkin_oppivelvollisuus_paattynyt_id
LEFT JOIN dw.d_kytkin d15 on d15.id = f.d_kytkin_valm_alk_koko_tutk_joht_koul_id
LEFT JOIN dw.d_kytkin d16 on d16.id = f.d_kytkin_valm_muu_koko_tutk_joht_koul_id
LEFT JOIN dw.d_kytkin d17 on d17.id = f.d_kytkin_jatk_alk_koko_tutk_joht_koul_id
LEFT JOIN dw.d_kytkin d18 on d18.id = f.d_kytkin_jatk_muu_koko_tutk_joht_koul_id
LEFT JOIN dw.d_kytkin d19 on d19.id = f.d_kytkin_valm_alk_valm_koul_id
LEFT JOIN dw.d_kytkin d20 on d20.id = f.d_kytkin_valm_muu_valm_koul_id
LEFT JOIN dw.d_kytkin d21 on d21.id = f.d_kytkin_jatk_alk_valm_koul_id
LEFT JOIN dw.d_kytkin d22 on d22.id = f.d_kytkin_jatk_muu_valm_koul_id
LEFT JOIN dw.d_kytkin d23 on d23.id = f.d_kytkin_valm_amm_tutk_osa_koul_id
LEFT JOIN dw.d_kytkin d24 on d24.id = f.d_kytkin_jatk_amm_tutk_osa_koul_id
LEFT JOIN dw.d_kytkin d25 on d25.id = f.d_kytkin_valm_per_op_koul_id
LEFT JOIN dw.d_kytkin d26 on d26.id = f.d_kytkin_jatk_per_op_koul_id
LEFT JOIN dw.d_kytkin d27 on d27.id = f.d_kytkin_koul_jok_ei_kelp_ov_suor_id
LEFT JOIN dw.d_kytkin d28 on d28.id = f.d_kytkin_ei_koul_id
LEFT JOIN dw.d_kytkin d29 on d29.id = f.d_kytkin_kesk_ov_suor_val_id
LEFT JOIN dw.d_kytkin d31 on d31.id = f.d_kytkin_kesk_ov_suor_val_valpas_id
LEFT JOIN dw.d_kytkin d30 on d30.kytkin_koodi = CASE WHEN d17.kytkin_koodi + d18.kytkin_koodi + d21.kytkin_koodi + d22.kytkin_koodi + d24.kytkin_koodi + d26.kytkin_koodi + d29.kytkin_koodi > 0 THEN 1 ELSE 0 END
LEFT JOIN dw.d_pidennetty_oppivelvollisuus d32 on d32.id = f.d_pidennetty_oppivelvollisuus_id
LEFT JOIN dw.d_perusopetuksen_oppimaaran_yksilollistaminen d33 on d33.id = f.d_perusopetuksen_oppimaaran_yksilollistaminen_id
LEFT JOIN dw.d_erityisopetus d34 on d34.id = f.d_erityisopetus_aloitettu_koulutus_id
LEFT JOIN dw.d_kytkin d35 on d35.id = f.d_kytkin_kotikunta_mannersuomessa_id

GO

USE [ANTERO]