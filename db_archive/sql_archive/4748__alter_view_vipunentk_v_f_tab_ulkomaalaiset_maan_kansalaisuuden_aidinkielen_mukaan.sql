USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan]    Script Date: 10.8.2021 18:47:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_tab_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan] AS
SELECT 
	   [opiskelijoiden_lkm] AS lkm_op2
	  ,CASE WHEN [tilastovuosi] = [koulutuksen_aloittamislukuvuosi] THEN [opiskelijoiden_lkm] ELSE 0 END AS lkm_aloit2
	  ,CASE WHEN d13.opiskelijan_olo_koodi = 1 THEN [opiskelijoiden_lkm] ELSE 0 END AS lkm_opiskolo2
	  ,[tilastovuosi] AS Tilastovuosi
	  ,[Nakokulma] AS Näkökulma
	  ,d1.lahde AS Lähde
      ,d2.koulutus AS [Koulutusnimike]
	  ,d2.opintoala2002 AS [Opintoala]
	  ,d2.koulutusala2002 AS [Koulutusala]
	  ,d2.opintoala1995 AS [Koulutusala (95 luokitus)]
	  ,d2.koulutusala2002 AS [Koulutusala (02 luokitus)]
	  ,d2.koulutusaste2002 AS [Koulutusaste]
	  ,d3.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS Järjestämistapa
	  ,d4.ammatillisen_koulutuksen_koulutuslaji AS Tutkintotyyppi
	  --,d5.opetushallinnon_koulutus AS Hallinnonala
	  ,d5b.hallinnonala AS Hallinnonala
	  ,d6.kieli AS Opetuskieli
	  ,d7.nuorten_aikuisten_koulutus_amm AS 'Nuorten koulutus/aikuiskoulutus'
	  ,d8.maakunta AS 'Koulutuksen maakunta'
	  ,d8.ely AS 'Koulutuksen ELY-alue'
	  ,d8.avi AS 'Koulutuksen AVI-alue'
	  ,d9.sukupuoli AS Sukupuoli
	  ,d10.aikuisopiskelija AS 'Nuori opiskelija/aikuisopiskelija'
	  ,d11.lukukausiselite AS 'Aloituslukukausi'
	  ,d11.lukuvuosi AS 'Aloituslukuvuosi'
	  ,d11.vuosiselite AS Aloitusvuosi
	  ,d12.opiskelijan_olo AS 'Kirjoillaolo (tammi)'
	  ,d13.opiskelijan_olo AS 'Kirjoillaolo (syys)'
	  ,d14.kuntaryhma AS Kuntaryhmä
	  ,d15.jarjestamismuoto AS Järjestämismuoto
	  ,d15.koulutuslaji3 AS Koulutuslaji
	  ,d16.maa AS 'Kansalaisuus (maa)'
	  ,d16.maanosa AS 'Kansalaisuus (maanosa)'
	  ,d16.etamaa AS 'ETA-maan kansalainen'
	  ,d16.eumaa AS 'EU-maan kansalainen'
	  ,d17.kansalaisuus_versio1 AS 'Kansalaisuus (suomi/muu)'
	  ,d18.maa AS Syntymävaltio
	  ,d18.maanosa AS 'Syntymävaltio (maanosa)'
	  ,d19.kansalaisuus_versio1 AS 'Syntymävaltio (suomi/muu)'
	  ,d20.kieli AS Äidinkieli
	  ,d21.aidinkieli_versio3 AS 'Äidinkieli (suomi/muu)'
	  ,d22.koulutussektori AS Koulutussektori
	  ,d1.lahde_koodi

	  --Ruotsi
	  ,[tilastovuosi] AS Statistikår
      ,d2.koulutus_SV AS [Utbildningsbenämning]
	  ,d2.opintoala2002_SV AS [Studieområde]
	  ,d2.koulutusala2002_SV AS [Utbildningsområde]
	  ,d2.opintoala1995_SV AS [Utbildningsområde (1995)]
	  ,d2.koulutusala2002_SV AS [Utbildningsområde (2002)]
	  ,d2.koulutusaste2002_SV AS [Utbildningsnivå]
	  ,d3.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV AS [Sättet på vilket utbildningen ordnas]
	  ,d4.ammatillisen_koulutuksen_koulutuslaji_SV AS [Typ av examen]
	  --,d5.opetushallinnon_koulutus_SV AS Förvaltningsområde
	  ,d5b.hallinnonala_SV AS Förvaltningsområde
	  ,d6.kieli_SV AS [Utbildningens språk]
	  ,d7.nuorten_aikuisten_koulutus_amm_SV AS [Ungdoms-/vuxenutbildning]
	  ,d8.maakunta_SV AS [Utbildningens landskap]
	  ,d8.ely_SV AS [Utbildningens NTM-område]
	  ,d8.avi_SV AS [Utbildningens RFV-område]
	  ,d9.sukupuoli_SV AS Kön
	  ,d10.aikuisopiskelija_SV AS [Ungdoms-/vuxenstuderande]
	  ,d11.lukukausiselite_SV AS [Begynnelsetermin]
	  ,d11.lukuvuosi AS [Begynnelseläsår]
	  ,d11.vuosiselite_SV AS Begynnelseår
	  ,d12.opiskelijan_olo_SV AS [Inskrivning (januari)]
	  ,d13.opiskelijan_olo_SV AS [Inskrivning (september)]
	  ,d14.kuntaryhma_SV AS Kommungruppen
	  ,d15.jarjestamismuoto_SV AS [Formen i vilken utbildningen ordnas]
	  ,d15.koulutuslaji3_SV AS Utbildningsslag
	  ,d16.maa_SV AS [Medborgarskap (land)]
	  ,d16.maanosa_SV AS [Medborgarskap (världsdel)]
	  ,d16.etamaa_SV AS [Medborgare i ett EES-land]
	  ,d16.eumaa_SV AS [Medborgare i ett EU-land]
	  ,d17.kansalaisuus_versio1_SV AS [Medborgarskap (finska/andra)]
	  ,d18.maa_SV AS Födelseland
	  ,d18.maanosa_SV AS [Födelseland (världsdel)]
	  ,d19.kansalaisuus_versio1_SV AS [Födelseland (Finland/andra)]
	  ,d20.kieli_SV AS Modersmål
	  ,d21.aidinkieli_versio3_SV AS [Modersmål (finska/andra)]
	  ,d22.koulutussektori_SV AS Utbildningssektor

	  --Englanti
	  ,[tilastovuosi] AS [Statistical year]
      ,d2.koulutus_EN AS [Name of education]
	  ,d2.opintoala2002_EN AS [Subfield of education]
	  ,d2.koulutusala2002_EN AS [Field of education]
	  ,d2.opintoala1995_EN AS [Field of education (1995)]
	  ,d2.koulutusala2002_EN AS [Field of education (2002)]
	  ,d2.koulutusaste2002_EN AS [Level of education]
	  ,d3.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN AS [Method of vocational education and training]
	  ,d4.ammatillisen_koulutuksen_koulutuslaji_EN AS [Qualification type]
	  --,d5.opetushallinnon_koulutus_EN AS [Administrative sector]
	  ,d5b.hallinnonala_EN AS 'Administrative sector'
	  ,d6.kieli_EN AS [Language of education]
	  ,d7.nuorten_aikuisten_koulutus_amm_EN [Youth/adult education]
	  ,d8.maakunta_EN AS [Region of education]
	  ,d8.ely_EN AS [ELY area of education]
	  ,d8.avi_EN AS [AVI area of education]
	  ,d9.sukupuoli_EN AS Gender
	  ,d10.aikuisopiskelija_EN AS [Young person/adult student]
	  ,d11.lukukausiselite_EN AS [First term]
	  ,d11.lukuvuosi AS [First academic year]
	  ,d11.vuosiselite_EN AS [First year]
	  ,d12.opiskelijan_olo_EN AS [Enrollment status (January)]
	  ,d13.opiskelijan_olo_EN AS [Enrollment status (September)]
	  ,d14.kuntaryhma_EN AS [Municipality type]
	  ,d15.jarjestamismuoto_EN AS [Form of vocational education and training]
	  ,d15.koulutuslaji3_EN AS [Form of education and training]
	  ,d16.maa_EN AS [Nationality (country)]
	  ,d16.maanosa_EN AS [Nationality (continent)]
	  ,d16.etamaa_EN AS [Citizen of EEA nation]
	  ,d16.eumaa_EN AS [Citizen of EU nation]
	  ,d17.kansalaisuus_versio1_EN AS [Nationality (Finn/Other)]
	  ,d18.maa_EN AS [Country of birth]
	  ,d18.maanosa_EN AS [Country of birth (continent)]
	  ,d19.kansalaisuus_versio1_EN AS [Country of birth (Finland/Other)]
	  ,d20.kieli_EN AS [Mother tongue]
	  ,d21.aidinkieli_versio3_EN AS [Mother tongue (Finnish/Other)]
	  ,d22.koulutussektori_EN AS [Sector of education]

	  --isced
	  ,d2.iscle2011 as "Koulutusaste, taso 1"
	  ,d2.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	  ,d2.iscfibroad2013 as "Koulutusala, taso 1"
	  ,d2.iscfinarrow2013 as "Koulutusala, taso 2"
	  ,d2.iscfi2013 as "Koulutusala, taso 3"
	  ,d2.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak."
	  ,d2.iscle2011_SV as "Utbildn.nivå, nivå 1"
	  ,d2.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	  ,d2.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	  ,d2.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	  ,d2.iscfi2013_SV as "Utbildn.område, nivå 3"
	  ,d2.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor"
	  ,d2.iscle2011_EN as "Level of education, tier 1"
	  ,d2.Koulutusaste_taso2_EN as "Level of education, tier 2"
	  ,d2.iscfibroad2013_EN as "Field of education, tier 1"
	  ,d2.iscfinarrow2013_EN as "Field of education, tier 2"
	  ,d2.iscfi2013_EN as "Field of education, tier 3"
	  ,d2.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"

	  --koodit
      ,d2.koulutus_koodi AS [Koodit Koulutusnimike]
	  ,d2.opintoala2002_koodi AS [Koodit Opintoala]
	  ,d2.koulutusala2002_koodi AS [Koodit Koulutusala]
	  ,d2.opintoala1995_koodi AS [Koodit Koulutusala (95 luokitus)]
	  ,d2.koulutusala2002_koodi AS [Koodit Koulutusala (02 luokitus)]
	  ,d8.maakunta AS [Koodit Koulutuksen maakunta]

	  --järjestys
	  ,d2.jarjestys AS jarj_koulnimike
	  ,d2.jarjestys_opintoala2002 AS jarj_opintoala
	  ,d2.jarjestys_koulutusala2002
	  ,d2.jarjestys_opintoala1995
	  ,d2.jarjestys_koulutusaste2002
	  ,d3.jarjestys AS jarj_jarjtapa
	  ,d4.jarjestys AS jarj_tutktyyppi
	  ,d5b.jarjestys AS jarj_hallinnonala
	  ,d6.jarjestys AS jarj_opetuskieli
	  ,d7.jarjestys AS jarj_nuoretaikuiset
	  ,d8.jarjestys_maakunta
	  ,d8.jarjestys_ely
	  ,d8.jarjestys_avi
	  ,d9.jarjestys AS jarj_sukupuoli
	  ,d10.jarjestys AS jarj_nuoriaikuinen
	  ,d11.lukukausi AS jarj_lukukausi
	  ,d12.jarjestys AS jarj_kirjtammi
	  ,d13.jarjestys AS jarj_kirjsyys
	  ,d14.jarjestys AS jarj_kuntaryhma
	  ,d15.jarjestys_jarjestamismuoto AS jarj_jarjmuoto
	  ,d15.jarjestys_koulutuslaji3
	  ,d16.jarjestys AS jarj_maa
	  ,d16.jarjestys_maanosa
	  ,d16.jarjestys_etamaa
	  ,d16.jarjestys_eumaa
	  ,d17.jarjestys AS jarj_kans
	  ,d18.jarjestys AS jarj_syntvaltio
	  ,d18.jarjestys_maanosa AS jarj_syntmaanosa
	  ,d19.jarjestys AS jarj_syntsuomimuu
	  ,d20.jarjestys AS jarj_aidinkieli
	  ,d21.jarjestys AS jarj_aidinkielisuomi
	  ,d22.jarjestys AS jarj_koulsektori
	  ,d2.koulutusaste2002_koodi
	  ,[koulutuksen_aloittamislukuvuosi]
	  ,[Nakokulma] AS Aineistonäkökulma
	  ,d21.aidinkieli_versio3_koodi AS koodi_ai
	  ,d17.kansalaisuus_versio1_koodi AS koodi_kan
	  ,d19.kansalaisuus_versio1_koodi AS koodi_syn
	  ,d2.jarjestys_iscle2011 as jarj_isced_koulast1
	  ,d2.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	  ,d2.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	  ,d2.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	  ,d2.jarjestys_iscfi2013 as jarj_isced_koulala3
	  ,d2.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
	  
