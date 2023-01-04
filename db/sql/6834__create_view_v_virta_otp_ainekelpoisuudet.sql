USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_ainekelpoisuudet]    Script Date: 4.1.2023 15:10:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dw].[v_virta_otp_ainekelpoisuudet] AS

SELECT		
	 [Kelpoisuuden suoritusvuosi] = f.kelpoisuuden_vuosi
	,[Kelpoisuuden suoritusvuosi (toinen kelpoisuus)] = coalesce(cast(f.kelpoisuuden_vuosi2 as varchar), 'Tieto puuttuu')
	,[Kelpoisuuden suoritusvuosi (kolmas kelpoisuus)] = coalesce(cast(f.kelpoisuuden_vuosi3 as varchar), 'Tieto puuttuu')
	,[Tilastovuosi] = f.kelpoisuuden_vuosi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä] = d2.ika_fi
	,[Ikäryhmä] = d2.ikaryhma3_fi
	
	,d3a.aine_fi as Aine
	,d3a.aineryhma_1_fi as 'Aineryhmä I'
	,d3a.aineryhma_2_fi as 'Aineryhmä II'
	,coalesce(d3b.aine_fi, 'Ei muita ainekelpoisuuksia') as 'Aine (toinen kelpoisuus)'
	,coalesce(d3b.aineryhma_1_fi, 'Ei muita ainekelpoisuuksia') as 'Aineryhmä I (toinen kelpoisuus)'
	,coalesce(d3b.aineryhma_2_fi, 'Ei muita ainekelpoisuuksia') as 'Aineryhmä II (toinen kelpoisuus)'
	,coalesce(d3c.aine_fi, 'Ei muita ainekelpoisuuksia') as 'Aine (kolmas kelpoisuus)'
	,coalesce(d3c.aineryhma_1_fi, 'Ei muita ainekelpoisuuksia') as 'Aineryhmä I (kolmas kelpoisuus)'
	,coalesce(d3c.aineryhma_2_fi, 'Ei muita ainekelpoisuuksia') as 'Aineryhmä II (kolmas kelpoisuus)'
	,d4.koulutusluokitus_fi as 'Tutkinto (korkein)'
	,d4.okmohjauksenala_fi as 'OKM ohjauksen ala'
	,d4.koulutusalataso1_fi as 'Koulutusala, taso 1'
	,d4.koulutusalataso2_fi as 'Koulutusala, taso 2'
	,d4.koulutusalataso3_fi as 'Koulutusala, taso 3'
	,d4.koulutusastetaso1_fi as 'Koulutusaste, taso 1'
	,d4.koulutusastetaso2_fi as 'Koulutusaste, taso 2'
	,coalesce(f.laajuus, 'Tieto puuttuu') as 'Laajuus'
	,f.laajuus2 as 'Laajuus (toinen kelpoisuus)'
	,f.laajuus3 as 'Laajuus (kolmas kelpoisuus)'
	,CASE 
		WHEN f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi2 and f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi3 THEN 'Kyllä'
		WHEN f.kelpoisuuden_vuosi = f.kelpoisuuden_vuosi2 and f.kelpoisuuden_vuosi3 is null THEN 'Kyllä'
		WHEN f.kelpoisuuden_vuosi2 is null and f.kelpoisuuden_vuosi3 is null THEN 'Kyllä'
		ELSE 'Ei'
	END as 'Kelpoisuudet suoritettu samana vuonna'

	,d5a.organisaatio_fi as Korkeakoulu
	,d5a.oppilaitostyyppi_fi as 'Sektori'
	,d5b.organisaatio_fi as 'Korkeakoulu (toinen kelpoisuus)'
	,d5c.organisaatio_fi as 'Korkeakoulu (kolmas kelpoisuus)'
	,d6.organisaatio_fi as 'Tutkinnon suorituskorkeakoulu'

	,d4.koulutusluokitus_koodi as 'Koodit Tutkinto'
	,d5a.organisaatio_koodi as 'Koodit Korkeakoulu'
	,d5b.organisaatio_koodi as 'Koodit Korkeakoulu (toinen kelpoisuus)'
	,d5c.organisaatio_koodi as 'Koodit Korkeakoulu (kolmas kelpoisuus)'
	,d6.organisaatio_koodi as 'Koodit Tutkinnon suorituskorkeakoulu'

	,d1.jarjestys_sukupuoli_koodi as 'jarjestys Sukupuoli'
	,d2.jarjestys_ikaryhma3 as 'jarjestys Ikäryhmä'
	,d4.jarjestys_koulutusalataso1_koodi as 'jarjestys Koulutusala, taso 1'
	,d4.jarjestys_koulutusalataso2_koodi as 'jarjestys Koulutusala, taso 2'
	,d4.jarjestys_koulutusalataso3_koodi as 'jarjestys Koulutusala, taso 3'
	,d4.jarjestys_koulutusastetaso1_koodi as 'jarjestys Koulutusaste, taso 1'
	,d4.jarjestys_koulutusastetaso2_koodi as 'jarjestys Koulutusaste, taso 2'
	,d4.jarjestys_okmohjauksenala_koodi as 'jarjestys OKM ohjauksen ala' 
	,coalesce(d3b.aine_fi, 'ööö') as 'jarjetys Aine (toinen kelpoisuus)'
	,coalesce(d3b.aineryhma_1_fi, 'ööö') as 'jarjestys Aineryhmä I (toinen kelpoisuus)'
	,coalesce(d3b.aineryhma_2_fi, 'ööö') as 'jarjestys Aineryhmä II (toinen kelpoisuus)'
	,coalesce(d3c.aine_fi, 'ööö') as 'jarjetys Aine (kolmas kelpoisuus)'
	,coalesce(d3c.aineryhma_1_fi, 'ööö') as 'jarjestys Aineryhmä I (kolmas kelpoisuus)'
	,coalesce(d3c.aineryhma_2_fi, 'ööö') as 'jarjestys Aineryhmä II (kolmas kelpoisuus)'

	,f.henkilo
	,case when f.aine_sektori = 2 then 'Ammatillinen' else 'Perusopetus ja lukio' end as raportti

FROM dw.f_virta_otp_ainekelpoisuudet f

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


GO

USE [ANTERO]