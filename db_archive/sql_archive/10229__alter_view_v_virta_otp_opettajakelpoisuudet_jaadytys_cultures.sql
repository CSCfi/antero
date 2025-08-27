USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opettajakelpoisuudet_jaadytys_cultures]    Script Date: 16.10.2024 8:11:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dw].[v_virta_otp_opettajakelpoisuudet_jaadytys_cultures] AS

SELECT		
	 kelpoisuuden_suoritusvuosi_fi = f.Vuosi
	,kelpoisuuden_suoritusvuosi_sv = f.Vuosi
	,kelpoisuuden_suoritusvuosi_en = f.Vuosi
	,tilastovuosi_fi = f.Vuosi
	,tilastovuosi_sv = f.vuosi
	,tilastovuosi_en = f.vuosi

	,sukupuoli_fi = d1.sukupuoli_fi
	,sukupuoli_sv = d1.sukupuoli_sv
	,sukupuoli_en = d1.sukupuoli_sv
	,ika_fi = d2.ika_fi
	,ika_sv = d2.ika_sv
	,ika_en = d2.ika_en
	,ikaryhma_fi = d2.ikaryhma3_fi
	,ikaryhma_sv = d2.ikaryhma3_sv
	,ikaryhma_en = d2.ikaryhma3_en

	,opettajakelpoisuus_fi = d3.selite_fi
	,opettajakelpoisuus_sv = d3.selite_sv
	,opettajakelpoisuus_en = d3.selite_en
	,suorittanut_korkeakoulututkinnon_fi = 
		CASE 
			WHEN f.d_koulutusluokitus_korkein_tutkinto_id = -1 THEN 'Ei'
			ELSE 'Kyllä'
		END
	,suorittanut_korkeakoulututkinnon_sv = 
		CASE 
			WHEN f.d_koulutusluokitus_korkein_tutkinto_id = -1 THEN 'Nej'
			ELSE 'Ja'
		END
	,suorittanut_korkeakoulututkinnon_en = 
		CASE 
			WHEN f.d_koulutusluokitus_korkein_tutkinto_id = -1 THEN 'No'
			ELSE 'Yes'
		END
	,kelpoisuuden_suoritustapa_fi =
		CASE
			WHEN suoritustapa = '1' THEN 'Kelpoisuus tutkinnon yhteydessä'
			WHEN suoritustapa = '2' THEN 'Kelpoisuus suoritettu erillisinä opintoina'
			ELSE 'Tieto puuttuu'
		END
	,kelpoisuuden_suoritustapa_sv =
		CASE
			WHEN suoritustapa = '1' THEN 'Behörighet i samband med examen'
			WHEN suoritustapa = '2' THEN 'Behörighet avlagd som fristående studier'
			ELSE 'Information saknas'
		END
	,kelpoisuuden_suoritustapa_en =
		CASE
			WHEN suoritustapa = '1' THEN 'Qualification in connection with the degree'
			WHEN suoritustapa = '2' THEN 'Qualification completed as non-degree studies'
			ELSE 'Information saknas'
		END
	,yli_asetuksen_fi = d15.kytkin_fi
	,yli_asetuksen_sv = d15.kytkin_sv
	,yli_asetuksen_en = d15.kytkin_en
	,sektori_fi = d5.oppilaitostyyppi_fi
	,sektori_sv = d5.oppilaitostyyppi_sv
	,sektori_en = d5.oppilaitostyyppi_en
	,koulutusaste_taso_1_fi = d4.koulutusastetaso1_fi
	,koulutusaste_taso_1_sv = d4.koulutusastetaso1_sv
	,koulutusaste_taso_1_en = d4.koulutusastetaso1_en
	,koulutusaste_taso_2_fi = d4.koulutusastetaso2_fi
	,koulutusaste_taso_2_sv = d4.koulutusastetaso2_sv
	,koulutusaste_taso_2_en = d4.koulutusastetaso2_en
	,koulutusala_taso_1_fi = d4.koulutusalataso1_fi
	,koulutusala_taso_1_sv = d4.koulutusalataso1_sv
	,koulutusala_taso_1_en = d4.koulutusalataso1_en
	,koulutusala_taso_2_fi = d4.koulutusalataso2_fi
	,koulutusala_taso_2_sv = d4.koulutusalataso2_sv
	,koulutusala_taso_2_en = d4.koulutusalataso2_en
	,koulutusala_taso_3_fi = d4.koulutusalataso3_fi
	,koulutusala_taso_3_sv = d4.koulutusalataso3_sv
	,koulutusala_taso_3_en = d4.koulutusalataso3_en
	,okm_ohjauksen_ala_fi = d4.okmohjauksenala_fi
	,okm_ohjauksen_ala_sv = d4.okmohjauksenala_sv
	,okm_ohjauksen_ala_en = d4.okmohjauksenala_en
	,tutkinto_korkein_fi = d4.koulutusluokitus_fi
	,tutkinto_korkein_sv = d4.koulutusluokitus_sv
	,tutkinto_korkein_en = d4.koulutusluokitus_en
	,tutkinnon_suoritusvuosi_fi = f.vuosi_korkein_tutkinto
	,tutkinnon_suoritusvuosi_sv = f.vuosi_korkein_tutkinto
	,tutkinnon_suoritusvuosi_en = f.vuosi_korkein_tutkinto
	,tutkinnon_suorituskorkeakoulu_fi = d13.organisaatio_fi
	,tutkinnon_suorituskorkeakoulu_sv = d13.organisaatio_sv
	,tutkinnon_suorituskorkeakoulu_en = d13.organisaatio_en

	,korkeakoulu_fi = d5.organisaatio_fi
	,korkeakoulu_sv = d5.organisaatio_sv
	,korkeakoulu_en = d5.organisaatio_en

	,kelpoisuus_suoritettu_yhdessa_korkeakoulussa_fi = d16.kytkin_fi
	,kelpoisuus_suoritettu_yhdessa_korkeakoulussa_sv = d16.kytkin_sv
	,kelpoisuus_suoritettu_yhdessa_korkeakoulussa_en = d16.kytkin_en

	--koodit
	,koodit_tutkinto_korkein = d4.koulutusluokitus_koodi
	,koodit_korkeakoulu = d5.organisaatio_koodi
	,koodit_tutkinnon_suorituskorkeakoulu = d13.organisaatio_koodi
	
	--järjestys
	,jarjestys_sukupuoli = d1.jarjestys_sukupuoli_koodi
	,jarjestys_ikaryhma = d2.jarjestys_ikaryhma3
	,jarjestys_opettajakelpoisuus = d3.jarjestys3_koodi
	,jarjestys_tutkinnon_suoritustapa =
		CASE
			WHEN suoritustapa = '1' THEN 1
			WHEN suoritustapa = '2' THEN 2
			ELSE 9
		END
	,jarjestys_sektori = d5.jarjestys_oppilaitostyyppi_koodi
	,jarjestys_koulutusaste_taso_1 = d4.jarjestys_koulutusastetaso1_koodi
	,jarjestys_koulutusaste_taso_2 = d4.jarjestys_koulutusastetaso2_koodi
	,jarjestys_koulutusala_taso_1 = d4.jarjestys_koulutusalataso1_koodi
	,jarjestys_koulutusala_taso_2 = d4.jarjestys_koulutusalataso2_koodi
	,jarjestys_koulutusala_taso_3 = d4.jarjestys_koulutusalataso3_koodi
	,jarjestys_okm_ohjauksen_ala = d4.jarjestys_okmohjauksenala_koodi

	--apumuuttujat
	,coalesce(erityisopettaja.erityisopettaja,0) as apusarake_erityisopettaja_prio
	,coalesce(varhaiskasvatuksen_erityisopettaja.varhaiskasvatuksen_erityisopettaja,0) as apusarake_varhaiskasvatuksen_erityisopettaja_prio
	,coalesce(erityisluokanopettaja.erityisluokanopettaja,0) as apusarake_erityisluokanopettaja_prio
	,case 
		when luokanopettaja_prio.luokanopettaja = 1 THEN 1
		when (aineenopettaja_luokanopettaja.aineenopettaja_luokanopettaja = 1 or varhaiskasvatuksen_opettaja_luokanopettaja.varhaiskasvatuksen_opettaja_luokanopettaja = 1) and luokanopettaja.luokanopettaja = 1 then 1
		else 0
	end as apusarake_kaikki_luokanopettajat,
	coalesce(aineenopettaja_luokanopettaja.aineenopettaja_luokanopettaja,0) as apusarake_aineenopettaja_luokanopettaja_prio,
	coalesce(varhaiskasvatuksen_opettaja_luokanopettaja.varhaiskasvatuksen_opettaja_luokanopettaja,0) as apusarake_varhaiskasvatuksen_opettaja_luokanopettaja_prio,
	coalesce(luokanopettaja_prio.luokanopettaja,0) as apusarake_luokanopettaja_prio,
	coalesce(opintoohjaaja.opintoohjaaja,0) as apusarake_opintoohjaaja_prio,
	coalesce(aineenopettaja.aineenopettaja,0) as apusarake_aineenopettaja_prio,
	coalesce(varhaiskasvatuksen_opettaja_amk.varhaiskasvatuksen_opettaja_amk,0) as apusarake_varhaiskasvatuksen_opettaja_amk_prio,
	coalesce(varhaiskasvatuksen_opettaja_yo.varhaiskasvatuksen_opettaja_yo,0) as apusarake_varhaiskasvatuksen_opettaja_yo_prio,
	coalesce(varhaiskasvatuksen_sosionomi.varhaiskasvatuksen_sosionomi,0) as apusarake_varhaiskasvatuksen_sosionomi_prio,
	coalesce(ruotsinkielinen_ammatillinen_opettajakoulutus.ruotsinkielinen_ammatillinen_opettajakoulutus,0) as apusarake_ruotsinkielinen_ammatillinen_opettajakoulutus_prio,
	coalesce(ammatillinen_opettajankoulutus.ammatillinen_opettajankoulutus,0) as apusarake_ammatillinen_opettajankoulutus_prio,
	coalesce(ammatillinen_erityisopettajankoulutus.ammatillinen_erityisopettajankoulutus,0) as apusarake_ammatillinen_erityisopettajankoulutus_prio,
	coalesce(ammatillinen_opintoohjaajakoulutus.ammatillinen_opintoohjaajakoulutus,0) as apusarake_ammatillinen_opintoohjaajakoulutus_prio,
	coalesce(pedagogiset_opinnot.pedagogiset_opinnot,0) as apusarake_pedagogiset_opinnot_prio,
	coalesce(luovien_alojen_opettaja.luovien_alojen_opettaja,0) as apusarake_luovien_alojen_opettaja_prio
	,CASE 
		WHEN d3.selite_fi like '%ammatillinen%' THEN 'Ammatillinen'
		WHEN d3.selite_fi like '%erityis%' THEN 'Erityisopettaja'
		WHEN d3.selite_fi like '%Varhaiskasvatuksen%' and d3.selite_fi not like '%Luokanopettaja%' THEN 'Varhaiskasvatus'
		WHEN d3.selite_fi in('Luovien alojen opettaja', 'Opettajan pedagogiset opinnot (ei merkintää ainekelpoisuudesta)') THEN 'Muu'
		ELSE 'Yleissivistävä'
	END as apusarake_raportti
	,f.KelpoisuusID as apusarake_kelpoisuusid
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
	WHERE d.koodi = 'JA' and f0.henkilo = f.henkilo and f0.Vuosi = f.Vuosi and f0.Status = 'Raportilla näkyvä kelpoisuus'
) ammatillinen_opettajankoulutus
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
WHERE  f.Vuosi BETWEEN 2016 AND YEAR(getdate()) AND [Status] = 'Raportilla näkyvä kelpoisuus'

GO

USE [ANTERO]