USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_laskentapaiva_cultures]    Script Date: 11.4.2023 10:47:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dw].[v_koski_lukio_opiskelijat_laskentapaiva_cultures] AS

SELECT DISTINCT 
-- LASKENTAMUUTTUJAT 
	f.oppija_oid AS apusarake_oppija_oid

--FI
	-- AIKAMUUTTUJAT
		,aloitusvuosi_fi										= COALESCE(f.aloitusvuosi, 'Tieto puuttuu')
		,aloituskuukausi_fi 									= COALESCE(d14.kuukausi_fi, 'Tieto puuttuu')
		,tilastopaiva_fi										= f.laskentapaiva

	-- KOULUTUSMUUTTUJAT
		,oppimaara AS oppimaara_fi
		,tavoitetutkinto AS tavoitetutkinto_fi
		,koulutus_fi											= CASE
																	WHEN koulutusluokitus_fi in ('Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN koulutusluokitus_fi
																	ELSE 'Yleissivistävä lukiokoulutus' 
																END
		,majoitus_fi 											= d16.kytkin_fi
		,sisaoppilaitosmuotoinen_majoitus_fi 						= d17.kytkin_fi
		,suorituskieliryhma_fi 											= d15.kieliryhma2_fi
		,suorituskieli_fi 										= d15.suorituskieli_yleissivistava_fi 

	-- HENKILÖMUUTTUJAT
		,ika_fi													= d4.ikaryhma6_fi			
		,aidinkieli_fi 											= d6.kieliryhma2_fi
		,kansalaisuus_fi 										= d1.maanosa1_fi
		,kansalaisuus_maanosa_fi 								= COALESCE(d1.maanosa_fi, 'Tieto puuttuu')
		,sukupuoli_fi 											= COALESCE(d3.[sukupuoli_fi], 'Tieto puuttuu')
		,ikaryhma_fi 											= COALESCE(d4.ikaryhma3_fi, 'Tuntematon')

	-- ORGANISAATIOMUUTTUJAT
		-- Koulutuksen järjestäjä
				,koulutuksen_jarjestaja_fi						= d7.organisaatio_fi
				,koulutuksen_jarjestajan_yritysmuoto_fi 		= d7.koulutuksen_jarjestajan_yritysmuoto
				,koulutuksen_jarjestajan_kunta_fi 				= d10.kunta_fi
				,koulutuksen_jarjestajan_maakunta_fi 			= d10.maakunta_fi
				,koulutuksen_jarjestajan_avi_fi 				= d10.avi_fi 
				,koulutuksen_jarjestajan_ely_fi 				= d10.ely_fi 
				,koulutuksen_jarjestajan_oppilaitostyyppi_fi 	= d7.oppilaitostyyppi_fi
				,koulutuksen_jarjestajan_seutukunta_fi	 		= d10.seutukunta_fi
				,koulutuksen_jarjestajan_kuntaryhma_fi 			= d10.kuntaryhma_fi 
				,koulutuksen_jarjestajan_kunnan_kielisuhde_fi 	= d10.kielisuhde_fi
			-- Oppilaitos
				,oppilaitos_fi 									= d8.organisaatio_fi
				,opetuskieli_fi 								= d8.oppilaitoksenopetuskieli_fi
				,oppilaitoksen_kunta_fi 						= d11.kunta_fi
				,oppilaitoksen_maakunta_fi 						= d11.maakunta_fi
				,oppilaitoksen_avi_fi 							= d11.avi_fi
				,oppilaitoksen_ely_fi							= d11.ely_fi 
				,oppilaitostyyppi_fi 							= d8.oppilaitostyyppi_fi
				,oppilaitoksen_seutukunta_fi 					= d11.seutukunta_fi
				,oppilaitoksen_kuntaryhma_fi 					= d11.kuntaryhma_fi
				,oppilaitoksen_kunnan_kielisuhde_fi 			= d11.kielisuhde_fi
			-- Toimipiste
				,toimipiste_fi 									= d9.organisaatio_fi
				,toimipisteen_kunta_fi							= d12.kunta_fi
				,toimipisteen_maakunta_fi						= d12.maakunta_fi

--SV
	-- AIKAMUUTTUJAT
		,aloitusvuosi_sv 										= COALESCE(f.aloitusvuosi, 'Information saknas')
		,aloituskuukausi_sv 									= COALESCE(d14.kuukausi_sv, 'Information saknas')
		,tilastopaiva_sv 										= f.laskentapaiva

	-- KOULUTUSMUUTTUJAT
		,oppimaara_sv											= CASE WHEN oppimaara = 'Aikuisten oppimäärä' THEN 'Lärokursen för vuxna'
																	WHEN oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 'Ämnesstuderande (Ingen målexamen)'
																	WHEN oppimaara = 'Nuorten oppimäärä' THEN 'Lärokursen för unga'
																	WHEN oppimaara = 'Ulkomainen tutkinto' THEN 'Utländsk examen' END
		,tavoitetutkinto_sv										= CASE WHEN tavoitetutkinto = 'Ylioppilastutkinto' THEN 'Studentexamen' 
																	WHEN tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN 'IB-examen (International Baccalaureate)' 
																	WHEN tavoitetutkinto = 'Ei tutkintotavoitetta' THEN  'Ingen målexamen'
																	ELSE tavoitetutkinto END
		,koulutus_sv											= CASE
																	WHEN koulutusluokitus_fi in ('Lukiokoulutukseen valmistava koulutus', 'Tutkintokoulutukseen valmentava koulutus') THEN koulutusluokitus_sv
																	ELSE 'Allmänbildande gymnasieutbildning' 
																END
		,majoitus_sv 											= d16.kytkin_sv
		,sisaoppilaitosmuotoinen_majoitus_sv 						= d17.kytkin_sv
		,suorituskieliryhma_sv 											= d15.kieliryhma2_sv
		,suorituskieli_sv 										= d15.suorituskieli_yleissivistava_sv 

	-- HENKILÖMUUTTUJAT
		,ika_sv													= d4.ikaryhma6_sv
		,aidinkieli_sv 											= d6.kieliryhma2_sv
		,kansalaisuus_sv 										= d1.maanosa1_sv
		,kansalaisuus_maanosa_sv 								= COALESCE(d1.maanosa_sv, 'Information saknas')
		,sukupuoli_sv 											= COALESCE(d3.[sukupuoli_sv], 'Information saknas')
		,ikaryhma_sv 											= COALESCE(d4.ikaryhma3_sv, 'Okänd')

	-- ORGANISAATIOMUUTTUJAT
		-- Koulutuksen järjestäjä
			,koulutuksen_jarjestaja_sv							= d7.organisaatio_sv
			,koulutuksen_jarjestajan_yritysmuoto_sv 			= d7.koulutuksen_jarjestajan_yritysmuoto_sv
			,koulutuksen_jarjestajan_kunta_sv 					= d10.kunta_sv
			,koulutuksen_jarjestajan_maakunta_sv 				= d10.maakunta_sv
			,koulutuksen_jarjestajan_avi_sv 					= d10.avi_sv 
			,koulutuksen_jarjestajan_ely_sv 					= d10.ely_sv 
			,koulutuksen_jarjestajan_oppilaitostyyppi_sv 		= d7.oppilaitostyyppi_sv
			,koulutuksen_jarjestajan_seutukunta_sv	 			= d10.seutukunta_sv
			,koulutuksen_jarjestajan_kuntaryhma_sv 				= d10.kuntaryhma_sv 
			,koulutuksen_jarjestajan_kunnan_kielisuhde_sv 		= d10.kielisuhde_sv
		-- Oppilaitos
			,oppilaitos_sv 										= d8.organisaatio_sv
			,opetuskieli_sv 									= d8.oppilaitoksenopetuskieli_sv
			,oppilaitoksen_kunta_sv 							= d11.kunta_sv
			,oppilaitoksen_maakunta_sv 							= d11.maakunta_sv
			,oppilaitoksen_avi_sv 								= d11.avi_sv
			,oppilaitoksen_ely_sv								= d11.ely_sv 
			,oppilaitostyyppi_sv 								= d8.oppilaitostyyppi_sv
			,oppilaitoksen_seutukunta_sv 						= d11.seutukunta_sv
			,oppilaitoksen_kuntaryhma_sv 						= d11.kuntaryhma_sv
			,oppilaitoksen_kunnan_kielisuhde_sv 				= d11.kielisuhde_sv
		-- Toimipiste
			,toimipiste_sv 										= d9.organisaatio_sv
			,toimipisteen_kunta_sv								= d12.kunta_sv
			,toimipisteen_maakunta_sv							= d12.maakunta_sv


-- KOODIMUUTTUJAT
	,koodit_koulutuksen_jarjestaja 								= d7.organisaatio_koodi
	,koodit_koulutuksen_jarjestajan_kunta 						= d7.kunta_koodi
	,koodit_koulutuksen_jarjestajan_seutukunta 					= d10.seutukunta_koodi
	,koodit_oppilaitos 											= d8.organisaatio_koodi
	,koodit_oppilaitoksen_kunta 								= d8.kunta_koodi
	,koodit_oppilaitoksen_seutukunta 							= d11.seutukunta_koodi

-- JÄRJESTYSMUUTTUJAT
	,case
		when f.ika = -1 then 99 
		when f.[ika] < 15 then 0 
		when f.ika > 70 then 71
		else f.ika end 
		AS [jarjestys_ika]
	,[jarjestys_opetuskieli] 									= d9.jarjestys_oppilaitoksenopetuskieli_koodi
	,jarjestys_suorituskieliryhma 								= d6.jarjestys_kieliryhma2 
	,jarjestys_sukupuoli	 									= COALESCE(d3.jarjestys_sukupuoli_koodi, 999)
	,d4.jarjestys_ikaryhma3
	,CASE
		WHEN f.oppimaara = 'Aikuisten oppimäärä' THEN 2
		WHEN f.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 4
		WHEN f.oppimaara = 'Nuorten oppimäärä' THEN 1
		WHEN f.oppimaara = 'Ulkomainen tutkinto' THEN 3
		ELSE 999 END
		AS jarjestys_oppimaara
	,jarjestys_tavoitetutkinto									= f.jarj_tavoitetutkinto
	,CASE
		WHEN koulutusluokitus_fi = 'Lukiokoulutukseen valmistava koulutus' THEN 2
		WHEN koulutusluokitus_fi = 'Tutkintokoulutukseen valmentava koulutus' THEN 3
		ELSE 1 END
		AS jarjestys_koulutus
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 1
		ELSE 2 END
		AS jarjestys_kansalaisuus
	,jarjestys_aloituskuukausi 									= COALESCE(d14.kuukausi, 99)
	,jarjestys_koulutuksen_jarjestajan_maakunta 				= d10.jarjestys_maakunta_koodi
	,jarjestys_oppilaitoksen_maakunta 							= d11.jarjestys_maakunta_koodi
	,jarjestys_toimipisteen_maakunta 							= d12.jarjestys_maakunta_koodi



  FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_laskentapaiva] AS f
  LEFT JOIN ANTERO.dw.d_maatjavaltiot2 AS d1 ON CAST(f.kansalaisuus AS varchar) = CAST(d1.maatjavaltiot2_koodi AS varchar)
--  LEFT JOIN ANTERO.dw.d_alueluokitus AS d2 ON f.oppilaitos_kotipaikka = d2.kunta_koodi
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
  LEFT JOIN 	
	(SELECT DISTINCT 
	vuosi, kuukausi, kuukausi_fi, kuukausi_sv
	FROM ANTERO.dw.d_kalenteri) AS d14 ON f.aloitusvuosi = d14.vuosi AND f.aloituskuukausi = d14.kuukausi
  LEFT JOIN ANTERO.dw.d_kieli AS d15 ON f.suorituskieli_koodiarvo = d15.kieli_koodi
  LEFT JOIN ANTERO.dw.d_kytkin AS d16 ON COALESCE(f.majoitus,0) = d16.kytkin_koodi
  LEFT JOIN ANTERO.dw.d_kytkin AS d17 ON COALESCE(f.sisaoppilaitosmainen_majoitus,0) = d17.kytkin_koodi
 WHERE aloitusvuosi <= YEAR(GETDATE())


GO

USE [ANTERO]