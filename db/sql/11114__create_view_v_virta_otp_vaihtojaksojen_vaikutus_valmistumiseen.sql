USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen]    Script Date: 27.8.2025 12.06.08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER VIEW [dw].[v_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen] as

SELECT

	f.aloitusvuosi as Aloitusvuosi,
	f.tutkinnon_suoritusvuosi as Tutkintovuosi,
	f.Vaihtovuosi,
	d6.lukuvuosi as  Vaihtolukuvuosi,
	NULLIF(CONCAT(f.Vaihtovuosi,LEFT(d6.lukukausi_fi,1)),'') as Vaihtolukukausi,

	d1.organisaatio_fi as Korkeakoulu,
	f.korkeakoulun_lyhenne as 'Korkeakoulun lyhenne',
	d1.oppilaitostyyppi_fi as Oppilaitostyyppi,

	d2.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d2.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d2.koulutusalataso3_fi as 'Koulutusala, taso 3',
	d2.koulutusastetaso1_fi as 'Koulutusaste, taso 1',
	d2.koulutusastetaso2_fi as 'Koulutusaste, taso 2',

	d3.sukupuoli_fi as Sukupuoli,
	d4.maanosa4_fi as Kansalaisuus,
	d5.kieli_fi as 'Äidinkieli',
	d7a.ika_fi as 'Ikä aloittaessa',
	d7b.ika_fi as 'Ikä valmistuessa',
	CASE
		WHEN f.tavoiteajassa_valmistunut = 1 THEN 'Tavoiteajassa valmistunut' 
		WHEN f.enintaan_12kk_yli_tavoitteen = 1 THEN 'Enintään 12kk yli tavoitteen'
		ELSE 'Yli 12kk tavoitteesta'
	END as Tavoiteaika,

	CASE 
		WHEN f.opintopisteet_vaihdossa = 0 THEN '0'
		WHEN f.opintopisteet_vaihdossa >= 41 THEN '41+'
		ELSE CONCAT(CAST(CEILING(f.opintopisteet_vaihdossa / 5.0) * 5 - 4 as varchar), '-',  CAST(CEILING(f.opintopisteet_vaihdossa / 5.0) * 5 as varchar))
	END as 'Opintopisteet vaihdossa',
	CASE 
		WHEN f.opintopisteet_vaihdossa = 0 THEN '0'
		WHEN f.opintopisteet_vaihdossa >= 40 THEN '40+'
		ELSE CONCAT(CAST(CEILING(f.opintopisteet_vaihdossa / 3.0) * 3 - 2 as varchar), '-',  CAST(CEILING(f.opintopisteet_vaihdossa / 3.0) * 3 as varchar))
	END as 'Opintopisteet vaihdossa (3 ryhmät)',

	f.opintopisteet_vaihdossa,
	f.opintopisteet_yhteensa,
	f.tavoiteajassa_valmistunut,
	f.enintaan_12kk_yli_tavoitteen,
	f.yli_12kk_tavoitteesta,
	f.on_aiempi_tutkinto,
	f.vaihtojakso as Vaihtojakso,
	f.vaihtolukuvuoden_jarjestysluku,
	f.vaihtolukukauden_jarjestysluku,
	f.opiskelijaAvain,
	f.opiskeluoikeusAvain,
	f.avain,

	CASE
		WHEN f.tavoiteajassa_valmistunut = 1 THEN 1
		WHEN f.enintaan_12kk_yli_tavoitteen = 1 THEN 2
		ELSE 3
	END as tavoiteaika_jarj,
	CASE 
		WHEN f.opintopisteet_vaihdossa = 0 THEN 0
		WHEN f.opintopisteet_vaihdossa >= 41 THEN 99
		ELSE CEILING(opintopisteet_vaihdossa / 5.0) * 5
	END as 'Opintopisteet vaihdossa_jarj',
	CASE 
		WHEN f.opintopisteet_vaihdossa = 0 THEN 0
		WHEN f.opintopisteet_vaihdossa >= 40 THEN 99
		ELSE CEILING(opintopisteet_vaihdossa / 3.0) * 3
	END as 'Opintopisteet vaihdossa_3_jarj'

FROM [dw].[f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_kieli d5 on d5.id = d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.id = f.d_kalenteri_vaihto_alkanut_id
LEFT JOIN ANTERO.dw.d_ika d7a on d7a.id = f.d_ika_aloittaessa_id
LEFT JOIN ANTERO.dw.d_ika d7b on d7b.id = f.d_ika_valmistuessa_id

GO


