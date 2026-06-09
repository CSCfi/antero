USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 29.8.2025 11.19.44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dbo].[v_f_vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] AS

Select --top 100
[15 vuotta täyttäneen väestön lukumäärä2] = lukumaara
,[Tilastointivuosi] as Tilastovuosi
,d1.koulutus as "Koulutusnimike"
,d1.koulutusala2002 as "Koulutusala"
,d1.jarjestys_koulutusala2002 as "koul02"
,d1.opintoala2002 as "Opintoala"
,d1.jarjestys_opintoala2002 as "op02"
,d1.koulutusaste2002 as "Koulutusaste"
,d1.jarjestys_koulutusaste2002 as "kast02"
,d1.opintoala1995 as "Koulutusala (95 luokitus)"
,d1.jarjestys_opintoala1995 as "op95"
,d2.vuosiselite as "Tutkinnon suoritusvuosi"
,d2.jarjestys as "tutksuorvj"
,d3.vuosiselite as "Syntymävuosi"
,d3.jarjestys as "syntjarj"
,d4.oppisopimuskoulutus as "Oppisopimuskoulutus"
,d4.jarjestys as "opsopj"
,d5.sukupuoli as "Sukupuoli"
,d6.ika5v as "Ikäryhmä"
,d6.jarjestys_ika5v
,d7.aidinkieli_versio1 as "Äidinkieli"
,d7.jarjestys as "aid_jarj"
,d8.eumaa as "EU-maan kansalainen"
,d8.jarjestys_eumaa as "eujarj"
,d8.eumaa_koodi as "eukoodi"
,d9.etamaa as "ETA-maan kansalainen"
,d9.jarjestys_etamaa as "etajarj"
,d9.etamaa_koodi as "etakoodi"
,d10.pohjoismaa as "Pohjoismaan kansalainen"
,d10.jarjestys as "pohjjarj"
,d11.avi as "Tutk. suorituspaikan AVI"
,d11.jarjestys_avi as "suorjavi"
,d11.ely as "Tutk. suorituspaikan ELY"
,d11.jarjestys_ely as "suorjely"
,d11.maakunta as "Tutk. suoritusmaakunta"
,d11.jarjestys_maakunta as "suorjmaak"
,d12.avi as "Asuinalueen AVI"
,d12.jarjestys_avi as "asavij"
,d12.ely as "Asuinalueen ELY"
,d12.jarjestys_ely as "aselyj"
,d12.maakunta as "Asuinmaakunta"
,d12.jarjestys_maakunta as "asmaakj"
,d13.kansalaisuus_versio1 as "Kansalaisuus"
,d13.jarjestys as "kansjarj"
,d14.paaasiallinen_toiminta as "Pääasiallinen toiminta"
,d14.jarjestys as "pastoim"
,d14.paaasiallinen_toiminta_koodi as "paaasiallinen_toiminta_versio2_koodi"
,d15.ammattiluokitus_2010_paataso as "Ammattiryhmä"
,d15.jarjestys_ammattiluokitus_2010_paataso as "am2010paajarj"
,d15.ammattiluokitus_2010_2_taso as "Ammatti"
,d15.jarjestys_ammattiluokitus_2010_taso2 as "am2010taso2jarj"
,d16.tyossakayntitilaston_tyonantajasektori as "Työnantajasektori"
,d16.jarjestys as "tantj"
,d17.ammattiluokitus_2001 as "Ammatti (2001 luokitus)"
,d17.jarjestys as "am2001jarj"
,d18.ika as "Ikä"
,d18.jarjestys_ika as "ikajarj"
,d19.ika as "Tutkinnon suoritusikä"
,d19.jarjestys_ika as "suorikajarj"
,d20.ika as "Tutkinnon ikä"
,d20.jarjestys_ika as "tutkikajarj"
,d21.koulutusmuoto as "Koulutusmuoto"
,d21.jarjestys as "koulmuotojarj"
,d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa as "Amm. koul. koulutuslaji"
,d22.jarjestys as "amkouljarj"

