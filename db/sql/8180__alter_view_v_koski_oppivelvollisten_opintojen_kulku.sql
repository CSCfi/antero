USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_oppivelvollisten_opintojen kulku]    Script Date: 9.10.2023 13:43:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP VIEW IF EXISTS [dw].[v_koski_oppivelvollisten_opintojen kulku]
GO

CREATE OR ALTER  VIEW [dw].[v_koski_oppivelvollisten_opintojen_kulku] AS 

SELECT 
	CONCAT(d1.paiva, '.', d1.kuukausi, '. - ', d2.paiva, '.', d2.kuukausi, '.', d2.vuosi) as Aloitusajankohta,
	CASE 
		WHEN f.aika_vuosina = 0 THEN 'Aloitusajankohta'
		WHEN f.aika_vuosina = 1 THEN '1 vuosi aloituspäivästä'
		ELSE CONCAT(aika_vuosina, ' vuotta aloituspäivästä')
	END as Tarkastelujakso,

	d7.sukupuoli_fi as Sukupuoli,
	d8.ika_fi as 'Ikä aloittaessa',
	d9.maanosa1_fi as Kansalaisuus,
	d10.kieliryhma2_fi as 'Äidinkieli (ryhmä)',
	d11.kytkin_fi as 'Suorittanut perusopetuksen oppimäärän',
	
	d12.priorisoitu_tilanne_fi as 'Priorisoitu tilanne',
	d14.kytkin_fi as 'Oppivelvollisuus päättynyt',
	d15.kytkin_fi as 'Valm. alkuper. koko tutk. johtavasta koulutuksesta',
	d16.kytkin_fi as 'Valm. muusta koko tutk. johtavasta koulutuksesta',
	d17.kytkin_fi as 'Jatk. alkuper. koko tutk. johtavassa koulutuksessa',
	d18.kytkin_fi as 'Jatk. muussa koko tutk. johtavassa koulutuksessa',
	d19.kytkin_fi as 'Valm. alkuper. valmentavasta koulutuksesta',
	d20.kytkin_fi as 'Valm. muusta valmentavasta koulutuksesta',
	d21.kytkin_fi as 'Jatk. alkuper. valmentavassa koulutuksessa',
	d22.kytkin_fi as 'Jatk. muussa valmentavassa koulutuksessa',
	d23.kytkin_fi as 'Valm. amm. tutk. osan/osien koulutuksesta',
	d24.kytkin_fi as 'Jatk. amm. tutk. osan/osien koulutuksessa',
	d25.kytkin_fi as 'Valm. perusop. oppimäärän koulutuksesta',
	d26.kytkin_fi as 'Jatk. perusop. oppimäärän koulutuksessa',
	d27.kytkin_fi as 'Koulutuksessa, joka ei kelpaa oppivelv. suorittamiseen',
	d28.kytkin_fi as 'Ei koulutuksessa',
	d29.kytkin_fi as 'Keskeyttänyt koulutuksen väliaikaisesti',
	
	d3.selite_fi as 'Suorituksen tyyppi (tarkasteluhetki)',
	d4.selite_fi as 'Alkuperäinen suorituksen tyyppi',
	d5.selite_fi as 'Koulutusmuoto (tarkasteluhetki)',
	d6.selite_fi as 'Alkuperäinen koulutusmuoto',
	d13.selite_fi as 'Aloitettu koulutus',

	f.oppija_oid,

	f.aika_vuosina as jarjestys_tarkastelujakso,
	f.tilanne as jarjestys_tilanne,
	f.alku as jarjestys_aloitusajankohta,
	d13.jarjestys as jarjestys_aloitettu_koulutus,
	d7.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
	d9.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus,
	d10.jarjestys_kieliryhma2 as jarjestys_aidinkieli,
	d11.jarjestys_kytkin_koodi as jarjestys_suorittanut_perusopetuksen_oppimäärän

FROM [ANTERO].[dw].[f_koski_oppivelvollisten_opintojen_kulku] f
LEFT JOIN ANTERO.dw.d_kalenteri d1 on d1.kalenteri_avain = f.alku
LEFT JOIN ANTERO.dw.d_kalenteri d2 on d2.kalenteri_avain = f.loppu
LEFT JOIN ANTERO.dw.d_koski_suorituksen_tyyppi d3 on d3.koodi = coalesce(f.suorituksen_tyyppi , '-1')
LEFT JOIN ANTERO.dw.d_koski_suorituksen_tyyppi d4 on d4.koodi = f.suorituksen_tyyppi_alkuperainen 
LEFT JOIN ANTERO.dw.d_koski_koulutusmuoto d5 on d5.koodi = coalesce(f.koulutusmuoto, '-1')
LEFT JOIN ANTERO.dw.d_koski_koulutusmuoto d6 on d6.koodi = f.koulutusmuoto_alkuperainen
LEFT JOIN ANTERO.dw.d_sukupuoli d7 on d7.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_ika d8 on d8.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d9 on d9.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_kieli d10 on d10.id = f.d_aidinkieli_id
LEFT JOIN ANTERO.dw.d_kytkin d11 on d11.id = f.d_kytkin_suorittanut_perusopetuksen_id
LEFT JOIN ANTERO.dw.d_opintojen_kulku_priorisoitu_tilanne d12 on d12.priorisoitu_tilanne_koodi = f.tilanne_prio and d12.koulutus_kytkin = 'oppivelvolliset'
LEFT JOIN ANTERO.dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus d13 on d13.koodi = f.aloitettu_koulutus
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = f.d_kytkin_oppivelvollisuus_paattynyt_id
LEFT JOIN ANTERO.dw.d_kytkin d15 on d15.id = f.d_kytkin_valm_alk_koko_tutk_joht_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = f.d_kytkin_valm_muu_koko_tutk_joht_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d17 on d17.id = f.d_kytkin_jatk_alk_koko_tutk_joht_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d18 on d18.id = f.d_kytkin_jatk_muu_koko_tutk_joht_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d19 on d19.id = f.d_kytkin_valm_alk_valm_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d20 on d20.id = f.d_kytkin_valm_muu_valm_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d21 on d21.id = f.d_kytkin_jatk_alk_valm_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d22 on d22.id = f.d_kytkin_jatk_muu_valm_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d23 on d23.id = f.d_kytkin_valm_amm_tutk_osa_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d24 on d24.id = f.d_kytkin_jatk_amm_tutk_osa_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d25 on d25.id = f.d_kytkin_valm_per_op_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d26 on d26.id = f.d_kytkin_jatk_per_op_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d27 on d27.id = f.d_kytkin_koul_jok_ei_kelp_ov_suor_id
LEFT JOIN ANTERO.dw.d_kytkin d28 on d28.id = f.d_kytkin_ei_koul_id
LEFT JOIN ANTERO.dw.d_kytkin d29 on d29.id = f.d_kytkin_kesk_ov_suor_val_id



GO

USE [ANTERO]
