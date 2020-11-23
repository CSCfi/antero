USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP view if exists [dw].[v_koski_lukio_opiskelijat_uudet] 
GO
CREATE VIEW [dw].[v_koski_lukio_opiskelijat_uudet] AS

SELECT DISTINCT 

-- LASKENTAMUUTTUJAT 
	 f.oppija_oid AS oppija_oid
	,f2.keskiarvo_lukuaineet
	,f2.keskiarvo

-- AIKAMUUTTUJAT
	,f.vuosi AS Tilastovuosi
	,d13.kuukausi_fi AS Kuukausi

-- KOULUTUSMUUTTUJAT
	,CASE
		WHEN f.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
		WHEN f.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
		WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
		ELSE 'Ei tietoa' END
		AS Oppimäärä
	,CASE
		WHEN koulutusluokitus_fi IS NULL THEN 'Ei tutkintotavoitetta'
		WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 'Ylioppilastutkinto'
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus') THEN 'Ei tutkintotavoitetta'
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN koulutusluokitus_fi
		ELSE 'Ei tietoa' END
		AS Tavoitetutkinto
	,CASE
		WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 'Lukiokoulutukseen valmistava koulutus'
		ELSE 'Yleissivistävä lukiokoulutus' END
		AS Koulutus
	,CASE 
		WHEN f.majoitus = 1 THEN 'Kyllä'
		ELSE 'Ei' END
		AS Majoitus
	,CASE
		WHEN f.[sisaoppilaitosmainen_majoitus] = 1 THEN 'Kyllä'
		ELSE 'Ei' END
		AS [Sisäoppilaitosmuotoinen majoitus]
	,CASE 
		WHEN d14.selite_fi is not null THEN d14.selite_fi
		WHEN d14.selite_fi is null AND d15.selite_fi is not null THEN d15.selite_fi
		WHEN d14.selite_fi is null AND d15.selite_fi is null AND d16.selite_fi is not null THEN d16.selite_fi
	END AS Hakukohde

-- HENKILÖMUUTTUJAT
	,f.[ika] AS [Ikä]
	,d6.kieliryhma1_fi AS [Kieliryhmä]
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 'Suomi'
		ELSE 'Muu' END
		AS Kansalaisuus
	,COALESCE(d1.maanosa_fi, 'Tieto puuttuu') AS [Kansalaisuuden maanosa]
	,COALESCE(d3.[sukupuoli_fi], 'Tieto puuttuu') AS [Sukupuoli]
	,CASE 
		WHEN d4.[ikaryhma3_fi] IS NULL THEN 'Tuntematon'
		ELSE d4.ikaryhma3_fi END 
		AS [Ikäryhmä]

-- ORGANISAATIOMUUTTUJAT
	-- Koulutuksen järjestäjä
	,d7.organisaatio_fi AS [Koulutuksen järjestäjä]
	,d7.koulutuksen_jarjestajan_yritysmuoto AS [Koul. järj. yritysmuoto]
	,d10.kunta_fi AS [Koul. järj. kotikunta]
	,d10.maakunta_fi AS [Koul. järj. maakunta]
	,d10.avi_fi AS [Koul. järj. AVI]
	,d10.ely_fi AS [Koul. järj. ELY]
	-- Oppilaitos
	,d8.organisaatio_fi AS Oppilaitos
	,d8.oppilaitoksenopetuskieli_fi AS Opetuskieli
	,d11.kunta_fi AS [Oppilaitoksen kotikunta]
	,d11.maakunta_fi AS [Oppilaitoksen maakunta]
	,d11.avi_fi AS [Oppilaitoksen AVI]
	,d11.ely_fi AS [Oppilaitoksen ELY]
	-- Toimipiste
	,d9.organisaatio_fi AS Toimipiste

-- KOODIMUUTTUJAT
	,d8.organisaatio_koodi AS [Koodit Oppilaitos]
	,d7.organisaatio_koodi AS [Koodit Koulutuksen järjestäjä]
	,d9.organisaatio_koodi AS [Koodit Toimipiste]

