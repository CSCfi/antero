USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_sosioekonominen_tausta]    Script Date: 29.4.2020 10:42:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER VIEW [dbo].[v_f_tab_sosioekonominen_tausta] as

SELECT
 [Uudet opiskelijat2] = coalesce (uudet_opiskelijat,0)
,[Opiskelijat2] = coalesce (opiskelijat,0)
,[Tutkinnot2] = coalesce (tutkinnot,0)
,[Tilastointivuosi] as Tilastovuosi
,[Sos.ek. tausta (SES)] = sosioekonominen_tausta
,d1.koulutusala2002 as "Koulutusala (opiskelija)"
,d1.jarjestys_koulutusala2002 as "koul02_op"
,d1.opintoala2002 as "Opintoala (opiskelija)"
,d1.jarjestys_opintoala2002 as "op02_op"
,d1.koulutus as "Koulutusnimike (opiskelija)"
,d1.koulutusaste2002 as "Koulutusaste (opiskelija)"
,d1.jarjestys_koulutusaste2002 as "kast02_op"
,d1.opintoala1995 as "Koulutusala (95) (opiskelija)"
,d1.jarjestys_opintoala1995 as "op95_op"
,d2.koulutusala2002 as "Koulutusala (äiti)"
,d2.jarjestys_koulutusala2002 as "koul02_ai"
,d2.opintoala2002 as "Opintoala (äiti)"
,d2.jarjestys_opintoala2002 as "op02_ai"
,d2.koulutus as "Koulutusnimike (äiti)"
,d2.koulutusaste2002 as "Koulutusaste (äiti)"
,d2.jarjestys_koulutusaste2002 as "kast02_ai"
,d2.opintoala1995 as "Koulutusala (95) (äiti)"
,d2.jarjestys_opintoala1995 as "op95_ai"
,d3.koulutusala2002 as "Koulutusala (isä)"
,d3.jarjestys_koulutusala2002 as "koul02_is"
,d3.opintoala2002 as "Opintoala (isä)"
,d3.jarjestys_opintoala2002 as "op02_is"
,d3.koulutus as "Koulutusnimike (isä)"
,d3.koulutusaste2002 as "Koulutusaste (isä)"
,d3.jarjestys_koulutusaste2002 as "kast02_is"
,d3.opintoala1995 as "Koulutusala (95) (isä)"
,d3.jarjestys_opintoala1995 as "op95_is"
,d4.koulutuslaji as "Koulutuslaji (opiskelija)"
,d4.jarjestys as "koulaj_jarj"
,d5.sukupuoli as "Sukupuoli (opiskelija)"
,d6.opetushallinnon_koulutus as "Hallinnonala"
,d6.jarjestys as "ophaljarj"
,d7.aidinkieli_versio1 as "Äidinkieli (opiskelija)"
,d7.jarjestys as "aid_jarj"
,d8.vuosiselite as "Syntymävuosi (opiskelija)"
,d8.jarjestys as "synt_jarj"
,d9.kieli as "Koulutuksen kieli (opiskelija)"
,d9.jarjestys as "kiel_jarj"
,d10.avi as "Koulutuksen AVI (opiskelija)"
,d10.jarjestys_avi as "koulavij"
,d10.ely as "Koulutuksen ELY (opiskelija)"
,d10.jarjestys_ely as "koulelyj"
,d10.maakunta as "Koulutuksen maakunta (opiskelija)"
,d10.jarjestys_maakunta as "koulmaakj"
,d11.avi as "Asuinalueen AVI (opiskelija)"
,d11.jarjestys_avi as "asavij"
,d11.ely as "Asuinalueen ELY (opiskelija)"
,d11.jarjestys_ely as "aselyj"
,d11.maakunta as "Asuinmaakunta (opiskelija)"
,d11.jarjestys_maakunta as "asmaakj"
,d12.avi as "Til.v:tta edeltävän vuoden AVI (opiskelija)"
,d12.jarjestys_avi as "as2avij"
,d12.ely as "Til.v:tta edeltävän vuoden ELY (opiskelija)"
,d12.jarjestys_ely as "as2elyj"
,d12.maakunta as "Til.v:tta edeltävän vuoden asuinmaakunta (opiskelija)"
,d12.jarjestys_maakunta as "as2maakj"
,d12.kuntaryhma as "Til.v:tta edeltävän vuoden kuntaryhmä (opiskelija)"
,d12.jarjestys_kuntaryhma as "as2kryhmäj"
,d13.tulodesiili as "Tuloluokka (äiti)"
,d13.jarjestys as "tuljaiti"
,d14.tulodesiili as "Tuloluokka (isä)"
,d14.jarjestys as "tuljisa"
,d15.sosioekonominen_asema_ryhma as "Sos.ek. asema 1 (äiti)"
,d15.jarjestys_ryhma as "sosek1a_jarj"
,d16.sosioekonominen_asema as "Sos.ek. asema 2 (äiti)"
,d16.jarjestys_asema as "sosek2a_jarj"
,d17.sosioekonominen_asema_ryhma as "Sos.ek. asema 1 (isä)"
,d17.jarjestys_ryhma as "sosek1i_jarj"
,d18.sosioekonominen_asema as "Sos.ek. asema 2 (isä)"
,d18.jarjestys_asema as "sosek2i_jarj"
,d19.ika as "Ikä (opiskelija)"
,d19.jarjestys_ika as "ikaopjarj"
,d19.ika5v as "Ikäryhmä (opiskelija)"
,d19.jarjestys_ika5v as "ikaryhopjarj"
,d21.opiskelijan_olo as "Kirjoillaolo (opiskelija)"
,d21.jarjestys as "kirjjarj"
,d22.vuosiselite as "Kirjoihintulovuosi (opiskelija)"
,d22.jarjestys as "kirjvjarj"

