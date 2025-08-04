USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_uudet_cultures]    Script Date: 30.7.2025 10.35.10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dw].[v_koski_lukio_opiskelijat_uudet_cultures] AS

SELECT DISTINCT

-- APUMUUTTUJAT 
	 f.master_oid AS apusarake_oppija_oid
	,f2.keskiarvo_lukuaineet AS apusarake_keskiarvo_lukuaineet
	,f2.keskiarvo AS apusarake_keskiarvo

-- AIKAMUUTTUJAT

	--fi
	,f.vuosi AS tilastovuosi_fi
	,d13.kuukausi_fi AS kuukausi_fi

	--sv
	,f.vuosi AS tilastovuosi_sv
	,d13.kuukausi_sv AS kuukausi_sv

	--en
	,f.vuosi AS tilastovuosi_en
	,d13.kuukausi_en AS kuukausi_en

-- KOULUTUSMUUTTUJAT
	
	--fi
	,CASE
		WHEN f.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
		WHEN f.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
		WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
		ELSE 'Tieto puuttuu' END
		AS oppimaara_fi
	,CASE
		WHEN koulutusluokitus_fi IS NULL THEN 'Ei tutkintotavoitetta'
		WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 'Ylioppilastutkinto'
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus') THEN 'Ei tutkintotavoitetta'
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_fi
		ELSE 'Tieto puuttuu' END
		AS tavoitetutkinto_fi
	,CASE
		WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 'Lukiokoulutukseen valmistava koulutus'
		ELSE 'Yleissivistävä lukiokoulutus' END
		AS koulutus_fi
	,CASE 
		WHEN d14.selite_fi is not null THEN d14.selite_fi
		WHEN d14.selite_fi is null AND d15.selite_fi is not null THEN d15.selite_fi
		WHEN d14.selite_fi is null AND d15.selite_fi is null AND d16.selite_fi is not null THEN d16.selite_fi
	END AS hakukohde_fi

	--sv
	,CASE
		WHEN f.[oppimaara] = 'nuortenops' THEN 'Lärokurs för ungdomar'
		WHEN f.[oppimaara] = 'aikuistenops' THEN 'Lärokurs för vuxna'
		WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Ämnesstuderande (ingen målexamen)'
		WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Utländsk examen'
		ELSE 'Information saknas' END
		AS oppimaara_sv
	,CASE
		WHEN koulutusluokitus_fi IS NULL THEN 'Ingen målexamen'
		WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 'Studentexamen'
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus') THEN 'Ingen målexamen'
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_sv
		ELSE 'Information saknas' END
		AS tavoitetutkinto_sv
	,CASE
		WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN koulutusluokitus_sv
		ELSE 'Allmänbildande gymnasieutbildning' END
		AS koulutus_sv
	,CASE 
		WHEN d14.selite_fi is not null THEN d14.selite_sv
		WHEN d14.selite_fi is null AND d15.selite_fi is not null THEN d15.selite_sv
		WHEN d14.selite_fi is null AND d15.selite_fi is null AND d16.selite_fi is not null THEN d16.selite_sv
	END AS hakukohde_sv

	--en
	,CASE
		WHEN f.[oppimaara] = 'nuortenops' THEN 'Syllabus for youth'
		WHEN f.[oppimaara] = 'aikuistenops' THEN 'Syllabus for adults'
		WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Subject student (no intended qualification)'
		WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Foreign qualification'
		ELSE 'Missing information' END
		AS oppimaara_en
	,CASE
		WHEN koulutusluokitus_fi IS NULL THEN 'No intended qualification'
		WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 'Matriculation examination'
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus') THEN 'No intended qualification'
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_en
		ELSE 'Missing information' END
		AS tavoitetutkinto_en
	,CASE
		WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 'Instruction preparing for general upper secondary education'
		ELSE 'General upper secondary education' END
		AS koulutus_en
	,CASE 
		WHEN d14.selite_fi is not null THEN d14.selite_en
		WHEN d14.selite_fi is null AND d15.selite_fi is not null THEN d15.selite_en
		WHEN d14.selite_fi is null AND d15.selite_fi is null AND d16.selite_fi is not null THEN d16.selite_en
	END AS hakukohde_en

