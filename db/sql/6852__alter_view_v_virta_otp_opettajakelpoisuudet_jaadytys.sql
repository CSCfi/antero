USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opettajakelpoisuudet_jaadytys]    Script Date: 10.1.2023 13:50:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_virta_otp_opettajakelpoisuudet_jaadytys] AS

SELECT		
	 [Kelpoisuuden suoritusvuosi] = f.Vuosi
	,[Tilastovuosi] = f.Vuosi
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä] = d2.ika_fi
	,[Ikäryhmä] = d2.ikaryhma3_fi
	,[Opettajakelpoisuus] = d3.selite_fi
	,[Kelpoisuuden suoritustapa] =
		CASE
			WHEN suoritustapa = '1' THEN 'Kelpoisuus tutkinnon yhteydessä'
			WHEN suoritustapa = '2' THEN 'Kelpoisuus suoritettu erillisinä opintoina'
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
	,[Tutkinnon suoritusvuosi] = f.vuosi_korkein_tutkinto
	,[Tutkinnon suorituskorkeakoulu] = d13.organisaatio_fi
	,CASE 
		WHEN d3.selite_fi like '%ammatillinen%' THEN 'Ammatillinen'
		WHEN d3.selite_fi like '%Varhaiskasvatuksen%' and d3.selite_fi not like '%Luokanopettaja%' THEN 'Varhaiskasvatus'
		WHEN d3.selite_fi in('Luovien alojen opettaja', 'Opettajan pedagogiset opinnot (ei merkintää ainekelpoisuudesta)') THEN 'Muu'
		ELSE 'Yleissivistävä'
	END as raportti

	,[Korkeakoulu] = d5.organisaatio_fi

	,d16.kytkin_fi as 'Kelpoisuus suoritettu yhdessä korkeakoulussa'
	,[tutkinnon_yhteydessa] = CASE WHEN suoritustapa = '1' THEN 1 ELSE 0 END
	,[erillinen_eka] = CASE WHEN suoritustapa = '2' THEN 1 ELSE 0 END
	,[erillinen_taydentava] = CASE WHEN suoritustapa = '3' THEN 1 ELSE 0 END

	,f.KelpoisuusID

	--koodit
	,[Koodit Koulutusnimike] = d4.koulutusluokitus_koodi
	,[Koodit Korkeakoulu] = d5.organisaatio_koodi
	,[Koodit Tutkinnon suorituskorkeakoulu] = d13.organisaatio_koodi
	
	--järjestys
	,[jarjestys Sukupuoli] = d1.jarjestys_sukupuoli_koodi
	,[jarjestys Ikäryhmä] = d2.jarjestys_ikaryhma3
	,[jarjestys Opettajakelpoisuus] = d3.jarjestys3_koodi
	,[jarjestys Tutkinnon suoritustapa] =
		CASE
			WHEN suoritustapa = '1' THEN 1
			WHEN suoritustapa = '2' THEN 2
			ELSE 9
		END
	,[jarjestys Sektori] = d5.jarjestys_oppilaitostyyppi_koodi
	,[jarjestys Koulutusaste, taso 1] = d4.jarjestys_koulutusastetaso1_koodi
	,[jarjestys Koulutusaste, taso 2] = d4.jarjestys_koulutusastetaso2_koodi
	,[jarjestys Koulutusala, taso 1] = d4.jarjestys_koulutusalataso1_koodi
	,[jarjestys Koulutusala, taso 2] = d4.jarjestys_koulutusalataso2_koodi
	,[jarjestys Koulutusala, taso 3] = d4.jarjestys_koulutusalataso3_koodi
	,[jarjestys OKM ohjauksen ala] = d4.jarjestys_okmohjauksenala_koodi

FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f

LEFT JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id		
LEFT JOIN dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN dw.d_opettajapatevyys d3 on d3.id = f.d_kelpoisuus_id
LEFT JOIN dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_korkein_tutkinto_id
LEFT JOIN dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_kelpoisuus_id
LEFT JOIN dw.d_organisaatioluokitus d13 on d13.id = f.d_organisaatioluokitus_korkein_tutkinto_id
LEFT JOIN dw.d_kytkin d15 on d15.id = f.d_kytkin_yli_asetuksen_id
LEFT JOIN dw.d_kytkin d16 on d16.id = f.d_kytkin_yksi_org_id

WHERE  f.Vuosi <= YEAR(getdate()) AND [Status] = 'Raportilla näkyvä kelpoisuus'


GO

USE [ANTERO]

