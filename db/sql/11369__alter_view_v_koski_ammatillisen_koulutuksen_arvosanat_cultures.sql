USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_ammatillisen_koulutuksen_arvosanat_cultures]    Script Date: 10.11.2025 7.46.02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  VIEW [dw].[v_koski_ammatillisen_koulutuksen_arvosanat_cultures] as

SELECT
	coalesce(cast(d8.vuosi as varchar), 'Koulutus ei ole päättynyt') as koulutuksen_paattymisvuosi_fi,
	coalesce(cast(d8.vuosi as varchar), 'Utbildningen har inte avslutats') as koulutuksen_paattymisvuosi_sv,
	coalesce(d8.kuukausi_fi, 'Koulutus ei ole päättynyt') as koulutuksen_paattymiskuukausi_fi,
	coalesce(d8.kuukausi_sv, 'Utbildningen har inte avslutats') as koulutuksen_paattymiskuukausi_sv,
	f.tutkinnon_osan_suoritusvuosi as tutkinnon_osan_suoritusvuosi_fi,
	f.tutkinnon_osan_suoritusvuosi as tutkinnon_osan_suoritusvuosi_sv,

	master_oid as apusarake_oppija_oid,
	opiskeluoikeus_oid as apusarake_opiskeluoikeus_oid,
	osasuoritus_id as apusarake_osasuoritus_id,
	osasuoritus_id_tutkinnon_osa as apusarake_osasuoritus_id_tutkinnon_osa,
	CAST(arvosana as int)  as apusarake_arvosana,
	laajuus as apusarake_laajuus,
	laajuus_tutkinnon_osa as apusarake_laajuus_tutkinnon_osa,

	CASE
		WHEN d3.kytkin_fi = 'Kyllä' and yto = 0 THEN 'Paikalliset ammatillisen tutkinnon osat'
		ELSE COALESCE(d1.selite_fi, f.tutkinnonosa)
	END as tutkinnon_osan_nimi_fi,
	CASE
		WHEN d3.kytkin_fi = 'Kyllä' and yto = 0 THEN 'Lokala yrkesinriktade examensdelar'
		ELSE COALESCE(d1.selite_sv, f.tutkinnonosa)
	END as tutkinnon_osan_nimi_sv,
	CASE 
		WHEN yto = 1 AND d4.kytkin_koodi = 1 THEN 'Paikalliset yhteisen tutkinnon osan osa-alueet'
		WHEN yto = 0  THEN 'Ammatillinen tutkinnon osa'
		ELSE COALESCE(d2.nimi, f.tutkinnonosan_osaalue)
	END as yhteisen_tutkinnon_osan_osa_alueen_nimi_fi,
	CASE 
		WHEN yto = 1 AND d4.kytkin_koodi = 1 THEN 'Lokala delområden av en gemensam examensdel'
		WHEN yto = 0  THEN 'Yrkesexamensdel'
		ELSE COALESCE(d2.nimi_sv, f.tutkinnonosan_osaalue)
	END as yhteisen_tutkinnon_osan_osa_alueen_nimi_sv,
	d7.koulutusluokitus_fi as tutkinto_fi,
	d7.koulutusluokitus_sv as tutkinto_sv,
	d7.koulutusalataso1_fi as koulutusala_taso_1_fi,
	d7.koulutusalataso2_fi as koulutusala_taso_2_fi,
	d7.koulutusalataso3_fi as koulutusala_taso_3_fi,
	d7.koulutusalataso1_sv as koulutusala_taso_1_sv,
	d7.koulutusalataso2_sv as koulutusala_taso_2_sv,
	d7.koulutusalataso3_sv as koulutusala_taso_3_sv,
	d15.kieli_fi as suorituskieli_fi,
	d15.kieli_sv as suorituskieli_sv,
	d18.selite_fi as suorituksen_tyyppi_fi,
	d18.selite_sv as suorituksen_tyyppi_sv,
	d19.kytkin_fi as koulutusvienti_fi,
	d19.kytkin_sv as koulutusvienti_sv,
	d20.erityisopetus_ryhma_fi as erityisopetus_fi,
	d20.erityisopetus_ryhma_sv as erityisopetus_sv,
	d21.kytkin_fi as oppisopimus_fi,
	d21.kytkin_sv as oppisopimus_sv,
	d22.kytkin_fi as koulutussopimus_fi,
	d22.kytkin_sv as koulutussopimus_sv,
	d23.selite_fi as rahoitusmuoto_fi,
	d23.selite_sv as rahoitusmuoto_sv,
	d24.kytkin_fi as tyovoimakoulutus_fi,
	d24.kytkin_sv as tyovoimakoulutus_sv,
	case 
		when oppisopimus_osuus <= 0 then '0 %'
		when oppisopimus_osuus < 0.25 then '1–24 %'
		when oppisopimus_osuus < 0.5 then '25–49 %'
		when oppisopimus_osuus < 0.75 then '50–74 %'
		when oppisopimus_osuus >= 0.75 then '75–100 %'
		else 'Tieto puuttuu'
	end as oppisopimuksen_suoritusosuus_fi,
	case 
		when oppisopimus_osuus <= 0 then '0 %'
		when oppisopimus_osuus < 0.25 then '1–24 %'
		when oppisopimus_osuus < 0.5 then '25–49 %'
		when oppisopimus_osuus < 0.75 then '50–74 %'
		when oppisopimus_osuus >= 0.75 then '75–100 %'
		else 'Information saknas'
	end as oppisopimuksen_suoritusosuus_sv,
	
	case 
		when koulutussopimus_osuus <= 0 then '0 %'
		when koulutussopimus_osuus < 0.25 then '1–24 %'
		when koulutussopimus_osuus < 0.5 then '25–49 %'
		when koulutussopimus_osuus < 0.75 then '50–74 %'
		when koulutussopimus_osuus >= 0.75 then '75–100 %'
		else 'Tieto puuttuu'
	end as koulutussopimuksen_suoritusosuus_fi,
	case 
		when koulutussopimus_osuus <= 0 then '0 %'
		when koulutussopimus_osuus < 0.25 then '1–24 %'
		when koulutussopimus_osuus < 0.5 then '25–49 %'
		when koulutussopimus_osuus < 0.75 then '50–74 %'
		when koulutussopimus_osuus >= 0.75 then '75–100 %'
		else 'Information saknas'
	end as koulutussopimuksen_suoritusosuus_sv,
	CASE
		WHEN f.laajuus_tutkinnon_osa is null THEN 'Tieto puuttuu'
		WHEN f.laajuus_tutkinnon_osa = 1 THEN '1 osaamispiste'
		ELSE CONCAT(CAST(f.laajuus_tutkinnon_osa as varchar), ' osaamispistettä')
	END as tutkinnon_osan_laajuus_fi,
	CASE
		WHEN f.laajuus_tutkinnon_osa is null THEN 'Information saknas'
		ELSE CONCAT(CAST(f.laajuus_tutkinnon_osa as varchar), ' kompetenspoäng')
	END as tutkinnon_osan_laajuus_sv,
	CASE
		WHEN f.laajuus is null OR yto = 0 THEN 'Tieto puuttuu'
		WHEN f.laajuus = 1 THEN '1 osaamispiste'
		ELSE CONCAT(CAST(f.laajuus as varchar), ' osaamispistettä')
	END as yhteisen_tutkinnon_osan_osa_alueen_laajuus_fi,
	CASE
		WHEN f.laajuus is null OR yto = 0 THEN 'Information saknas'
		ELSE CONCAT(CAST(f.laajuus as varchar), ' kompetenspoäng')
	END as yhteisen_tutkinnon_osan_osa_alueen_laajuus_sv,

	CASE
		WHEN yto = 1 THEN 'Yhteinen tutkinnon osa'
		WHEN d3.kytkin_fi = 'Kyllä' THEN 'Paikallinen ammatillinen tutkinnon osa'
		WHEN d5.kytkin_fi = 'Kyllä' THEN 'Pakollinen ammatillinen tutkinnon osa'
		WHEN d5.kytkin_fi = 'Ei' THEN 'Valinnainen ammatillinen tutkinnon osa'
		ELSE 'Tieto puuttuu'
	END as tutkinnon_osa_fi,
	CASE
		WHEN yto = 1 THEN 'Gemensam examensdel'
		WHEN d3.kytkin_fi = 'Kyllä' THEN 'Lokal yrkesinriktad examensdel'
		WHEN d5.kytkin_fi = 'Kyllä' THEN 'Obligatorisk yrkesinriktad examensdel'
		WHEN d5.kytkin_fi = 'Ei' THEN 'Valbar yrkesinriktad examensdel'
		ELSE 'Information saknas'
	END as tutkinnon_osa_sv,
	CASE 
		WHEN d4.kytkin_fi = 'Kyllä' THEN 'Paikallinen yhteisen tutkinnon osan osa-alue'
		WHEN d6.kytkin_fi = 'Kyllä' THEN 'Pakollinen yhteisen tutkinnon osan osa-alue'
		WHEN d6.kytkin_fi = 'Ei' THEN 'Valinnainen yhteisen tutkinnon osan osa-alue'
		ELSE 'Tieto puuttuu'
	END as yhteisen_tutkinnon_osan_osa_alue_fi,
	CASE 
		WHEN d4.kytkin_fi = 'Kyllä' THEN 'Lokalt delområde av en gemensam examensdel'
		WHEN d6.kytkin_fi = 'Kyllä' THEN 'Obligatoriskt delområde av en gemensam examensdel'
		WHEN d6.kytkin_fi = 'Ei' THEN 'Valbart delområde av en gemensam examensdel'
		ELSE 'Information saknas'
	END as yhteisen_tutkinnon_osan_osa_alue_sv,
	CASE 
		WHEN d26.kytkin_fi = 'Kyllä' THEN 'Tunnustettu tutkinnon osa' 
		WHEN d26.kytkin_fi = 'Ei' THEN 'Suoritettu tutkinnon osa'
		ELSE d26.kytkin_fi
	END as suoritettu_tunnustettu_tutkinnon_osa_fi,
	CASE 
		WHEN d26.kytkin_fi = 'Kyllä' THEN 'Erkänd examensdel' 
		WHEN d26.kytkin_fi = 'Ei' THEN 'Genomförd examensdel'
		ELSE d26.kytkin_fi
	END as suoritettu_tunnustettu_tutkinnon_osa_sv,
	CASE 
		WHEN d27.kytkin_fi = 'Kyllä' THEN 'Tunnustettu yhteisen tutkinnon osan osa-alue' 
		WHEN d27.kytkin_fi = 'Ei' THEN 'Suoritettu yhteisen tutkinnon osan osa-alue'
		ELSE d27.kytkin_fi
	END suoritettu_tunnustettu_yhteisen_tutkinnon_osan_osa_alue_fi,
	CASE 
		WHEN d27.kytkin_fi = 'Kyllä' THEN 'Erkänt delområde av en gemensam examensdel' 
		WHEN d27.kytkin_fi = 'Ei' THEN 'Genomfört delområde av en gemensam examensdel'
		ELSE d27.kytkin_fi
	END suoritettu_tunnustettu_yhteisen_tutkinnon_osan_osa_alue_sv,

	CASE 
		WHEN yto = 1 THEN 'Yhteinen tutkinnon osa'
		ELSE 'Ammatillinen tutkinnon osa'
	END as tutkinnon_osan_tyyppi_fi,
	CASE 
		WHEN yto = 1 THEN 'Gemensam examensdel'
		ELSE 'Yrkesexamensdel'
	END as tutkinnon_osan_tyyppi_sv,

	d9a.organisaatio_fi as koulutuksen_jarjestaja_fi,
	d9a.organisaatio_sv as koulutuksen_jarjestaja_sv,
	d9b.organisaatio_fi as oppilaitos_fi,
	d9b.organisaatio_sv as oppilaitos_sv,
	d9c.organisaatio_fi as toimipiste_fi,
	d9c.organisaatio_sv as toimipiste_sv,
	d9b.oppilaitostyyppi_fi as oppilaitostyyppi_fi,
	d9b.oppilaitostyyppi_sv as oppilaitostyyppi_sv,
	d16a.kunta_fi as koulutuksen_jarjestajan_kunta_fi,
	d16a.kunta_sv as koulutuksen_jarjestajan_kunta_sv,
	d16b.kunta_fi as oppilaitoksen_kunta_fi,
	d16b.kunta_sv as oppilaitoksen_kunta_sv,
	d16c.kunta_fi as toimipisteen_kunta_fi,
	d16c.kunta_sv as toimipisteen_kunta_sv,
	d16a.maakunta_fi as koulutuksen_jarjestajan_maakunta_fi,
	d16a.maakunta_sv as koulutuksen_jarjestajan_maakunta_sv,
	d16b.maakunta_fi as oppilaitoksen_maakunta_fi,
	d16b.maakunta_sv as oppilaitoksen_maakunta_sv,
	d16c.maakunta_fi as toimipisteen_maakunta_fi,
	d16c.maakunta_sv as toimipisteen_maakunta_sv,

	d10.sukupuoli_fi as sukupuoli_fi,
	d10.sukupuoli_sv as sukupuoli_sv,
	d11.maanosa_fi as kansalaisuus_maanosa_fi,
	d11.maanosa_sv as kansalaisuus_maanosa_sv,
	d11.maanosa1_fi as kansalaisuus_ryhma_fi,
	d11.maanosa1_sv as kansalaisuus_ryhma_sv,
	d12.kieliryhma2_fi as aidinkieli_ryhma_fi,
	d12.kieliryhma2_sv as aidinkieli_ryhma_sv,
	d13a.ika_fi as ika_opiskeluoikeuden_alkamishetkella_fi,
	d13a.ika_sv as ika_opiskeluoikeuden_alkamishetkella_sv,
	d13b.ika_fi as ika_opiskeluoikeuden_paattymishetkella_fi,
	d13b.ika_sv as ika_opiskeluoikeuden_paattymishetkella_sv,
	d13a.ikaryhma3_fi as ikaryhma_opiskeluoikeuden_alkamishetkella_fi,
	d13a.ikaryhma3_sv as ikaryhma_opiskeluoikeuden_alkamishetkella_sv,
	d13b.ikaryhma3_fi as ikaryhma_opiskeluoikeuden_paattymishetkella_fi,
	d13b.ikaryhma3_sv as ikaryhma_opiskeluoikeuden_paattymishetkella_sv,
	d14.kytkin_fi as oppivelvollinen_1_8_2021_opiskeluoikeuden_alkamishetkella_fi,
	d14.kytkin_sv as oppivelvollinen_1_8_2021_opiskeluoikeuden_alkamishetkella_sv,
	CAST(arvosana as int) as arvosana_fi,
	CAST(arvosana as int) as arvosana_sv,

	d9a.organisaatio_koodi as koodit_koulutuksen_jarjestaja,
	d9b.organisaatio_koodi as koodit_oppilaitos,
	d7.koulutusluokitus_koodi as koodit_tutkinto,
	CASE 
		WHEN d3.kytkin_koodi = 1 THEN 'paikallinen'
		ELSE f.tutkinnonosa
	END as koodit_tutkinnon_osan_nimi,
	CASE 
		WHEN yto = 1 AND d4.kytkin_koodi = 1 THEN 'paikallinen_yto' 
		WHEN yto = 1 AND f.tutkinnonosan_osaalue like 'VVAI22%' THEN 'VVAI22'
		WHEN yto = 0 THEN NULL 
		ELSE f.tutkinnonosan_osaalue 
	END as koodit_yhteisen_tutkinnon_osan_osa_alueen_nimi,
	f.diaarinumero as koodit_tutkinnon_diaarinumero,

	9999 - coalesce(d8.vuosi,0) as jarjestys_koulutuksen_paattymisvuosi,
	coalesce(d8.kuukausi,13) as jarjestys_koulutuksen_paattymiskuukausi,
	d7.jarjestys_koulutusalataso1_koodi as jarjestys_koulutusala_taso_1,
	d7.jarjestys_koulutusalataso2_koodi as jarjestys_koulutusala_taso_2,
	d7.jarjestys_koulutusalataso3_koodi as jarjestys_koulutusala_taso_3,
	d9b.jarjestys_oppilaitostyyppi_koodi as jarjestys_oppilaitostyyppi,
	d11.jarjestys_maanosa_koodi as jarjestys_kansalaisuus_maanosa,
	d11.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus_ryhma,
	d12.jarjestys_kieliryhma2 as jarjestys_aidinkieli_ryhma,
	d13a.jarjestys_ika as jarjestys_ika_opiskeluoikeuden_alkamishetkella,
	d13b.jarjestys_ika as jarjestys_ika_opiskeluoikeuden_paattymishetkella,
	d13a.jarjestys_ikaryhma3 as jarjestys_ikaryhma_opiskeluoikeuden_alkamishetkella,
	d13b.jarjestys_ikaryhma3 as jarjestys_ikaryhma_opiskeluoikeuden_paattymishetkella,
	d16a.jarjestys_maakunta_koodi as jarjestys_koulutuksen_jarjestajan_maakunta,
	d16b.jarjestys_maakunta_koodi as jarjestys_oppilaitoksen_maakunta,
	d16c.jarjestys_maakunta_koodi as jarjestys_toimipisteen_maakunta,
	d23.jarjestys_koodi as jarjestys_rahoitusmuoto,
	d20.jarjestys_erityisopetus_ryhma as jarjestys_erityisopetus,
	COALESCE(f.laajuus_tutkinnon_osa, 999) as jarjestys_tutkinnon_osan_laajuus,
	CASE
		WHEN yto = 0 THEN 999
		ELSE COALESCE(f.laajuus, 999)
	END as jarjestys_yhteisen_tutkinnon_osan_osa_alueen_laajuus,
	CASE 
		WHEN yto = 1 AND d4.kytkin_koodi = 1 THEN 'ZZZ'
		WHEN yto = 0 AND d4.kytkin_koodi = 1 THEN 'ZZY'
		ELSE COALESCE(d2.nimi, f.tutkinnonosan_osaalue)
	END as jarjestys_yhteisen_tutkinnon_osan_osa_alueen_nimi,
	CASE
		WHEN d3.kytkin_fi = 'Kyllä' and yto = 0 THEN 'ZZZ'
		ELSE COALESCE(d1.selite_fi, f.tutkinnonosa)
	END as jarjestys_tutkinnon_osan_nimi,
	CASE
		WHEN yto = 1 THEN 1
		WHEN d5.kytkin_fi = 'Kyllä' THEN 2
		WHEN d3.kytkin_fi = 'Kyllä' THEN 3
		WHEN d5.kytkin_fi = 'Ei' THEN 4
		ELSE 9
	END as jarjestys_tutkinnon_osa,
	CASE 
		WHEN d6.kytkin_fi = 'Kyllä' THEN 1
		WHEN d4.kytkin_fi = 'Kyllä' THEN 2
		WHEN d6.kytkin_fi = 'Ei' THEN 3
		ELSE 9
	END as jarjestys_yhteisen_tutkinnon_osan_osa_alue,
	d26.jarjestys_kytkin_koodi as jarjestys_suoritettu_tunnustettu_tutkinnon_osa,
	d27.jarjestys_kytkin_koodi as jarjestys_suoritettu_tunnustettu_yhteisen_tutkinnon_osan_osa_alue