--ruotsi
,[Tilastointivuosi] as Statistikår
,[Soc.ek. bakgrund (SES)] = sosioekonominen_tausta
,d1.koulutusala2002_SV as "Utbildn.omr. 2002 (stud.)"
,d1.opintoala2002_SV as "Studieomr. 2002 (stud.)"
,d1.koulutus_SV as "Utbildn.benämn. (stud.)"
,d1.koulutusaste2002_SV as "Utbildn.nivå 2002 (stud.)"
,d1.opintoala1995_SV as "Utbildn.omr. 1995 (stud.)"
,d2.koulutusala2002_SV as "Utbildn.omr. 2002 (modern)"
,d2.opintoala2002_SV as "Studieomr. 2002 (modern)"
,d2.koulutus_SV as "Utbildn.benämn. (modern)"
,d2.koulutusaste2002_SV as "Utbildn.nivå 2002 (modern)"
,d2.opintoala1995_SV as "Utbildn.omr. 1995 (modern)"
,d3.koulutusala2002_SV as "Utbildn.omr. 2002 (fadern)"
,d3.opintoala2002_SV as "Studieomr. 2002 (fadern)"
,d3.koulutus_SV as "Utbildn.benämn. (fadern)"
,d3.koulutusaste2002_SV as "Utbildn.nivå 2002 (fadern)"
,d3.opintoala1995_SV as "Utbildn.omr. 1995 (fadern)"
,d4.koulutuslaji_SV as "Examensslag (studerande)"
,d5.sukupuoli_SV as "Kön (studerande)"
,d6.opetushallinnon_koulutus_SV as "Förvaltningsområde"
,d7.aidinkieli_versio1_SV as "Modersmål (studerande)"
,d8.vuosiselite_SV as "Födelseår (studerande)"
,d9.kieli_SV as "Utbildn. språk (stud.)"
,d10.avi_SV as "Utbildn. RFV (studerande)"
,d10.ely_SV as "Utbildn. NTM (studerande)"
,d10.maakunta_SV as "Utbildn. landskap (stud.)"
,d11.avi_SV as "Bostadsortens RFV (stud.)"
,d11.ely_SV as "Bostadsortens NTM (stud.)"
,d11.maakunta_SV as "Bostadslandskap (stud.)"
,d12.avi_SV as "RFV före statistikåret (stud.)"
,d12.ely_SV as "NTM före statistikåret (stud.)"
,d12.maakunta_SV as "Landskap före stat.år. (stud.)"
,d12.kuntaryhma_SV as "Ortsgrupp före stat.år. (stud.)"
,d13.tulodesiili_SV as "Inkomstklass (modern)"
,d14.tulodesiili_SV as "Inkomstklass (fadern)"
,d15.sosioekonominen_asema_ryhma_SV as "Soc.ek. ställn. 1 (modern)"
,d16.sosioekonominen_asema_SV as "Soc.ek. ställn. 2 (modern)"
,d17.sosioekonominen_asema_ryhma_SV as "Soc.ek. ställn. 1 (fadern)"
,d18.sosioekonominen_asema_SV as "Soc.ek. ställn. 2 (fadern)"
,d19.ika_SV as "Ålder (studerande)"
,d19.ika5v_SV as "Åldersgrupp (studerande)"
,d21.opiskelijan_olo_SV as "Inskrivning (studerande)"
,d22.vuosiselite_SV as "Inskrivningår (stud.)"

