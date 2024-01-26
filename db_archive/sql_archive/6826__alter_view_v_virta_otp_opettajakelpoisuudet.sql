USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opettajakelpoisuudet]    Script Date: 4.1.2023 13:30:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_virta_otp_opettajakelpoisuudet] AS

SELECT		
	 [Kelpoisuuden suoritusvuosi] = f.tilastovuosi
	,[Tilastovuosi] = f.tilastovuosi
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä] = d2.ika_fi
	,[Ikäryhmä] = d2.ikaryhma3_fi
	,[Opettajakelpoisuus] = d3b.selite_fi
	,[Kelpoisuuden suoritustapa] =
		CASE
			WHEN d_opettajapatevyys_suoritustapa_id = '1' THEN 'Kelpoisuus tutkinnon yhteydessä'
			WHEN d_opettajapatevyys_suoritustapa_id = '2' THEN 'Kelpoisuus suoritettu erillisinä opintoina'
			ELSE 'Tieto puuttuu'
		END
	,[Yli asetuksen] = d15.kytkin_fi
	,[Sektori] = d5.oppilaitostyyppi_fi
	,[Koulutusaste, taso 1] = d4.koulutusastetaso1_fi
	,[Koulutusaste, taso 2] = d4.koulutusastetaso2_fi
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d4.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi
	,[OKM ohjauksen ala] = d4.okmohjauksenala_fi
	,[Tutkinto (korkein)] = d4.koulutusluokitus_fi
	,[Tutkinnon suoritusvuosi] = f.korkeimman_tutkinnon_vuosi
	,[Tutkinnon suorituskorkeakoulu] = d13.organisaatio_fi
	,CASE 
		WHEN d3b.selite_fi like '%ammatillinen%' THEN 'Ammatillinen'
		WHEN d3b.selite_fi like '%Varhaiskasvatuksen%' and d3b.selite_fi not like '%Luokanopettaja%' THEN 'Varhaiskasvatus'
		WHEN d3b.selite_fi in('Luovien alojen opettaja', 'Opettajan pedagogiset opinnot (ei merkintää ainekelpoisuudesta)') THEN 'Muu'
		ELSE 'Yleissivistävä'
	END as raportti

	,[Korkeakoulu] = d5.organisaatio_fi

	,[tutkinnon_yhteydessa] = CASE WHEN d_opettajapatevyys_suoritustapa_id = '1' THEN 1 ELSE 0 END
	,[erillinen_eka] = CASE WHEN d_opettajapatevyys_suoritustapa_id = '2' THEN 1 ELSE 0 END
	,[erillinen_taydentava] = CASE WHEN d_opettajapatevyys_suoritustapa_id = '3' THEN 1 ELSE 0 END

	,lkm

	--koodit
	,[Koodit Koulutusnimike] = d4.koulutusluokitus_koodi
	,[Koodit Korkeakoulu] = d5.organisaatio_koodi
	,[Koodit Tutkinnon suorituskorkeakoulu] = d13.organisaatio_koodi
	
	--järjestys
	,[jarjestys Sukupuoli] = d1.jarjestys_sukupuoli_koodi
	,[jarjestys Ikäryhmä] = d2.jarjestys_ikaryhma3
	,[jarjestys Opettajakelpoisuus] = d3b.jarjestys3_koodi
	,[jarjestys Tutkinnon suoritustapa] =
		CASE
			WHEN d_opettajapatevyys_suoritustapa_id = '1' THEN 1
			WHEN d_opettajapatevyys_suoritustapa_id = '2' THEN 2
			ELSE 9
		END
	,[jarjestys Sektori] = d5.jarjestys_oppilaitostyyppi_koodi
	,[jarjestys Koulutusaste, taso 1] = d4.jarjestys_koulutusastetaso1_koodi
	,[jarjestys Koulutusaste, taso 2] = d4.jarjestys_koulutusastetaso2_koodi
	,[jarjestys Koulutusala, taso 1] = d4.jarjestys_koulutusalataso1_koodi
	,[jarjestys Koulutusala, taso 2] = d4.jarjestys_koulutusalataso2_koodi
	,[jarjestys Koulutusala, taso 3] = d4.jarjestys_koulutusalataso3_koodi
	,[jarjestys OKM ohjauksen ala] = d4.jarjestys_okmohjauksenala_koodi

FROM dw.f_virta_otp_opettajakelpoisuudet f

LEFT JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id		
LEFT JOIN dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN dw.d_opettajapatevyys d3b on d3b.id = f.d_opettajapatevyys_id
LEFT JOIN dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_viimeisin_tutkinto_id
LEFT JOIN dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatio_kelpoisuus_id
LEFT JOIN dw.d_organisaatioluokitus d13 on d13.id = f.d_organisaatio_tutkinto_id
LEFT JOIN dw.d_kytkin d15 on d15.id = f.d_kytkin_yli_asetuksen_id

WHERE  f.tilastovuosi <= YEAR(getdate())

GO

USE [ANTERO]