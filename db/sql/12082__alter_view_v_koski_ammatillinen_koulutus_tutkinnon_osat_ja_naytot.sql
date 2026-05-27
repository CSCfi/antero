USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot]    Script Date: 20.5.2026 12.13.49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON

GO

ALTER  VIEW [dw].[v_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot] as

SELECT 

	YEAR(f.arviointi_paiva) as 'Arviointivuosi',
	NULL as 'Tutkinnon suoritusvuosi',
	
	NULL as paatason_suoritus_id,
	f.osasuoritus_id,

	CASE 
		WHEN d5.kytkin_fi = 'Kyllä' THEN d1.selite_fi
		WHEN d3.kytkin_fi = 'Kyllä' THEN 'Paikallinen tutkinnon osa'
		ELSE d1.selite_fi
	END as 'Tutkinnon osa',

	CASE 
		WHEN d5.kytkin_fi = 'Kyllä' THEN d1.selite_sv
		WHEN d3.kytkin_fi = 'Kyllä' THEN 'Lokal examensdel'
		ELSE d1.selite_sv
	END as 'Examensdel',

	d2.kytkin_fi as 'Pakollinen tutkinnon osa',
	d2.kytkin_sv as 'Obligatorisk examensdel',
	d3.kytkin_fi as 'Paikallinen tutkinnon osa',
	d3.kytkin_sv as 'Lokal examensdel',
	d4.kytkin_fi as 'Tunnustettu tutkinnon osa',
	d4.kytkin_sv as 'Erkänd examensdel',
	d5.kytkin_fi as 'Yhteinen tutkinnon osa',
	d5.kytkin_sv as 'Gemensam examensdel',
	d20.kytkin_fi as 'Yhteinen ammatillinen valinnainen tutkinnon osa',
	d20.kytkin_sv as 'Gemensam valbar yrkesinriktad examensdel',

	d6.organisaatio_fi as 'Koulutuksen järjestäjä',
	d6.organisaatio_sv as 'Utbildningsanordnare',
	d7.koulutusluokitus_fi as Tutkinto,
	d7.koulutusluokitus_sv as Examen,
	d7.tutkintotyyppi_fi as Tutkintotyyppi,
	d7.tutkintotyyppi_sv as 'Typ av examen',
	d7.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d7.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d7.koulutusalataso3_fi as 'Koulutusala, taso 3',
	d7.koulutusalataso1_sv as 'Utbildningsområde, nivå 1',
	d7.koulutusalataso2_sv as 'Utbildningsområde, nivå 2',
	d7.koulutusalataso3_sv as 'Utbildningsområde, nivå 3',
	d8.selite_fi as 'Suorituksen tyyppi',
	d8.selite_sv as 'Typ av prestation',
	d9.selite_fi as Osaamisala,
	d9.selite_sv as 'Kompetensområde',
	d10.tutkintonimike_fi as Tutkintonimike,
	d10.tutkintonimike_sv as Examensbeteckning,
	d11.selite_fi as 'Rahoituslähde',
	d11.selite_sv as 'Finansieringskälla',
	d23.kytkin_fi as Hankintakoulutus,
	d23.kytkin_sv as Anskaffningsutbildning,
	NULL as Suorituskieli,
	NULL as 'Studiespråk',

	d22.selite_fi as 'Näytön suorituspaikka',
	d22.selite_sv as 'Plats för yrkesprov',
	d21.selite_fi as 'Arvioinnista päättäneet',
	d21.selite_sv as 'Bedömare',

	d11.jarjestys_koodi as jarjestys_rahoituslahde,
	d7.jarjestys_tutkintotyyppi_koodi,
	d7.jarjestys_koulutusalataso1_koodi,
	d7.jarjestys_koulutusalataso2_koodi,
	d7.jarjestys_koulutusalataso3_koodi

FROM ANTERO.dw.f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot f
LEFT JOIN ANTERO.dw.d_koski_tutkinnonosat d1 on d1.id = f.d_koski_tutkinnon_osat_id
LEFT JOIN ANTERO.dw.d_kytkin d2 on d2.id = f.d_kytkin_pakollinen_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_kytkin d3 on d3.id = f.d_kytkin_paikallinen_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_kytkin d4 on d4.id = f.d_kytkin_tunnustettu_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.id = f.d_kytkin_yhteinen_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id = f.d_organisaatioluokitus_koulutuksen_jarjestaja_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d7 on d7.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_koski_suorituksen_tyyppi d8 on d8.id = f.d_koski_suorituksen_tyyppi_id
LEFT JOIN ANTERO.dw.d_osaamisala_koodisto d9 on d9.id = f.d_osaamisala_koodisto_id
LEFT JOIN ANTERO.dw.d_tutkintonimike d10 on d10.id = f.d_tutkintonimike_id
LEFT JOIN ANTERO.dw.d_opintojenrahoitus d11 ON d11.id = f.d_opintojenrahoitus_id
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.kytkin_koodi = d11.tyovoimakoulutus
LEFT JOIN ANTERO.dw.d_kytkin d20 on d20.id = f.d_kytkin_yhteinen_ammatillinen_valinnainen_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_nayton_arvioinnista_paattaneet d21 on d21.id = f.d_nayton_arvioinnista_paattaneet_id
LEFT JOIN ANTERO.dw.d_nayton_suorituspaikka d22 on d22.id = f.d_nayton_suorituspaikka_id
LEFT JOIN ANTERO.dw.d_kytkin d23 on d23.id = f.d_kytkin_hankintakoulutus_id
WHERE f.osasuoritus_id is not null AND YEAR(f.arviointi_paiva) <= YEAR(GETDATE())

