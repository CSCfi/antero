USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_netto]    Script Date: 1.2.2021 14:00:39 ******/
DROP VIEW IF EXISTS [dw].[v_koski_lukio_opiskelijat_netto]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_netto]    Script Date: 1.2.2021 14:00:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [dw].[v_koski_lukio_opiskelijat_netto] AS

SELECT 

-- AIKAMUUTTUJAT
	[Tilastovuosi]
	,[Tilastokuukausi] = d14.kuukausi_fi
	,[pv_kk] = DAY(EOMONTH(d14.paivays))

-- LUKUMÄÄRÄMUUTTUJAT
		,opiskelijat_netto = opiskelijat

-- HENKILÖMUUTTUJAT
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieliryhma1_fi
	,[Ikä] = 
		CASE
			WHEN d3.ika_avain < 15 THEN 'alle 15 vuotta'
			WHEN d3.ika_avain > 70 THEN 'yli 70 vuotta'
			ELSE d3.ika_fi END
	,[Ikäryhmä] = d3.ikaryhma3_fi
	,[Kansalaisuus] = CASE WHEN d22.maatjavaltiot2_koodi = '246' THEN d22.maatjavaltiot2_fi WHEN d22.maatjavaltiot2_koodi != '-1'  THEN 'Muu' ELSE 'Tieto puuttuu' END
	,[Kansalaisuus (maanosa)] = d22.maanosa0_fi

-- KOULUTUSMUUTTUJAT
	,[Suorituskieli] = d23.kieli_fi
	,[Majoitus] = d15.majoitus_nimi_fi
	,oppimaara AS Oppimäärä
	,tavoitetutkinto AS Tavoitetutkinto
	,koulutus AS Koulutus

-- ORGANISAATIOMUUTTUJAT
	,[Oppilaitos] = d5.organisaatio_fi
	,[Koulutuksen järjestäjä] = d11.organisaatio_fi
	,[Toimipiste] = d21.organisaatio_fi
	,[Oppilaitoksen kunta] = d10.kunta_fi
	,[Oppilaitoksen maakunta] = d10.maakunta_fi
	,d10.seutukunta_fi AS [Oppilaitoksen seutukunta]
	,d10.kuntaryhma_fi AS [Oppilaitoksen kuntaryhmä]
	,d10.kielisuhde_fi AS [Oppilaitoksen kunnan kielisuhde]
	,[Oppilaitoksen AVI] = d10.avi_fi
	,[Oppilaitoksen ELY] = d10.ely_fi 
	,[Oppilaitoksen opetuskieli] = d5.oppilaitoksenopetuskieli_fi
	,[Oppilaitostyyppi] = d5.oppilaitostyyppi_fi
	,[Koul. järj. kunta] = d12.kunta_fi 
	,[Koul. järj. maakunta] = d12.maakunta_fi 
	,[Koul. järj. ELY] = d12.ely_fi 
	,[Koul. järj. AVI] = d12.avi_fi
	,d11.koulutuksen_jarjestajan_yritysmuoto AS [Koul. järj. omistajatyyppi]
	,d12.seutukunta_fi AS [Koul. järj. seutukunta]
	,d12.kuntaryhma_fi AS [Koul. järj. kuntaryhmä]
	,d12.kielisuhde_fi AS [Koul. jarj. kunnan kielisuhde]

-- KOODIT
	,[Koodit Koulutuksen järjestäjä] = d11.organisaatio_koodi 
	,[Koodit Oppilaitos] = d5.organisaatio_koodi 
	,d12.kunta_koodi AS [Koodi Koul. järj. kunta]
	,d12.seutukunta_koodi AS [Koodi Koul. järj. seutukunta]
	,d10.kunta_koodi AS [Koodi Oppilaitoksen kunta]
	,d10.seutukunta_koodi AS [Koodi Oppilaitoksen seutukunta]

-- JÄRJESTYSMUUTTUJAT
	,jarj_ika =
		CASE
			WHEN d3.ika_avain = -1 THEN 99
			WHEN d3.ika_avain < 15 THEN 1
			WHEN d3.ika_avain > 70 THEN 71
			ELSE d3.jarjestys_ika END
	,d14.kuukausi AS jarj_tilastokuukausi
	,d1.jarjestys_sukupuoli_koodi AS jarj_sukupuoli
	,d3.jarjestys_ikaryhma3 AS jarj_ikaryhma
	,d2.jarjestys_kieliryhma1 AS jarj_aidinkieli
	,CASE d22.maatjavaltiot2_fi WHEN 'Suomi' THEN 1 ELSE 2 END AS jarj_kansalaisuus
	,jarj_koulutus
	,jarj_oppimaara
	,jarj_tavoitetutkinto
	,d12.jarjestys_maakunta_koodi AS jarj_koul_jarj_maakunta
	,d12.jarjestys_avi_koodi AS jarj_koul_jarj_avi
	,d12.jarjestys_ely_koodi AS jarj_koul_jarj_ely
	,d10.jarjestys_maakunta_koodi AS jarj_oppilaitoksen_maakunta
	,d10.jarjestys_ely_koodi AS jarj_oppilaitoksen_ely
	,d10.jarjestys_avi_koodi AS jarj_oppilaitoksen_avi
	,d5.jarjestys_oppilaitoksenopetuskieli_koodi AS jarj_oppilaitoksen_opetuskieli
	,d5.jarjestys_oppilaitostyyppi_koodi AS jarj_oppilaitostyyppi
	,d15.jarjestys_majoitus_koodi as jarj_majoitus
	FROM dw.f_koski_lukio_opiskelijat_netto f

LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
LEFT JOIN dw.d_kalenteri d14 ON d14.id = f.d_kalenteri_id
LEFT JOIN dw.d_majoitus d15 ON d15.id = f.d_majoitus_id
LEFT JOIN dw.d_organisaatioluokitus d21 ON d21.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_maatjavaltiot2 d22 ON d22.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN dw.d_kieli d23 ON d23.id = f.d_kieli_suorituskieli_id



















GO


USE ANTERO