/*sopv22 alkaen: korkein viimeiseksi aloitettu koulutus, tutkintoon johtavassa koulutuksessa opiskelu sekä tutkinnon ulkomaisuus*/
,d23.koulutus as "Koulutusnimike (viim. aloitettu)"
,d23.iscle2011 as "Koulutusaste, taso 1 (viim. aloitettu)"
,d23.Koulutusaste_taso2 as "Koulutusaste, taso 2 (viim. aloitettu)"
,d23.iscfibroad2013 as "Koulutusala, taso 1 (viim. aloitettu)"
,d23.iscfinarrow2013 as "Koulutusala, taso 2 (viim. aloitettu)"
,d23.iscfi2013 as "Koulutusala, taso 3 (viim. aloitettu)"
,d23.OKM_ohjauksen_ala as "OKM ohjauksen ala (viim. aloitettu)"

,d23a.koulutus as "Koulutusnimike (viim. aloitettu kk-koulutus)"
,d23a.iscle2011 as "Koulutusaste, taso 1 (viim. aloitettu kk-koulutus)"
,d23a.Koulutusaste_taso2 as "Koulutusaste, taso 2 (viim. aloitettu kk-koulutus)"
,d23a.iscfibroad2013 as "Koulutusala, taso 1 (viim. aloitettu kk-koulutus)"
,d23a.iscfinarrow2013 as "Koulutusala, taso 2 (viim. aloitettu kk-koulutus)"
,d23a.iscfi2013 as "Koulutusala, taso 3 (viim. aloitettu kk-koulutus)"
,d23a.OKM_ohjauksen_ala as "OKM ohjauksen ala (viim. aloitettu kk-koulutus)"

,d23b.koulutus as "Koulutusnimike (viim. aloitettu II-aste koulutus)"
,d23b.iscle2011 as "Koulutusaste, taso 1 (viim. aloitettu II-aste koulutus)"
,d23b.Koulutusaste_taso2 as "Koulutusaste, taso 2 (viim. aloitettu II-aste koulutus)"
,d23b.iscfibroad2013 as "Koulutusala, taso 1 (viim. aloitettu II-aste koulutus)"
,d23b.iscfinarrow2013 as "Koulutusala, taso 2 (viim. aloitettu II-aste koulutus)"
,d23b.iscfi2013 as "Koulutusala, taso 3 (viim. aloitettu II-aste koulutus)"
,d23b.OKM_ohjauksen_ala as "OKM ohjauksen ala (viim. aloitettu II-aste koulutus)"

,d24.kylla_ei as "Tutkinto sama kuin viim. aloitettu"
,d25.kylla_ei as "Opiskelee tutk. joht. koulutuksessa"
,d26.kylla_ei as "Tutkinto suoritettu ulkomailla"

,d33.kylla_ei as "Aloittanut korkea-asteen koulutuksen"
,d34.kylla_ei as "Aloittanut toisen asteen koulutuksen"
--
,d23.koulutus_koodi as "Koodit Koulutusnimike (viim. aloitettu)"
,d23.iscle2011_koodi as "Koodit Koulutusaste, taso 1 (viim. aloitettu)"
,d23.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2 (viim. aloitettu)"
,d23.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1 (viim. aloitettu)"
,d23.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2 (viim. aloitettu)"
,d23.iscfi2013_koodi as "Koodit Koulutusala, taso 3 (viim. aloitettu)"
,d23.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala (viim. aloitettu)"

,d23a.koulutus_koodi as "Koodit Koulutusnimike (viim. aloitettu kk-koulutus)"
,d23a.iscle2011_koodi as "Koodit Koulutusaste, taso 1 (viim. aloitettu kk-koulutus)"
,d23a.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2 (viim. aloitettu kk-koulutus)"
,d23a.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1 (viim. aloitettu kk-koulutus)"
,d23a.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2 (viim. aloitettu kk-koulutus)"
,d23a.iscfi2013_koodi as "Koodit Koulutusala, taso 3 (viim. aloitettu kk-koulutus)"
,d23a.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala (viim. aloitettu kk-koulutus)"

