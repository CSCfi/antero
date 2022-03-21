USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_indikaattorit_kunta]    Script Date: 10.8.2021 19:43:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_tab_indikaattorit_kunta] AS

Select 
[Tilastovuosi]
,d1.aineisto as Aineisto
,d2.aidinkieli_versio1 as Äidinkieli
,d3.avi as "Asuinalueen AVI"
,d3.ely as "Asuinalueen ELY"
,d3.kielisuhde as "Asuinkunnan kielisuhde"
,d3.maakunta as Asuinmaakunta
,d3.kunta as Asuinkunta
,d3b.avi as "Edeltävän vuoden AVI"
,d3b.ely as "Edeltävän vuoden ELY"
,d3b.kielisuhde as "Edeltävän vuoden asuinkunnan kielisuhde"
,d3b.maakunta as "Edeltävän vuoden asuinmaakunta"
,d3b.kunta as "Edeltävän vuoden asuinkunta"
,d3c.avi as "2v til.v:tta ed. AVI"
,d3c.ely as "2v til.v:tta ed. ELY"
,d3c.kielisuhde as "2v til.v:tta ed. asuinkunnan kielisuhde"
,d3c.maakunta as "2v til.v:tta ed. asuinmaakunta"
,d3c.kunta as "2v til.v:tta ed. asuinkunta"
,d4.sukupuoli as Sukupuoli
,d5.ika as Ikä
,d5.ika5v as Ikäryhmä
,d5b.vuosiselite as Syntymävuosi
,d6a.tutkinto_amk as "Tutkinto (amk)"
,d6b.tutkinto_yo as "Tutkinto (yo)"
,d7.koulutustyyppi as Koulutustyyppi
,d8.kansalaisuus_versio2 as Kansalaisuus
,d9.oppilaitos as Oppilaitos
,d9.opetuskieli as Opetuskieli
,d9.oppilaitoksen_omistajatyyppi as "Oppil. omistajatyyppi"
,d9.oppilaitostyyppi as Oppilaitostyyppi
,d9b.koulutuksen_jarjestaja as "Koulutuksen järjestäjä"
,d9b.koulutuksen_jarjestajan_omistajatyyppi as "Koul. järj. omistajatyyppi"
,d10.lahde as Lähde
,d11.koulutusohjelma_amk as Koulutusohjelma
,d12.opiskelijan_olo as "Kirjoillaolo (syys)"
,d12b.opiskelijan_olo_tamm as "Kirjoillaolo (tammi)"
,d13.rahoituslahde as Rahoituslähde
,d15.suuntautumisvaihtoehto_amk as Suuntautumisvaihtoehto
,d16.kieli as "Koulutuksen kieli"
,d17.ensisijainen_opintooikeus as "Ensisijainen opinto-oikeus"
,d18.tilauskoulutuksen_sijaintimaa as "Tilauskoulutuksen sijaintimaa"
,d19.koulutussektori as Koulutussektori
,CASE WHEN d21b.jarjestys in (12,13) Then 'Opetushallinnon alainen koulutus' Else d20.opetushallinnon_koulutus End as Hallinnonala
,d21.koulutusaste2002 as "Koulutusaste (2002)"
,d21.koulutusala2002 as "Koulutusala (2002)"
,d21.opintoala1995 as "Koulutusala (1995)"
,d21.opintoala2002 as "Opintoala (2002)"
,d21.koulutus as Koulutusnimike
,d21b.koulutuslaji_okm as Koulutuslaji
,d21b.koulutuslaji_okm2 as Koulutuslaji2
,d22.avi as "Koulutuksen AVI"
,d22.ely as "Koulutuksen ELY"
,d22.maakunta as "Koulutuksen maakunta"
,d22.kielisuhde as "Koul. kunnan kielisuhde"
,d22.kunta as "Koulutuksen kunta"
,d22b.avi as "Koul. järjestäjän AVI"
,d22b.ely as "Koul. järjestäjän ELY"
,d22b.maakunta as "Koul. järjestäjän maakunta"
,d22b.kielisuhde as "Koul. järj. kunnan kielisuhde"
,d22b.kunta as "Koul. järjestäjän kunta"
,d22c.avi as "Oppilaitoksen AVI"
,d22c.ely as "Oppilaitoksen ELY"
,d22c.maakunta as "Oppilaitoksen maakunta"
,d22c.kielisuhde as "Oppil. kunnan kielisuhde"
,d22c.kunta as "Oppilaitoksen kunta"
,d23.vuosiselite as "Kirjoihintulovuosi"
,d23b.lukukausiselite as "Kirjoihintulokausi"
,d24b.vuosiselite as "Kirjoihintulovuosi (kk-sek.)"
,d24c.vuosiselite as "Kirjoihintulovuosi (kk-sek. läsna)"
,d24d.vuosiselite as "Kirjoihintulovuosi (sek.)"
,d24e.vuosiselite as "Kirjoihintulovuosi (sek. läsnä)"
,d24f.vuosiselite as "Kirjoihintulovuosi (kk)"
,d24g.vuosiselite as "Kirjoihintulovuosi (kk läsnä)"
,d24h.vuosiselite as "Kirjoihintulovuosi (op.ala)"
,d24i.vuosiselite as "Kirjoihintulovuosi (op.ala läsnä)"
,d24j.vuosiselite as "Kirjoihintulovuosi (tutk.)"
,d24k.lukukausiselite as "Kirjoihintulokausi (tutk.)"
,d45.tutkinnon_tavoite as "Koulutuksen tavoite"
--jarjestysmuuttujat
,d2.jarjestys as jarj_aidinkieli
,d3.jarjestys_avi as jarj_as_avi
,d3.jarjestys_ely as jarj_as_ely
,d3.jarjestys_kielisuhde as jarj_as_kielisuhde
,d3.jarjestys_maakunta as jarj_as_maakunta
,d3.jarjestys as jarj_as_kunta
,d3b.jarjestys_avi as jarj_as_avi1x
,d3b.jarjestys_ely as jarj_as_ely1x
,d3b.jarjestys_kielisuhde as jarj_as_kielisuhde1x
,d3b.jarjestys_maakunta as jarj_as_maakunta1x
,d3b.jarjestys as jarj_as_kunta1x
,d3c.jarjestys_avi as jarj_as_avi2x
,d3c.jarjestys_ely as jarj_as_ely2x
,d3c.jarjestys_kielisuhde as jarj_as_kielisuhde2x
,d3c.jarjestys_maakunta as jarj_as_maakunta2x
,d3c.jarjestys as jarj_as_kunta2x
,d5.jarjestys_ika
,d5.jarjestys_ika5v as jarj_ika5v
,d5b.jarjestys as jarj_syntv
,d6a.jarjestys as jarj_tutk_amk
,d6b.jarjestys as jarj_tutk_yo
,d7.jarjestys as jarj_koultyyppi
,d8.jarjestys as jarj_kansalaisuus
,d9.jarjestys_oppilaitos
,d9.jarjestys_opetuskieli
,d9.jarjestys_omistajatyyppi
,d9.jarjestys_oppilaitostyyppi
,d11.jarjestys as jarj_koulohjelma_amk
,d12.jarjestys as jarj_kirjolosyys
,d12b.jarjestys as jarj_kirjolotammi
,d13.jarjestys as jarj_rahoitus
,d15.jarjestys as jarj_suunnvaiht
,d16.jarjestys as jarj_koulkiel
,d16.jarjestys_iso3kirjainta as jarj_koulkiel2
,d17.jarjestys as jarj_ensop
,d18.jarjestys as jarj_tilauskoul
,d19.jarjestys as jarj_koulsek
,d20.jarjestys as jarj_hallinnonala
,d21.jarjestys_koulutusaste2002
,d21.jarjestys_koulutusala2002
,d21.jarjestys_opintoala1995
,d21.jarjestys_opintoala2002
,d21.jarjestys as jarj_koulnimike
,d21b.jarjestys as jarj_koullaji
,d21b.jarjestys2 as jarj_koullaji2
,d22.jarjestys_avi
,d22.jarjestys_ely
,d22.jarjestys_maakunta
,d22.jarjestys_kielisuhde
,d22.jarjestys as jarj_kunta
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
,d45.jarjestys as jarj_tavoite
--Koodimuuttujat
,d1.aineisto_koodi
,d2.aidinkieli_versio1_koodi as aidinkieli_koodi
,d3.maakunta_koodi as 'Koodit Asuinmaakunta'
,d3.kunta_koodi as 'Koodit Asuinkunta'
,d3b.maakunta_koodi as asmaak1xmk
,d3b.kunta_koodi as asmaak1xk
,d6a.tutkinto_amk_koodi as 'Koodit Tutkinto (amk)'
,d6b.tutkinto_yo_koodi as 'Koodit Tutkinto (yo)'
,d7.koulutustyyppi_koodi as 'Koodit Koulutustyyppi'
,d8.kansalaisuus_versio2_koodi as kansalaisuus_koodi
,d9.oppilaitoskoodi as 'Koodit Oppilaitos'
,d9b.koulutuksen_jarjestajakoodi as 'Koodit Koulutuksen järjestäjä'
,d10.lahde_koodi
,d11.koulutusohjelma_amk_koodi as 'Koodit Koulutusohjelma'
,d12.opiskelijan_olo_koodi as kirjoillaolosyys_koodi
,d12b.opiskelijan_olo_tamm_koodi as kirjoillaolotammi_koodi
,d17.ensisijainen_opintooikeus_koodi as ensiop
,d21.koulutusaste2002_koodi as 'Koodit Koulutusaste 2002'
,d21.koulutusala2002_koodi as 'Koodit Koulutusala 2002'
,d21.opintoala1995_koodi as 'Koodit Koulutusala 1995'
,d21.opintoala2002_koodi as 'Koodit Opintoala 2002'
,d21.koulutus_koodi as 'Koodit Koulutusnimike'
,d22.maakunta_koodi as 'Koodit Koulutuksen maakunta'
,d22.kunta_koodi as 'Koodit Koulutuksen kunta'
,d22b.maakunta_koodi as 'Koodit Koul. järj. maakunta'
,d22b.kunta_koodi as 'Koodit Koul. järj. kunta'
,d22c.maakunta_koodi as 'Koodit Oppil. maakunta'
,d22c.kunta_koodi as 'Koodit Oppil. kunta'
,d23.vuosi as alvv
,d23b.lukukausi as alkk
,d24b.vuosi as alvv_kksek
,d24c.vuosi as alvv_kksek_lasna
,d24d.vuosi as alvv_sek
,d24e.vuosi as alvv_sek_lasna
,d24f.vuosi as alvv_kk
,d24g.vuosi as alvv_kk_lasna
,d24h.vuosi as alvv_opa
,d24i.vuosi as alvv_opa_lasna
,d24j.vuosi as kirtu1v
,d24k.lukukausi as kirtu1k
--ruotsi
,[Tilastovuosi] as Statistikår
,d2.aidinkieli_versio1_SV as Modersmål
--,d3.avi_SV as "Asuinalueen AVISV"
--,d3.ely_SV as "Asuinalueen ELYSV"
--,d3.kielisuhde_SV as "Asuinkunnan kielisuhdeSV"
,d3.maakunta_SV as Bostadslandskap
,d3.kunta_SV as Bostadskommun
--,d3b.avi_SV as "Til.v:tta edeltävä AVISV"
--,d3b.ely_SV as "Til.v:tta edeltävä ELYSV"
--,d3b.kielisuhde_SV as "Til.v:tta ed. asuinkunnan kielisuhdeSV"
--,d3b.maakunta_SV as "Til.v:tta ed. asuinmaakuntaSV"
--,d3b.kunta_SV as "Til.v:tta ed. asuinkuntaSV"
--,d3c.avi_SV as "2v til.v:tta ed. AVISV"
--,d3c.ely_SV as "2v til.v:tta ed. ELYSV"
--,d3c.kielisuhde_SV as "2v til.v:tta ed. asuinkunnan kielisuhdeSV"
--,d3c.maakunta_SV as "2v til.v:tta ed. asuinmaakuntaSV"
--,d3c.kunta_SV as "2v til.v:tta ed. asuinkuntaSV"
,d4.sukupuoli_SV as Kön
,d5.ika_SV as Ålder
,d5.ika5v_SV as Åldersgrupp
,d5b.vuosiselite_SV as Födelseår
--,d5c.kuukausiselite_SV as SyntymäkuukausiSV
,d6a.tutkinto_amk_SV as "Examen (yrkehögskola)"
,d6b.tutkinto_yo_SV as "Examen (universitet)"
,d7.koulutustyyppi_SV as "Typ av utbildning"
,d8.kansalaisuus_versio2_SV as Medborgarskap
,d9.oppilaitos_SV as Läroanstalt
,d9.oppilaitos_SV as Universitet
,d9.oppilaitos_SV as Yrkeshögskola
--,d9.opetuskieli_SV as OpetuskieliSV
--,d9.oppilaitoksen_omistajatyyppi_SV as "Oppil. omistajatyyppiSV"
--,d9.oppilaitostyyppi_SV as OppilaitostyyppiSV
,d9b.koulutuksen_jarjestaja_SV as "Utbildningsanordnare"
--,d9b.koulutuksen_jarjestajan_omistajatyyppi_SV as "Koul. järj. omistajatyyppiSV"
--,d10.lahde_SV as LähdeSV
,d11.koulutusohjelma_amk_SV as Utbildningsprogram
,d12.opiskelijan_olo_SV as "Inskrivning (september)"
,d12b.opiskelijan_olo_tamm_SV as "Inskrivning (januari)"
,d13.rahoituslahde_SV as Finansieringskälla
--,d15.suuntautumisvaihtoehto_amk_SV as SuuntautumisvaihtoehtoSV
--,d16.kieli_SV as "Koulutuksen kieliSV"
--,d17.ensisijainen_opintooikeus_SV as "Ensisijainen opinto-oikeusSV"
--,d18.tilauskoulutuksen_sijaintimaa_SV as "Tilauskoulutuksen sijaintimaaSV"
,d19.koulutussektori_SV as Utbildningssektor
,CASE WHEN d21b.jarjestys in (12,13) Then 'Undervisningsförvaltn. utbildn.' Else d20.opetushallinnon_koulutus_SV End as Förvaltningsområde
,d21.koulutusaste2002_SV as "Utbildningsnivå (2002)"
,d21.koulutusala2002_SV as "Utbildningsområde (2002)"
,d21.opintoala1995_SV as "Utbildningsområde (1995)"
,d21.opintoala2002_SV as "Studieområde (2002)"
,d21.koulutus_SV as Utbildningsbenämning
,d21b.koulutuslaji_okm_SV as Utbildningsslag
,d21b.koulutuslaji_okm2_SV as Utbildningsslag2
--,d22.avi_SV as "Koulutuksen AVISV"
--,d22.ely_SV as "Koulutuksen ELYSV"
,d22.maakunta_SV as "Utbildningens landskap"
--,d22.kielisuhde_SV as "Koul. kunnan kielisuhdeSV"
,d22.kunta_SV as "Utbildningens kommun"
--,d22b.avi_SV as "Koul. järjestäjän AVISV"
--,d22b.ely_SV as "Koul. järjestäjän ELYSV"
--,d22b.maakunta_SV as "Koul. järjestäjän maakuntaSV"
--,d22b.kielisuhde_SV as "Koul. järj. kunnan kielisuhdeSV"
--,d22b.kunta_SV as "Koul. järjestäjän kuntaSV"
--,d22c.avi_SV as "Oppilaitoksen AVISV"
--,d22c.ely_SV as "Oppilaitoksen ELYSV"
--,d22c.maakunta_SV as "Oppilaitoksen maakuntaSV"
--,d22c.kielisuhde_SV as "Oppil. kunnan kielisuhdeSV"
--,d22c.kunta_SV as "Oppilaitoksen kuntaSV"
--,d23.vuosiselite_SV as "KirjoihintulovuosiSV"
--,d23b.lukukausiselite_SV as "KirjoihintulokausiSV"
--,d24b.vuosiselite_SV as "Kirjoihintulovuosi (kk-sek.)SV"
--,d24c.vuosiselite_SV as "Kirjoihintulovuosi (kk-sek. läsna)SV"
--,d24d.vuosiselite_SV as "Kirjoihintulovuosi (sek.)SV"
--,d24e.vuosiselite_SV as "Kirjoihintulovuosi (sek. läsnä)SV"
--,d24f.vuosiselite_SV as "Kirjoihintulovuosi (kk)SV"
--,d24f2.lukukausiselite_SV as "Kirjoihintulokausi (kk)SV"
--,d24g.vuosiselite_SV as "Kirjoihintulovuosi (kk läsnä)SV"
--,d24h.vuosiselite_SV as "Kirjoihintulovuosi (op.ala)SV"
--,d24i.vuosiselite_SV as "Kirjoihintulovuosi (op.ala läsnä)SV"
--,d24j.vuosiselite_SV as "Kirjoihintulovuosi (tutk.)SV"
--,d24k.lukukausiselite_SV as "Kirjoihintulokausi (tutk.)SV"
,d45.tutkinnon_tavoite_SV as "Utbildningens mål"
--englanti
,[Tilastovuosi] as "Statistical year"
,d2.aidinkieli_versio1_EN as "Mother tongue"
--,d3.avi_EN as "Asuinalueen AVIEN"
--,d3.ely_EN as "Asuinalueen ELYEN"
--,d3.kielisuhde_EN as "Asuinkunnan kielisuhdeEN"
,d3.maakunta_EN as "Region of residence"
,d3.kunta_EN as "Municipality of residence"
--,d3b.avi_EN as "Til.v:tta edeltävä AVIEN"
--,d3b.ely_EN as "Til.v:tta edeltävä ELYEN"
--,d3b.kielisuhde_EN as "Til.v:tta ed. asuinkunnan kielisuhdeEN"
--,d3b.maakunta_EN as "Til.v:tta ed. asuinmaakuntaEN"
--,d3b.kunta_EN as "Til.v:tta ed. asuinkuntaEN"
--,d3c.avi_EN as "2v til.v:tta ed. AVIEN"
--,d3c.ely_EN as "2v til.v:tta ed. ELYEN"
--,d3c.kielisuhde_EN as "2v til.v:tta ed. asuinkunnan kielisuhdeEN"
--,d3c.maakunta_EN as "2v til.v:tta ed. asuinmaakuntaEN"
--,d3c.kunta_EN as "2v til.v:tta ed. asuinkuntaEN"
,d4.sukupuoli_EN as Gender
,d5.ika_EN as Age
,d5.ika5v_EN as Agegroup
,d5b.vuosiselite_EN as "Year of birth"
--,d5c.kuukausiselite_EN as SyntymäkuukausiEN
,d6a.tutkinto_amk_EN as "Degree (polytechnic)"
,d6b.tutkinto_yo_EN as "Degree (university)"
,d7.koulutustyyppi_EN as "Type of education"
,d8.kansalaisuus_versio2_EN as Nationality
,d9.oppilaitos_EN as "Educational institution"
,d9.oppilaitos_EN as University
,d9.oppilaitos_EN as Polytechnic
--,d9.opetuskieli_EN as OpetuskieliEN
--,d9.oppilaitoksen_omistajatyyppi_EN as "Oppil. omistajatyyppiEN"
--,d9.oppilaitostyyppi_EN as OppilaitostyyppiEN
,d9b.koulutuksen_jarjestaja_EN as "Education provider"
--,d9b.koulutuksen_jarjestajan_omistajatyyppi_EN as "Koul. järj. omistajatyyppiEN"
--,d10.lahde_EN as LähdeEN
,d11.koulutusohjelma_amk_EN as "Degree programme"
,d12.opiskelijan_olo_EN as "Enrollment status (sept.)"
,d12b.opiskelijan_olo_tamm_EN as "Enrollment status (jan.)"
,d13.rahoituslahde_EN as "Source of funding"
--,d15.suuntautumisvaihtoehto_amk_EN as SuuntautumisvaihtoehtoEN
--,d16.kieli_EN as "Koulutuksen kieliEN"
--,d17.ensisijainen_opintooikeus_EN as "Ensisijainen opinto-oikeusEN"
--,d18.tilauskoulutuksen_sijaintimaa_EN as "Tilauskoulutuksen sijaintimaaEN"
,d19.koulutussektori_EN as "Sector of education"
,CASE WHEN d21b.jarjestys in (12,13) Then 'Education under the education administration' Else d20.opetushallinnon_koulutus_EN End as "Administrative sector"
,d21.koulutusaste2002_EN as "Level of education (2002)"
,d21.koulutusala2002_EN as "Field of education (2002)"
,d21.opintoala1995_EN as "Field of education (1995)"
,d21.opintoala2002_EN as "Subfield of ed. (2002)"
,d21.koulutus_EN as "Name of education"
,d21b.koulutuslaji_okm_EN as "Form of education"
,d21b.koulutuslaji_okm2_EN as "Form of education2"
--,d22.avi_EN as "Koulutuksen AVIEN"
--,d22.ely_EN as "Koulutuksen ELYEN"
,d22.maakunta_EN as "Region of education"
--,d22.kielisuhde_EN as "Koul. kunnan kielisuhdeEN"
,d22.kunta_EN as "Municipality of education"
--,d22b.avi_EN as "Koul. järjestäjän AVIEN"
--,d22b.ely_EN as "Koul. järjestäjän ELYEN"
--,d22b.maakunta_EN as "Koul. järjestäjän maakuntaEN"
--,d22b.kielisuhde_EN as "Koul. järj. kunnan kielisuhdeEN"
--,d22b.kunta_EN as "Koul. järjestäjän kuntaEN"
--,d22c.avi_EN as "Oppilaitoksen AVIEN"
--,d22c.ely_EN as "Oppilaitoksen ELYEN"
--,d22c.maakunta_EN as "Oppilaitoksen maakuntaEN"
--,d22c.kielisuhde_EN as "Oppil. kunnan kielisuhdeEN"
--,d22c.kunta_EN as "Oppilaitoksen kuntaEN"
,d23.vuosiselite_EN as "Year of enrollment"
,d23b.lukukausiselite_EN as "Term of enrollment"
,d24b.vuosiselite_EN as "Year of enrollment (HE sec.)"
,d24c.vuosiselite_EN as "Year of enrollment (HE sec. present)"
,d24d.vuosiselite_EN as "Year of enrollment (sec.)"
,d24e.vuosiselite_EN as "Year of enrollment (sec. present)"
,d24f.vuosiselite_EN as "Year of enrollment (ed. inst.)"
,d24g.vuosiselite_EN as "Year of enrollment (ed. inst. present)"
,d24h.vuosiselite_EN as "Year of enrollment (subfield of ed.)"
,d24i.vuosiselite_EN as "Year of enrollment (subfield of ed. present)"
,d24j.vuosiselite_EN as "Year of enrollment (degree)"
,d24k.lukukausiselite_EN as "Term of enrollment (degree)"
,d45.tutkinnon_tavoite_EN as "Objective of education"
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
,d21.iscle2011_EN as "Level of ed., tier 1"
,d21.Koulutusaste_taso2_EN as "Level of ed., tier 2"
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
,d21.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
,d21.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
,d21.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
,d21.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
,d21.iscfi2013_koodi as "Koodit Koulutusala, taso 3"
,d21.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala, korkeak."
--Lukumäärämuuttujat
,[Opisk2]
,[Aloit2]
,[opiskelijat_lasna]