-- JÄRJESTYSMUUTTUJAT
	,d8.jarjestys_oppilaitoksenopetuskieli_koodi AS [jarj_opetuskieli]
	,d6.jarjestys_kieliryhma1 AS jarj_kieliryhma
	,COALESCE(d3.jarjestys_sukupuoli_koodi, 999) AS jarj_sukupuoli
	,d4.jarjestys_ikaryhma3
	,CASE
		WHEN f.[oppimaara] = 'nuortenops' THEN 1
		WHEN f.[oppimaara] = 'aikuistenops' THEN 2
		WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 4
		WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 3
		ELSE 5 END
		AS jarj_oppimaara
	,CASE
		WHEN koulutusluokitus_fi IS NULL THEN 3
		WHEN [koulutusluokitus_fi] = 'Lukion oppimäärä' THEN 1
		WHEN [koulutusluokitus_fi] IN ('Lukion aineen oppimäärä', 'Lukiokoulutukseen valmistava koulutus') THEN 3
		WHEN [koulutusluokitus_fi] IS NOT NULL THEN 2
		ELSE 4 END
		AS jarj_tavoitetutkinto
	,CASE
		WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 2
		ELSE 1 END
		AS jarj_koulutus
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 1
		ELSE 2 END
		AS jarj_kansalaisuus
	,d13.kuukausi AS jarj_kuukausi

   FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_uudet] AS f 
  LEFT JOIN ANTERO.dw.f_koski_perusaste_keskiarvot AS f2 ON f.oppija_oid = f2.oppija_oid
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
		,f.d_organisaatio_oppilaitos_id
		,d.hakutapa_koodi
		,d2.selite_fi
	FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_toinen_aste] f
	LEFT JOIN [ANTERO].[dw].[d_haku] d on d.id = f.d_haku_id
	LEFT JOIN [ANTERO].[dw].[d_hakukohde] d2 on f.d_hakukohde_id = d2.id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d3 ON d3.id = f.d_koulutusluokitus_hakukohde_id
	WHERE d.hakuryhma_koodi != 2 and d3.koulutusastetaso2_koodi in (31, -1)
	and (f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') or f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY'))
	) d14 on d14.henkilo_oid = f.oppija_oid and d14.d_organisaatio_oppilaitos_id = d8.id and d14.koulutuksen_alkamisvuosi = f.vuosi
	LEFT JOIN (
	SELECT DISTINCT
		f.henkilo_oid
		,f.koulutuksen_alkamisvuosi
		,f.d_organisaatio_oppilaitos_id
		,d.hakutapa_koodi
		,d2.selite_fi
	FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_toinen_aste] f
	LEFT JOIN [ANTERO].[dw].[d_haku] d on d.id = f.d_haku_id
	LEFT JOIN [ANTERO].[dw].[d_hakukohde] d2 on f.d_hakukohde_id = d2.id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d3 ON d3.id = f.d_koulutusluokitus_hakukohde_id
	WHERE d.hakuryhma_koodi != 2 and d3.koulutusastetaso2_koodi in (31, -1)
	and (f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') or f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY'))
	) d15 on d15.henkilo_oid = f.oppija_oid and d15.d_organisaatio_oppilaitos_id = d8.id and d15.koulutuksen_alkamisvuosi + 1 = f.vuosi
	LEFT JOIN (
	SELECT DISTINCT
		 f.henkilo_oid
		,f.koulutuksen_alkamisvuosi
		,f.d_organisaatio_oppilaitos_id
		,d.hakutapa_koodi
		,d2.selite_fi
	FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_toinen_aste] f
	LEFT JOIN [ANTERO].[dw].[d_haku] d on d.id = f.d_haku_id
	LEFT JOIN [ANTERO].[dw].[d_hakukohde] d2 on f.d_hakukohde_id = d2.id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d3 ON d3.id = f.d_koulutusluokitus_hakukohde_id
	WHERE d.hakuryhma_koodi != 2 and d3.koulutusastetaso2_koodi in (31, -1)
	and (f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') or f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY'))
	) d16 on d16.henkilo_oid = f.oppija_oid and d16.d_organisaatio_oppilaitos_id = d8.id and d16.koulutuksen_alkamisvuosi + 2 = f.vuosi
	WHERE f.[oppimaara] = 'nuortenops' and koulutusluokitus_fi != 'Lukiokoulutukseen valmistava koulutus' 
	AND (d14.hakutapa_koodi = '01' OR (d14.hakutapa_koodi is null AND d15.hakutapa_koodi = '01') OR (d14.hakutapa_koodi is null AND d15.hakutapa_koodi is null AND d16.hakutapa_koodi = '01'))

GO

USE [ANTERO]