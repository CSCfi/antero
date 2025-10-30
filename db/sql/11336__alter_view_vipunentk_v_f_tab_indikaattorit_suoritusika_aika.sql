USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_indikaattorit_suoritusika_aika]    Script Date: 30.10.2025 10.00.25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER  VIEW [dbo].[v_f_tab_indikaattorit_suoritusika_aika] AS

Select --top 100
[Tilastovuosi]
,[Statistical year]
,[Statistikår]
,d1.aineisto as Aineisto
,d1b.aineisto as Aineisto_OTV
,d1b.kaikkien_asteiden_koulutus as 'Kaikkien asteiden koulutus'
,d1b.tilastointivuosi as OTV_Tilv
,d2.aidinkieli_versio1 as Äidinkieli
,d4.sukupuoli as Sukupuoli
,d5b.vuosiselite as Syntymävuosi
,d5c.kuukausiselite as Syntymäkuukausi
,d7.koulutustyyppi as Koulutustyyppi
,d9.oppilaitos as Oppilaitos
,d9.opetuskieli as Opetuskieli
,d9.oppilaitoksen_omistajatyyppi as "Oppil. omistajatyyppi"
,d9.oppilaitostyyppi as Oppilaitostyyppi
,d9b.koulutuksen_jarjestaja as "Koulutuksen järjestäjä"
,d9b.koulutuksen_jarjestajan_omistajatyyppi as "Koul. järjestäjän omistajatyyppi"
,d10.lahde as Lähde
,d19.koulutussektori as Koulutussektori
,d20.opetushallinnon_koulutus as Hallinnonala
,d21.koulutusaste2002 as Koulutusaste
,d21.koulutusala2002 as "Koulutusala"
,d21.koulutusala2002 as "Koulutusala (02 luokitus)"
,d21.opintoala1995 as "Koulutusala (95 luokitus)"
,d21.opintoala2002 as Opintoala
,d21.koulutus as Koulutusnimike
,d21b.koulutuslaji_okm as Koulutuslaji
,d21b.koulutuslaji_okm2 as Koulutuslaji2
,d22b.avi as "Koul. järjestäjän AVI"
,d22b.ely as "Koul. järjestäjän ELY"
,d22b.maakunta as "Koul. järjestäjän maakunta"
,d22b.kielisuhde as "Koul. järjestäjän kunnan kielisuhde"
,d22b.kunta as "Koul. järjestäjän kunta"
,d22c.avi as "Oppilaitoksen AVI"
,d22c.ely as "Oppilaitoksen ELY"
,d22c.maakunta as "Oppilaitoksen maakunta"
,d22c.kielisuhde as "Oppil. kunnan kielisuhde"
,d22c.kunta as "Oppilaitoksen kunta"
,d23.vuosiselite as "Kirjoihintulovuosi"
,d23b.lukukausiselite as "Kirjoihintulokausi"
,d24f.vuosiselite as "Kirjoihintulovuosi (korkeakoulu)"
,d24f2.lukukausiselite as "Kirjoihintulokausi (korkeakoulu)"
,d37.vuosiselite as "Tutkinnon suoritusvuosi"
,d38.lukukausiselite as "Tutk. suorituslukukausi"
,d39.kuukausiselite as "Tutk. suorituskuukausi"
,d40.tutkinnon_toteuma as "Tutkinnon toteuma"
,d41.ammatillisen_koulutuksen_koulutuslaji as "Tutkintotyyppi"
,d42.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus as "Järjestämistapa"
,d43.nuorten_aikuisten_koulutus as "Nuorten/aikuisten koulutus"
,d44.koulutuksen_jarjestamismuoto as "Järjestämismuoto"
,d45.rahoituslahde as "Rahoituslähde"
,d46.kvopiskelija as "Kansainvälinen opiskelija"
--Ruotsinkielinen käännös
,d2.aidinkieli_versio1_SV as Modersmål
,d4.sukupuoli_SV as Kön
,d7.koulutustyyppi_SV as "Typ av utbildning"
,d9.oppilaitos_SV as Läroanstalt
,d9.opetuskieli_SV as Undervisningsspråk
,d9.oppilaitoksen_omistajatyyppi_SV as "Läroanstaltens ägartyp"
,d9.oppilaitostyyppi_SV as Läroanstaltstyp
,d9b.koulutuksen_jarjestaja_SV as "Utbildningsanordnare"
,d9b.koulutuksen_jarjestajan_omistajatyyppi_SV as "Utbildningsanordnarens ägartyp"
,d19.koulutussektori_SV as Utbildningssektor
,d20.opetushallinnon_koulutus_SV as Förvaltningsområde
,d21.koulutusaste2002_SV as "Utbildningsnivå (2002)"
,d21.koulutusala2002_SV as "Utbildningsområde (2002)"
,d21.opintoala1995_SV as "Utbildningsområde (1995)"
,d21.opintoala2002_SV as Studieområde
,d21.koulutus_SV as Utbildningsbenämning
,d21b.koulutuslaji_okm_SV as Examensslag
,d21b.koulutuslaji_okm2_SV as Examensslag2
--,d22b.avi_SV as "Koul. järjestäjän AVISV"
--,d22b.ely_SV as "Koul. järjestäjän ELYSV"
--,d22b.maakunta_SV as "Koul. järjestäjän maakuntaSV"
--,d22b.kielisuhde_SV as "Koul. järjestäjän kunnan kielisuhdeSV"
--,d22b.kunta_SV as "Koul. järjestäjän kuntaSV"
--,d22c.avi_SV as "Oppilaitoksen AVISV"
--,d22c.ely_SV as "Oppilaitoksen ELYSV"
--,d22c.maakunta_SV as "Oppilaitoksen maakuntaSV"
--,d22c.kielisuhde_SV as "Oppil. kunnan kielisuhdeSV"
--,d22c.kunta_SV as "Oppilaitoksen kuntaSV"
--,d23.vuosiselite_SV as "KirjoihintulovuosiSV"
--,d23b.lukukausiselite_SV as "KirjoihintulokausiSV"
--,d24f.vuosiselite_SV as "Kirjoihintulovuosi (korkeakoulu)SV"
--,d24f2.lukukausiselite_SV as "Kirjoihintulokausi (korkeakoulu)SV"
--,d37.vuosiselite_SV as "Tutkinnon suoritusvuosiSV"
--,d38.lukukausiselite_SV as "Tutk. suorituslukukausiSV"
--,d39.kuukausiselite_SV as "Tutk. suorituskuukausiSV"
--,d40.tutkinnon_toteuma_SV as "Tutkinnon toteumaSV"
,d41.ammatillisen_koulutuksen_koulutuslaji_SV as "Typ av examen"
,d42.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV as "Sättet på vilket utbildn. ordnas"
,d43.nuorten_aikuisten_koulutus_SV as "Ungdoms-/vuxenutbildning"
,d44.koulutuksen_jarjestamismuoto_SV as "Formen i vilken utbildn. ordnas"
--Englanninkielinen käännös
,d2.aidinkieli_versio1_EN as "Mother tongue"
,d4.sukupuoli_EN as Gender
--,d5b.vuosiselite_EN as SyntymävuosiEN
--,d5c.kuukausiselite_EN as SyntymäkuukausiEN
,d7.koulutustyyppi_EN as "Education type"
,d9.oppilaitos_EN as "Educational institution"
,d9.opetuskieli_EN as "Language of education"
,d9.oppilaitoksen_omistajatyyppi_EN as "Type of ed. institution owner"
,d9.oppilaitostyyppi_EN as "Type of ed. institution"
,d9b.koulutuksen_jarjestaja_EN as "Education provider"
,d9b.koulutuksen_jarjestajan_omistajatyyppi_EN as "Type of ed. provider owner"
,d19.koulutussektori_EN as "Sector of education"
,d20.opetushallinnon_koulutus_EN as "Administrative sector"
,d21.koulutusaste2002_EN as "Level of education (2002)"
,d21.koulutusala2002_EN as "Field of education (2002)"
,d21.opintoala1995_EN as "Field of education (1995)"
,d21.opintoala2002_EN as "Subfield of education (2002)"
,d21.koulutus_EN as "Name of education"
,d21b.koulutuslaji_okm_EN as "Form of education"
,d21b.koulutuslaji_okm2_EN as "Form of education2"
--,d22b.avi_EN as "Koul. järjestäjän AVI"
--,d22b.ely_EN as "Koul. järjestäjän ELY"
--,d22b.maakunta_EN as "Koul. järjestäjän maakunta"
--,d22b.kielisuhde_EN as "Koul. järjestäjän kunnan kielisuhde"
--,d22b.kunta_EN as "Koul. järjestäjän kunta"
--,d22c.avi_EN as "Oppilaitoksen AVI"
--,d22c.ely_EN as "Oppilaitoksen ELY"
--,d22c.maakunta_EN as "Oppilaitoksen maakunta"
--,d22c.kielisuhde_EN as "Oppil. kunnan kielisuhde"
--,d22c.kunta_EN as "Oppilaitoksen kunta"
--,d23.vuosiselite_EN as "Kirjoihintulovuosi"
--,d23b.lukukausiselite_EN as "Kirjoihintulokausi"
--,d24f.vuosiselite_EN as "Kirjoihintulovuosi (korkeakoulu)"
--,d24f2.lukukausiselite_EN as "Kirjoihintulokausi (korkeakoulu)"
--,d37.vuosiselite_EN as "Tutkinnon suoritusvuosi"
--,d38.lukukausiselite_EN as "Tutk. suorituslukukausi"
--,d39.kuukausiselite_EN as "Tutk. suorituskuukausi"
--,d40.tutkinnon_toteuma_EN as "Tutkinnon toteuma"
,d41.ammatillisen_koulutuksen_koulutuslaji_EN as "Qualification type"
,d42.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN as "Method of voc. education"
,d43.nuorten_aikuisten_koulutus_EN as "Youth/adult education"
,d44.koulutuksen_jarjestamismuoto_EN as "Form of voc. education"
--Järjestysmuuttujat
,d1b.jarjestys as aineisto_otv_jarj
,d2.jarjestys as jarj_aidinkieli
,d5b.jarjestys as jarj_syntv
,d7.jarjestys as jarj_koultyyppi
,d9.jarjestys_oppilaitos
,d9.jarjestys_opetuskieli
,d9.jarjestys_omistajatyyppi
,d9.jarjestys_oppilaitostyyppi
,d19.jarjestys as jarj_koulsek
,d20.jarjestys as jarj_hallinnonala
,d21.jarjestys_koulutusaste2002
,d21.jarjestys_koulutusala2002
,d21.jarjestys_opintoala1995
,d21.jarjestys_opintoala2002
,d21.jarjestys as jarj_koulnimike
,d21b.jarjestys as jarj_koullaji
,d21b.jarjestys2 as jarj_koullaji2
,d22b.jarjestys_avi as jarjestys_avi2
,d22b.jarjestys_ely as jarjestys_ely2
,d22b.jarjestys_maakunta as jarjestys_maakunta2
,d22b.jarjestys_kielisuhde as jarjestys_kielisuhde2
,d22b.jarjestys as jarj_kunta2
,d22c.jarjestys_avi as jarjestys_avi3
,d22c.jarjestys_ely as jarjestys_ely3
,d22c.jarjestys_maakunta as jarjestys_maakunta3
,d22c.jarjestys_kielisuhde as jarjestys_kielisuhde3
,d22c.jarjestys as jarj_kunta3
,d23b.jarjestys as jarj_lukukausi
,d24f2.jarjestys as jarj_lukukausi_kk
,d39.jarjestys as jarj_suor_kk
,d40.jarjestys as jarj_tutktot
,d41.jarjestys as jarj_tutktyyppi
,d42.jarjestys as jarj_jarjtapa
,d43.jarjestys as jarj_nuoretaikuiset
,d44.jarjestys as jarj_jarjmuoto
,d45.jarjestys as jarj_rahoituslahde
,d46.jarjestys as jar_kv_opiskelija
--Koodimuuttujat
,d1.aineisto_koodi
,d1b.aineisto_koodi as ainesto_koodi_otv
,d2.aidinkieli_versio1_koodi as aidinkieli_koodi
,d5c.kuukausi as syntk
,d7.koulutustyyppi_koodi as 'Koodit Koulutustyyppi'
,d9.oppilaitoskoodi as 'Koodit Oppilaitos'
,d9b.koulutuksen_jarjestajan_omistajatyyppikoodi as 'Koodit Koul. järjestäjän omistajatyyppi'
,d9b.koulutuksen_jarjestajakoodi as 'Koodit Koulutuksen järjestäjä'
,d10.lahde_koodi
,d21.koulutusaste2002_koodi as 'Koodit Koulutusaste'
,d21.koulutusala2002_koodi as 'Koodit Koulutusala (02)'
,d21.opintoala1995_koodi as 'Koodit Koulutusala (95)'
,d21.opintoala2002_koodi as 'Koodit Opintoala (02)'
,d21.koulutus_koodi as 'Koodit Koulutusnimike'
,d22b.maakunta_koodi as 'Koodit Koul. järj. maakunta'
,d22b.kunta_koodi as 'Koodit Koul. järj. kunta'
,d22c.maakunta_koodi as 'Koodit Oppil. maakunta'
,d22c.kunta_koodi as 'Koodit Oppil. kunta'
,d23.vuosi as alvv
,d23b.lukukausi as alkk
,d24f.vuosi as alvv_kk
,d24f2.lukukausi as alkk_kk
,d37.vuosi as suorv
,d38.lukukausi as suor_lk
,d39.kuukausi as suor_kk
,d21.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
,d21.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
,d21.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
,d21.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
,d21.iscfi2013_koodi as "Koodit Koulutusala, taso 3"
,d21.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala, korkeak."
--isced
,d21.iscle2011 as "Koulutusaste, taso 1"
,d21.Koulutusaste_taso2 as "Koulutusaste, taso 2"
,d21.iscfibroad2013 as "Koulutusala, taso 1"
,d21.iscfinarrow2013 as "Koulutusala, taso 2"
,d21.iscfi2013 as "Koulutusala, taso 3"
,d21.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak."
,d21.iscle2011_SV as "Utbildn.nivå, nivå 1"
,d21.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
,d21.iscfibroad2013_SV as "Utbildn.område, nivå 1"
,d21.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
,d21.iscfi2013_SV as "Utbildn.område, nivå 3"
,d21.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor"
,d21.iscle2011_EN as "Level of education, tier 1"
,d21.Koulutusaste_taso2_EN as "Level of education, tier 2"
,d21.iscfibroad2013_EN as "Field of education, tier 1"
,d21.iscfinarrow2013_EN as "Field of education, tier 2"
,d21.iscfi2013_EN as "Field of education, tier 3"
,d21.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"
,d21.jarjestys_iscle2011 as jarj_isced_koulast1
,d21.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
,d21.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d21.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d21.jarjestys_iscfi2013 as jarj_isced_koulala3
,d21.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
--Lukumäärämuuttujat
,[Tutk3]
,[suoritusika2]
,[jarjestys_suoritusika]
,[suoritusaika2]
,[jarjestys_suoritusaika]
,[suoritusaika_kk]
,[jarjestys_suoritusaika_kk]

