USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_erikoistumiskoulutukset]    Script Date: 9.1.2020 11:47:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER VIEW [dw].[v_virta_otp_erikoistumiskoulutukset] AS

SELECT   	
    d6.vuosi as							[Aloitusvuosi],

	d4.sukupuoli_fi	as					[Sukupuoli],
	d2.ika_fi	as						[Ikä],
	d2.ikaryhma1_fi	as					[Ikäryhmä],
	
	d5.oppilaitostyyppi_fi as           [Sektori],
	d1.erikoistumiskoulutus_nimi_fi as  [Erikoistumiskoulutus],
	d3.ohjauksenala_nimi_fi	as			[OKM Ohjauksen ala],

	d5.organisaatio_fi	as				[Korkeakoulu],

	case 
		when d7.vuosi is not null then 'Aiempi tutkinto'
		when d11.vuosi is not null then 'Myöhempi tutkinto'
		else 'Tieto puuttuu'
	end as								[Aiempi/myöhempi tutkinto],

	COALESCE(d7.vuosi, d11.vuosi) as							[Tutkinnon suoritusvuosi],
	COALESCE(d8.koulutussektori_fi, d12.koulutussektori_fi, 'Tieto puuttuu') as			[Tutkinnon sektori],
	COALESCE(d8.koulutusastetaso1_fi, d12.koulutusastetaso1_fi, 'Tieto puuttuu') as			[Tutkinnon koulutusaste, taso 1],
	COALESCE(d8.koulutusastetaso2_fi, d12.koulutusastetaso2_fi, 'Tieto puuttuu') as			[Tutkinnon koulutusaste, taso 2],
	COALESCE(d8.koulutusalataso1_fi, d12.koulutusalataso1_fi, 'Tieto puuttuu') as			[Tutkinnon koulutusala, taso 1],
	COALESCE(d8.koulutusalataso2_fi, d12.koulutusalataso1_fi, 'Tieto puuttuu') as			[Tutkinnon koulutusala, taso 2],
	COALESCE(d8.koulutusalataso3_fi,  d12.koulutusalataso1_fi, 'Tieto puuttuu') as			[Tutkinnon koulutusala, taso 3],
	COALESCE(d8.koulutusluokitus_fi,d12.koulutusalataso1_fi, 'Tieto puuttuu') as	[Tutkinto],
	COALESCE(d9.organisaatio_fi, d13.organisaatio_fi, 'Tieto puuttuu')	as				[Tutkinnon korkeakoulu],

	--ruotsi
	d6.vuosi as							[Begynnelseläsår],

	d4.sukupuoli_sv	as					[Kön],
	d2.ika_sv	as						[Ålder],
	d2.ikaryhma1_sv	as					[Åldersgrupp],
	
	d5.oppilaitostyyppi_sv as           [Sektorn],
	d1.erikoistumiskoulutus_nimi_sv as  [Specialiseringsutbildning],
	d3.ohjauksenala_nimi_sv	as			[UKM-styrningsområde],

	d5.organisaatio_en	as				[Högskola],

	case 
		when d7.vuosi is not null then 'Föregående examen'
		when d11.vuosi is not null then 'Senare examen'
		else 'Information saknas'
	end as								[Föregående/senare examen],

	COALESCE(d7.vuosi, d11.vuosi) as							[År då utbildningen avlagts],
	COALESCE(d8.koulutussektori_sv, d12.koulutussektori_sv, 'Information saknas') as			[Sektorn av examen],
	COALESCE(d8.koulutusastetaso1_sv, d12.koulutusastetaso1_sv, 'Information saknas') as			[Utbildningsnivå av examen, nivå 1],
	COALESCE(d8.koulutusastetaso2_sv, d12.koulutusastetaso2_sv, 'Information saknas') as			[Utbildningsnivå av examen, nivå 2],
	COALESCE(d8.koulutusalataso1_sv, d12.koulutusalataso1_sv, 'Information saknas') as			[Utbildningsområde av examen, nivå 1],
	COALESCE(d8.koulutusalataso2_sv, d12.koulutusalataso1_sv, 'Information saknas') as			[Utbildningsområde av examen, nivå 2],
	COALESCE(d8.koulutusalataso3_sv,  d12.koulutusalataso1_sv, 'Information saknas') as			[Utbildningsområde av examen, nivå 3],
	COALESCE(d8.koulutusluokitus_sv,d12.koulutusalataso1_sv, 'Information saknas') as	[Examen],
	COALESCE(d9.organisaatio_sv, d13.organisaatio_sv, 'Information saknas')	as				[Högskola av examen],

	--englanti
	d6.vuosi as							[First academic year],

	d4.sukupuoli_en	as					[Gender],
	d2.ika_en	as						[Age],
	d2.ikaryhma1_en	as					[Age group],
	
	case 
		when d5.oppilaitostyyppi_en = 'Polytechnics' then 'UASs'
		else d5.oppilaitostyyppi_en
	end as								[Sector],
	d1.erikoistumiskoulutus_nimi_en as  [Professional specialisation education],
	d3.ohjauksenala_nimi_en	as			[Field of ed. HE steering],

	d5.organisaatio_en	as				[Higher education institution],

	case 
		when d7.vuosi is not null then 'Preceding degree'
		when d11.vuosi is not null then 'Subsequent degree'
		else 'Missing data'
	end as								[Preceding/subsequent degree],

	COALESCE(d7.vuosi, d11.vuosi) as							[Graduation year],
	COALESCE(d8.koulutussektori_en, d12.koulutussektori_en, 'Missing data') as			[Sector of the degree],
	COALESCE(d8.koulutusastetaso1_en, d12.koulutusastetaso1_en, 'Missing data') as			[Level of education of the degree, tier 1],
	COALESCE(d8.koulutusastetaso2_en, d12.koulutusastetaso2_en, 'Missing data') as			[Level of education of the degree, tier 2],
	COALESCE(d8.koulutusalataso1_en, d12.koulutusalataso1_en, 'Missing data') as			[Field of education of the degree, tier 1],
	COALESCE(d8.koulutusalataso2_en, d12.koulutusalataso1_en, 'Missing data') as			[Field of education of the degree, tier 2],
	COALESCE(d8.koulutusalataso3_en,  d12.koulutusalataso1_en, 'Missing data') as			[Field of education of the degree, tier 3],
	COALESCE(d8.koulutusluokitus_en,d12.koulutusalataso1_en, 'Missing data') as	[Degree],
	COALESCE(d9.organisaatio_en, d13.organisaatio_en, 'Missing data')	as				[Higher ed. istitution of the degree],

	--koodit
	d1.erikoistumiskoulutus_koodi as    [Koodit Erikoistumiskoulutus],
	d5.organisaatio_koodi	as			[Koodit Korkeakoulu],
	COALESCE(d9.organisaatio_koodi,d13.organisaatio_koodi)	as			[Koodit Tutkinnon korkeakoulu],
	COALESCE(d8.koulutusluokitus_koodi, d12.koulutusluokitus_koodi) as		[Koodit Tutkinto],

	d1.jarjestys_erikoistumiskoulutus_koodi as [Erikoistumiskoulutus jarj],
	d2.jarjestys_ika	as				[Ikä jarj],
	d2.jarjestys_ikaryhma1	as			[Ikäryhmä jarj],
	d3.jarjestys_ohjauksenala_koodi	as	[Ohjauksen ala jarj] ,  
	d4.jarjestys_sukupuoli_koodi	as	[Sukupuoli jarj] ,

	COALESCE(d7.vuosi, d11.vuosi) as							[jarj Tutkinnon suoritusvuosi],
	COALESCE(d8.jarjestys_koulutussektori_koodi, d12.jarjestys_koulutussektori_koodi, '999999') as			[jarj Tutkinnon sektori],
	COALESCE(d8.jarjestys_koulutusastetaso1_koodi, d12.jarjestys_koulutusastetaso1_koodi, '999999') as			[jarj Tutkinnon koulutusaste_koodi, taso 1],
	COALESCE(d8.jarjestys_koulutusastetaso2_koodi, d12.jarjestys_koulutusastetaso2_koodi, '999999') as			[jarj Tutkinnon koulutusaste_koodi, taso 2],
	COALESCE(d8.jarjestys_koulutusalataso1_koodi, d12.jarjestys_koulutusalataso1_koodi, '999999') as			[jarj Tutkinnon koulutusala_koodi, taso 1],
	COALESCE(d8.jarjestys_koulutusalataso2_koodi, d12.jarjestys_koulutusalataso1_koodi, '999999') as			[jarj Tutkinnon koulutusala_koodi, taso 2],
	COALESCE(d8.jarjestys_koulutusalataso3_koodi,  d12.jarjestys_koulutusalataso1_koodi, '999999') as			[jarj Tutkinnon koulutusala_koodi, taso 3],
	COALESCE(d8.jarjestys_koulutusluokitus_koodi,d12.jarjestys_koulutusalataso1_koodi, 'ööö') as	[jarj Tutkinto],
	COALESCE(d9.jarjestys_organisaatio_koodi, d13.jarjestys_organisaatio_koodi, 'ööö')	as				[jarj Tutkinnon korkeakoulu],

	/*
	d7.vuosi as							[Aiemman tutkinnon suoritusvuosi],
	COALESCE(d8.koulutusastetaso1_fi,'Ei aiempaa tutkintoa') as			[Aiemman tutkinnon koulutusaste, taso 1],
	COALESCE(d8.koulutusastetaso2_fi,'Ei aiempaa tutkintoa') as			[Aiemman tutkinnon koulutusaste, taso 2],
	COALESCE(d8.koulutusalataso1_fi,'Ei aiempaa tutkintoa') as			[Aiemman tutkinnon koulutusala, taso 1],
	COALESCE(d8.koulutusalataso2_fi,'Ei aiempaa tutkintoa') as			[Aiemman tutkinnon koulutusala, taso 2],
	COALESCE(d8.koulutusalataso3_fi,'Ei aiempaa tutkintoa') as			[Aiemman tutkinnon koulutusala, taso 3],
	COALESCE(d8.koulutusluokitus_fi,'Ei aiempaa tutkintoa') as	[Aiempi tutkinto],
	COALESCE(d9.organisaatio_fi,'Ei aiempaa tutkintoa')	as				[Aiemman tutkinnon korkeakoulu],

	d11.vuosi as [Myöhemmän tutkinnon suoritusvuosi],
	COALESCE(d12.koulutusluokitus_fi,'Ei myöhempää tutkintoa') as [Myöhempi tutkinto],
	
	COALESCE(d8.koulutusluokitus_fi,'aaa') as [Aiempi tutkinto jarj],
	COALESCE(d12.koulutusluokitus_fi,'aaa') as [Myöhempi tutkinto jarj],
	coalesce(d8.jarjestys_koulutusastetaso1_koodi,'9') as			[Aiemman tutkinnon koulutusaste, taso 1 jarj],
	coalesce(d8.jarjestys_koulutusastetaso1_koodi,'99') as			[Aiemman tutkinnon koulutusaste, taso 2 jarj],
	coalesce(d8.jarjestys_koulutusalataso1_koodi,'99') as			[Aiemman tutkinnon koulutusala, taso 1 jarj],
	coalesce(d8.jarjestys_koulutusalataso2_koodi,'999') as			[Aiemman tutkinnon koulutusala, taso 2 jarj],
	coalesce(d8.jarjestys_koulutusalataso3_koodi,'9999') as			[Aiemman tutkinnon koulutusala, taso 3 jarj],
	*/
	case 
		when d7.vuosi is not null then 1
		when d11.vuosi is not null then 2
		else 3
	end as								[Aiempi/myöhempi tutkinto jarj],
	
	f.lkm	as lkm

