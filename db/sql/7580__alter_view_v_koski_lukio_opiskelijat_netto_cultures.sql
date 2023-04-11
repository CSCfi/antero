USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_netto_cultures]    Script Date: 11.4.2023 10:48:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER   VIEW [dw].[v_koski_lukio_opiskelijat_netto_cultures] AS

SELECT 

-- LUKUMÄÄRÄMUUTTUJAT
		apusarake_opiskelijat_netto = opiskelijat

-- FI
	-- AIKAMUUTTUJAT
		,[Tilastovuosi] AS tilastovuosi_fi
		,tilastokuukausi_fi									= d14.kuukausi_fi
		,apusarake_pv_kk									= DAY(EOMONTH(d14.paivays))

	-- HENKILÖMUUTTUJAT
		,sukupuoli_fi										= d1.sukupuoli_fi
		,aidinkieli_fi										= d2.kieliryhma2_fi
		,ika_fi												= d3.ikaryhma6_fi
		,ikaryhma_fi										= d3.ikaryhma3_fi
		,kansalaisuus_fi									= d22.maanosa1_fi
		,kansalaisuus_maanosa_fi							= d22.maanosa0_fi

	-- KOULUTUSMUUTTUJAT
		,suorituskieli_fi									= d23.suorituskieli_yleissivistava_fi
		,majoitus_fi										= d15.majoitus_nimi_fi
		,oppimaara AS oppimaara_fi
		,tavoitetutkinto AS tavoitetutkinto_fi
		,koulutus AS koulutus_fi

	-- ORGANISAATIOMUUTTUJAT
		-- Koulutuksen järjestäjä
			,koulutuksen_jarjestaja_fi						= d11.organisaatio_fi
			,koulutuksen_jarjestajan_kunta_fi				= d12.kunta_fi 
			,koulutuksen_jarjestajan_maakunta_fi			= d12.maakunta_fi 
			,koulutuksen_jarjestajan_ely_fi					= d12.ely_fi 
			,koulutuksen_jarjestajan_avi_fi					= d12.avi_fi
			,koulutuksen_jarjestajan_omistajatyyppi_fi		= d11.koulutuksen_jarjestajan_yritysmuoto
			,koulutuksen_jarjestajan_seutukunta_fi			= d12.seutukunta_fi
			,koulutuksen_jarjestajan_kuntaryhma_fi			= d12.kuntaryhma_fi
			,koulutuksen_jarjestajan_kunnan_kielisuhde_fi	= d12.kielisuhde_fi
		-- Oppilaitos
			,oppilaitos_fi									= d5.organisaatio_fi
			,oppilaitoksen_kunta_fi							= d10.kunta_fi
			,oppilaitoksen_maakunta_fi						= d10.maakunta_fi
			,oppilaitoksen_seutukunta_fi					= d10.seutukunta_fi
			,oppilaitoksen_kuntaryhma_fi					= d10.kuntaryhma_fi
			,oppilaitoksen_kunnan_kielisuhde_fi				= d10.kielisuhde_fi
			,oppilaitoksen_avi_fi							= d10.avi_fi
			,oppilaitoksen_ely_fi							= d10.ely_fi 
			,oppilaitoksen_opetuskieli_fi					= d5.oppilaitoksenopetuskieli_fi
			,oppilaitostyyppi_fi							= d5.oppilaitostyyppi_fi
		-- Toimipiste
			,toimipiste_fi									= d21.organisaatio_fi
			,toimipisteen_kunta_fi							= d24.kunta_fi
			,toimipisteen_maakunta_fi						= d24.maakunta_fi