FROM (
SELECT [tilastointivuosi] as Tilastovuosi
	  ,aineisto_id
	  ,aidinkieli_versio1_id
	  ,kotikunta_id
	  ,kotikunta1x_id
	  ,kotikunta_ed_id = -1
	  ,kotikunta2x_id
	  ,sukupuoli_id
	  ,ika_id
	  ,syntymavuosi_id
	  ,tutkinto_amk_id
	  ,tutkinto_yo_id
	  ,koulutustyyppi_id
	  ,kansalaisuus_versio2_id
	  ,oppilaitos_id
	  ,koulutuksen_jarjestaja_id
	  ,lahde_id
	  ,koulutusohjelma_amk_id
	  ,opiskelijan_olo_syys_id
	  ,opiskelijan_olo_tamm_id
	  ,rahoituslahde_id
	  ,suuntautumisvaihtoehto_amk_id
	  ,koulutuksen_kieli_id
	  ,ensisijainen_opintooikeus_id
	  ,tilauskoulutuksen_sijaintimaa_id
	  ,koulutussektori_id
	  ,opetushallinnon_koulutus_id
	  ,koulutusluokitus_id
	  ,koulutusala_id = -1
	  ,koulutuslaji_OKM_id
	  ,koulutuksen_kunta_id
	  ,koulutuksen_jarjestaja_kunta_id
	  ,oppilaitos_kunta_id
	  ,kirjoihintulovuosi_id
	  ,kirjoihintulokausi_id
	  ,kirjoihintulovuosi_korkeakoulusektori_id
	  ,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id
	  ,kirjoihintulovuosi_sektori_id
	  ,kirjoihintulovuosi_sektori_lasnaoleva_id
	  ,kirjoihintulovuosi_korkeakoulu_id
	  ,kirjoihintulovuosi_korkeakoulu_lasnaoleva_id
	  ,kirjoihintulovuosi_opintoala_id
	  ,kirjoihintulovuosi_opintoala_lasnaoleva_id
	  ,kirjoihintulovuosi_tutkinto_id
	  ,kirjoihintulokausi_tutkinto_id
	  ,tutkinnon_tavoite_id = -1
	  ,[opiskelijat] as Opisk2
	  ,[aloittaneet] as Aloit2
	  ,[opiskelijat_lasna]
  FROM [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]
  WHERE [tilastointivuosi] >= 2010

UNION ALL
SELECT [tilastointivuosi] as Tilastovuosi
	  ,aineisto_id = -1
	  ,aidinkieli_versio1_id = -1
	  ,kotikunta_id
	  ,kotikunta1x_id = -1
	  ,kotikunta_ed_id
	  ,kotikunta2x_id = -1
	  ,sukupuoli_id = -1
	  ,ika_5v_id
	  ,syntymavuosi_id = -1
	  ,tutkinto_amk_id = -1
	  ,tutkinto_yo_id = -1
	  ,koulutustyyppi_id = -1
	  ,kansalaisuus_versio2_id = -1
	  ,oppilaitos_id
	  ,koulutuksen_jarjestaja_id
	  ,lahde_id = -1
	  ,koulutusohjelma_amk_id = -1
	  ,opiskelijan_olo_syys_id = -1
	  ,opiskelijan_olo_tamm_id = -1
	  ,rahoituslahde_id = -1
	  ,suuntautumisvaihtoehto_amk_id = -1
	  ,koulutuksen_kieli_id
	  ,ensisijainen_opintooikeus_id = -1
	  ,tilauskoulutuksen_sijaintimaa_id = -1
	  ,koulutussektori_id = -1
	  ,opetushallinnon_koulutus_id
	  ,koulutusluokitus_id = -1
	  ,koulutusala_id
	  ,koulutuslaji_OKM_id
	  ,koulutuksen_kunta_id
	  ,koulutuksen_jarjestaja_kunta_id = -1
	  ,oppilaitos_kunta_id = -1
	  ,kirjoihintulovuosi_id = -1
	  ,kirjoihintulokausi_id = -1
	  ,kirjoihintulovuosi_korkeakoulusektori_id = -1
	  ,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id = -1
	  ,kirjoihintulovuosi_sektori_id = -1
	  ,kirjoihintulovuosi_sektori_lasnaoleva_id = -1
	  ,kirjoihintulovuosi_korkeakoulu_id = -1
	  ,kirjoihintulovuosi_korkeakoulu_lasnaoleva_id = -1
	  ,kirjoihintulovuosi_opintoala_id = -1
	  ,kirjoihintulovuosi_opintoala_lasnaoleva_id = -1
	  ,kirjoihintulovuosi_tutkinto_id = -1
	  ,kirjoihintulokausi_tutkinto_id = -1
	  ,tutkinnon_tavoite_id
	  ,[opiskelijat] as Opisk2
	  ,[aloittaneet] as Aloit2
	  ,[opiskelijat_lasna]

  FROM [dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]

  ) f
	LEFT JOIN [dbo].d_aineisto d1 ON d1.id = f.aineisto_id
	LEFT JOIN [dbo].d_aidinkieli_versio1 d2 ON d2.id = f.aidinkieli_versio1_id
	LEFT JOIN [dbo].d_alueluokitus d3 ON d3.id = f.kotikunta_id
	LEFT JOIN [dbo].d_alueluokitus d3b ON d3b.id = f.kotikunta1x_id & f.kotikunta_ed_id
	LEFT JOIN [dbo].d_alueluokitus d3c ON d3c.id = f.kotikunta2x_id
	LEFT JOIN [dbo].d_sukupuoli d4 ON d4.id = f.sukupuoli_id
	LEFT JOIN [dbo].d_ika d5 ON d5.id = f.ika_id
	LEFT JOIN [dbo].d_kausi d5b ON d5b.kausi_id = f.syntymavuosi_id
	LEFT JOIN [dbo].d_tutkinto_amk d6a ON d6a.id = f.tutkinto_amk_id
	LEFT JOIN [dbo].d_tutkinto_yo d6b ON d6b.id = f.tutkinto_yo_id
	LEFT JOIN [dbo].d_koulutustyyppi d7 ON d7.id = f.koulutustyyppi_id
	LEFT JOIN [dbo].d_kansalaisuus_versio2 d8 ON d8.id = f.kansalaisuus_versio2_id
	LEFT JOIN [dbo].d_oppilaitoksen_taustatiedot d9 ON d9.id = f.oppilaitos_id
	LEFT JOIN [dbo].d_oppilaitoksen_taustatiedot d9b ON d9b.id = f.koulutuksen_jarjestaja_id
	LEFT JOIN [dbo].d_lahde d10 ON d10.id = f.lahde_id
	LEFT JOIN [dbo].d_koulutusohjelma_amk d11 ON d11.id = f.koulutusohjelma_amk_id
	LEFT JOIN [dbo].d_opiskelijan_olo d12 ON d12.id = f.opiskelijan_olo_syys_id
	LEFT JOIN [dbo].d_opiskelijan_olo_tamm d12b ON d12b.id = f.opiskelijan_olo_tamm_id
	LEFT JOIN [dbo].d_rahoituslahde d13 ON d13.id = f.rahoituslahde_id
	LEFT JOIN [dbo].d_suuntautumisvaihtoehto_amk d15 ON d15.id = f.suuntautumisvaihtoehto_amk_id
	LEFT JOIN [dbo].d_kieli d16 ON d16.id = f.koulutuksen_kieli_id
	LEFT JOIN [dbo].d_ensisijainen_opintooikeus d17 ON d17.id = f.ensisijainen_opintooikeus_id
	LEFT JOIN [dbo].d_tilauskoulutuksen_sijaintimaa d18 ON d18.id = f.tilauskoulutuksen_sijaintimaa_id
	LEFT JOIN [dbo].d_koulutussektori d19 ON d19.id = f.koulutussektori_id
	LEFT JOIN [dbo].d_opetushallinnon_koulutus d20 ON d20.id = f.opetushallinnon_koulutus_id
	LEFT JOIN [dbo].d_koulutusluokitus d21 ON d21.id = f.koulutusluokitus_id & f.koulutusala_id
	LEFT JOIN [dbo].d_koulutuslaji_okm d21b ON d21b.id = f.koulutuslaji_OKM_id
	LEFT JOIN [dbo].d_alueluokitus d22 ON d22.id = f.koulutuksen_kunta_id
	LEFT JOIN [dbo].d_alueluokitus d22b ON d22b.id = f.koulutuksen_jarjestaja_kunta_id
	LEFT JOIN [dbo].d_alueluokitus d22c ON d22c.id = f.oppilaitos_kunta_id
	LEFT JOIN [dbo].d_kausi d23 ON d23.kausi_id = f.kirjoihintulovuosi_id
	LEFT JOIN [dbo].d_kausi d23b ON d23b.kausi_id = f.kirjoihintulokausi_id
	LEFT JOIN [dbo].d_kausi d24b ON d24b.kausi_id = f.kirjoihintulovuosi_korkeakoulusektori_id
	LEFT JOIN [dbo].d_kausi d24c ON d24c.kausi_id = f.kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id
	LEFT JOIN [dbo].d_kausi d24d ON d24d.kausi_id = f.kirjoihintulovuosi_sektori_id
	LEFT JOIN [dbo].d_kausi d24e ON d24e.kausi_id = f.kirjoihintulovuosi_sektori_lasnaoleva_id
	LEFT JOIN [dbo].d_kausi d24f ON d24f.kausi_id = f.kirjoihintulovuosi_korkeakoulu_id
	LEFT JOIN [dbo].d_kausi d24g ON d24g.kausi_id = f.kirjoihintulovuosi_korkeakoulu_lasnaoleva_id
	LEFT JOIN [dbo].d_kausi d24h ON d24h.kausi_id = f.kirjoihintulovuosi_opintoala_id
	LEFT JOIN [dbo].d_kausi d24i ON d24i.kausi_id = f.kirjoihintulovuosi_opintoala_lasnaoleva_id
	LEFT JOIN [dbo].d_kausi d24j ON d24j.kausi_id = f.kirjoihintulovuosi_tutkinto_id
	LEFT JOIN [dbo].d_kausi d24k ON d24k.kausi_id = f.kirjoihintulokausi_tutkinto_id
	left join VipunenTK.dbo.d_tutkinnon_tavoite d45 on d45.id=f.tutkinnon_tavoite_id
WHERE d1.aineisto_koodi in ('L','-1') AND d9.oppilaitoskoodi <> '02557' AND d9.oppilaitoskoodi <> '10031' AND d9.oppilaitoskoodi <> '02358'



GO