-- HENKILÖMUUTTUJAT

	--fi
	,f.[ika] AS ika_fi
	,d6.kieliryhma1_fi AS kieliryhma_fi
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 'Suomi'
		ELSE 'Muu' END
		AS kansalaisuus_fi
	,COALESCE(d1.maanosa_fi, 'Tieto puuttuu') AS kansalaisuus_maanosa_fi
	,COALESCE(d3.[sukupuoli_fi], 'Tieto puuttuu') AS sukupuoli_fi
	,CASE 
		WHEN d4.[ikaryhma3_fi] IS NULL THEN 'Tuntematon'
		ELSE d4.ikaryhma3_fi END 
		AS ikaryhma_fi

	--sv
	,f.[ika] AS ika_sv
	,d6.kieliryhma1_sv AS kieliryhma_sv
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 'Finland'
		ELSE 'Övrig' END
		AS kansalaisuus_sv
	,COALESCE(d1.maanosa_sv, 'Information saknas') AS kansalaisuus_maanosa_sv
	,COALESCE(d3.[sukupuoli_sv], 'Information saknas') AS sukupuoli_sv
	,CASE 
		WHEN d4.[ikaryhma3_sv] IS NULL THEN 'Okänd'
		ELSE d4.ikaryhma3_sv END 
		AS ikaryhma_sv

	--en
	,f.[ika] AS ika_en
	,d6.kieliryhma1_en AS kieliryhma_en
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 'Finland'
		ELSE 'Other' END
		AS kansalaisuus_en
	,COALESCE(d1.maanosa_en, 'Missing data') AS kansalaisuus_maanosa_en
	,COALESCE(d3.[sukupuoli_en], 'Missing data') AS sukupuoli_en
	,CASE 
		WHEN d4.[ikaryhma3_en] IS NULL THEN 'Unknown'
		ELSE d4.ikaryhma3_en END 
		AS ikaryhma_en

-- ORGANISAATIOMUUTTUJAT

	-- Koulutuksen järjestäjä

	--fi
	,d7.organisaatio_fi AS koulutuksen_jarjestaja_fi
	,d10.kunta_fi AS koulutuksen_jarjestajan_kunta_fi
	,d10.maakunta_fi AS koulutuksen_jarjestajan_maakunta_fi
	,d10.avi_fi AS koulutuksen_jarjestajan_avi_fi
	,d10.ely_fi AS koulutuksen_jarjestajan_ely_fi

	--sv
	,d7.organisaatio_sv AS koulutuksen_jarjestaja_sv
	,d10.kunta_sv AS koulutuksen_jarjestajan_kunta_sv
	,d10.maakunta_sv AS koulutuksen_jarjestajan_maakunta_sv
	,d10.avi_sv AS koulutuksen_jarjestajan_avi_sv
	,d10.ely_sv AS koulutuksen_jarjestajan_ely_sv

	--en
	,d7.organisaatio_en AS koulutuksen_jarjestaja_en
	,d10.kunta_en AS koulutuksen_jarjestajan_kunta_en
	,d10.maakunta_en AS koulutuksen_jarjestajan_maakunta_en
	,d10.avi_en AS koulutuksen_jarjestajan_avi_en
	,d10.ely_en AS koulutuksen_jarjestajan_ely_en

	-- Oppilaitos

	--fi
	,d8.organisaatio_fi AS oppilaitos_fi
	,d8.oppilaitoksenopetuskieli_fi AS opetuskieli_fi
	,d11.kunta_fi AS oppilaitoksen_kunta_fi
	,d11.maakunta_fi AS oppilaitoksen_maakunta_fi
	,d11.avi_fi AS oppilaitoksen_avi_fi
	,d11.ely_fi AS oppilaitoksen_ely_fi

	--sv
	,d8.organisaatio_sv AS oppilaitos_sv
	,d8.oppilaitoksenopetuskieli_sv AS opetuskieli_sv
	,d11.kunta_sv AS oppilaitoksen_kunta_sv
	,d11.maakunta_sv AS oppilaitoksen_maakunta_sv
	,d11.avi_sv AS oppilaitoksen_avi_sv
	,d11.ely_sv AS oppilaitoksen_ely_sv

	--en
	,d8.organisaatio_en AS oppilaitos_en
	,d8.oppilaitoksenopetuskieli_en AS opetuskieli_en
	,d11.kunta_en AS oppilaitoksen_kunta_en
	,d11.maakunta_en AS oppilaitoksen_maakunta_en
	,d11.avi_en AS oppilaitoksen_avi_en
	,d11.ely_en AS oppilaitoksen_ely_en

	-- Toimipiste

	--fi
	,d9.organisaatio_fi AS toimipiste_fi

	--sv
	,d9.organisaatio_sv AS toimipiste_sv

	--en
	,d9.organisaatio_en AS toimipiste_en

