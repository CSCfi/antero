USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_kuukausittain_cultures]    Script Date: 30.7.2025 10.40.56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_koski_lukio_opiskelijat_kuukausittain_cultures] AS

SELECT --TOP 1000

-- LASKENTAMUUTTUJAT 
	 f.master_oid AS apusarake_oppija_oid
	,f.uusi_opiskelija AS apusarake_uusi_opiskelija
	,eronnut AS apusarake_eronnut
    ,[jatkaa_kj] AS apusarake_jatkaa_kj
    ,[jatkaa_oppilaitos] AS apusarake_jatkaa_oppilaitos
    ,[jatkaa_tutkintotyyppi] AS apusarake_jatkaa_tutkintotyyppi
    ,[jatkaa_ammatillinen] AS apusarake_jatkaa_ammatillinen
    ,[jatkaa_yleissivistava] AS apusarake_jatkaa_yleissivistava
    ,[jatkaa_valmentava] AS apusarake_jatkaa_valmentava
    ,[jatkaa_lukio_valmentava] AS apusarake_jatkaa_lukio_valmentava
    ,[jatkaa_amm_valmentava] AS apusarake_jatkaa_amm_valmentava
    ,[jatkaa_muu_ammatillinen] AS apusarake_jatkaa_muu_ammatillinen
	,[jatkaa_amm_tutkintokoulutus] AS apusarake_jatkaa_amm_tutkintokoulutus
    ,[jatkaa_tutkinto_boo] AS apusarake_jatkaa_tutkinto_boo
    ,[jatkaa_koulutusala_taso3_boo] AS apusarake_jatkaa_koulutusala_taso3_boo
    ,[jatkaa_koulutusala_taso2_boo] AS apusarake_jatkaa_koulutusala_taso2_boo
    ,[jatkaa_koulutusala_taso1_boo] AS apusarake_jatkaa_koulutusala_tas1_boo
    ,[jatkaa_koulutusmuoto_boo] AS apusarake_jatkaa_koulutusalamuoto_boo
    ,[jatkaa_amm_yleissiv_boo] AS apusarake_jatkaa_amm_yleissiv_boo
    ,[jatkaa_toinen_aste_boo] AS apusarake_jatkaa_toinen_aste_boo
    ,[jatkaa_koulutusjarjestelma_boo] AS apusarake_jatkaa_koulutusjarjestelma_boo
    ,[jatkaa_oppimaara] AS apusarake_jatkaa_oppimaara
    ,[vaihto_oppimaara] AS apusarake_vaihto_oppimaara
    ,[jatkaa_aikuistenops] AS apusarake_jatkaa_aikuistenops
    ,[jatkaa_nuortenops] AS apusarake_jatkaa_nuortenops
    ,[jatkaa_lukioaine] AS apusarake_jatkaa_lukioaine
    ,[jatkaa_lukio_ulkomainen] AS apusarake_jatkaa_lukio_ulkomainen

	,f.aloitusajankohta

