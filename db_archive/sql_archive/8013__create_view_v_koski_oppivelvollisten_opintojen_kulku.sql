USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_oppivelvollisten_opintojen kulku]    Script Date: 6.9.2023 11:42:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER VIEW [dw].[v_koski_oppivelvollisten_opintojen kulku] AS 

SELECT 
	CONCAT(d1.paiva, '.', d1.kuukausi, '. - ', d2.paiva, '.', d2.kuukausi, '.', d2.vuosi) as Aloitusajankohta,
	CASE 
		WHEN f.aika_vuosina = 0 THEN 'Aloitusajankohta'
		WHEN f.aika_vuosina = 1 THEN '1 vuosi aloituspäivästä'
		ELSE CONCAT(aika_vuosina, ' vuotta aloituspäivästä')
	END as Tarkastelujakso,
	f.oppija_oid,

	d7.sukupuoli_fi as Sukupuoli,
	d8.ika_fi as 'Ikä aloittaessa',
	d9.maanosa1_fi as Kansalaisuus,
	d10.kieliryhma2_fi as 'Äidinkieli (ryhmä)',
	d11.kytkin_fi as 'Suorittanut perusopetuksen oppimäärän',
	
	d12.priorisoitu_tilanne_fi as 'Priorisoitu tilanne',
	d3.selite_fi as 'Suorituksen tyyppi (tarkasteluhetki)',
	d4.selite_fi as 'Alkuperäinen suorituksen tyyppi',
	f.tilanne as jarjestys_tilanne,
	f.alku as jarjestys_aloitusajankohta,
	f.aika_vuosina as jarjestys_tarkastelujakso,
	d5.selite_fi as 'Koulutusmuoto (tarkasteluhetki)',
	d6.selite_fi as 'Alkuperäinen koulutusmuoto',

	d13.selite_fi as 'Aloitettu koulutus',
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

GO

USE [ANTERO]