-- SV
	-- AIKAMUUTTUJAT
		,[Tilastovuosi] AS tilastovuosi_sv
		,tilastokuukausi_sv									= d14.kuukausi_sv

	-- HENKILÖMUUTTUJAT
		,sukupuoli_sv										= d1.sukupuoli_sv
		,aidinkieli_sv										= d2.kieliryhma2_sv
		,ika_sv												= d3.ikaryhma6_sv
		,ikaryhma_sv										= d3.ikaryhma3_sv
		,kansalaisuus_sv									= d22.maanosa1_sv
		,kansalaisuus_maanosa_sv							= d22.maanosa0_sv

	-- KOULUTUSMUUTTUJAT
		,suorituskieli_sv									= d23.suorituskieli_yleissivistava_sv
		,majoitus_sv										= d15.majoitus_nimi_sv
		,oppimaara_sv										= CASE WHEN oppimaara = 'Aikuisten oppimäärä' THEN 'Lärokursen för vuxna'
															  WHEN oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 'Ämnesstuderande (Ingen målexamen)'
															  WHEN oppimaara = 'Nuorten oppimäärä' THEN 'Lärokursen för unga'
															  WHEN oppimaara = 'Ulkomainen tutkinto' THEN 'Utländsk examen' END
		,tavoitetutkinto_sv									= CASE WHEN tavoitetutkinto = 'Ylioppilastutkinto' THEN 'Studentexamen' 
															  WHEN tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN 'IB-examen (International Baccalaureate)' 
															  WHEN tavoitetutkinto = 'Ei tutkintotavoitetta' THEN  'Ingen målexamen'
															  ELSE tavoitetutkinto END
		,koulutus_sv										= CASE WHEN koulutus = 'Lukiokoulutukseen valmistava koulutus' THEN 'Utbildning som förbereder för gymnasieutbildning' 
															  WHEN koulutus = 'Yleissivistävä lukiokoulutus' THEN 'Allmänbildande gymnasieutbildning' END

	-- ORGANISAATIOMUUTTUJAT
		-- Koulutuksen järjestäjä
			,koulutuksen_jarjestaja_sv						= d11.organisaatio_sv
			,koulutuksen_jarjestajan_kunta_sv				= d12.kunta_sv 
			,koulutuksen_jarjestajan_maakunta_sv			= d12.maakunta_sv 
			,koulutuksen_jarjestajan_ely_sv					= d12.ely_sv 
			,koulutuksen_jarjestajan_avi_sv					= d12.avi_sv
			,koulutuksen_jarjestajan_omistajatyyppi_sv		= d11.koulutuksen_jarjestajan_yritysmuoto_sv
			,koulutuksen_jarjestajan_seutukunta_sv			= d12.seutukunta_sv 
			,koulutuksen_jarjestajan_kuntaryhma_sv			= d12.kuntaryhma_sv
			,koulutuksen_jarjestajan_kunnan_kielisuhde_sv	= d12.kielisuhde_sv
		-- Oppilaitos
			,oppilaitos_sv									= d5.organisaatio_sv
			,oppilaitoksen_kunta_sv							= d10.kunta_sv
			,oppilaitoksen_maakunta_sv						= d10.maakunta_sv
			,oppilaitoksen_seutukunta_sv					= d10.seutukunta_sv
			,oppilaitoksen_kuntaryhma_sv					= d10.kuntaryhma_sv 
			,oppilaitoksen_kunnan_kielisuhde_sv				= d10.kielisuhde_sv
			,oppilaitoksen_avi_sv							= d10.avi_sv
			,oppilaitoksen_ely_sv							= d10.ely_sv 
			,oppilaitoksen_opetuskieli_sv					= d5.oppilaitoksenopetuskieli_sv
			,oppilaitostyyppi_sv							= d5.oppilaitostyyppi_sv
		--Toimipiste
			,toimipiste_sv									= d21.organisaatio_sv
			,toimipisteen_kunta_sv							= d24.kunta_sv
			,toimipisteen_maakunta_sv						= d24.maakunta_sv


-- KOODIT
	,koodit_koulutuksen_jarjestaja							= d11.organisaatio_koodi 
	,koodit_oppilaitos										= d5.organisaatio_koodi 
	,koodit_koulutuksen_jarjestajan_kunta					= d12.kunta_koodi 
	,koodit_koulutuksen_jarjestajan_seutukunta				= d12.seutukunta_koodi
	,koodit_oppilaitoksen_kunta								= d10.kunta_koodi
	,koodit_oppilaitoksen_seutukunta						= d10.seutukunta_koodi

-- JÄRJESTYSMUUTTUJAT
	,jarjestys_ika =
		CASE
			WHEN d3.ika_avain = -1 THEN 99
			WHEN d3.ika_avain < 15 THEN 1
			WHEN d3.ika_avain > 70 THEN 71
			ELSE d3.jarjestys_ika END
	,jarjestys_tilastokuukausi 									= d14.kuukausi
	,jarjestys_sukupuoli 										= d1.jarjestys_sukupuoli_koodi
	,jarjestys_ikaryhma 										= d3.jarjestys_ikaryhma3
	,jarjestys_aidinkieli 										= d2.jarjestys_kieliryhma2
	,jarjestys_kansalaisuus										= CASE d22.maatjavaltiot2_fi WHEN 'Suomi' THEN 1 ELSE 2 END
	,jarjestys_koulutus											= f.jarj_koulutus
	,jarjestys_oppimaara										= f.jarj_oppimaara
	,jarjestys_tavoitetutkinto									= f.jarj_tavoitetutkinto
	,jarjestys_koul_jarjestys_maakunta 							= d12.jarjestys_maakunta_koodi
	,jarjestys_koul_jarjestys_avi 								= d12.jarjestys_avi_koodi
	,jarjestys_koul_jarjestys_ely 								= d12.jarjestys_ely_koodi
	,jarjestys_oppilaitoksen_maakunta 							= d10.jarjestys_maakunta_koodi
	,jarjestys_oppilaitoksen_ely 								= d10.jarjestys_ely_koodi
	,jarjestys_oppilaitoksen_avi 								= d10.jarjestys_avi_koodi
	,jarjestys_oppilaitoksen_opetuskieli 						= d5.jarjestys_oppilaitoksenopetuskieli_koodi
	,jarjestys_oppilaitostyyppi 								= d5.jarjestys_oppilaitostyyppi_koodi
	,jarjestys_majoitus 										= d15.jarjestys_majoitus_koodi
	,jarjestys_toimipisteen_maakunta 							= d24.jarjestys_maakunta_koodi


	
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
LEFT JOIN dw.d_alueluokitus d24 ON d24.kunta_koodi = d21.kunta_koodi

GO

USE [ANTERO]