-- KOODIMUUTTUJAT
	,d8.organisaatio_koodi AS koodit_oppilaitos
	,d7.organisaatio_koodi AS koodit_koulutuksen_jarjestaja
	,d9.organisaatio_koodi AS koodit_toimipiste

-- JÄRJESTYSMUUTTUJAT
	,d8.jarjestys_oppilaitoksenopetuskieli_koodi AS jarjestys_opetuskieli
	,d6.jarjestys_kieliryhma1 AS jarjestys_kieliryhma
	,COALESCE(d3.jarjestys_sukupuoli_koodi, 999) AS jarjestys_sukupuoli
	,d4.jarjestys_ikaryhma3 AS jarjestys_ikaryhma
	,CASE
		WHEN f.[oppimaara] = 'nuortenops' THEN 1
		WHEN f.[oppimaara] = 'aikuistenops' THEN 2
		WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 4
		WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 3
		ELSE 5 END
		AS jarjestys_oppimaara
	,CASE
		WHEN koulutusluokitus_fi IS NULL THEN 3
		WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 1
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus') THEN 3
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN 2
		ELSE 4 END
		AS jarjestys_tavoitetutkinto
	,CASE
		WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 2
		ELSE 1 END
		AS jarjestys_koulutus
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 1
		ELSE 2 END
		AS jarjestys_kansalaisuus
	,d13.kuukausi AS jarjestys_kuukausi

   FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_uudet] AS f 
  LEFT JOIN ANTERO.dw.f_koski_perusaste_keskiarvot AS f2 ON f.master_oid = f2.master_oid and f.vuosi = f2.vuosi
  LEFT JOIN ANTERO.dw.d_maatjavaltiot2 AS d1 ON CAST(f.kansalaisuus AS varchar) = CAST(d1.maatjavaltiot2_koodi AS varchar)
  LEFT JOIN ANTERO.dw.d_sukupuoli AS d3 ON f.Sukupuoli = d3.sukupuoli_koodi
  LEFT JOIN ANTERO.dw.d_ika AS d4 ON f.Ika = d4.ika_avain
  LEFT JOIN ANTERO.dw.d_koulutusluokitus AS d5 ON f.koulutusmoduuli_koodiarvo = d5.koulutusluokitus_koodi
  LEFT JOIN ANTERO.dw.d_kieli AS d6 ON f.aidinkieli = d6.kieli_koodi
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d7 ON f.koulutustoimija_oid = d7.organisaatio_oid
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d8 ON f.oppilaitos_oid = d8.organisaatio_oid
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d9 ON f.toimipiste_oid = d9.organisaatio_oid
  LEFT JOIN ANTERO.dw.d_alueluokitus AS d10 ON d7.kunta_koodi = d10.kunta_koodi
  LEFT JOIN ANTERO.dw.d_alueluokitus AS d11 ON d8.kunta_koodi = d11.kunta_koodi
  LEFT JOIN ANTERO.dw.d_alueluokitus AS d12 ON d9.kunta_koodi = d12.kunta_koodi
  LEFT JOIN ANTERO.dw.d_kalenteri AS d13 ON f.vuosi = d13.vuosi AND f.kuukausi = d13.kuukausi
  LEFT JOIN (
	SELECT DISTINCT
		 f.henkilo_oid
		,f.koulutuksen_alkamisvuosi
		,d4.organisaatio_nykyinen_koodi
		,d.hakutapa_koodi
		,d2.selite_fi
		,d2.selite_sv
		,d2.selite_en
	FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_toinen_aste] f
	LEFT JOIN [ANTERO].[dw].[d_haku] d on d.id = f.d_haku_id
	LEFT JOIN [ANTERO].[dw].[d_hakukohde] d2 on f.d_hakukohde_id = d2.id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d3 ON d3.id = f.d_koulutusluokitus_hakukohde_id
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.id = f.d_organisaatio_oppilaitos_id 
	WHERE d.hakuryhma_koodi != 2 and d3.koulutusastetaso2_koodi in (31, -1)
	and (f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') or f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY'))
	) d14 on d14.henkilo_oid = f.master_oid and d14.organisaatio_nykyinen_koodi = d8.organisaatio_nykyinen_koodi and d14.koulutuksen_alkamisvuosi = f.vuosi
	LEFT JOIN (
	SELECT DISTINCT
		 f.henkilo_oid
		,f.koulutuksen_alkamisvuosi
		,d4.organisaatio_nykyinen_koodi
		,d.hakutapa_koodi
		,d2.selite_fi
		,d2.selite_sv
		,d2.selite_en
	FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_toinen_aste] f
	LEFT JOIN [ANTERO].[dw].[d_haku] d on d.id = f.d_haku_id
	LEFT JOIN [ANTERO].[dw].[d_hakukohde] d2 on f.d_hakukohde_id = d2.id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d3 ON d3.id = f.d_koulutusluokitus_hakukohde_id
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.id = f.d_organisaatio_oppilaitos_id 
	WHERE d.hakuryhma_koodi != 2 and d3.koulutusastetaso2_koodi in (31, -1)
	and (f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') or f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY'))
	) d15 on d15.henkilo_oid = f.master_oid and d15.organisaatio_nykyinen_koodi = d8.organisaatio_nykyinen_koodi and d15.koulutuksen_alkamisvuosi + 1 = f.vuosi
	LEFT JOIN (
	SELECT DISTINCT
		 f.henkilo_oid
		,f.koulutuksen_alkamisvuosi
		,d4.organisaatio_nykyinen_koodi
		,d.hakutapa_koodi
		,d2.selite_fi
		,d2.selite_sv
		,d2.selite_en
	FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_toinen_aste] f
	LEFT JOIN [ANTERO].[dw].[d_haku] d on d.id = f.d_haku_id
	LEFT JOIN [ANTERO].[dw].[d_hakukohde] d2 on f.d_hakukohde_id = d2.id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d3 ON d3.id = f.d_koulutusluokitus_hakukohde_id
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.id = f.d_organisaatio_oppilaitos_id 
	WHERE d.hakuryhma_koodi != 2 and d3.koulutusastetaso2_koodi in (31, -1)
	and (f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') or f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY'))
	) d16 on d16.henkilo_oid = f.master_oid and d16.organisaatio_nykyinen_koodi = d8.organisaatio_nykyinen_koodi and d16.koulutuksen_alkamisvuosi + 2 = f.vuosi
	WHERE f.[oppimaara] = 'nuortenops' and koulutusluokitus_fi != 'Lukiokoulutukseen valmistava koulutus' 
	AND (d14.hakutapa_koodi = '01' OR (d14.hakutapa_koodi is null AND d15.hakutapa_koodi = '01') OR (d14.hakutapa_koodi is null AND d15.hakutapa_koodi is null AND d16.hakutapa_koodi = '01'))
	AND getdate() >= CAST(CONCAT(f.vuosi, '-08-01') as date)
GO


