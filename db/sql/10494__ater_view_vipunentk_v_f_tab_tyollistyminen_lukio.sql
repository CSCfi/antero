USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tyollistyminen_lukio]    Script Date: 13.1.2025 16.30.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dbo].[v_f_tab_tyollistyminen_lukio] as

Select [lkm_1vr2] = sijoittuminen_1v_tutkinnon_jalkeen
,[lkm_3vr2] = sijoittuminen_3v_tutkinnon_jalkeen
,[lkm_5vr2] = sijoittuminen_5v_tutkinnon_jalkeen
,[Tilastointivuosi] as Tilastovuosi
,d1.koulutusala2002 as "Koulutusala"
,d1.jarjestys_koulutusala2002
,d1.opintoala2002 as "Opintoala"
,d1.jarjestys_opintoala2002
,d1.koulutus as "Koulutusnimike"
,d1.koulutusaste2002 as "Koulutusaste"
,d1.jarjestys_koulutusaste2002
,d2.paaasiallinen_toiminta_ja_maasta_muuttaneet as "Pääasiallinen toiminta"
,d2.jarjestys as "p_toim_jarj"
,d2.paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi as "paaskoodi"
,d3.tutkintolaji_tyollistymiseen as "Tutkintolaji"
,d3.jarjestys as "tutklaj_jarj"
,d3.tutkintolaji_tyollistymiseen_koodi as "tutklajikoodi"
,d4.ammattiluokitus_2010 as "Ammatti"
,d5.ammattiasema as "Ammattiasema"
,d5.jarjestys as "amas_jarj"
,d6.maassaolo as "Maassaolo"
--placeholder
/*
,Case when d6.maassaolo_koodi='1' Or d6.maassaolo_koodi='2'
			then 'Tuntematon'
			else 'Tuntematon' end AS "Kansalaisuus"
,Case when d6.maassaolo_koodi='1' Or d6.maassaolo_koodi='2'
			then 'Information saknas'
			else 'Information saknas' end AS "Medborgarskap"
,Case when d6.maassaolo_koodi='1' Or d6.maassaolo_koodi='2'
			then 'Missing data'
			else 'Missing data' end AS "Nationality"
,Case when d6.maassaolo_koodi='1' Or d6.maassaolo_koodi='2'
			then '-1'
			else '-1' end AS jarj_kansalaisuus
			*/
--
,d8.aikuisopiskelija as "Nuori/aikuisopiskelija"
,d8.jarjestys as "aik_jarj"
,d9.oppilaitos as "Oppilaitos"
,d9.oppilaitostyyppi as "Oppilaitostyyppi"
,d9.jarjestys_oppilaitostyyppi
,d9.opetuskieli as "Opetuskieli"
,d9.jarjestys_opetuskieli
,d9.oppilaitoksen_omistajatyyppi as "Oppilaitoksen omistajatyyppi"
,d9.jarjestys_omistajatyyppi
,d10.koulutuksen_jarjestaja as "Koulutuksen järjestäjä"
,d10.koulutuksen_jarjestajan_kieli as "Koul. järjestäjän kieli"
,d10.jarjestys_koulutuksen_jarjestajan_kieli
,d11.avi as "Tutk. suorituspaikan AVI"
,d11.jarjestys_avi as "suorjavi"
,d11.ely as "Tutk. suorituspaikan ELY"
,d11.jarjestys_ely as "suorjely"
,d11.maakunta as "Tutk. suoritusmaakunta"
,d11.jarjestys_maakunta as "suorjmaak"
,d11.maakunta_koodi as "suormaakkoodi"
,d12.avi as "Asuinalueen AVI"
,d12.jarjestys_avi as "ajavi"
,d12.ely as "Asuinalueen ELY"
,d12.jarjestys_ely as "ajely"
,d12.maakunta as "Asuinmaakunta"
,d12.jarjestys_maakunta as "ajmaak"
,d12.maakunta_koodi as "asmaakkoodi"
,d25.paaasiallinen_toiminta_okm as "Pääasiallinen toiminta I"
,d25.jarjestys as paastoim2jarj

/* Uudet kentät 3.5.2016 -LR */
,d30.eu_etamaat as 'Kansalaisuus'
,d30.jarjestys as jarj_kansalaisuus
,d31.aidinkieli_versio1 as 'Äidinkieli'
,d31.jarjestys as jarj_aidinkieli
,d32.maanosa as 'Kansalaisuus (maanosa)'
,d32.jarjestys_maanosa as jarj_kans_maanosa
,d4.ammattiluokitus_2010_paataso as 'Ammattiluokitus taso 1'
,d4.ammattiluokitus_2010_2_taso as 'Ammattiluokitus taso 2'
,d4.[jarjestys_ammattiluokitus_2010_paataso] as 'jarj_ammattiluokitustaso1'
,d4.[jarjestys_ammattiluokitus_2010_taso2] as 'jarj_ammattiluokitustaso2'