--FI
	-- AIKAMUUTTUJAT
		,vuosi_fi 											= f.vuosi
		,kuukausi_fi 										= d13.kuukausi_fi
		,aloitusvuosi_fi									= COALESCE(f.aloitusvuosi, 'Tieto puuttuu')
		,aloituskuukausi_fi 								= COALESCE(d14.kuukausi_fi, 'Tieto puuttuu')
		,lukuvuosi_fi 										= case when f.lukuvuosi = '2017/2018' then '2017/2018 kevätlukukausi' else f.lukuvuosi END 
		,lukukausi_fi 										= f.lukukausi
		,aloitus_kuukauden_aikana_fi						= d19.kytkin_fi

	-- KOULUTUSMUUTTUJAT
		--,CASE
		--	WHEN f.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
		--	WHEN f.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
		--	WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		--	WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
		--	ELSE 'Ei tietoa' END
		--	AS Oppimäärä
		,oppimaara AS oppimaara_fi
		,tavoitetutkinto AS tavoitetutkinto_fi
		,yhdistelmatutkinto AS yhdistelmatutkinto_fi
		,koulutus AS koulutus_fi
		,majoitus_fi 										= d17.kytkin_fi
		,sisaoppilaitosmuotoinen_majoitus_fi 				= d18.kytkin_fi
		,suorituskieliryhma_fi 								= d15.kieliryhma2_fi
		,suorituskieli_fi 									= d15.suorituskieli_yleissivistava_fi

	-- HENKILÖMUUTTUJAT
		,ika_fi												= d4.ikaryhma6_fi
		,aidinkieli_fi										= d6.kieliryhma2_fi
		,kansalaisuus_tarkka_fi								= d1.maatjavaltiot2_fi
		,kansalaisuus_fi 									= d1.maanosa1_fi
		,kansalaisuus_maanosa_fi 							= COALESCE(d1.maanosa_fi, 'Tieto puuttuu')
		,sukupuoli_fi 										= COALESCE(d3.[sukupuoli_fi], 'Tieto puuttuu') 
		,ikaryhma_fi 										= d4.[ikaryhma3_fi]
		,ikaryhma2_fi 										= CASE
															      WHEN d4.[ika_avain] <= 18 THEN d4.[ikaryhma2_fi]
																  ELSE 'yli 18-vuotiaat'
															  END
		,kotikunta_nykyinen_fi								= d0.kunta_fi
		,kotimaakunta_nykyinen_fi							= d0.maakunta_fi
		,kotikunnan_hyvinvointialue_nykyinen_fi				= d0.hyvinvointialue_fi
		,kotikunta_manner_suomessa_fi						= d20.kytkin_fi
		,oppivelvollinen_1_8_2021_fi						= d21.kytkin_fi

	-- ORGANISAATIOMUUTTUJAT
		-- Koulutuksen järjestäjä
			,koulutuksen_jarjestaja_fi 						= d7.organisaatio_fi 
			,koulutuksen_jarjestajan_yritysmuoto_fi 		= d7.koulutuksen_jarjestajan_yritysmuoto
			,koulutuksen_jarjestajan_kunta_fi 				= d10.kunta_fi
			,koulutuksen_jarjestajan_maakunta_fi 			= d10.maakunta_fi
			,koulutuksen_jarjestajan_hyvinvointialue_fi 	= d10.hyvinvointialue_fi
			,koulutuksen_jarjestajan_avi_fi					= d10.avi_fi
			,koulutuksen_jarjestajan_ely_fi 				= d10.ely_fi
			,koulutuksen_jarjestajan_oppilaitostyyppi_fi 	= d7.oppilaitostyyppi_fi
			,koulutuksen_jarjestajan_seutukunta_fi			= d10.seutukunta_fi
			,koulutuksen_jarjestajan_kuntaryhma_fi			= COALESCE(d10.kuntaryhma_fi, 'Tieto puuttuu')
			,koulutuksen_jarjestajan_kunnan_kielisuhde_fi	= d10.kielisuhde_fi
		-- Oppilaitos
			,oppilaitos_fi 									= d8.organisaatio_fi
			,opetuskieli_fi									= d8.oppilaitoksenopetuskieli_fi
			,oppilaitoksen_kunta_fi 						= d11.kunta_fi
			,oppilaitoksen_maakunta_fi 						= d11.maakunta_fi
			,oppilaitoksen_hyvinvointialue_fi 				= d11.hyvinvointialue_fi
			,oppilaitoksen_avi_fi 							= d11.avi_fi
			,oppilaitoksen_ely_fi 							= d11.ely_fi
			,Oppilaitostyyppi_fi 							= d8.oppilaitostyyppi_fi
			,oppilaitoksen_seutukunta_fi 					= COALESCE(d11.seutukunta_fi, 'Tieto puuttuu')
			,oppilaitoksen_kuntaryhma_fi 					= COALESCE(d11.kuntaryhma_fi, 'Tieto puuttuu')
			,oppilaitoksen_kunnan_kielisuhde_fi 			= COALESCE(d11.kielisuhde_fi, 'Tieto puuttuu')
		-- Toimipiste
			,toimipiste_fi									= d9.organisaatio_fi
			,toimipisteen_kunta_fi							= d12.kunta_fi
			,toimipisteen_maakunta_fi						= d12.maakunta_fi
			,toimipisteen_hyvinvointialue_fi				= d12.hyvinvointialue_fi

	--TILANNEMUUTTUJAT
		,eronnut_fi = d16b.keskeyttaminen_opiskelijan_toiminta_taso0_fi
		,jatkoi_keskeytti_vaihtoi_fi = d16b.keskeyttaminen_opiskelijan_toiminta_taso1_fi
		,opiskelijan_tilanne_fi = d16b.keskeyttaminen_opiskelijan_toiminta_fi
		,jarjestys_opiskelijan_tilanne = d16b.keskeyttaminen_opiskelijan_toiminta_jarjestys

