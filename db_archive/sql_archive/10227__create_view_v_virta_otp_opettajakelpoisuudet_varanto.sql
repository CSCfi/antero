USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opettajakelpoisuudet_varanto]    Script Date: 15.10.2024 13:27:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dw].[v_virta_otp_opettajakelpoisuudet_varanto] AS

SELECT DISTINCT
	 f.tilastovuosi as Tilastovuosi
	,f.kelpoisuuden_vuosi as 'Kelpoisuuden vuosi'
	,coalesce(cast(f.korkeimman_tutkinnon_vuosi as varchar), 'Tieto puuttuu') as 'Tutkinnon suoritusvuosi'
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä tilastovuonna] = d2.ika_fi
	,[Ikäryhmä tilastovuonna] = d2.ikaryhma3_fi
	,[Opettajakelpoisuus] = d3.selite_fi
	,[Kelpoisuuden suoritustapa] =
		CASE
			WHEN suoritustapa = '1' THEN 'Kelpoisuus tutkinnon yhteydessä'
			WHEN suoritustapa = '2' THEN 'Kelpoisuus suoritettu erillisinä opintoina'
			ELSE 'Tieto puuttuu'
		END
	,[Yli asetuksen] = d15.kytkin_fi
	,[Sektori] = d5.oppilaitostyyppi_fi

	,d20.kytkin_fi as 'Kelpoisuus päätelty tutkinnosta'
	,d21.koulutusluokitus_fi as 'Tutkinto (korkein)'

	,[Korkeakoulu] = d5.organisaatio_fi

	,d16.kytkin_fi as 'Kelpoisuus suoritettu yhdessä korkeakoulussa'

	,f.KelpoisuusID
	,f.henkilo
	,f.priorisoitu_kelpoisuus

	--koodit
	,[Koodit Korkeakoulu] = d5.organisaatio_koodi
	,[Koodit Tutkinto (korkein)] = d21.koulutusluokitus_koodi

	--järjestys
	,[jarjestys Sukupuoli] = d1.jarjestys_sukupuoli_koodi
	,[jarjestys Ikäryhmä] = d2.jarjestys_ikaryhma3
	,[jarjestys Opettajakelpoisuus] = d3.jarjestys3_koodi
	,[jarjestys kelpoisuuden suoritustapa] =
		CASE
			WHEN suoritustapa = '1' THEN 1
			WHEN suoritustapa = '2' THEN 2
			ELSE 9
		END
	,[jarjestys Sektori] = d5.jarjestys_oppilaitostyyppi_koodi



FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_varanto_jaadytys f
LEFT JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id		
LEFT JOIN dw.d_ika d2 on d2.id = f.d_ika_tilastovuonna_id
LEFT JOIN dw.d_opettajapatevyys d3 on d3.id = f.d_kelpoisuus_id
LEFT JOIN dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_kelpoisuus_id
LEFT JOIN dw.d_kytkin d15 on d15.id = f.d_kytkin_yli_asetuksen_id
LEFT JOIN dw.d_kytkin d16 on d16.id = f.d_kytkin_yksi_org_id
LEFT JOIN dw.d_kytkin d20 on d20.id = f.d_kytkin_paatelty_tutkinnosta_id
LEFT JOIN dw.d_koulutusluokitus d21 on d21.id = f.d_koulutusluokitus_korkein_tutkinto_id
WHERE d2.ika_fi is not null



GO

USE [ANTERO]