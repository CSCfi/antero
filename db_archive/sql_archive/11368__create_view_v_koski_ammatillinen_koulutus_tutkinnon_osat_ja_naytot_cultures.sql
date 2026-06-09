USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot_cultures]    Script Date: 7.11.2025 15.29.31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  OR ALTER  VIEW [dw].[v_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot_cultures] as

SELECT 

	YEAR(f.arviointi_paiva) as arviointivuosi,
	
	f.opiskeluoikeus_oid as apusarake_opiskeluoikeus_oid,
	f.master_oid as apusarake_oppija_oid,
	f.osasuoritus_id as apusarake_osasuoritus_id,

	CASE 
		WHEN d5.kytkin_fi = 'Kyllä' THEN d1.selite_fi
		WHEN d3.kytkin_fi = 'Kyllä' THEN 'Paikallinen tutkinnon osa'
		ELSE d1.selite_fi
	END as tutkinnon_osa_fi,

	CASE 
		WHEN d5.kytkin_fi = 'Kyllä' THEN d1.selite_sv
		WHEN d3.kytkin_fi = 'Kyllä' THEN 'Lokal examensdel'
		ELSE d1.selite_sv
	END as tutkinnon_osa_sv,

	d2.kytkin_fi as pakollinen_tutkinnon_osa_fi,
	d2.kytkin_sv as pakollinen_tutkinnon_osa_sv,
	d3.kytkin_fi as paikallinen_tutkinnon_osa_fi,
	d3.kytkin_sv as paikallinen_tutkinnon_osa_sv,
	d4.kytkin_fi as tunnustettu_tutkinnon_osa_fi,
	d4.kytkin_sv as tunnustettu_tutkinnon_osa_sv,
	d5.kytkin_fi as yhteinen_tutkinnon_osa_fi,
	d5.kytkin_sv as yhteinen_tutkinnon_osa_sv,
	d20.kytkin_fi as yhteinen_ammatillinen_valinnainen_tutkinnon_osa_fi,
	d20.kytkin_sv as yhteinen_ammatillinen_valinnainen_tutkinnon_osa_sv,

	d6.organisaatio_fi as koulutuksen_jarjestaja_fi,
	d6.organisaatio_sv as koulutuksen_jarjestaja_sv,
	d7.koulutusluokitus_fi as tutkinto_fi,
	d7.koulutusluokitus_sv as tutkinto_sv,
	d7.tutkintotyyppi_fi as tutkintotyyppi_fi,
	d7.tutkintotyyppi_sv as tutkintotyyppi_sv,
	d7.koulutusalataso1_fi as koulutusala_taso_1_fi,
	d7.koulutusalataso2_fi as koulutusala_taso_2_fi,
	d7.koulutusalataso3_fi as koulutusala_taso_3_fi,
	d7.koulutusalataso1_sv as koulutusala_taso_1_sv,
	d7.koulutusalataso2_sv as koulutusala_taso_2_sv,
	d7.koulutusalataso3_sv as koulutusala_taso_3_sv,
	d8.selite_fi as suorituksen_tyyppi_fi,
	d8.selite_sv as suorituksen_tyyppi_sv,
	d9.selite_fi as osaamisala_fi,
	d9.selite_sv as osaamisala_sv,
	d10.tutkintonimike_fi as tutkintonimike_fi,
	d10.tutkintonimike_sv as tutkintonimike_sv,
	d11.selite_fi as rahoituslahde_fi,
	d11.selite_sv as rahoituslahde_sv,
	d23.kytkin_fi as hankintakoulutus_fi,
	d23.kytkin_sv as hankintakoulutus_sv,

	d14.sukupuoli_fi as sukupuoli_fi,
	d14.sukupuoli_sv as sukupuoli_sv,
	d15.ikaryhma3_fi as ikaryhma_fi,
	d15.ikaryhma3_sv as ikaryhma_sv,
	d16.kytkin_fi as oppivelvollinen_fi,
	d16.kytkin_sv as oppivelvollinen_sv,
	d17.maanosa1_fi as kansalaisuus_fi,
	d17.maanosa1_sv as kansalaisuus_sv,
	d18.kieliryhma1_fi as aidinkieli_fi,
	d18.kieliryhma1_sv as aidinkieli_sv,

	d22.selite_fi as nayton_suorituspaikka_fi,
	d22.selite_sv as nayton_suorituspaikka_sv,
	d21.selite_fi as arvioinnista_paattaneet_fi,
	d21.selite_sv as arvioinnista_paattaneet_sv,

	d11.jarjestys_koodi as jarjestys_rahoituslahde,
	d7.jarjestys_tutkintotyyppi_koodi as jarjestys_tutkintotyyppi,
	d7.jarjestys_koulutusalataso1_koodi as jarjestys_koulutusala_taso_1,
	d7.jarjestys_koulutusalataso2_koodi as jarjestys_koulutusala_taso_2,
	d7.jarjestys_koulutusalataso3_koodi as jarjestys_koulutusala_taso_3,
	d14.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
	d17.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus,
	d18.jarjestys_kieliryhma1 as jarjestys_aidinkieli

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
LEFT JOIN ANTERO.dw.d_kytkin d23 on d23.id = f.d_kytkin_hankintakoulutus_id

GO

