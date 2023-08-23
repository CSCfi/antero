USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_ainekelpoisuudet_jaadytys_cultures]    Script Date: 23.8.2023 11:05:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP VIEW IF EXISTS [dw].[v_virta_otp_ainekelpoisuudet_jaadytys]

GO

CREATE OR ALTER VIEW [dw].[v_virta_otp_ainekelpoisuudet_jaadytys_cultures] AS

SELECT		
	 kelpoisuuden_suoritusvuosi_fi = f.kelpoisuuden_vuosi
	,kelpoisuuden_suoritusvuosi_sv = f.kelpoisuuden_vuosi
	,kelpoisuuden_suoritusvuosi_en = f.kelpoisuuden_vuosi
	,kelpoisuuden_suoritusvuosi_toinen_kelpoisuus_fi = coalesce(cast(f.kelpoisuuden_vuosi2 as varchar), 'Tieto puuttuu')
	,kelpoisuuden_suoritusvuosi_toinen_kelpoisuus_sv = coalesce(cast(f.kelpoisuuden_vuosi2 as varchar), 'Information saknas')
	,kelpoisuuden_suoritusvuosi_toinen_kelpoisuus_en = coalesce(cast(f.kelpoisuuden_vuosi2 as varchar), 'Missing data')
	,kelpoisuuden_suoritusvuosi_kolmas_kelpoisuus_fi = coalesce(cast(f.kelpoisuuden_vuosi3 as varchar), 'Tieto puuttuu')
	,kelpoisuuden_suoritusvuosi_kolmas_kelpoisuus_sv = coalesce(cast(f.kelpoisuuden_vuosi3 as varchar), 'Information saknas')
	,kelpoisuuden_suoritusvuosi_kolmas_kelpoisuus_en = coalesce(cast(f.kelpoisuuden_vuosi3 as varchar), 'Missing data')
	,tilastovuosi_fi = f.kelpoisuuden_vuosi
	,tilastovuosi_sv = f.kelpoisuuden_vuosi
	,tilastovuosi_en = f.kelpoisuuden_vuosi

	,sukupuoli_fi = d1.sukupuoli_fi
	,sukupuoli_sv = d1.sukupuoli_sv
	,sukupuoli_en = d1.sukupuoli_en
	,ika_fi = d2.ika_fi
	,ika_sv = d2.ika_sv
	,ika_en = d2.ika_en
	,ikaryhma_fi = d2.ikaryhma3_fi
	,ikaryhma_sv = d2.ikaryhma3_sv
	,ikaryhma_en = d2.ikaryhma3_en
	
	,d3a.aine_fi as aine_fi
	,d3a.aine_sv as aine_sv
	,d3a.aine_en as aine_en
	,d3a.aineryhma_1_fi as 'aineryhma_taso_1_fi'
	,d3a.aineryhma_1_sv as 'aineryhma_taso_1_sv'
	,d3a.aineryhma_1_en as 'aineryhma_taso_1_en'
	,d3a.aineryhma_2_fi as 'aineryhma_taso_2_fi'
	,d3a.aineryhma_2_sv as 'aineryhma_taso_2_sv'
	,d3a.aineryhma_2_en as 'aineryhma_taso_2_en'
	,coalesce(d3b.aine_fi, 'Ei muita ainekelpoisuuksia') as 'aine_toinen_kelpoisuus_fi'
	,coalesce(d3b.aine_sv, 'Inga andra ämnesbehörigheter') as 'aine_toinen_kelpoisuus_sv'
	,coalesce(d3b.aine_en, 'No other subject qualifications') as 'aine_toinen_kelpoisuus_en'
	,coalesce(d3b.aineryhma_1_fi, 'Ei muita ainekelpoisuuksia') as 'aineryhma_taso_1_toinen_kelpoisuus_fi'
	,coalesce(d3b.aineryhma_1_sv, 'Inga andra ämnesbehörigheter') as 'aineryhma_taso_1_toinen_kelpoisuus_sv'
	,coalesce(d3b.aineryhma_1_en, 'No other subject qualifications') as 'aineryhma_taso_1_toinen_kelpoisuus_en'
	,coalesce(d3b.aineryhma_2_fi, 'Ei muita ainekelpoisuuksia') as 'aineryhma_taso_2_toinen_kelpoisuus_fi'
	,coalesce(d3b.aineryhma_2_sv, 'Inga andra ämnesbehörigheter') as 'aineryhma_taso_2_toinen_kelpoisuus_sv'
	,coalesce(d3b.aineryhma_2_en, 'No other subject qualifications') as 'aineryhma_taso_2_toinen_kelpoisuus_en'
	,coalesce(d3c.aine_fi, 'Ei muita ainekelpoisuuksia') as 'aine_kolmas_kelpoisuus_fi'
	,coalesce(d3c.aine_sv, 'Inga andra ämnesbehörigheter') as 'aine_kolmas_kelpoisuus_sv'
	,coalesce(d3c.aine_en, 'No other subject qualifications') as 'aine_kolmas_kelpoisuus_en'
	,coalesce(d3c.aineryhma_1_fi, 'Ei muita ainekelpoisuuksia') as 'aineryhma_taso_1_kolmas_kelpoisuus_fi'
	,coalesce(d3c.aineryhma_1_sv, 'Inga andra ämnesbehörigheter') as 'aineryhma_taso_1_kolmas_kelpoisuus_sv'
	,coalesce(d3c.aineryhma_1_en, 'No other subject qualifications') as 'aineryhma_taso_1_kolmas_kelpoisuus_en'
	,coalesce(d3c.aineryhma_2_fi, 'Ei muita ainekelpoisuuksia') as 'aineryhma_taso_2_kolmas_kelpoisuus_fi'
	,coalesce(d3c.aineryhma_2_sv, 'Inga andra ämnesbehörigheter') as 'aineryhma_taso_2_kolmas_kelpoisuus_sv'
	,coalesce(d3c.aineryhma_2_en, 'No other subject qualifications') as 'aineryhma_taso_2_kolmas_kelpoisuus_en'
	,d4.koulutusluokitus_fi as 'tutkinto_korkein_fi'
	,d4.koulutusluokitus_sv as 'tutkinto_korkein_sv'
	,d4.koulutusluokitus_en as 'tutkinto_korkein_en'
	,d4.okmohjauksenala_fi as 'okm_ohjauksen_ala_fi'
	,d4.okmohjauksenala_sv as 'okm_ohjauksen_ala_sv'
	,d4.okmohjauksenala_en as 'okm_ohjauksen_ala_en'
	,d4.koulutusalataso1_fi as 'koulutusala_taso_1_fi'
	,d4.koulutusalataso1_sv as 'koulutusala_taso_1_sv'
	,d4.koulutusalataso1_en as 'koulutusala_taso_1_en'
	,d4.koulutusalataso2_fi as 'koulutusala_taso_2_fi'
	,d4.koulutusalataso2_sv as 'koulutusala_taso_2_sv'
	,d4.koulutusalataso2_en as 'koulutusala_taso_2_en'
	,d4.koulutusalataso3_fi as 'koulutusala_taso_3_fi'
	,d4.koulutusalataso3_sv as 'koulutusala_taso_3_sv'
	,d4.koulutusalataso3_en as 'koulutusala_taso_3_en'
	,d4.koulutusastetaso1_fi as 'koulutusaste_taso_1_fi'
	,d4.koulutusastetaso1_sv as 'koulutusaste_taso_1_sv'
	,d4.koulutusastetaso1_en as 'koulutusaste_taso_1_en'
	,d4.koulutusastetaso2_fi as 'koulutusaste_taso_2_fi'
	,d4.koulutusastetaso2_sv as 'koulutusaste_taso_2_sv'
	,d4.koulutusastetaso2_en as 'koulutusaste_taso_2_en'
	,coalesce(f.laajuus, 'Tieto puuttuu') as 'laajuus_fi'
	,coalesce(replace(f.laajuus,'muu laajuus', 'annat omfattning'), 'Information saknas') as 'laajuus_sv'
	,coalesce(replace(f.laajuus,'muu laajuus', 'other scope'), 'Missing data') as 'laajuus_en'
	,coalesce(f.laajuus2, 'Tieto puuttuu') as 'laajuus_toinen_kelpoisuus_fi'
	,coalesce(replace(f.laajuus2,'muu laajuus', 'annat omfattning'), 'Information saknas') as 'laajuus_toinen_kelpoisuus_sv'
	,coalesce(replace(f.laajuus2,'muu laajuus', 'other scope'), 'Missing data') as 'laajuus_toinen_kelpoisuus_en'
	,coalesce(f.laajuus3, 'Tieto puuttuu') as 'laajuus_kolmas_kelpoisuus_fi'
	,coalesce(replace(f.laajuus3,'muu laajuus', 'annat omfattning'), 'Information saknas') as 'laajuus_kolmas_kelpoisuus_sv'
	,coalesce(replace(f.laajuus3,'muu laajuus', 'other scope'), 'Missing data') as 'laajuus_kolmas_kelpoisuus_en'
	,CASE 
		WHEN f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi2 and f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi3 THEN 'Kyllä'
		WHEN f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi2 and f.kelpoisuuden_vuosi3 is null THEN 'Kyllä'
		WHEN f.kelpoisuuden_vuosi2 is null and f.kelpoisuuden_vuosi3 is null THEN 'Kyllä'
		ELSE 'Ei'
	END as 'kelpoisuudet_suoritettu_samana_vuonna_fi'
	,CASE 
		WHEN f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi2 and f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi3 THEN 'Ja'
		WHEN f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi2 and f.kelpoisuuden_vuosi3 is null THEN 'Ja'
		WHEN f.kelpoisuuden_vuosi2 is null and f.kelpoisuuden_vuosi3 is null THEN 'Ja'
		ELSE 'Nej'
	END as 'kelpoisuudet_suoritettu_samana_vuonna_sv'
	,CASE 
		WHEN f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi2 and f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi3 THEN 'Yes'
		WHEN f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi2 and f.kelpoisuuden_vuosi3 is null THEN 'Yes'
		WHEN f.kelpoisuuden_vuosi2 is null and f.kelpoisuuden_vuosi3 is null THEN 'Yes'
		ELSE 'No'
	END as 'kelpoisuudet_suoritettu_samana_vuonna_en'
	,d7.kytkin_fi as 'kelpoisuus_paatelty_tutkinnosta_fi'
	,d5a.organisaatio_fi as korkeakoulu_fi
	,d5a.organisaatio_sv as korkeakoulu_sv
	,d5a.organisaatio_en as korkeakoulu_en
	,d5a.oppilaitostyyppi_fi as 'sektori_fi'
	,d5a.oppilaitostyyppi_sv as 'sektori_sv'
	,d5a.oppilaitostyyppi_en as 'sektori_en'
	,d5b.organisaatio_fi as 'korkeakoulu_toinen_kelpoisuus_fi'
	,d5b.organisaatio_sv as 'korkeakoulu_toinen_kelpoisuus_sv'
	,d5b.organisaatio_en as 'korkeakoulu_toinen_kelpoisuus_en'
	,d5c.organisaatio_fi as 'korkeakoulu_kolmas_kelpoisuus_fi'
	,d5c.organisaatio_sv as 'korkeakoulu_kolmas_kelpoisuus_sv'
	,d5c.organisaatio_en as 'korkeakoulu_kolmas_kelpoisuus_en'
	,d6.organisaatio_fi as 'tutkinnon_suorituskorkeakoulu_fi'
	,d6.organisaatio_sv as 'tutkinnon_suorituskorkeakoulu_sv'
	,d6.organisaatio_en as 'tutkinnon_suorituskorkeakoulu_en'

	,d4.koulutusluokitus_koodi as 'koodit_tutkinto_korkein'
	,d5a.organisaatio_koodi as 'koodit_korkeakoulu'
	,d5b.organisaatio_koodi as 'koodit_korkeakoulu_toinen_kelpoisuus'
	,d5c.organisaatio_koodi as 'koodit_korkeakoulu_kolmas_kelpoisuus'
	,d6.organisaatio_koodi as 'koodit_tutkinnon_suorituskorkeakoulu'

	,d1.jarjestys_sukupuoli_koodi as 'jarjestys_sukupuoli'
	,d2.jarjestys_ikaryhma3 as 'jarjestys_ikaryhma'
	,d4.jarjestys_koulutusalataso1_koodi as 'jarjestys_koulutusala_taso_1'
	,d4.jarjestys_koulutusalataso2_koodi as 'jarjestys_koulutusala_taso_2'
	,d4.jarjestys_koulutusalataso3_koodi as 'jarjestys_koulutusala_taso_3'
	,d4.jarjestys_koulutusastetaso1_koodi as 'jarjestys_koulutusaste_taso_1'
	,d4.jarjestys_koulutusastetaso2_koodi as 'jarjestys_koulutusaste_taso_2'
	,d4.jarjestys_okmohjauksenala_koodi as 'jarjestys_okm_ohjauksen_ala' 
	,coalesce(d3b.aine_fi, 'ööö') as 'jarjestys_aine_toinen_kelpoisuus'
	,coalesce(d3b.aineryhma_1_fi, 'ööö') as 'jarjestys_aineryhma_taso_1_toinen_kelpoisuus'
	,coalesce(d3b.aineryhma_2_fi, 'ööö') as 'jarjestys_aineryhma_taso_2_toinen_kelpoisuus'
	,coalesce(d3c.aine_fi, 'ööö') as 'jarjestys_aine_kolmas_kelpoisuus'
	,coalesce(d3c.aineryhma_1_fi, 'ööö') as 'jarjestys_aineryhma_taso_1_kolmas_kelpoisuus'
	,coalesce(d3c.aineryhma_2_fi, 'ööö') as 'jarjestys_aineryhma_taso_2_kolmas_kelpoisuus'

	,f.henkilo as apusarake_henkilo
	,case when f.aine_sektori = 2 then 'Ammatillinen' else 'Perusopetus ja lukio' end as apusarake_raportti

FROM dw.f_virta_otp_ainekelpoisuudet_jaadytys f

LEFT JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id		
LEFT JOIN dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN dw.d_ainekelpoisuus d3a on d3a.id = f.d_ainekelpoisuus_id
LEFT JOIN dw.d_ainekelpoisuus d3b on d3b.id = f.d_ainekelpoisuus2_id
LEFT JOIN dw.d_ainekelpoisuus d3c on d3c.id = f.d_ainekelpoisuus3_id
LEFT JOIN dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_korkein_tutkinto_id
LEFT JOIN dw.d_organisaatioluokitus d5a on d5a.id = f.d_organisaatioluokitus_kelpoisuus_id
LEFT JOIN dw.d_organisaatioluokitus d5b on d5b.id = f.d_organisaatioluokitus_kelpoisuus2_id
LEFT JOIN dw.d_organisaatioluokitus d5c on d5c.id = f.d_organisaatioluokitus_kelpoisuus3_id
LEFT JOIN dw.d_organisaatioluokitus d6 on d6.id = f.d_organisaatioluokitus_korkein_tutkinto_id
LEFT JOIN dw.d_kytkin d7 on d7.id = f.d_kytkin_paatelty_tutkinnosta_id

GO

USE [ANTERO]