--englanti
,[Tilastointivuosi] as "Statistical year"
,[Soc.ec. background (SES)] = sosioekonominen_tausta
,d1.koulutusala2002_EN as "Field of ed. 2002 (stud.)"
,d1.opintoala2002_EN as "Subfield of ed. 2002 (stud.)"
,d1.koulutus_EN as "Name of ed. (stud.)"
,d1.koulutusaste2002_EN as "Level of ed. (stud.)"
,d1.opintoala1995_EN as "Field of ed. 1995 (stud.)"
,d2.koulutusala2002_EN as "Field of ed. 2002 (mother)"
,d2.opintoala2002_EN as "Subfield of ed. 2002 (mother)"
,d2.koulutus_EN as "Name of ed. (mother)"
,d2.koulutusaste2002_EN as "Level of ed. (mother)"
,d2.opintoala1995_EN as "Field of ed. 1995 (mother)"
,d3.koulutusala2002_EN as "Field of ed. 2002 (father)"
,d3.opintoala2002_EN as "Subfield of ed. 2002 (father)"
,d3.koulutus_EN as "Name of ed. (father)"
,d3.koulutusaste2002_EN as "Level of ed. (father)"
,d3.opintoala1995_EN as "Field of ed. 1995 (father)"
,d4.koulutuslaji_EN as "Form of ed. (student)"
,d5.sukupuoli_EN as "Gender (student)"
,d6.opetushallinnon_koulutus_EN as "Administrative sector"
,d7.aidinkieli_versio1_EN as "Mother tongue (student)"
,d8.vuosiselite_EN as "Birth year (student)"
,d9.kieli_EN as "Language of ed. (student)"
,d10.avi_EN as "AVI area of ed. (stud.)"
,d10.ely_EN as "ELY area of ed. (stud.)"
,d10.maakunta_EN as "Region of ed. (stud.)"
,d11.avi_EN as "AVI area of res. (stud.)"
,d11.ely_EN as "ELY area of res. (stud.)"
,d11.maakunta_EN as "Region of res. (stud.)"
,d12.avi_EN as "AVI preceding the stat. year (stud.)"
,d12.ely_EN as "ELY preceding the stat. year (stud.)"
,d12.maakunta_EN as "Region preceding the stat. year (stud.)"
,d12.kuntaryhma_EN as "Municipal group preceding the stat. year (stud.)"
,d13.tulodesiili_EN as "Income group (mother)"
,d14.tulodesiili_EN as "Income group (father)"
,d15.sosioekonominen_asema_ryhma_EN as "Soc.ec. group 1 (mother)"
,d16.sosioekonominen_asema_EN as "Soc.ec. group 2 (mother)"
,d17.sosioekonominen_asema_ryhma_EN as "Soc.ec. group 1 (father)"
,d18.sosioekonominen_asema_EN as "Soc.ec. group 2 (father)"
,d19.ika_EN as "Age (student)"
,d19.ika5v_EN as "Agegroup (student)"
,d21.opiskelijan_olo_EN as "Enrollment status (stud.)"
,d22.vuosiselite_EN as "Year of enrollment (stud.)"

--koodit
,d1.koulutusala2002_koodi as "Koodit Koulutusala 2002 (opisk.)"
,d1.opintoala2002_koodi as "Koodit Opintoala 2002 (opisk.)"
,d1.koulutus_koodi as "Koodit Koulutusnimike (opisk.)"
,d1.koulutusaste2002_koodi as "Koodit Koulutusaste 2002 (opisk.)"
,d1.opintoala1995_koodi as "Koodit Koulutusala 1995 (opisk.)"
,d2.koulutusala2002_koodi as "Koodit Koulutusala 2002 (äiti)"
,d2.opintoala2002_koodi as "Koodit Opintoala 2002 (äiti)"
,d2.koulutus_koodi as "Koodit Koulutusnimike (äiti)"
,d2.koulutusaste2002_koodi as "Koodit Koulutusaste 2002 (äiti)"
,d2.opintoala1995_koodi as "Koodit Koulutusala 1995 (äiti)"
,d3.koulutusala2002_koodi as "Koodit Koulutusala 2002 (isä)"
,d3.opintoala2002_koodi as "Koodit Opintoala 2002 (isä)"
,d3.koulutus_koodi as "Koodit Koulutusnimike (isä)"
,d3.koulutusaste2002_koodi as "Koodit Koulutusaste 2002 (isä)"
,d3.opintoala1995_koodi as "Koodit Koulutusala 1995 (isä)"
,d4.koulutuslaji_koodi as "Koodit Koulutuslaji (opisk.)"
,d10.maakunta_koodi as "Koodit Koulutuksen maakunta (opisk.)"
,d11.maakunta_koodi as "Koodit Asuinmaakunta (opisk.)"
,d12.maakunta_koodi as "Koodit Til.v:tta ed. asuinmaakunta (opisk.)"
,d12.kuntaryhma_koodi as "Koodit Til.v:tta ed. kuntaryhmä (opisk.)"