FROM (
SELECT [tilastointivuosi] as Tilastovuosi
	  ,[tilastointivuosi] as "Statistical year"
	  ,[tilastointivuosi] as "Statistikår"
	  ,aineisto_id
	  ,aineisto_OTV_id
	  ,aidinkieli_versio1_id
	  ,sukupuoli_id
	  ,syntymavuosi_id
	  ,syntymakuukausi_id
	  ,koulutustyyppi_id
	  ,oppilaitos_id
	  ,koulutuksen_jarjestaja_id
	  ,lahde_id
	  ,koulutussektori_id
	  ,opetushallinnon_koulutus_id
	  ,koulutusluokitus_id
	  ,koulutuslaji_OKM_id
	  ,koulutuksen_jarjestaja_kunta_id
	  ,oppilaitos_kunta_id
	  ,kirjoihintulovuosi_id
	  ,kirjoihintulokausi_id
	  ,kirjoihintulovuosi_korkeakoulu_id
	  ,kirjoihintulokausi_korkeakoulu_id
	  ,tutkinnon_suoritusvuosi_id
	  ,tutkinnon_suorituslukukausi_id = '-1'
	  ,tutkinnon_suorituskuukausi_id
	  ,tutkinnon_toteuma_id = '-1'
	  ,ammatillisen_koulutuksen_koulutuslaji_id = '-1'
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = '-1'
	  ,nuorten_aikuisten_koulutus_id = '-1'
	  ,koulutuksen_jarjestamismuoto_id = '-1'
	  ,rahoituslahde_id
	  ,kv_opiskelija_id
	  ,[lukumaara] as Tutk3
	  ,[suoritusika] as suoritusika2
	  ,[jarjestys_suoritusika]
	  ,[suoritusaika] as suoritusaika2
	  ,[jarjestys_suoritusaika]
	  ,[suoritusaika_kk]
	  ,[jarjestys_suoritusaika_kk]
  FROM [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]

UNION ALL
SELECT [tilastointivuosi] as Tilastovuosi
	  ,[tilastointivuosi] as "Statistical year"
	  ,[tilastointivuosi] as "Statistikår"
	  ,aineisto_id
	  ,aineisto_OTV_id
	  ,aidinkieli_versio1_id
	  ,sukupuoli_id
	  ,syntymavuosi_id
	  ,syntymakuukausi_id
	  ,koulutustyyppi_id = '-1'
	  ,oppilaitos_id
	  ,koulutuksen_jarjestaja_id
	  ,lahde_id
	  ,koulutussektori_id
	  ,opetushallinnon_koulutus_id
	  ,koulutusluokitus_id
	  ,koulutuslaji_OKM_id
	  ,koulutuksen_jarjestaja_kunta_id
	  ,oppilaitos_kunta_id
	  ,kirjoihintulovuosi_id
	  ,kirjoihintulokausi_id
	  ,kirjoihintulovuosi_korkeakoulu_id = '-1'
	  ,kirjoihintulokausi_korkeakoulu_id = '-1'
	  ,tutkinnon_suoritusvuosi_id
	  ,tutkinnon_suorituslukukausi_id = '-1'
	  ,tutkinnon_suorituskuukausi_id
	  ,tutkinnon_toteuma_id
	  ,ammatillisen_koulutuksen_koulutuslaji_id
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
	  ,nuorten_aikuisten_koulutus_id
	  ,koulutuksen_jarjestamismuoto_id
	  ,rahoituslahde_id = '-1'
	  ,kv_opiskelija_id = '-1'
	  ,[lukumaara] as Tutk3
	  ,[suoritusika] as suoritusika2
	  ,[jarjestys_suoritusika]
	  ,[suoritusaika] as suoritusaika2
	  ,[jarjestys_suoritusaika]
	  ,[suoritusaika_kk] = NULL
	  ,[jarjestys_suoritusaika_kk] = NULL
  FROM [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]

  ) f
	INNER JOIN [dbo].d_aineisto d1 ON d1.id = f.aineisto_id
	INNER JOIN [dbo].d_aineisto_OTV d1b ON d1b.id = f.aineisto_OTV_id
	INNER JOIN [dbo].d_aidinkieli_versio1 d2 ON d2.id = f.aidinkieli_versio1_id
	INNER JOIN [dbo].d_sukupuoli d4 ON d4.id = f.sukupuoli_id
	INNER JOIN [dbo].d_kausi d5b ON d5b.kausi_id = f.syntymavuosi_id
	INNER JOIN [dbo].d_kausi d5c ON d5c.kausi_id = f.syntymakuukausi_id
	INNER JOIN [dbo].d_koulutustyyppi d7 ON d7.id = f.koulutustyyppi_id
	INNER JOIN [dbo].d_oppilaitoksen_taustatiedot d9 ON d9.id = f.oppilaitos_id
	INNER JOIN [dbo].d_oppilaitoksen_taustatiedot d9b ON d9b.id = f.koulutuksen_jarjestaja_id
	INNER JOIN [dbo].d_lahde d10 ON d10.id = f.lahde_id
	INNER JOIN [dbo].d_koulutussektori d19 ON d19.id = f.koulutussektori_id
	INNER JOIN [dbo].d_opetushallinnon_koulutus d20 ON d20.id = f.opetushallinnon_koulutus_id
	INNER JOIN [dbo].d_koulutusluokitus d21 ON d21.id = f.koulutusluokitus_id
	INNER JOIN [dbo].d_koulutuslaji_okm d21b ON d21b.id = f.koulutuslaji_OKM_id
	INNER JOIN [dbo].d_alueluokitus d22b ON d22b.id = f.koulutuksen_jarjestaja_kunta_id
	INNER JOIN [dbo].d_alueluokitus d22c ON d22c.id = f.oppilaitos_kunta_id
	INNER JOIN [dbo].d_kausi d23 ON d23.kausi_id = f.kirjoihintulovuosi_id
	INNER JOIN [dbo].d_kausi d23b ON d23b.kausi_id = f.kirjoihintulokausi_id
	INNER JOIN [dbo].d_kausi d24f ON d24f.kausi_id = f.kirjoihintulovuosi_korkeakoulu_id
	INNER JOIN [dbo].d_kausi d24f2 ON d24f2.kausi_id = f.kirjoihintulokausi_korkeakoulu_id
	INNER JOIN [dbo].d_kausi d37 ON d37.kausi_id = f.tutkinnon_suoritusvuosi_id
	INNER JOIN [dbo].d_kausi d38 ON d38.kausi_id = f.tutkinnon_suorituslukukausi_id
	INNER JOIN [dbo].d_kausi d39 ON d39.kausi_id = f.tutkinnon_suorituskuukausi_id
	INNER JOIN [dbo].d_tutkinnon_toteuma d40 ON d40.id = f.tutkinnon_toteuma_id
	INNER JOIN [dbo].d_ammatillisen_koulutuksen_koulutuslaji d41 ON d41.id = f.ammatillisen_koulutuksen_koulutuslaji_id
	INNER JOIN [dbo].d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d42 ON d42.id = f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
	INNER JOIN [dbo].d_nuorten_aikuisten_koulutus d43 ON d43.id = f.nuorten_aikuisten_koulutus_id
	INNER JOIN [dbo].d_koulutuksen_jarjestamismuoto d44 ON d44.id = f.koulutuksen_jarjestamismuoto_id

	INNER JOIN [dbo].d_rahoituslahde d45 ON d45.id = f.rahoituslahde_id
	INNER JOIN [dbo].d_kvopiskelija d46 ON d46.id = f.kv_opiskelija_id
WHERE d9.oppilaitoskoodi <> '02557' AND d9.oppilaitoskoodi <> '10031' AND d9.oppilaitoskoodi <> '02358' AND suoritusika2 <> '-1' AND suoritusaika2 <> '-1' AND (NOT(d10.lahde_koodi in ('21','22','23') AND Tilastovuosi = 2010))













GO


