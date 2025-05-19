USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_vaeston_koulutusrakenne]    Script Date: 16.5.2025 13.56.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_f_vaeston_koulutusrakenne] AS

Select top 100
[15 vuotta täyttäneen väestön lukumäärä2] = lukumaara
,[Tilastointivuosi] as Tilastovuosi
,d1.koulutusala2002 as "Koulutusala"
,d1.jarjestys_koulutusala2002 as "koul02"
,d1.opintoala2002 as "Opintoala"
,d1.jarjestys_opintoala2002 as "op02"
,d1.koulutus as "Koulutusnimike"
,d1.koulutusaste2002 as "Koulutusaste"
,d1.jarjestys_koulutusaste2002 as "kast02"

--kuutiossa ja oikeasti "min_koulutusaste_taso2_ja_2002_koodi"; ratkaisun taustalla poistunut 2002-luokitus sekä mittariehtojen suuri määrä
,[koulutusaste2002_koodi] =
case 
	when d1.Koulutusaste_taso2_koodi in ('33','41') then '32'
	when d1.Koulutusaste_taso2_koodi = '51' then '50'
	when d1.Koulutusaste_taso2_koodi not in ('-1',' ','91') then d1.Koulutusaste_taso2_koodi
	else d1.koulutusaste2002_koodi
end

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
,d18.ika as "Ikä"
,d18.jarjestys_ika as "ikajarj"
,d19.ika as "Tutkinnon suoritusikä"
,d19.jarjestys_ika as "suorikajarj"
,d20.ika as "Tutkinnon ikä"
,d20.jarjestys_ika as "tutkikajarj"
,d21.koulutusmuoto as "Koulutusmuoto"
,d21.jarjestys as "koulmuotojarj"
,d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa as "Amm. koul. koulutuslaji"
,[Koulutuslaji] = 
	case d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
		when 'ammatillinen peruskoulutus; toinen aste, opistoaste, ammatillinen korkea-aste, (opetushallinnon 2002 koulutusluokituksen asteet 32, 50, 61)  sisältää myös sotilasalan ja ulkomailla suoritetut ammatilliset tutkinnot' then 'Ammatillinen perustutkinto'
		when 'ammatillinen lisäkoulutus, ammattitutkinto v. 1994 alkaen' then 'Ammattitutkinto'
		when 'ammatillinen lisäkoulutus, erikoisammattitutkinto v. 1994 alkaen' then 'Erikoisammattitutkinto'
		else d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
	end
,[Koulutuslaji apu] = 
	case d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
		when 'muu kuin ammatillinen koulutus; ylioppilas-, ammattikorkeakoulu- ja yliopistotutkinnot, työllisyyskurssikoulutukset (kouljat=2), aikuiskoulutuksen jatkolinjat (kouljat=9)' then 1
		else 0
	end
,[Ikä 10v] = 
	case 
		when d18.ika >= '15' and d18.ika <= '24' then '15-24-vuotiaat'
		when d18.ika >= '25' and d18.ika <= '34' then '25-34-vuotiaat'
		when d18.ika >= '35' and d18.ika <= '44' then '35-44-vuotiaat'
		when d18.ika >= '45' and d18.ika <= '54' then '45-54-vuotiaat'
		when d18.ika >= '55' and d18.ika <= '64' then '55-64-vuotiaat'
		when d18.ika >= '65' and d18.ika <= '74' then '65-74-vuotiaat'
		when d18.ika > '74' then 'yli 74-vuotiaat'
		else 'Tuntematon'
	end
,[Ikä 10v jarj] = 
	case 
		when d18.ika >= '15' and d18.ika <= '24' then 1
		when d18.ika >= '25' and d18.ika <= '34' then 2
		when d18.ika >= '35' and d18.ika <= '44' then 3
		when d18.ika >= '45' and d18.ika <= '54' then 4
		when d18.ika >= '55' and d18.ika <= '64' then 5
		when d18.ika >= '65' and d18.ika <= '74' then 6
		when d18.ika > '74' then 7
		else 8
	end
