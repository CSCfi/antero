USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot]    Script Date: 24.1.2025 8.55.44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dw].[v_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot] as

SELECT 

	YEAR(f.arviointi_paiva) as 'Arviointivuosi',
	
	f.opiskeluoikeus_oid,
	f.oppija_oid,
	f.osasuoritus_id,

	CASE 
		WHEN d5.kytkin_fi = 'Kyllä' THEN d1.selite_fi
		WHEN d3.kytkin_fi = 'Kyllä' THEN 'Paikallinen tutkinnon osa'
		ELSE d1.selite_fi
	END as 'Tutkinnon osa',
	d2.kytkin_fi as 'Pakollinen tutkinnon osa',
	d3.kytkin_fi as 'Paikallinen tutkinnon osa',
	d4.kytkin_fi as 'Tunnustettu tutkinnon osa',
	d5.kytkin_fi as 'Yhteinen tutkinnon osa',
	d20.kytkin_fi as 'Yhteinen ammatillinen valinnainen tutkinnon osa',

	d6.organisaatio_fi as 'Koulutuksen järjestäjä',
	d7.koulutusluokitus_fi as Tutkinto,
	d7.tutkintotyyppi_fi as Tutkintotyyppi,
	d7.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d7.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d7.koulutusalataso3_fi as 'Koulutusala, taso 3',
	d8.selite_fi as 'Suorituksen tyyppi',
	d9.selite_fi as Osaamisala,
	d10.tutkintonimike_fi as Tutkintonimike,
	d11.selite_fi as 'Rahoituslähde',
	d12.kytkin_fi as 'Tyvövoimakoulutus',
	d13.kytkin_fi as 'Työssäoppimisen yhteydessä',

	d14.sukupuoli_fi as Sukupuoli,
	d15.ika_fi as 'Ikä',
	d15.ikaryhma3_fi as 'Ikäryhmä',
	d16.kytkin_fi as Oppivelvollinen,
	d17.maanosa1_fi as Kansalaisuus,
	d18.kieliryhma1_fi as 'Äidinkieli',
	d19.kieli_fi as Suorituskieli,

	d22.selite_fi as 'Näytön suorituspaikka',
	d21.selite_fi as 'Arvioinnista päättäneet',

	d11.jarjestys_koodi as jarjestys_rahoituslahde

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
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.id = f.d_kytkin_tyossaoppimisen_yhteydessa_id
LEFT JOIN ANTERO.dw.d_sukupuoli d14 on d14.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_ika d15 on d15.id = f.d_ika_id 
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = f.d_kytkin_oppivelvollinen_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d17 on d17.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_kieli d18 on d18.id = f.d_aidinkieli_id
LEFT JOIN ANTERO.dw.d_kieli d19 on d19.id = f.d_suorituskieli_id
LEFT JOIN ANTERO.dw.d_kytkin d20 on d20.id = f.d_kytkin_yhteinen_ammatillinen_valinnainen_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_nayton_arvioinnista_paattaneet d21 on d21.id = f.d_nayton_arvioinnista_paattaneet_id
LEFT JOIN ANTERO.dw.d_nayton_suorituspaikka d22 on d22.id = f.d_nayton_suorituspaikka_id

GO