FROM dbo.f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15
	JOIN d_lahde d1 ON d1.id = [lahde_id]
	JOIN d_koulutusluokitus d2 on d2.id = [koulutusluokitus_id]
	JOIN d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d3 on d3.id = [opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id]
	JOIN d_ammatillisen_koulutuksen_koulutuslaji d4 on d4.id = [ammatillisen_koulutuksen_koulutuslaji_id]
	JOIN d_opetushallinnon_koulutus d5 on d5.id = [opetushallinnon_koulutus_id]
	JOIN d_hallinnonala2 d5b on d5b.id=hallinnonala2_id
	JOIN d_kieli d6 on d6.id = [koulutuksen_opetuskieli_id]
	JOIN d_nuorten_aikuisten_koulutus_amm d7 on d7.id = [nuorten_aikuisten_koulutus_amm_id]
	JOIN d_alueluokitus d8 on d8.id = [koulutuksen_sijaintimaakunta_id]
	JOIN d_sukupuoli d9 on d9.id = [sukupuoli_id]
	JOIN d_aikuisopiskelija d10 on d10.id = [aikuisopiskelija_id]
	JOIN d_kausi d11 on d11.kausi_id = [koulutuksen_aloittamislukukausi_id]
	JOIN d_opiskelijan_olo d12 on d12.id = [kirjoillaolo_tammikuu_id]
	JOIN d_opiskelijan_olo d13 on d13.id = [kirjoillaolo_syyskuu_id]
	JOIN d_kuntaryhma d14 on d14.id = [kotikunnan_kuntaryhma_id]
	JOIN d_koulutuslaji3 d15 on d15.id = [koulutusryhma_koulutuslaji3_id]
	JOIN d_valtio d16 on d16.id = [kansalaisuus_maa_id]
	JOIN d_kansalaisuus_versio1 d17 on d17.id = [kansalaisuus_versio1_id]
	JOIN d_valtio d18 on d18.id = [syntymavaltio_maa_id]
	JOIN d_kansalaisuus_versio1 d19 on d19.id = [syntymavaltio_kansalaisuus_versio1_id]
	JOIN d_kieli d20 on d20.id = [aidinkieli_kieli_id]
	JOIN d_aidinkieli_versio3 d21 on d21.id = [aidinkieli_versio3_id]
	JOIN d_koulutussektori d22 on d22.id = [koulutussektori_id]
WHERE d13.opiskelijan_olo_koodi <> '-1' OR d1.lahde_koodi in ('31','32','33','34','35','36')

GO
