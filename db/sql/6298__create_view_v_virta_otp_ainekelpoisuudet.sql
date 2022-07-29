USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_ainekelpoisuudet]    Script Date: 8.7.2022 11:10:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dw].[v_virta_otp_ainekelpoisuudet] AS

SELECT		
	 [Kelpoisuuden suoritusvuosi] = f.kelpoisuuden_vuosi
	,[Tilastovuosi] = f.kelpoisuuden_vuosi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä] = d2.ika_fi
	,[Ikäryhmä] = d2.ikaryhma3_fi
	
	,d3.aine_fi as Aine
	,d3.aineryhma_1_fi as 'Aineryhmä I'
	,d3.aineryhma_2_fi as 'Aineryhmä II'
	,f.laajuus as 'Laajuus'
	,d4.koulutusluokitus_fi as 'Tutkinto (korkein)'
	,d4.okmohjauksenala_fi as 'OKM ohjauksen ala'
	,d4.koulutusalataso1_fi as 'Koulutusala, taso 1'
	,d4.koulutusalataso2_fi as 'Koulutusala, taso 2'
	,d4.koulutusalataso3_fi as 'Koulutusala, taso 3'
	,d4.koulutusastetaso1_fi as 'Koulutusaste, taso 1'
	,d4.koulutusastetaso2_fi as 'Koulutusaste, taso 2'

	,d5.organisaatio_fi as Korkeakoulu
	,d5.oppilaitostyyppi_fi as 'Sektori'
	,d6.organisaatio_fi as 'Tutkinnon suorituskorkeakoulu'

	,d4.koulutusluokitus_koodi as  'Koodit Tutkinto'
	,d5.organisaatio_koodi as 'Koodit Korkeakoulu'
	,d6.organisaatio_koodi as 'Koodit Tutkinnon suorituskorkeakoulu'

	,d1.jarjestys_sukupuoli_koodi as 'jarjestys Sukupuoli'
	,d2.jarjestys_ikaryhma3 as 'jarjestys Ikäryhmä'
	,d4.jarjestys_koulutusalataso1_koodi as 'jarjestys Koulutusala, taso 1'
	,d4.jarjestys_koulutusalataso2_koodi as 'jarjestys Koulutusala, taso 2'
	,d4.jarjestys_koulutusalataso3_koodi as 'jarjestys Koulutusala, taso 3'
	,d4.jarjestys_koulutusastetaso1_koodi as 'jarjestys Koulutusaste, taso 1'
	,d4.jarjestys_koulutusastetaso2_koodi as 'jarjestys Koulutusaste, taso 2'
	,d4.jarjestys_okmohjauksenala_koodi as 'jarjestys OKM ohjauksen ala', 

	lkm

FROM dw.f_virta_otp_ainekelpoisuudet f

LEFT JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id		
LEFT JOIN dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN dw.d_ainekelpoisuus d3 on d3.id = f.d_ainekelpoisuus_id
LEFT JOIN dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_korkein_tutkinto_id
LEFT JOIN dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_kelpoisuus_id
LEFT JOIN dw.d_organisaatioluokitus d6 on d6.id = f.d_organisaatioluokitus_korkein_tutkinto_id

WHERE  f.kelpoisuuden_vuosi <= YEAR(getdate())

GO

USE [ANTERO]