,d23b.koulutus_koodi as "Koodit Koulutusnimike (viim. aloitettu II-aste koulutus)"
,d23b.iscle2011_koodi as "Koodit Koulutusaste, taso 1 (viim. aloitettu II-aste koulutus)"
,d23b.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2 (viim. aloitettu II-aste koulutus)"
,d23b.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1 (viim. aloitettu II-aste koulutus)"
,d23b.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2 (viim. aloitettu II-aste koulutus)"
,d23b.iscfi2013_koodi as "Koodit Koulutusala, taso 3 (viim. aloitettu II-aste koulutus)"
,d23b.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala (viim. aloitettu II-aste koulutus)"
--
,d23.jarjestys_iscle2011 as jarj_isced_koulast1_viim_aloitettu
,d23.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2_viim_aloitettu
,d23.jarjestys_iscfibroad2013 as jarj_isced_koulala1_viim_aloitettu
,d23.jarjestys_iscfinarrow2013 as jarj_isced_koulala2_viim_aloitettu
,d23.jarjestys_iscfi2013 as jarj_isced_koulala3_viim_aloitettu
,d23.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1_viim_aloitettu

,d23a.jarjestys_iscle2011 as jarj_isced_koulast1_viim_aloitettu_ka
,d23a.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2_viim_aloitettu_ka
,d23a.jarjestys_iscfibroad2013 as jarj_isced_koulala1_viim_aloitettu_ka
,d23a.jarjestys_iscfinarrow2013 as jarj_isced_koulala2_viim_aloitettu_ka
,d23a.jarjestys_iscfi2013 as jarj_isced_koulala3_viim_aloitettu_ka
,d23a.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1_viim_aloitettu_ka

,d23b.jarjestys_iscle2011 as jarj_isced_koulast1_viim_aloitettu_ta
,d23b.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2_viim_aloitettu_ta
,d23b.jarjestys_iscfibroad2013 as jarj_isced_koulala1_viim_aloitettu_ta
,d23b.jarjestys_iscfinarrow2013 as jarj_isced_koulala2_viim_aloitettu_ta
,d23b.jarjestys_iscfi2013 as jarj_isced_koulala3_viim_aloitettu_ta
,d23b.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1_viim_aloitettu_ta

,d28.kieli as "Koulutuksen opetuskieli"
,d28.jarjestys as jarj_koulutuksen_opetuskieli
,d29.Koulutusaste_taso2 as "Korkea-asteelle ensim. haettu koulutusaste"
,d29.jarjestys_Koulutusaste_taso2 as jarj_korkea_asteelle_ensim_haettu_koulutusaste
,d30.vuosi as "Korkea-asteelle ensim. koulutuksen hakuvuosi"
,d30.jarjestys as jarj_korkea_asteelle_ensim_koulutuksen_hakuvuosi
,d31.Koulutusaste_taso2 as "Toiselle asteelle ensim. haettu koulutusaste"
,d31.jarjestys_Koulutusaste_taso2 as jarj_toiselle_asteelle_ensim_haettu_koulutusaste
,d32.vuosi as "Toiselle asteelle ensim. koulutuksen hakuvuosi"
,d32.jarjestys as jarj_toiselle_asteelle_ensim_koulutuksen_hakuvuosi