,d22.jarjestys as "amkouljarj"

/*sopv22 alkaen: korkein viimeiseksi aloitettu koulutus, tutkintoon johtavassa koulutuksessa opiskelu sekä tutkinnon ulkomaisuus*/
,d23.koulutus as "Koulutusnimike (viim. aloitettu)"
,d23.iscle2011 as "Koulutusaste, taso 1 (viim. aloitettu)"
,d23.Koulutusaste_taso2 as "Koulutusaste, taso 2 (viim. aloitettu)"
,d23.iscfibroad2013 as "Koulutusala, taso 1 (viim. aloitettu)"
,d23.iscfinarrow2013 as "Koulutusala, taso 2 (viim. aloitettu)"
,d23.iscfi2013 as "Koulutusala, taso 3 (viim. aloitettu)"
,d23.OKM_ohjauksen_ala as "OKM ohjauksen ala (viim. aloitettu)"
,d24.kylla_ei as "Tutkinto sama kuin viim. aloitettu"
,d25.kylla_ei as "Opiskelee tutk. joht. koulutuksessa"
,d26.kylla_ei as "Tutkinto suoritettu ulkomailla"
--
,d23.koulutus_koodi as "Koodit Koulutusnimike (viim. aloitettu)"
,d23.iscle2011_koodi as "Koodit Koulutusaste, taso 1 (viim. aloitettu)"
,d23.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2 (viim. aloitettu)"
,d23.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1 (viim. aloitettu)"
,d23.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2 (viim. aloitettu)"
,d23.iscfi2013_koodi as "Koodit Koulutusala, taso 3 (viim. aloitettu)"
,d23.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala (viim. aloitettu)"
--
,d23.jarjestys_iscle2011 as jarj_isced_koulast1_viim_aloitettu
,d23.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2_viim_aloitettu
,d23.jarjestys_iscfibroad2013 as jarj_isced_koulala1_viim_aloitettu
,d23.jarjestys_iscfinarrow2013 as jarj_isced_koulala2_viim_aloitettu
,d23.jarjestys_iscfi2013 as jarj_isced_koulala3_viim_aloitettu
,d23.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1_viim_aloitettu

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

--ruotsi
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
,d18.ika_SV as "Ålder"
--sopv22-
,d23.koulutus_SV as "Utbildningsbenämning (senast inledda)"
,d23.iscle2011_SV as "Utbildningsnivå, nivå 1 (senast inledda)"
,d23.Koulutusaste_taso2_SV as "Utbildningsnivå, nivå 2 (senast inledda)"
,d23.iscfibroad2013_SV as "Utbildningsområde, nivå 1 (senast inledda)"
,d23.iscfinarrow2013_SV as "Utbildningsområde, nivå 2 (senast inledda)"
,d23.iscfi2013_SV as "Utbildningsområde, nivå 3 (senast inledda)"
,d23.OKM_ohjauksen_ala_SV as "UKM-styrningsområde (senast inledda)"
,d24.kylla_ei_SV as "Samma examen som den som senast inletts"
,d25.kylla_ei_SV as "Studerar utbildning som leder till examen"
,d26.kylla_ei_SV as "Examen avlagd utomlands"


--englanti
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
,d18.ika_EN as "Age"
--sopv22-
,d23.koulutus_EN as "Name of education (latest started)"
,d23.iscle2011_EN as "Level of education, tier 1 (latest started)"
,d23.Koulutusaste_taso2_EN as "Level of education, tier 2 (latest started)"
,d23.iscfibroad2013_EN as "Field of education, tier 1 (latest started)"
,d23.iscfinarrow2013_EN as "Field of education, tier 2 (latest started)"
,d23.iscfi2013_EN as "Field of education, tier 3 (latest started)"
,d23.OKM_ohjauksen_ala_EN as "Field of education, HE steering (latest started)"
,d24.kylla_ei_EN as "Qualification same as latest started"
,d25.kylla_ei_EN as "Studying in degree-awarding education"
,d26.kylla_ei_EN as "Qualification attained abroad"