--isced
,d1.iscle2011 as "Koulutusaste 1 (opisk.)"
,d1.Koulutusaste_taso2 as "Koulutusaste 2 (opisk.)"
,d1.iscfibroad2013 as "Koulutusala 1 (opisk.)"
,d1.iscfinarrow2013 as "Koulutusala 2 (opisk.)"
,d1.iscfi2013 as "Koulutusala 3 (opisk.)"
,d1.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak. (opisk.)"
,d1.iscle2011_SV as "Utbildn.nivå 1 (studerande)"
,d1.Koulutusaste_taso2_SV as "Utbildn.nivå 2 (studerande)"
,d1.iscfibroad2013_SV as "Utbildn.omr. 1 (studerande)"
,d1.iscfinarrow2013_SV as "Utbildn.omr. 2 (studerande)"
,d1.iscfi2013_SV as "Utbildn.omr. 3 (studerande)"
,d1.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor (studerande)"
,d1.iscle2011_EN as "Level of ed. 1 (student)"
,d1.Koulutusaste_taso2_EN as "Level of ed. 2 (student)"
,d1.iscfibroad2013_EN as "Field of ed. 1 (student)"
,d1.iscfinarrow2013_EN as "Field of ed. 2 (student)"
,d1.iscfi2013_EN as "Field of ed. 3 (student)"
,d1.OKM_ohjauksen_ala_EN as "Field of ed., HE steering (student)"
,d1.jarjestys_iscle2011 as jarj_isced_koulast1
,d1.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
,d1.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d1.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d1.jarjestys_iscfi2013 as jarj_isced_koulala3
,d1.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
,d1.iscle2011_koodi as "Koodit Koulutusaste 1 (opisk.)"
,d1.Koulutusaste_taso2_koodi as "Koodit Koulutusaste 2 (opisk.)"
,d1.iscfibroad2013_koodi as "Koodit Koulutusala 1 (opisk.)"
,d1.iscfinarrow2013_koodi as "Koodit Koulutusala 2 (opisk.)"
,d1.iscfi2013_koodi as "Koodit Koulutusala 3 (opisk.)"
,d1.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala, korkeak. (opisk.)"

,d2.iscle2011 as "Koulutusaste 1 (äiti)"
,d2.Koulutusaste_taso2 as "Koulutusaste 2 (äiti)"
,d2.iscfibroad2013 as "Koulutusala 1 (äiti)"
,d2.iscfinarrow2013 as "Koulutusala 2 (äiti)"
,d2.iscfi2013 as "Koulutusala 3 (äiti)"
,d2.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak. (äiti)"
,d2.iscle2011_SV as "Utbildn.nivå 1 (modern)"
,d2.Koulutusaste_taso2_SV as "Utbildn.nivå 2 (modern)"
,d2.iscfibroad2013_SV as "Utbildn.område 1 (modern)"
,d2.iscfinarrow2013_SV as "Utbildn.område 2 (modern)"
,d2.iscfi2013_SV as "Utbildn.område 3 (modern)"
,d2.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor (modern)"
,d2.iscle2011_EN as "Level of ed. 1 (mother)"
,d2.Koulutusaste_taso2_EN as "Level of ed. 2 (mother)"
,d2.iscfibroad2013_EN as "Field of ed. 1 (mother)"
,d2.iscfinarrow2013_EN as "Field of ed. 2 (mother)"
,d2.iscfi2013_EN as "Field of ed. 3 (mother)"
,d2.OKM_ohjauksen_ala_EN as "Field of ed., HE steering (mother)"
,d2.jarjestys_iscle2011 as jarj_isced_koulast1ai
,d2.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2ai
,d2.jarjestys_iscfibroad2013 as jarj_isced_koulala1ai
,d2.jarjestys_iscfinarrow2013 as jarj_isced_koulala2ai
,d2.jarjestys_iscfi2013 as jarj_isced_koulala3ai
,d2.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1ai
,d2.iscle2011_koodi as "Koodit Koulutusaste 1 (äiti)"
,d2.Koulutusaste_taso2_koodi as "Koodit Koulutusaste 2 (äiti)"
,d2.iscfibroad2013_koodi as "Koodit Koulutusala 1 (äiti)"
,d2.iscfinarrow2013_koodi as "Koodit Koulutusala 2 (äiti)"
,d2.iscfi2013_koodi as "Koodit Koulutusala 3 (äiti)"
,d2.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala, korkeak. (äiti)"

