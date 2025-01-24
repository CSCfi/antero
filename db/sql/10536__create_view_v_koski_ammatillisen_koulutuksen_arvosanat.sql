USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_ammatillisen_koulutuksen_arvosanat]    Script Date: 24.1.2025 10.25.48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_koski_ammatillisen_koulutuksen_arvosanat] as

SELECT 
	coalesce(cast(d8.vuosi as varchar), 'Koulutus ei ole päättynyt') as 'Koulutuksen päättymisvuosi',
	coalesce(d8.kuukausi_fi, 'Koulutus ei ole päättynyt') as 'Koulutuksen päättymiskuukausi',
	f.tutkinnon_osan_suoritusvuosi as 'Tutkinnon osan suoritusvuosi',

	oppija_oid as apusarake_oppija_oid,
	opiskeluoikeus_oid as apusarake_opiskeluoikeus_oid,
	osasuoritus_id as apusarake_osasuoritus_id,
	osasuoritus_id_tutkinnon_osa as apusarake_osasuoritus_id_tutkinnon_osa,
	CAST(arvosana as int)  as apusarake_arvosana,
	laajuus as apusarake_laajuus,
	laajuus_tutkinnon_osa as apusarake_laajuus_tutkinnon_osa,

	CASE
		WHEN d3.kytkin_fi = 'Kyllä' and yto = 0 THEN 'Paikalliset ammatillisen tutkinnon osat'
		ELSE COALESCE(d1.selite_fi, f.tutkinnonosa)
	END as 'Tutkinnon osan nimi',
	CASE 
		WHEN yto = 1 AND d4.kytkin_koodi = 1 THEN 'Paikalliset yhteisen tutkinnon osan osa-alueet'
		WHEN yto = 0  THEN 'Ammatillinen tutkinnon osa'
		ELSE COALESCE(d2.nimi, f.tutkinnonosan_osaalue)
	END as 'Yhteisen tutkinnon osan osa-alueen nimi',
	d7.koulutusluokitus_fi as 'Tutkinto',
	d7.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d7.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d7.koulutusalataso3_fi as 'Koulutusala, taso 3',
	d15.kieli_fi as Suorituskieli,
	d18.selite_fi as 'Suorituksen tyyppi',
	d19.kytkin_fi as Koulutusvienti,
	d20.erityisopetus_ryhma_fi as Erityisopetus,
	d21.kytkin_fi as Oppisopimus,
	d22.kytkin_fi as Koulutussopimus,
	d23.selite_fi as Rahoitusmuoto,
	d24.kytkin_fi as Työvoimakoulutus,
	case 
		when oppisopimus_osuus <= 0 then '0 %'
		when oppisopimus_osuus < 0.25 then '1–24 %'
		when oppisopimus_osuus < 0.5 then '25–49 %'
		when oppisopimus_osuus < 0.75 then '50–74 %'
		when oppisopimus_osuus >= 0.75 then '75–100 %'
		else 'Tieto puuttuu'
	end as 'Oppisopimuksen suoritusosuus',
	
	case 
		when koulutussopimus_osuus <= 0 then '0 %'
		when koulutussopimus_osuus < 0.25 then '1–24 %'
		when koulutussopimus_osuus < 0.5 then '25–49 %'
		when koulutussopimus_osuus < 0.75 then '50–74 %'
		when koulutussopimus_osuus >= 0.75 then '75–100 %'
		else 'Tieto puuttuu'
	end as 'Koulutussopimuksen suoritusosuus',
	CASE
		WHEN f.laajuus_tutkinnon_osa is null THEN 'Tieto puuttuu'
		WHEN f.laajuus_tutkinnon_osa = 1 THEN '1 osaamispiste'
		ELSE CONCAT(CAST(f.laajuus_tutkinnon_osa as varchar), ' osaamispistettä')
	END as 'Tutkinnon osan laajuus',
	CASE
		WHEN f.laajuus is null OR yto = 0 THEN 'Tieto puuttuu'
		WHEN f.laajuus = 1 THEN '1 osaamispiste'
		ELSE CONCAT(CAST(f.laajuus as varchar), ' osaamispistettä')
	END as 'Yhteisen tutkinnon osan osa-alueen laajuus',

	CASE
		WHEN yto = 1 THEN 'Yhteinen tutkinnon osa'
		WHEN d5.kytkin_fi = 'Kyllä' THEN 'Pakollinen ammatillinen tutkinnon osa'
		WHEN d3.kytkin_fi = 'Kyllä' THEN 'Paikallinen ammatillinen tutkinnon osa'
		WHEN d5.kytkin_fi = 'Ei' THEN 'Valinnainen ammatillinen tutkinnon osa'
		ELSE 'Tieto puuttuu'
	END as 'Tutkinnon osa',
	CASE 
		WHEN d6.kytkin_fi = 'Kyllä' THEN 'Pakollinen yhteisen tutkinnon osan osa-alue'
		WHEN d4.kytkin_fi = 'Kyllä' THEN 'Paikallinen yhteisen tutkinnon osan osa-alue'
		WHEN d6.kytkin_fi = 'Ei' THEN 'Valinnainen yhteisen tutkinnon osan osa-alue'
		ELSE 'Tieto puuttuu'
	END as 'Yhteisen tutkinnon osan osa-alue',
	CASE 
		WHEN d26.kytkin_fi = 'Kyllä' THEN 'Tunnustettu tutkinnon osa' 
		WHEN d26.kytkin_fi = 'Ei' THEN 'Suoritettu tutkinnon osa'
		ELSE d26.kytkin_fi
	END as 'Suoritettu/tunnustettu tutkinnon osa',
	CASE 
		WHEN d27.kytkin_fi = 'Kyllä' THEN 'Tunnustettu yhteisen tutkinnon osan osa-alue' 
		WHEN d27.kytkin_fi = 'Ei' THEN 'Suoritettu yhteisen tutkinnon osan osa-alue'
		ELSE d27.kytkin_fi
	END 'Suoritettu/tunnustettu yhteisen tutkinnon osan osa-alue',

	CASE 
		WHEN yto = 1 THEN 'Yhteinen tutkinnon osa'
		ELSE 'Ammatillinen tutkinnon osa'
	END as 'Tutkinnon osan tyyppi',

	d9a.organisaatio_fi as 'Koulutuksen järjestäjä',
	d9b.organisaatio_fi as Oppilaitos,
	d9c.organisaatio_fi as Toimipiste,
	d9b.oppilaitostyyppi_fi as Oppilaitostyyppi,
	d16a.kunta_fi as 'Koulutuksen järjestäjän kunta',
	d16b.kunta_fi as 'Oppilaitoksen kunta',
	d16c.kunta_fi as 'Toimipisteen kunta',
	d16a.maakunta_fi as 'Koulutuksen järjestäjän maakunta',
	d16b.maakunta_fi as 'Oppilaitoksen maakunta',
	d16c.maakunta_fi as 'Toimipisteen maakunta',

	d10.sukupuoli_fi as Sukupuoli,
	d11.maanosa_fi as 'Kansalaisuus (maanosa)',
	d11.maanosa1_fi as 'Kansalaisuus (ryhmä)',
	d12.kieliryhma2_fi as 'Äidinkieli (ryhmä)',
	d13a.ika_fi as 'Ikä (opiskeluoikeuden alkamishetkellä)',
	d13b.ika_fi as 'Ikä (opiskeluoikeuden päättymishetkellä)',
	d13a.ikaryhma3_fi as 'Ikäryhmä (opiskeluoikeuden alkamishetkellä)',
	d13b.ikaryhma3_fi as 'Ikäryhmä (opiskeluoikeuden päättymishetkellä)',
	d14.kytkin_fi as 'Oppivelvollinen (1.8.2021) opiskeluoikeuden alkamishetkellä',

	d9a.organisaatio_koodi as 'Koodit Koulutuksen järjestäjä',
	d9b.organisaatio_koodi as 'Koodit Oppilaitos',
	d7.koulutusluokitus_koodi as 'Koodit Tutkinto',
	CASE 
		WHEN d3.kytkin_koodi = 1 THEN 'paikallinen'
		ELSE f.tutkinnonosa
	END as 'Koodit Tutkinnon osan nimi',
	CASE 
		WHEN yto = 1 AND d4.kytkin_koodi = 1 THEN 'paikallinen_yto' 
		WHEN yto = 0 THEN NULL 
		ELSE f.tutkinnonosan_osaalue 
	END as 'Koodit Yhteisen tutkinnon osan osa-alueen nimi',
	f.diaarinumero as 'Koodit Tutkinnon diaarinumero',

	9999 - coalesce(d8.vuosi,0) as jarjestys_koulutuksen_paattymisvuosi,
	coalesce(d8.kuukausi,13) as jarjestys_koulutuksen_paattymiskuukausi,
	d7.jarjestys_koulutusalataso1_koodi as jarjestys_koulutusala_taso1,
	d7.jarjestys_koulutusalataso2_koodi as jarjestys_koulutusala_taso2,
	d7.jarjestys_koulutusalataso3_koodi as jarjestys_koulutusala_taso3,
	d9b.jarjestys_oppilaitostyyppi_koodi as jarjestys_oppilaitostyyppi,
	d11.jarjestys_maanosa_koodi as jarjestys_kansalaisuus_maanosa,
	d11.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus_ryhma,
	d12.jarjestys_kieliryhma2 as jarjestys_aidinkieli,
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
	END as 'jarjestys_yhteisen_tutkinnon_osan_osaalueen_laajuus',
	CASE 
		WHEN yto = 1 AND d4.kytkin_koodi = 1 THEN 'ZZZ'
		WHEN yto = 0 AND d4.kytkin_koodi = 1 THEN 'ZZY'
		ELSE COALESCE(d2.nimi, f.tutkinnonosan_osaalue)
	END as 'jarjestys_yhteisen_tutkinnon_osan_osaalueen_nimi',
	CASE
		WHEN d3.kytkin_fi = 'Kyllä' and yto = 0 THEN 'ZZZ'
		ELSE COALESCE(d1.selite_fi, f.tutkinnonosa)
	END as 'jarjestys_tutkinnon_osan_nimi',
	CASE
		WHEN yto = 1 THEN 1
		WHEN d5.kytkin_fi = 'Kyllä' THEN 2
		WHEN d3.kytkin_fi = 'Kyllä' THEN 3
		WHEN d5.kytkin_fi = 'Ei' THEN 4
		ELSE 9
	END as 'jarjestys_tutkinnon_osa',
	CASE 
		WHEN d6.kytkin_fi = 'Kyllä' THEN 1
		WHEN d4.kytkin_fi = 'Kyllä' THEN 2
		WHEN d6.kytkin_fi = 'Ei' THEN 3
		ELSE 9
	END as 'jarjestys_yhteisen_tutkinnon_osan_osaalue',
	d26.jarjestys_kytkin_koodi as jarjestys_suoritettu_tunnustettu_tutkinnon_osa,
	d27.jarjestys_kytkin_koodi as jarjestys_suoritettu_tunnustettu_yhteisen_tutkinnon_osan_osaalue
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

USE [ANTERO]