--sv
,[Tilastointivuosi] as Statistikår
,d1.koulutusala2002_SV as "Utbildningsområde (2002)"
,d1.opintoala2002_SV as "Studieområde (2002)"
,d1.koulutus_SV as "Utbildningsbenämning"
,d1.koulutusaste2002_SV as "Utbildningsnivå (2002)"
,d1.opintoala1995_SV as "Utbildningsområde (1995)"
,d2.vuosiselite_SV as "År då utbildningen avlagts"
,d3.vuosiselite_SV as "Födelseår"
,d4.oppisopimuskoulutus_SV as "Läroavtalsutbildning"
,d5.sukupuoli_SV as "Kön"
,d6.ika5v_SV as "Åldersgrupp"
,d7.aidinkieli_versio1_SV as "Modersmål"
,d8.eumaa_SV as "Medborgare i ett EU-land"
,d9.etamaa_SV as "Medborgare i ett EES-land"
,d10.pohjoismaa_SV as "Medborgare i ett nordiskt land"
,d11.avi_SV as "RFV-område där examen avlagts"
,d11.ely_SV as "NMT-område där examen avlagts"
,d11.maakunta_SV as "Landskap där examen avlagts"
,d12.avi_SV as "Bostadsortens RFV-område"
,d12.ely_SV as "Bostadsortens NTM-område"
,d12.maakunta_SV as "Bostadslandskap"
,d13.kansalaisuus_versio1_SV as "Medborgarskap"
,d14.paaasiallinen_toiminta_SV as "Huvudsaklig verksamhet"
,d15.ammattiluokitus_2010_paataso_SV as "Yrkesgrupp"
,d15.ammattiluokitus_2010_2_taso_SV as "Yrke"
,d16.tyossakayntitilaston_tyonantajasektori_SV as "Arbetsgivarens sektor"
,d17.ammattiluokitus_2001_SV as "Yrke (2001)"
,d18.ika_SV as "Ålder"
--,d19.ika_SV as "Tutkinnon suoritusikä"
--,d20.ika_SV as "Tutkinnon ikä"
--,d21.koulutusmuoto_SV as "Koulutusmuoto"
--,d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_SV as "Amm. koul. koulutuslaji"
--sopv22-
,d23.koulutus_SV as "Utbildningsbenämning (senast inledda)"
,d23.iscle2011_SV as "Utbildningsnivå, nivå 1 (senast inledda)"
,d23.Koulutusaste_taso2_SV as "Utbildningsnivå, nivå 2 (senast inledda)"
,d23.iscfibroad2013_SV as "Utbildningsområde, nivå 1 (senast inledda)"
,d23.iscfinarrow2013_SV as "Utbildningsområde, nivå 2 (senast inledda)"
,d23.iscfi2013_SV as "Utbildningsområde, nivå 3 (senast inledda)"
,d23.OKM_ohjauksen_ala_SV as "UKM-styrningsområde (senast inledda)"

,d23a.koulutus_SV as "Utbildningsbenämning (senast inledda högre utbildning)"
,d23a.iscle2011_SV as "Utbildningsnivå, nivå 1 (senast inledda högre utbildning)"
,d23a.Koulutusaste_taso2_SV as "Utbildningsnivå, nivå 2 (senast inledda högre utbildning)"
,d23a.iscfibroad2013_SV as "Utbildningsområde, nivå 1 (senast inledda högre utbildning)"
,d23a.iscfinarrow2013_SV as "Utbildningsområde, nivå 2 (senast inledda högre utbildning)"
,d23a.iscfi2013_SV as "Utbildningsområde, nivå 3 (senast inledda högre utbildning)"
,d23a.OKM_ohjauksen_ala_SV as "UKM-styrningsområde (senast inledda högre utbildning)"

,d23b.koulutus_SV as "Utbildningsbenämning (senast inledda annan utbildning)"
,d23b.iscle2011_SV as "Utbildningsnivå, nivå 1 (senast inledda annan utbildning)"
,d23b.Koulutusaste_taso2_SV as "Utbildningsnivå, nivå 2 (senast inledda annan utbildning)"
,d23b.iscfibroad2013_SV as "Utbildningsområde, nivå 1 (senast inledda annan utbildning)"
,d23b.iscfinarrow2013_SV as "Utbildningsområde, nivå 2 (senast inledda annan utbildning)"
,d23b.iscfi2013_SV as "Utbildningsområde, nivå 3 (senast inledda annan utbildning)"
,d23b.OKM_ohjauksen_ala_SV as "UKM-styrningsområde (senast inledda annan utbildning)"