,d3.iscle2011 as "Koulutusaste 1 (isä)"
,d3.Koulutusaste_taso2 as "Koulutusaste 2 (isä)"
,d3.iscfibroad2013 as "Koulutusala 1 (isä)"
,d3.iscfinarrow2013 as "Koulutusala 2 (isä)"
,d3.iscfi2013 as "Koulutusala 3 (isä)"
,d3.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak. (isä)"
,d3.iscle2011_SV as "Utbildn.nivå 1 (fadern)"
,d3.Koulutusaste_taso2_SV as "Utbildn.nivå 2 (fadern)"
,d3.iscfibroad2013_SV as "Utbildn.område 1 (fadern)"
,d3.iscfinarrow2013_SV as "Utbildn.område 2 (fadern)"
,d3.iscfi2013_SV as "Utbildn.område 3 (fadern)"
,d3.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor (fadern)"
,d3.iscle2011_EN as "Level of ed. 1 (father)"
,d3.Koulutusaste_taso2_EN as "Level of ed. 2 (father)"
,d3.iscfibroad2013_EN as "Field of ed. 1 (father)"
,d3.iscfinarrow2013_EN as "Field of ed. 2 (father)"
,d3.iscfi2013_EN as "Field of ed. 3 (father)"
,d3.OKM_ohjauksen_ala_EN as "Field of ed., HE steering (father)"
,d3.jarjestys_iscle2011 as jarj_isced_koulast1is
,d3.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2is
,d3.jarjestys_iscfibroad2013 as jarj_isced_koulala1is
,d3.jarjestys_iscfinarrow2013 as jarj_isced_koulala2is
,d3.jarjestys_iscfi2013 as jarj_isced_koulala3is
,d3.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1is
,d3.iscle2011_koodi as "Koodit Koulutusaste 1 (isä)"
,d3.Koulutusaste_taso2_koodi as "Koodit Koulutusaste 2 (isä)"
,d3.iscfibroad2013_koodi as "Koodit Koulutusala 1 (isä)"
,d3.iscfinarrow2013_koodi as "Koodit Koulutusala 2 (isä)"
,d3.iscfi2013_koodi as "Koodit Koulutusala 3 (isä)"
,d3.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala, korkeak. (isä)"


FROM dbo.f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk
	  JOIN d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
	  JOIN d_koulutusluokitus d2 on d2.id = koulutusluokitus_aiti_id
	  JOIN d_koulutusluokitus d3 on d3.id = koulutusluokitus_isa_id
	  JOIN d_koulutuslaji d4 on d4.id = koulutuslaji_id
	  JOIN d_sukupuoli d5 on d5.id = sukupuoli_id
	  JOIN d_opetushallinnon_koulutus d6 on d6.id = opetushallinnon_koulutus2_id
	  JOIN d_aidinkieli_versio1 d7 on d7.id = aidinkieli_versio1x_id
	  JOIN d_kausi d8 on d8.kausi_id = syntymavuosi_id
	  JOIN d_kieli d9 on d9.id = koulutuksen_kieli_id
	  JOIN d_alueluokitus d10 on d10.id = koulutuksen_maakunta_id
	  JOIN d_alueluokitus d11 on d11.id = kotikunta_id
	  JOIN d_alueluokitus d12 on d12.id = kotikunta1x_id
	  JOIN d_tulodesiili d13 on d13.id = tulodesiili_aiti_id
	  JOIN d_tulodesiili d14 on d14.id = tulodesiili_isa_id
	  JOIN d_sosioekonominen_asema d15 on d15.id = sosioekonominen_asema_1_aiti_id
	  JOIN d_sosioekonominen_asema d16 on d16.id = sosioekonominen_asema_2_aiti_id
	  JOIN d_sosioekonominen_asema d17 on d17.id = sosioekonominen_asema_1_isa_id
	  JOIN d_sosioekonominen_asema d18 on d18.id = sosioekonominen_asema_2_isa_id
	  JOIN d_ika d19 on d19.id = ika_1v_id
	  --JOIN d_ika d20 on d20.id = ika_5v_id
	  JOIN d_opiskelijan_olo d21 on d21.id = opiskelijan_olo_syys_id
	  JOIN d_kausi d22 on d22.kausi_id = kirjoihintulovuosi_id










GO


USE [ANTERO]