,d33.rahoituslahde as 'Rahoituslähde'
,d33.jarjestys as jarj_rahoituslahde

--englanti
,[Tilastointivuosi] as "Statistical year"
,d1.koulutusala2002_EN as "Field of education (2002)"
,d1.opintoala2002_EN as "Subfield of ed. (2002)"
,d1.koulutus_EN as "Name of education"
,d1.koulutusaste2002_EN as "Level of education (2002)"
,d2.paaasiallinen_toiminta_ja_maasta_muuttaneet_EN as "Main type of activity II"
,d3.tutkintolaji_tyollistymiseen_EN as "Form of qualification"
,d4.ammattiluokitus_2010_2_taso_EN as "Profession"
,d5.ammattiasema_EN as "Status in employment"
,d6.maassaolo_EN as "Residency in Finland"
,d8.aikuisopiskelija_EN as "Youth/adult student"
,d9.oppilaitos_EN as "Educational institution"
,d9.oppilaitostyyppi_EN as "Type of ed. institution"
,d9.opetuskieli_EN as "Language of the ed. institution"
,d9.oppilaitoksen_omistajatyyppi_EN as "Type of ed. institution owner"
,d10.koulutuksen_jarjestaja_EN as "Education provider"
,d10.koulutuksen_jarjestajan_kieli_EN as "Language of the ed. provider"
,d11.avi_EN as "AVI area of qualification"
,d11.ely_EN as "ELY area of quafification"
,d11.maakunta_EN as "Region of qualification"
,d12.avi_EN as "AVI area of residence"
,d12.ely_EN as "ELY area of residence"
,d12.maakunta_EN as "Region of residence"
,d25.paaasiallinen_toiminta_okm_EN as "Main type of activity I"

/* Uudet kentät 3.5.2016 -LR */
,d30.eu_etamaat_EN as 'Nationality'
,d31.aidinkieli_versio1_EN as 'Mother tongue'
,d32.maanosa_EN as 'Nationality (continent)'
,d4.ammattiluokitus_2010_paataso_EN as 'Profession group 1'
,d4.ammattiluokitus_2010_2_taso_EN as 'Profession group 2'

,d33.rahoituslahde_EN as 'Source of funding'

--ruotsi
,[Tilastointivuosi] as Statistikår
,d1.koulutusala2002_SV as "Utbildningsområde (2002)"
,d1.opintoala2002_SV as "Studieområde (2002)"
,d1.koulutus_SV as "Utbildningsbenämning"
,d1.koulutusaste2002_SV as "Utbildningsnivå (2002)"
,d2.paaasiallinen_toiminta_ja_maasta_muuttaneet_SV as "Huvudsaklig verksamhet II"
,d3.tutkintolaji_tyollistymiseen_SV as "Examensslag"
,d4.ammattiluokitus_2010_2_taso_SV as "Yrke"
,d5.ammattiasema_SV as "Yrkesställning"
,d6.maassaolo_SV as "Bosatt i Finland"
,d8.aikuisopiskelija_SV as "Ungdoms-/vuxenstuderande"
,d9.oppilaitos_SV as "Läroanstalt"
,d9.oppilaitostyyppi_SV as "Läroanstaltstyp"
,d9.opetuskieli_SV as "Läroanstaltens undervis.språk"
,d9.oppilaitoksen_omistajatyyppi_SV as "Läroanstaltens ägartyp"
,d10.koulutuksen_jarjestaja_SV as "Utbildningsanordnare"
,d10.koulutuksen_jarjestajan_kieli_SV as "Utbildningsanordnarens språk"
,d11.avi_SV as "RFV-område där examen avlagts"
,d11.ely_SV as "NMT-område där examen avlagts"
,d11.maakunta_SV as "Landskap där examen avlagts"
,d12.avi_SV as "Bostadsortens RFV-område"
,d12.ely_SV as "Bostadsortens NTM-område"
,d12.maakunta_SV as "Bostadslandskap"
,d25.paaasiallinen_toiminta_okm_SV as "Huvudsaklig verksamhet I"


/* Uudet kentät 3.5.2016 -LR */
,d30.eu_etamaat_SV as 'Medborgarskap'
,d31.aidinkieli_versio1_SV as 'Modersmål'
,d32.maanosa_SV as 'Medborgarskap (världsdel)'
,d4.ammattiluokitus_2010_paataso_SV as 'Yrkesgrupp 1'
,d4.ammattiluokitus_2010_2_taso_SV as 'Yrkesgrupp 2'