FROM ANTERO.dw.f_koski_ammatillisen_koulutuksen_arvosanat f
LEFT JOIN ANTERO.dw.d_koski_tutkinnonosat d1 on d1.koodi = f.tutkinnonosa
LEFT JOIN ANTERO.dw.d_ammatillinen_oppiaine d2 on d2.koodi = f.tutkinnonosan_osaalue
LEFT JOIN ANTERO.dw.d_kytkin d3 on d3.id = f.d_kytkin_paikallinen_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_kytkin d4 on d4.id = f.d_kytkin_paikallinen_tutkinnon_osan_osaalue_id
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.id = f.d_kytkin_pakollinen_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_kytkin d6 on d6.id = f.d_kytkin_pakollinen_tutkinnon_osan_osaalue_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d7 on d7.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_kalenteri d8 on d8.id = f.d_kalenteri_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d9a on d9a.id = f.d_organisaatioluokitus_koulutuksen_jarjestaja_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d9b on d9b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d9c on d9c.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN ANTERO.dw.d_sukupuoli d10 on d10.id = f.d_sukupuoli_id 
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d11 on d11.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_kieli d12 on d12.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_ika d13a on d13a.id = f.d_ika_opiskeluoikeuden_alku_id
LEFT JOIN ANTERO.dw.d_ika d13b on d13b.id = f.d_ika_opiskeluoikeuden_loppu_id
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = f.d_kytkin_oppivelvollinen_id
LEFT JOIN ANTERO.dw.d_kieli d15 on d15.id = f.d_kieli_suorituskieli_id
LEFT JOIN ANTERO.dw.d_alueluokitus d16a on d16a.kunta_koodi = d9a.kunta_koodi 
LEFT JOIN ANTERO.dw.d_alueluokitus d16b on d16b.kunta_koodi = d9b.kunta_koodi 
LEFT JOIN ANTERO.dw.d_alueluokitus d16c on d16c.kunta_koodi = d9c.kunta_koodi
LEFT JOIN ANTERO.dw.d_suorituksen_tyyppi d18 on d18.id = f.d_suorituksen_tyyppi_id
LEFT JOIN ANTERO.dw.d_kytkin d19 on d19.id = f.d_kytkin_koulutusvienti_id
LEFT JOIN ANTERO.dw.d_erityisopetus d20 on d20.erityisopetus_koodi = f.erityisopetus
LEFT JOIN ANTERO.dw.d_kytkin d21 on d21.id = f.d_kytkin_oppisopimus_id
LEFT JOIN ANTERO.dw.d_kytkin d22 on d22.id = f.d_kytkin_koulutussopimus_id
LEFT JOIN ANTERO.dw.d_opintojenrahoitus d23 ON d23.id = f.d_opintojen_rahoitus_rahoitusmuoto_id
LEFT JOIN ANTERO.dw.d_kytkin d24 on d24.kytkin_koodi = d23.tyovoimakoulutus
LEFT JOIN ANTERO.dw.d_kytkin d26 on d26.id = f.d_kytkin_tunnustettu_tutkinnon_osa_id
LEFT JOIN ANTERO.dw.d_kytkin d27 on d27.id = f.d_kytkin_tunnustettu_tutkinnon_osan_osaalue_id

GO
