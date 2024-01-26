USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opettajakelpoisuudet_jaadytys]    Script Date: 14.4.2023 8:13:08 ******/
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
		WHEN d3.selite_fi like '%erityis%' THEN 'Erityisopettaja'
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

	--apumuuttujat
	,coalesce(erityisopettaja.erityisopettaja,0) as erityisopettaja_prio
	,coalesce(varhaiskasvatuksen_erityisopettaja.varhaiskasvatuksen_erityisopettaja,0) as varhaiskasvatuksen_erityisopettaja_prio
	,coalesce(erityisluokanopettaja.erityisluokanopettaja,0) as erityisluokanopettaja_prio
	,case 
		when luokanopettaja_prio.luokanopettaja = 1 THEN 1
		when (aineenopettaja_luokanopettaja.aineenopettaja_luokanopettaja = 1 or varhaiskasvatuksen_opettaja_luokanopettaja.varhaiskasvatuksen_opettaja_luokanopettaja = 1) and luokanopettaja.luokanopettaja = 1 then 1
		else 0
	end as kaikki_luokanopettajat,
	coalesce(aineenopettaja_luokanopettaja.aineenopettaja_luokanopettaja,0) as aineenopettaja_luokanopettaja_prio,
	coalesce(varhaiskasvatuksen_opettaja_luokanopettaja.varhaiskasvatuksen_opettaja_luokanopettaja,0) as varhaiskasvatuksen_opettaja_luokanopettaja_prio,
	coalesce(luokanopettaja_prio.luokanopettaja,0) as luokanopettaja_prio,
	coalesce(opintoohjaaja.opintoohjaaja,0) as opintoohjaaja_prio,
	coalesce(aineenopettaja.aineenopettaja,0) as aineenopettaja_prio,
	coalesce(varhaiskasvatuksen_opettaja_amk.varhaiskasvatuksen_opettaja_amk,0) as varhaiskasvatuksen_opettaja_amk_prio,
	coalesce(varhaiskasvatuksen_opettaja_yo.varhaiskasvatuksen_opettaja_yo,0) as varhaiskasvatuksen_opettaja_yo_prio,
	coalesce(varhaiskasvatuksen_sosionomi.varhaiskasvatuksen_sosionomi,0) as varhaiskasvatuksen_sosionomi_prio,
	coalesce(ruotsinkielinen_ammatillinen_opettajakoulutus.ruotsinkielinen_ammatillinen_opettajakoulutus,0) as ruotsinkielinen_ammatillinen_opettajakoulutus_prio,
	coalesce(ammatillinen_opettajankoulutus.ammatillinen_opettajankoulutus,0) as ammatillinen_opettajankoulutus_prio,
	coalesce(ammatillinen_opettajankoulutus_ilman_tutkintoa.ammatillinen_opettajankoulutus,0) as ammatillinen_opettajankoulutus_ilman_tutkintoa_prio,
	coalesce(ammatillinen_erityisopettajankoulutus.ammatillinen_erityisopettajankoulutus,0) as ammatillinen_erityisopettajankoulutus_prio,
	coalesce(ammatillinen_opintoohjaajakoulutus.ammatillinen_opintoohjaajakoulutus,0) as ammatillinen_opintoohjaajakoulutus_prio,
	coalesce(pedagogiset_opinnot.pedagogiset_opinnot,0) as pedagogiset_opinnot_prio,
	coalesce(luovien_alojen_opettaja.luovien_alojen_opettaja,0) as luovien_alojen_opettaja_prio
FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f

LEFT JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id		
LEFT JOIN dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN dw.d_opettajapatevyys d3 on d3.id = f.d_kelpoisuus_id
LEFT JOIN dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_korkein_tutkinto_id
LEFT JOIN dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_kelpoisuus_id
LEFT JOIN dw.d_organisaatioluokitus d13 on d13.id = f.d_organisaatioluokitus_korkein_tutkinto_id
LEFT JOIN dw.d_kytkin d15 on d15.id = f.d_kytkin_yli_asetuksen_id
LEFT JOIN dw.d_kytkin d16 on d16.id = f.d_kytkin_yksi_org_id
OUTER APPLY (
	SELECT 1 as erityisopettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'ER' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) erityisopettaja
OUTER APPLY (
	SELECT 1 as varhaiskasvatuksen_erityisopettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi in ('VA_ER', 'EL') and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) varhaiskasvatuksen_erityisopettaja
OUTER APPLY (
	SELECT 1 as erityisluokanopettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'ER_PE' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) erityisluokanopettaja
OUTER APPLY (
	SELECT 1 as luokanopettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'PE' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi
) luokanopettaja
OUTER APPLY (
	SELECT 1 as luokanopettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'PE' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) luokanopettaja_prio
OUTER APPLY (
	SELECT 1 as varhaiskasvatuksen_opettaja_luokanopettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'VA_PE' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) varhaiskasvatuksen_opettaja_luokanopettaja
OUTER APPLY (
	SELECT 1 as aineenopettaja_luokanopettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'AI_PE' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) aineenopettaja_luokanopettaja
OUTER APPLY (
	SELECT 1 as opintoohjaaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'OP' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) opintoohjaaja
OUTER APPLY (
	SELECT 1 as aineenopettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'AI' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) aineenopettaja
OUTER APPLY (
	SELECT 1 as varhaiskasvatuksen_opettaja_amk FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'VA' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) varhaiskasvatuksen_opettaja_amk
OUTER APPLY (
	SELECT 1 as varhaiskasvatuksen_opettaja_yo FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'VY' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) varhaiskasvatuksen_opettaja_yo
OUTER APPLY (
	SELECT 1 as varhaiskasvatuksen_sosionomi FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'VS' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) varhaiskasvatuksen_sosionomi
OUTER APPLY (
	SELECT 1 as ammatillinen_opettajankoulutus FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'JA' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus' and f.d_koulutusluokitus_korkein_tutkinto_id <> -1
) ammatillinen_opettajankoulutus
OUTER APPLY (
	SELECT 1 as ammatillinen_opettajankoulutus FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'JA' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus' and f.d_koulutusluokitus_korkein_tutkinto_id = -1
) ammatillinen_opettajankoulutus_ilman_tutkintoa
OUTER APPLY (
	SELECT 1 as ammatillinen_erityisopettajankoulutus FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'JB' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) ammatillinen_erityisopettajankoulutus
OUTER APPLY (
	SELECT 1 as ammatillinen_opintoohjaajakoulutus FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'JC' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) ammatillinen_opintoohjaajakoulutus
OUTER APPLY (
	SELECT 1 as ruotsinkielinen_ammatillinen_opettajakoulutus FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'IX' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) ruotsinkielinen_ammatillinen_opettajakoulutus
OUTER APPLY (
	SELECT 1 as luovien_alojen_opettaja FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'LA' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) luovien_alojen_opettaja
OUTER APPLY (
	SELECT 1 as pedagogiset_opinnot FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet_jaadytys f0
	LEFT JOIN ANTERO.dw.d_opettajapatevyys d on d.id = f0.d_kelpoisuus_id
	WHERE d.koodi = 'PD' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) pedagogiset_opinnot
WHERE  f.Vuosi <= YEAR(getdate()) AND [Status] = 'Raportilla näkyvä kelpoisuus'


GO

USE [ANTERO]