,d33.rahoituslahde_SV as 'Finansieringskälla'

--koodimuuttujat
,d1.koulutusala2002_koodi as "Koodit Koulutusala 2002"
,d1.opintoala2002_koodi as "Koodit Opintoala 2002"
,d1.koulutus_koodi as "Koodit Koulutusnimike"
,d1.koulutusaste2002_koodi as "Koodit Koulutusaste 2002"
,d3.tutkintolaji_tyollistymiseen_koodi as "Koodit Tutkintolaji"
,d9.oppilaitoskoodi as "Koodit Oppilaitos"
,d10.koulutuksen_jarjestajakoodi as "Koodit Koul. järjestäjä"
,d11.maakunta_koodi as "Koodit Tutk. suor.maakunta"
,d12.maakunta_koodi as "Koodit Asuinmaakunta"
,d1.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
,d1.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
,d1.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
,d1.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
,d1.iscfi2013_koodi as "Koodit Koulutusala, taso 3"

/* Uudet kentät 3.5.2016 -LR */
,d31.aidinkieli_versio1_koodi as 'Koodit Äidinkieli'
,d4.ammattiluokitus_2010_paataso_koodi as [Koodit Ammattiluokitus taso 1]
,d4.ammattiluokitus_2010_2_taso_koodi as [Koodit Ammattiluokitus taso 2]


--isced
,d1.iscle2011 as "Koulutusaste, taso 1"
,d1.Koulutusaste_taso2 as "Koulutusaste, taso 2"
,d1.iscfibroad2013 as "Koulutusala, taso 1"
,d1.iscfinarrow2013 as "Koulutusala, taso 2"
,d1.iscfi2013 as "Koulutusala, taso 3"
,d1.iscle2011_SV as "Utbildn.nivå, nivå 1"
,d1.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
,d1.iscfibroad2013_SV as "Utbildn.område, nivå 1"
,d1.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
,d1.iscfi2013_SV as "Utbildn.område, nivå 3"
,d1.iscle2011_EN as "Level of education, tier 1"
,d1.Koulutusaste_taso2_EN as "Level of education, tier 2"
,d1.iscfibroad2013_EN as "Field of education, tier 1"
,d1.iscfinarrow2013_EN as "Field of education, tier 2"
,d1.iscfi2013_EN as "Field of education, tier 3"
,d1.jarjestys_iscle2011 as jarj_isced_koulast1
,d1.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
,d1.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d1.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d1.jarjestys_iscfi2013 as jarj_isced_koulala3
FROM dbo.f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta f
	  JOIN d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
	  JOIN d_paaasiallinen_toiminta_ja_maasta_muuttaneet d2 on d2.id = paaasiallinen_toiminta_ja_maasta_muuttaneet_id
	  JOIN d_tutkintolaji_tyollistymiseen d3 on d3.id = tutkintolaji_tyollistymiseen_id
	  JOIN d_ammattiluokitus_2010 d4 on d4.id = ammattiluokitus_2010_id
	  JOIN d_ammattiasema d5 on d5.id = ammattiasema_id
	  JOIN d_maassaolo d6 on d6.id = maassaolo_id
	  JOIN d_aikuisopiskelija d8 on d8.id = aikuisopiskelija_id
	  JOIN d_oppilaitoksen_taustatiedot d9 on d9.id = oppilaitos_id
	  JOIN d_oppilaitoksen_taustatiedot d10 on d10.id = koulutuksen_jarjestaja_id
	  JOIN d_alueluokitus d11 on d11.id = tutkinnon_suorittamismaakunta_id
	  JOIN d_alueluokitus d12 on d12.id = asuinmaakunta_id
	  JOIN d_paaasiallinen_toiminta_okm d25 on d25.id = paaasiallinen_toiminta_okm_id

/* uudet dimensiot 3.5.2015 - LR */

	  JOIN d_eu_etamaat d30 ON d30.id = f.eu_etamaat_id
	  JOIN d_aidinkieli_versio1 d31 ON d31.id = f.aidinkieli_versio1_id
	  JOIN d_valtio d32 ON d32.id = f.kansalaisuus_maanosa_id

	  JOIN dbo.d_rahoituslahde_versio2 d33 on d33.id=f.rahoituslahde_v2_id

WHERE d1.Koulutusaste_taso2_koodi = '31' --d1.koulutusaste2002_koodi = 31 
AND NOT (sijoittuminen_1v_tutkinnon_jalkeen = 0 AND sijoittuminen_3v_tutkinnon_jalkeen = 0 AND sijoittuminen_5v_tutkinnon_jalkeen = 0)


GO