UNION ALL

SELECT DISTINCT

	NULL as 'Arviointivuosi',
	YEAR(f.vahvistus_paiva) as 'Tutkinnon suoritusvuosi',
	
	f.paatason_suoritus_id as paatason_suoritus_id,
	NULL as osasuoritus_id,

	NULL as 'Tutkinnon osa',
	NULL as 'Examensdel',
	NULL as 'Pakollinen tutkinnon osa',
	NULL as 'Obligatorisk examensdel',
	NULL as 'Paikallinen tutkinnon osa',
	NULL as 'Lokal examensdel',
	NULL as 'Tunnustettu tutkinnon osa',
	NULL as 'Erkänd examensdel',
	NULL as 'Yhteinen tutkinnon osa',
	NULL as 'Gemensam examensdel',
	NULL as 'Yhteinen ammatillinen valinnainen tutkinnon osa',
	NULL as 'Gemensam valbar yrkesinriktad examensdel',

	d6.organisaatio_fi as 'Koulutuksen järjestäjä',
	d6.organisaatio_sv as 'Utbildningsanordnare',
	d7.koulutusluokitus_fi as Tutkinto,
	d7.koulutusluokitus_sv as Examen,
	d7.tutkintotyyppi_fi as Tutkintotyyppi,
	d7.tutkintotyyppi_sv as 'Typ av examen',
	d7.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d7.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d7.koulutusalataso3_fi as 'Koulutusala, taso 3',
	d7.koulutusalataso1_sv as 'Utbildningsområde, nivå 1',
	d7.koulutusalataso2_sv as 'Utbildningsområde, nivå 2',
	d7.koulutusalataso3_sv as 'Utbildningsområde, nivå 3',
	d8.selite_fi as 'Suorituksen tyyppi',
	d8.selite_sv as 'Typ av prestation',
	d9.selite_fi as Osaamisala,
	d9.selite_sv as 'Kompetensområde',
	d10.tutkintonimike_fi as Tutkintonimike,
	d10.tutkintonimike_sv as Examensbeteckning,
	d11.selite_fi as 'Rahoituslähde',
	d11.selite_sv as 'Finansieringskälla',
	d23.kytkin_fi as Hankintakoulutus,
	d23.kytkin_sv as Anskaffningsutbildning,
	d19.kieli_fi as Suorituskieli,
	d19.kieli_sv as 'Studiespråk',

	NULL as 'Näytön suorituspaikka',
	NULL as 'Plats för yrkesprov',
	NULL as 'Arvioinnista päättäneet',
	NULL as 'Bedömare',

	d11.jarjestys_koodi as jarjestys_rahoituslahde,
	d7.jarjestys_tutkintotyyppi_koodi,
	d7.jarjestys_koulutusalataso1_koodi,
	d7.jarjestys_koulutusalataso2_koodi,
	d7.jarjestys_koulutusalataso3_koodi

FROM ANTERO.dw.f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id = f.d_organisaatioluokitus_koulutuksen_jarjestaja_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d7 on d7.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_koski_suorituksen_tyyppi d8 on d8.id = f.d_koski_suorituksen_tyyppi_id
LEFT JOIN ANTERO.dw.d_osaamisala_koodisto d9 on d9.id = f.d_osaamisala_koodisto_id
LEFT JOIN ANTERO.dw.d_tutkintonimike d10 on d10.id = f.d_tutkintonimike_id
LEFT JOIN ANTERO.dw.d_opintojenrahoitus d11 ON d11.id = f.d_opintojenrahoitus_id
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.kytkin_koodi = d11.tyovoimakoulutus
LEFT JOIN ANTERO.dw.d_kieli d19 on d19.id = f.d_suorituskieli_id
LEFT JOIN ANTERO.dw.d_kytkin d23 on d23.id = f.d_kytkin_hankintakoulutus_id
WHERE f.vahvistus_paiva <= YEAR(GETDATE()) and d8.selite_fi = 'Ammatillinen tutkinto'