--SV
	--AIKAMUUTTUJAT
		,vuosi_sv 											= f.vuosi
		,kuukausi_sv 										= d13.kuukausi_sv
		,aloitusvuosi_sv	 								= COALESCE(f.aloitusvuosi, 'Information saknas')
		,aloituskuukausi_sv 								= COALESCE(d14.kuukausi_sv, 'Information saknas')
		,lukuvuosi_sv										= case when f.lukuvuosi = '2017/2018' then '2017/2018 vårtermin' else f.lukuvuosi END 
		,lukukausi_sv 										= case f.lukukausi when 'Syyslukukausi' then 'Hösttermin' when 'Kevätlukukausi' then 'Vårtermin' end
		,aloitus_kuukauden_aikana_sv						= d19.kytkin_sv

	-- KOULUTUSMUUTTUJAT
		--,CASE
		--	WHEN f.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
		--	WHEN f.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
		--	WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		--	WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
		--	ELSE 'Ei tietoa' END
		--	AS Oppimäärä
		,oppimaara_sv										= CASE WHEN oppimaara = 'Aikuisten oppimäärä' THEN 'Lärokursen för vuxna'
																WHEN oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 'Ämnesstuderande (Ingen målexamen)'
																WHEN oppimaara = 'Nuorten oppimäärä' THEN 'Lärokursen för unga'
																WHEN oppimaara = 'Ulkomainen tutkinto' THEN 'Utländsk examen' END
		,tavoitetutkinto_sv									= CASE WHEN tavoitetutkinto = 'Ylioppilastutkinto' THEN 'Studentexamen' 
																WHEN tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN 'IB-examen (International Baccalaureate)' 
																WHEN tavoitetutkinto = 'Ei tutkintotavoitetta' THEN  'Ingen målexamen'
																ELSE tavoitetutkinto END
		,yhdistelmatutkinto_sv								= CASE WHEN yhdistelmatutkinto = 'Kaksoistutkinto-opiskelija' THEN 'Dubbelexamen student'
																WHEN yhdistelmatutkinto = 'Kolmoistutkinto-opiskelija' THEN 'Trippelexamen student' 
																WHEN yhdistelmatutkinto = 'Lukio valm. ja ammatillinen' THEN 'Utbildning som förbereder för gymnasieutbildning och yrkesutbildning'
																WHEN yhdistelmatutkinto = 'Ei yhdistelmätutkintoa' THEN 'Ingen kombinationsexamen' END
		,koulutus_sv										= CASE WHEN koulutus = 'Lukiokoulutukseen valmistava koulutus' THEN 'Utbildning som förbereder för gymnasieutbildning' 
																WHEN koulutus = 'Yleissivistävä lukiokoulutus' THEN 'Allmänbildande gymnasieutbildning' END
		,majoitus_sv 										= d17.kytkin_sv
		,sisaoppilaitosmuotoinen_majoitus_sv 				= d18.kytkin_sv
		,suorituskieliryhma_sv 										= d15.kieliryhma2_sv
		,suorituskieli_sv 									= d15.suorituskieli_yleissivistava_sv

	-- HENKILÖMUUTTUJAT
		,ika_sv												= d4.ikaryhma6_sv
		,aidinkieli_sv										= d6.kieliryhma2_sv
		,kansalaisuus_tarkka_sv								= d1.maatjavaltiot2_sv
		,kansalaisuus_sv 									= d1.maanosa1_sv
		,kansalaisuus_maanosa_sv 							= COALESCE(d1.maanosa_sv, 'Information saknas')
		,sukupuoli_sv 										= COALESCE(d3.[sukupuoli_sv], 'Information saknas') 
		,ikaryhma_sv 										= CASE WHEN d4.[ikaryhma3_sv] IS NULL THEN 'Okänd' ELSE d4.ikaryhma3_sv END
		,ikaryhma2_sv 										= CASE
															      WHEN d4.[ika_avain] <= 18 THEN d4.[ikaryhma2_sv]
																  ELSE 'över 18 år'
															  END
		,kotikunta_nykyinen_sv								= d0.kunta_sv
		,kotimaakunta_nykyinen_sv							= d0.maakunta_sv
		,kotikunnan_hyvinvointialue_nykyinen_sv				= d0.hyvinvointialue_sv
		,kotikunta_manner_suomessa_sv						= d20.kytkin_sv
		,oppivelvollinen_1_8_2021_sv						= d21.kytkin_sv
		
	-- ORGANISAATIOMUUTTUJAT
		-- Koulutuksen järjestäjä
			,koulutuksen_jarjestaja_sv 						= d7.organisaatio_sv
			,koulutuksen_jarjestajan_yritysmuoto_sv 		= d7.koulutuksen_jarjestajan_yritysmuoto_sv
			,koulutuksen_jarjestajan_kunta_sv 				= d10.kunta_sv
			,koulutuksen_jarjestajan_maakunta_sv 			= d10.maakunta_sv
			,koulutuksen_jarjestajan_hyvinvointialue_sv 	= d10.hyvinvointialue_sv
			,koulutuksen_jarjestajan_avi_sv					= d10.avi_sv
			,koulutuksen_jarjestajan_ely_sv 				= d10.ely_sv
			,koulutuksen_jarjestajan_oppilaitostyyppi_sv 	= d7.oppilaitostyyppi_sv
			,koulutuksen_jarjestajan_seutukunta_sv			= d10.seutukunta_sv
			,koulutuksen_jarjestajan_kuntaryhma_sv			= COALESCE(d10.kuntaryhma_sv, 'Information saknas')
			,koulutuksen_jarjestajan_kunnan_kielisuhde_sv	= d10.kielisuhde_sv
		-- Oppilaitos
			,oppilaitos_sv 									= d8.organisaatio_sv
			,opetuskieli_sv									= d8.oppilaitoksenopetuskieli_sv
			,oppilaitoksen_kunta_sv 						= d11.kunta_sv
			,oppilaitoksen_maakunta_sv 						= d11.maakunta_sv
			,oppilaitoksen_hyvinvointialue_sv 				= d11.hyvinvointialue_sv
			,oppilaitoksen_avi_sv 							= d11.avi_sv
			,oppilaitoksen_ely_sv 							= d11.ely_sv
			,Oppilaitostyyppi_sv							= d8.oppilaitostyyppi_sv
			,oppilaitoksen_seutukunta_sv 					= COALESCE(d11.seutukunta_sv, 'Information saknas')
			,oppilaitoksen_kuntaryhma_sv 					= COALESCE(d11.kuntaryhma_sv, 'Information saknas')
			,oppilaitoksen_kunnan_kielisuhde_sv 			= COALESCE(d11.kielisuhde_sv, 'Information saknas')
		-- Toimipiste
			,toimipiste_sv									= d9.organisaatio_sv
			,toimipisteen_kunta_sv							= d12.kunta_sv
			,toimipisteen_maakunta_sv						= d12.maakunta_sv
			,toimipisteen_hyvinvointialue_sv				= d12.hyvinvointialue_sv


