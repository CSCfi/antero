USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_yhteiskaksoistutkinnot]    Script Date: 8.2.2024 13:50:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW  [dw].[v_virta_otp_yhteiskaksoistutkinnot] 
AS

SELECT 
	f.tilastovuosi as Tilastovuosi, 	

	d1.organisaatio_fi as Korkeakoulu,
	CASE
		WHEN d1.oppilaitostyyppi_fi = 'Tieto puuttuu' and d1.organisaatio_fi like '%ammattikorkeakoulu' THEN 'Ammattikorkeakoulu'
		ELSE d1.oppilaitostyyppi_fi
	END as Sektori,

	d2.koulutusluokitus_fi as Tutkinto,
	d2.okmohjauksenala_fi as 'OKM ohjauksen ala',
	d2.koulutusastetaso1_fi as 'Koulutusaste, taso 1',
	d2.koulutusastetaso2_fi as 'Koulutusaste, taso 2',
	d2.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d2.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d2.koulutusalataso3_fi as 'Koulutusala, taso 3',
	d3.os_luokittelu_nimi_fi as Luokittelu,

	d4.ika_fi as 'Ikä',
	d4.ikaryhma1_fi as 'Ikäryhmä',
	d5.sukupuoli_fi as Sukupuoli,
	d6.maatjavaltiot2_fi as Kansalaisuus,
	d6.maanosa_fi as 'Kansalaisuus (maanosa)',
	d6.maanosa2_fi as 'Kansalaisuus (maanosa, suuralue)',

	f.henkilo_koodi as Henkilo_koodi,

	d2.jarjestys_okmohjauksenala_koodi as 'OKM ohjauksen ala jarj',
	d2.jarjestys_koulutusastetaso1_koodi as 'Koulutusaste, taso 1 jarj',
	d2.jarjestys_koulutusastetaso2_koodi as 'Koulutusaste, taso 2 jarj',
	d2.jarjestys_koulutusalataso1_koodi as 'Koulutusala, taso 1 jarj',
	d2.jarjestys_koulutusalataso2_koodi as 'Koulutusala, taso 2 jarj',
	d2.jarjestys_koulutusalataso3_koodi as 'Koulutusala, taso 3 jarj',
	d4.jarjestys_ika as 'Ikä jarj',
	d4.jarjestys_ikaryhma1 as 'Ikäryhmä jarj'

FROM ANTERO.dw.f_virta_otp_yhteiskaksoistutkinnot f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 ON d2.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_virta_os_luokittelu d3 ON d3.id = f.d_virta_os_luokittelu_id
LEFT JOIN ANTERO.dw.d_ika d4 ON d4.id  = f.d_ika_id
LEFT JOIN ANTERO.dw.d_sukupuoli d5 ON d5.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d6 ON d6.id = f.d_maatjavaltiot2_kansalaisuus_id

		
GO

USE [ANTERO]