,d24.kylla_ei_SV as "Samma examen som den som senast inletts"
,d25.kylla_ei_SV as "Studerar utbildning som leder till examen"
,d26.kylla_ei_SV as "Examen avlagd utomlands"

--en
,[Tilastointivuosi] as "Statistical year"
,d1.koulutusala2002_EN as "Field of education (2002)"
,d1.opintoala2002_EN as "Subfield of ed. (2002)"
,d1.koulutus_EN as "Name of education"
,d1.koulutusaste2002_EN as "Level of education (2002)"
,d1.opintoala1995_EN as "Field of education (1995)"
,d2.vuosiselite_EN as "Graduation year"
,d3.vuosiselite_EN as "Birth year"
,d4.oppisopimuskoulutus_EN as "Apprenticeship training"
,d5.sukupuoli_EN as "Gender"
,d6.ika5v_EN as "Age group"
,d7.aidinkieli_versio1_EN as "Mother tongue"
,d8.eumaa_EN as "Citizen of EU nation"
,d9.etamaa_EN as "Citizen of EEA nation"
,d10.pohjoismaa_EN as "Citizen of a nordic nation"
,d11.avi_EN as "AVI area of degree/qualif."
,d11.ely_EN as "ELY area of degree/qualif."
,d11.maakunta_EN as "Region of degree/qualif."
,d12.avi_EN as "AVI area of residence"
,d12.ely_EN as "ELY area of residence"
,d12.maakunta_EN as "Region of residence"
,d13.kansalaisuus_versio1_EN as "Nationality"
,d14.paaasiallinen_toiminta_EN as "Main type of activity"
,d15.ammattiluokitus_2010_paataso_EN as "Profession group"
,d15.ammattiluokitus_2010_2_taso_EN as "Profession"
,d16.tyossakayntitilaston_tyonantajasektori_EN as "Employer's sector"
,d17.ammattiluokitus_2001_EN as "Profession (2001)"
,d18.ika_EN as "Age"
--,d19.ika_EN as "Tutkinnon suoritusikä"
--,d20.ika_EN as "Tutkinnon ikä"
--,d21.koulutusmuoto_EN as "Koulutusmuoto"
--,d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_EN as "Amm. koul. koulutuslaji"
--sopv22-
,d23.koulutus_EN as "Name of education (latest started)"
,d23.iscle2011_EN as "Level of education, tier 1 (latest started)"
,d23.Koulutusaste_taso2_EN as "Level of education, tier 2 (latest started)"
,d23.iscfibroad2013_EN as "Field of education, tier 1 (latest started)"
,d23.iscfinarrow2013_EN as "Field of education, tier 2 (latest started)"
,d23.iscfi2013_EN as "Field of education, tier 3 (latest started)"
,d23.OKM_ohjauksen_ala_EN as "Field of education, HE steering (latest started)"

,d23a.koulutus_EN as "Name of education (latest started higher education)"
,d23a.iscle2011_EN as "Level of education, tier 1 (latest started higher education)"
,d23a.Koulutusaste_taso2_EN as "Level of education, tier 2 (latest started higher education)"
,d23a.iscfibroad2013_EN as "Field of education, tier 1 (latest started higher education)"
,d23a.iscfinarrow2013_EN as "Field of education, tier 2 (latest started higher education)"
,d23a.iscfi2013_EN as "Field of education, tier 3 (latest started higher education)"
,d23a.OKM_ohjauksen_ala_EN as "Field of education, HE steering (latest started higher education)"