--koodit
,d12.maakunta_koodi as 'Koodit Asuinmaakunta'
,d1.koulutusaste2002_koodi as 'Koodit Koulutusaste 2002'
,d1.koulutusala2002_koodi as 'Koodit Koulutusala 2002'
,d1.opintoala1995_koodi as 'Koodit Koulutusala 1995'
,d1.opintoala2002_koodi as 'Koodit Opintoala 2002'
,d1.koulutus_koodi as 'Koodit Koulutusnimike'
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
LEFT JOIN d_koulutusluokitus d1 on d1.id = f.koulutusluokitus_id
LEFT JOIN d_kausi d2 on d2.kausi_id = f.tutkinnon_suoritusvuosi_id
LEFT JOIN d_kausi d3 on d3.kausi_id = f.syntymavuosi_id
LEFT JOIN d_oppisopimuskoulutus d4 on d4.id = f.oppisopimuskoulutus_id
LEFT JOIN d_sukupuoli d5 on d5.id = f.sukupuoli_id
LEFT JOIN d_ika d6 on d6.id = f.vaeston_ika_5v_id
LEFT JOIN d_aidinkieli_versio1 d7 on d7.id = f.aidinkieli_versio1_id
LEFT JOIN d_valtio d8 on d8.id = f.eumaa_id
LEFT JOIN d_valtio d9 on d9.id = f.etamaa_id
LEFT JOIN d_pohjoismaa d10 on d10.id = f.pohjoismaa_id
LEFT JOIN d_alueluokitus d11 on d11.id = f.tutkinnon_suoritusmaakunta_id
LEFT JOIN d_alueluokitus d12 on d12.id = f.asuinmaakunta_id
LEFT JOIN d_kansalaisuus_versio1 d13 on d13.id = f.kansalaisuus_versio1_id
LEFT JOIN d_ika d18 on d18.id = f.vaeston_ika_1v_id
LEFT JOIN d_ika d19 on d19.id = f.tutkinnon_suoritusika_1v_id
LEFT JOIN d_ika d20 on d20.id = f.tutkinnon_ika_1v_id
LEFT JOIN d_koulutusmuoto d21 on d21.id = f.koulutusmuoto_id
LEFT JOIN d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 on d22.id = f.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id
LEFT JOIN d_koulutusluokitus d23 on d23.id = f.koulutusluokitus_korkein_viimeisin_aloitettu_id
LEFT JOIN d_kylla_ei d24 on d24.id = f.d_kylla_ei_koulutusluokitus_korkein_viimeisin_aloitettu_sama_id
LEFT JOIN d_kylla_ei d25 on d25.id = f.d_kylla_ei_tutkintoon_johtavassa_koulutuksessa_id
LEFT JOIN d_kylla_ei d26 on d26.id = f.d_kylla_ei_tutkinto_suoritettu_ulkomailla_id

LEFT JOIN VipunenTK..d_kieli AS d28 ON d28.id = f.koulutuksen_opetuskieli_id
LEFT JOIN VipunenTK..d_koulutusluokitus AS d29 ON d29.id = f.kk_ensim_koulutusaste_id
LEFT JOIN VipunenTK..d_kausi AS d30 ON d30.kausi_id = f.kk_ensim_hakuvuosi_id
LEFT JOIN VipunenTK..d_koulutusluokitus AS d31 ON d31.id = f.ta_ensim_koulutusaste_id
LEFT JOIN VipunenTK..d_kausi AS d32 ON d32.kausi_id = f.ta_ensim_hakuvuosi_id

--WHERE aineisto = 'R'

GO