-- KOODIMUUTTUJAT
	,koodit_koulutuksen_jarjestaja 							= d7.organisaatio_koodi 
	,koodit_koulutuksen_jarjestajan_kunta 					= d7.kunta_koodi
	,koodit_koulutuksen_jarjestajan_seutukunta 				= d10.seutukunta_koodi
	,koodit_oppilaitos 										= d8.organisaatio_koodi
	,koodit_oppilaitoksen_kunta								= d8.kunta_koodi
	,koodit_oppilaitoksen_seutukunta 						= d11.seutukunta_koodi


-- JÄRJESTYSMUUTTUJAT
	,jarjestys_koulutuksen_jarjestajan_kuntaryhma 							= COALESCE(d10.kuntaryhma_koodi, 99)
	,jarjestys_koulutuksen_jarjestajan_maakunta 							= d10.jarjestys_maakunta_koodi
	,jarjestys_koulutuksen_jarjestajan_hyvinvointialue 						= d10.jarjestys_hyvinvointialue_koodi
	,jarjestys_oppilaitoksen_kuntaryhma 									= COALESCE(d11.kuntaryhma_koodi, 99)
	,jarjestys_oppilaitoksen_maakunta 										= d11.jarjestys_maakunta_koodi
	,jarjestys_oppilaitoksen_hyvinvointialue 								= d11.jarjestys_hyvinvointialue_koodi
	,jarjestys_toimipisteen_maakunta 										= d12.jarjestys_maakunta_koodi
	,jarjestys_toimipisteen_hyvinvointialue 								= d12.jarjestys_hyvinvointialue_koodi
	,case
		when f.ika = -1 then 99 
		when f.[ika] < 15 then 0 
		when f.ika > 70 then 71
		else f.ika end 
		AS [jarjestys_ika]
	,[jarjestys_opetuskieli] 									= d8.jarjestys_oppilaitoksenopetuskieli_koodi
	,jarjestys_aidinkieli		 								= d6.jarjestys_kieliryhma2
	,jarjestys_suorituskieliryhma 								= d15.jarjestys_kieliryhma2
	,jarjestys_sukupuoli 										= COALESCE(d3.jarjestys_sukupuoli_koodi, 999)
	,d4.jarjestys_ikaryhma3 as jarjestys_ikaryhma
	,jarjestys_ikaryhma2										= CASE
																      WHEN d4.[ika_avain] = -1 THEN 3
															          WHEN d4.[ika_avain] <= 18 THEN 1
																      ELSE 2
																  END
	,CASE
		WHEN f.oppimaara = 'Aikuisten oppimäärä' THEN 2
		WHEN f.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 4
		WHEN f.oppimaara = 'Nuorten oppimäärä' THEN 1
		WHEN f.oppimaara = 'Ulkomainen tutkinto' THEN 3
		ELSE 999 END
		AS jarjestys_oppimaara
	,jarjestys_tavoitetutkinto									= f.jarj_tavoitetutkinto
	,jarjestys_koulutus											= f.jarj_koulutus
	,jarjestys_kansalaisuus										= d1.jarjestys_maanosa1_koodi
	,jarjestys_kotimaakunta_nykyinen							= d0.jarjestys_maakunta_koodi
	,jarjestys_kotikunnan_hyvinvointialue_nykyinen				= d0.jarjestys_hyvinvointialue_koodi
	,jarjestys_kuukausi 										= d13.kuukausi
	,jarjestys_aloituskuukausi 									= COALESCE(d14.kuukausi, 99)
	,jarjestys_yhdistelmatutkinto								= f.jarj_yhdistelmatutkinto
	,jarjestys_lukukausi 										= CASE WHEN f.lukukausi = 'Syyslukukausi' THEN 1 WHEN f.lukukausi = 'Kevätlukukausi' THEN 2 END


FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_kuukausittain] AS f 
LEFT JOIN ANTERO.dw.d_alueluokitus AS d0 ON d0.id = f.d_alueluokitus_kotikunta_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 AS d1 ON CAST(f.kansalaisuus AS varchar) = CAST(d1.maatjavaltiot2_koodi AS varchar)
LEFT JOIN ANTERO.dw.d_sukupuoli AS d3 ON f.Sukupuoli = d3.sukupuoli_koodi
LEFT JOIN ANTERO.dw.d_ika AS d4 ON coalesce(f.Ika,-1) = d4.ika_avain
--LEFT JOIN ANTERO.dw.d_koulutusluokitus AS d5 ON f.koulutusmoduuli_koodiarvo = d5.koulutusluokitus_koodi
LEFT JOIN ANTERO.dw.d_kieli AS d6 ON f.aidinkieli = d6.kieli_koodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d7 ON f.koulutustoimija_oid = d7.organisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d8 ON f.oppilaitos_oid = d8.organisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d9 ON f.toimipiste_oid = d9.organisaatio_oid
LEFT JOIN ANTERO.dw.d_alueluokitus AS d10 ON d7.kunta_koodi = d10.kunta_koodi
LEFT JOIN ANTERO.dw.d_alueluokitus AS d11 ON d8.kunta_koodi = d11.kunta_koodi
LEFT JOIN ANTERO.dw.d_alueluokitus AS d12 ON d9.kunta_koodi = d12.kunta_koodi
LEFT JOIN (SELECT DISTINCT vuosi, kuukausi, kuukausi_fi, kuukausi_sv FROM ANTERO.dw.d_kalenteri) AS d13 ON f.vuosi = d13.vuosi AND f.kuukausi = d13.kuukausi
LEFT JOIN (SELECT DISTINCT vuosi, kuukausi, kuukausi_fi, kuukausi_sv FROM ANTERO.dw.d_kalenteri) AS d14 ON f.aloitusvuosi = d14.vuosi AND f.aloituskuukausi = d14.kuukausi
LEFT JOIN ANTERO.dw.d_kieli AS d15 ON f.suorituskieli_koodiarvo = d15.kieli_koodi
LEFT JOIN dw.d_keskeyttaminen_vaiheittainen d16 ON d16.id = f.d_keskeyttaminen_vaiheittainen_id
LEFT JOIN dw.d_keskeyttaminen_opiskelijan_toiminta d16b ON d16b.id = f.d_keskeyttaminen_opiskelijan_toiminta_id
LEFT JOIN ANTERO.dw.d_kytkin AS d17 ON COALESCE(f.majoitus,0) = d17.kytkin_koodi
LEFT JOIN ANTERO.dw.d_kytkin AS d18 ON COALESCE(f.sisaoppilaitosmainen_majoitus,0) = d18.kytkin_koodi
LEFT JOIN dw.d_kytkin d19 ON d19.kytkin_koodi = f.aloitus_kuukauden_aikana_1_0
LEFT JOIN ANTERO.dw.d_kytkin AS d20 ON COALESCE(f.kotikunta_manner_suomessa,-1) = d20.kytkin_koodi
LEFT JOIN ANTERO.dw.d_kytkin AS d21 ON COALESCE(f.oppivelvollinen,-1) = d21.kytkin_koodi

-- WHERE aloitusvuosi >= YEAR(GETDATE())

GO