,d23b.koulutus_EN as "Name of education (latest started secondary education)"
,d23b.iscle2011_EN as "Level of education, tier 1 (latest started secondary education)"
,d23b.Koulutusaste_taso2_EN as "Level of education, tier 2 (latest started secondary education)"
,d23b.iscfibroad2013_EN as "Field of education, tier 1 (latest started secondary education)"
,d23b.iscfinarrow2013_EN as "Field of education, tier 2 (latest started secondary education)"
,d23b.iscfi2013_EN as "Field of education, tier 3 (latest started secondary education)"
,d23b.OKM_ohjauksen_ala_EN as "Field of education, HE steering (latest started secondary education)"

,d24.kylla_ei_EN as "Qualification same as latest started"
,d25.kylla_ei_EN as "Studying in degree-awarding education"
,d26.kylla_ei_EN as "Qualification attained abroad"


--koodit
,d12.maakunta_koodi as 'Koodit Asuinmaakunta'
,d1.koulutus_koodi as 'Koodit Koulutusnimike'
,d1.koulutusaste2002_koodi as 'Koodit Koulutusaste 2002'
,d1.koulutusala2002_koodi as 'Koodit Koulutusala 2002'
,d1.opintoala1995_koodi as 'Koodit Koulutusala 1995'
,d1.opintoala2002_koodi as 'Koodit Opintoala 2002'
,d11.maakunta_koodi as 'Koodit Tutkinnon suoritusmaakunta'
,d28.jarjestys as 'Koodit Koulutuksen opetuskieli'
,d29.Koulutusaste_taso2_koodi as 'Koodit Koulutusaste taso2'


--isced
,case when d1.iscle2011_koodi in (-1,9) then 'Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon' else d1.iscle2011 end as "Koulutusaste, taso 1"
,case when d1.Koulutusaste_taso2_koodi in (-1,91) then 'Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon' else d1.Koulutusaste_taso2 end as "Koulutusaste, taso 2"
,d1.iscfibroad2013 as "Koulutusala, taso 1"
,d1.iscfinarrow2013 as "Koulutusala, taso 2"
,d1.iscfi2013 as "Koulutusala, taso 3"
,d1.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak."
,case when d1.iscle2011_koodi in (-1,9) then 'Ingen examen efter den grundläggande utbildningen eller examen okänd' else d1.iscle2011_SV end as "Utbildn.nivå, nivå 1"
,case when d1.Koulutusaste_taso2_koodi in (-1,91) then 'Ingen examen efter den grundläggande utbildningen eller examen okänd' else d1.Koulutusaste_taso2_SV end as "Utbildn.nivå, nivå 2"
,d1.iscfibroad2013_SV as "Utbildn.område, nivå 1"
,d1.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
,d1.iscfi2013_SV as "Utbildn.område, nivå 3"
,d1.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor"
,case when d1.iscle2011_koodi in (-1,9) then 'No degree after elementary education or degree unknown' else d1.iscle2011_EN end as "Level of ed., tier 1"
,case when d1.Koulutusaste_taso2_koodi in (-1,91) then 'No degree after elementary education or degree unknown' else d1.Koulutusaste_taso2_EN end as "Level of ed., tier 2"
,d1.iscfibroad2013_EN as "Field of education, tier 1"
,d1.iscfinarrow2013_EN as "Field of education, tier 2"
,d1.iscfi2013_EN as "Field of education, tier 3"
,d1.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"
,d1.jarjestys_iscle2011 as jarj_isced_koulast1
,case d1.jarjestys_Koulutusaste_taso2 when 91 then 998 else d1.jarjestys_Koulutusaste_taso2 end as jarj_isced_koulast2
,d1.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d1.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d1.jarjestys_iscfi2013 as jarj_isced_koulala3
,d1.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
,d1.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
,d1.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
,d1.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
,d1.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
,d1.iscfi2013_koodi as "Koodit Koulutusala, taso 3"
,d1.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala, korkeak."