FROM ANTERO.dw.f_virta_otp_erikoistumiskoulutukset f 
LEFT JOIN ANTERO.dw.d_erikoistumiskoulutus d1 on d1.id = f.d_erikoistumiskoulutus_id
LEFT JOIN ANTERO.dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_ohjauksenala d3 on d3.id = f.d_ohjauksenala_id
LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.id	= f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.id = f.d_kalenteri_opiskeluoikeus_alku_id
LEFT JOIN ANTERO.dw.d_kytkin d10a on d10a.id = f.d_kytkin_aiempi_tutkinto_id
LEFT JOIN ANTERO.dw.d_kytkin d10b on d10b.id = f.d_kytkin_myohempi_tutkinto_id
LEFT JOIN ANTERO.dw.d_kalenteri d7 on d7.id = f.d_kalenteri_muu_tutkinto_id and d10a.kytkin_koodi = 1
LEFT JOIN ANTERO.dw.d_koulutusluokitus d8 on d8.id = f.d_koulutusluokitus_muu_tutkinto_id and d10a.kytkin_koodi = 1
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d9 on d9.id = f.d_organisaatioluokitus_muu_tutkinto_id and d10a.kytkin_koodi = 1
LEFT JOIN ANTERO.dw.d_kalenteri d11 on d11.id = f.d_kalenteri_muu_tutkinto_id and d10b.kytkin_koodi = 1
LEFT JOIN ANTERO.dw.d_koulutusluokitus d12 on d12.id = f.d_koulutusluokitus_muu_tutkinto_id and d10b.kytkin_koodi = 1
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13 on d13.id = f.d_organisaatioluokitus_muu_tutkinto_id and d10b.kytkin_koodi = 1

WHERE d6.vuosi < YEAR(getdate())