FROM dbo.f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta f
LEFT JOIN d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
LEFT JOIN d_kausi d2 on d2.kausi_id = tutkinnon_suoritusvuosi_id
LEFT JOIN d_kausi d3 on d3.kausi_id = syntymavuosi_id
LEFT JOIN d_oppisopimuskoulutus d4 on d4.id = oppisopimuskoulutus_id
LEFT JOIN d_sukupuoli d5 on d5.id = sukupuoli_id
LEFT JOIN d_ika d6 on d6.id = vaeston_ika_5v_id
LEFT JOIN d_aidinkieli_versio1 d7 on d7.id = aidinkieli_versio1_id
LEFT JOIN d_valtio d8 on d8.id = eumaa_id
LEFT JOIN d_valtio d9 on d9.id = etamaa_id
LEFT JOIN d_pohjoismaa d10 on d10.id = pohjoismaa_id
LEFT JOIN d_alueluokitus d11 on d11.id = tutkinnon_suoritusmaakunta_id
LEFT JOIN d_alueluokitus d12 on d12.id = asuinmaakunta_id
LEFT JOIN d_kansalaisuus_versio1 d13 on d13.id = kansalaisuus_versio1_id
LEFT JOIN d_paaasiallinen_toiminta d14 on d14.id = f.paaasiallinen_toiminta_versio6_id
LEFT JOIN d_ammattiluokitus_2010 d15 on d15.id = ammattiluokitus_2010_id
LEFT JOIN d_tyossakayntitilaston_tyonantajasektori d16 on d16.id = tyossakayntitilaston_tyonantajasektori_id
LEFT JOIN d_ammattiluokitus_2001 d17 on d17.id = ammattiluokitus_2001_id
LEFT JOIN d_ika d18 on d18.id = vaeston_ika_1v_id
LEFT JOIN d_ika d19 on d19.id = tutkinnon_suoritusika_1v_id
LEFT JOIN d_ika d20 on d20.id = tutkinnon_ika_1v_id
LEFT JOIN d_koulutusmuoto d21 on d21.id = koulutusmuoto_id
LEFT JOIN d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 on d22.id = ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id
LEFT JOIN d_koulutusluokitus d23 on d23.id = -1
LEFT JOIN d_koulutusluokitus d23a on d23a.id = f.koulutusluokitus_korkein_viimeisin_aloitettu_ka_id
LEFT JOIN d_koulutusluokitus d23b on d23b.id = f.koulutusluokitus_korkein_viimeisin_aloitettu_ta_id
LEFT JOIN d_kylla_ei d24 on d24.id = f.d_kylla_ei_koulutusluokitus_korkein_viimeisin_aloitettu_sama_id
LEFT JOIN d_kylla_ei d25 on d25.id = f.d_kylla_ei_tutkintoon_johtavassa_koulutuksessa_id
LEFT JOIN d_kylla_ei d26 on d26.id = f.d_kylla_ei_tutkinto_suoritettu_ulkomailla_id

LEFT JOIN VipunenTK..d_kieli AS d28 ON d28.id = f.koulutuksen_opetuskieli_id
LEFT JOIN VipunenTK..d_koulutusluokitus AS d29 ON d29.id = f.kk_ensim_koulutusaste_id
LEFT JOIN VipunenTK..d_kausi AS d30 ON d30.kausi_id = f.kk_ensim_hakuvuosi_id
LEFT JOIN VipunenTK..d_koulutusluokitus AS d31 ON d31.id = f.ta_ensim_koulutusaste_id
LEFT JOIN VipunenTK..d_kausi AS d32 ON d32.kausi_id = f.ta_ensim_hakuvuosi_id

LEFT JOIN d_kylla_ei d33 on d33.id = f.aloittanut_ka_koulutuksen_id
LEFT JOIN d_kylla_ei d34 on d34.id = f.aloittanut_ta_koulutuksen_id

--WHERE aineisto <> 'R'

GO

