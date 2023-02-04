USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_jatkuva_oppiminen_uudet_opiskelijat_1_21_1_22_cultures]    Script Date: 4.2.2023 4:11:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_f_tab_jatkuva_oppiminen_uudet_opiskelijat_1_21_1_22_cultures] AS

SELECT --top 1000
	
	--tilastovuosi = f.tilv,
	
  --APU / PIILOSUODATIN
	apusarake_lkm = f.lkm
	,f.aineisto
	,f.lahde
	,f.sektori

  --FI
	,tilastovuosi_fi = f.tilv
	,koulutussektori_fi = d0.koulutussektori
	,ikaryhma_fi = d1.ika
	,ika_25_64_vuotta_fi = d2.kylla_ei
	,sukupuoli_fi = d3.sukupuoli
	,syntypera_fi = d4.syntypera
	,asuinkunnan_kuntaryhma_fi = d6.kuntaryhma
	,asuinkunnan_suuralue_fi = d7.suuralue
	,paaasiallinen_toiminta_fi = d8.paaasiallinen_toiminta_versio2
	,sosioekonominen_asema_fi = d9.sosioekonominen_asema_ryhma
	,pienituloisuus_fi = case d10.kylla_ei when 'Kyllä' then 'Pienituloinen' when 'Ei' then 'Ei pienituloinen' else 'Ei tietoa' end
	,toimiala_fi = d11.toimiala_2008
	,koulutusaste_taso_1_fi = 
		case 
			when f.kaste_t2_3 = '78' then 'Yliopistojen jatkokoulutus (lääkärien erikoistumiskoulutus, lisensiaatintutkinto tai tohtorintutkinto)' 
			else d12.iscle2011 
		end
	,koulutusaste_taso_2_fi = 
		case 
			when f.kaste_t2_3 = '78' then 'Yliopistojen jatkokoulutus (lääkärien erikoistumiskoulutus, lisensiaatintutkinto tai tohtorintutkinto)' 
			else d12.Koulutusaste_taso2 
		end
    ,koulutusala_taso_1_fi = d13.iscfibroad2013
	,koulutusala_taso_2_fi = d13.iscfinarrow2013
	,koulutusala_taso_3_fi = d13.iscfi2013
	,koulutustyyppi_fi = d14.tutkintoon_johtamaton_koulutus
	,tavoite_koulutuksessa_fi = d15.tutkinnon_tavoite
	,tyovoimakoulutus_fi = d16.kylla_ei
	,[korkein_aiempi_tutkinto_fi] = d30.tutkinto
	,[aiempi_yo_tutkinto_fi] = d31.kylla_ei
	,[aiempi_amm_perustutkinto_fi] = d32b.kylla_ei
	,[aiempi_ammatti_erikoisammattitutkinto_fi] = d32c.kylla_ei
	,[aiempi_amk_tutkinto_fi] = d33.kylla_ei
	,[aiempi_alempi_kk_tutkinto_fi] = d34.kylla_ei
	,[aiempi_ylempi_amk_tutkinto_fi] = d35.kylla_ei
	,[aiempi_ylempi_kk_tutkinto_fi] = d36.kylla_ei
	,[vuotta_kulunut_korkein_tutkinto_fi] = coalesce('Suoritettu '+[korkein_aiempi_tutkinto_vuotta_kulunut]+' v. ennen aloitusta', 'Tuntematon')
	,[vuotta_kulunut_yo_tutkinto_fi] = coalesce('Suoritettu '+[aikyo_vuotta_kulunut]+' v. ennen aloitusta', 'Tuntematon')
	,[vuotta_kulunut_amm_perustutkinto_fi] = coalesce('Suoritettu '+[aikpt_vuotta_kulunut]+' v. ennen aloitusta', 'Tuntematon')
	,[vuotta_kulunut_ammatti_erikoisammattitutkinto_fi] = coalesce('Suoritettu '+[aikateat_vuotta_kulunut]+' v. ennen aloitusta', 'Tuntematon')
	,[vuotta_kulunut_amk_tutkinto_fi] = coalesce('Suoritettu '+[aikamk_vuotta_kulunut]+' v. ennen aloitusta', 'Tuntematon')
	,[vuotta_kulunut_alempi_kk_tutkinto_fi] = coalesce('Suoritettu '+[aikalkk_vuotta_kulunut]+' v. ennen aloitusta', 'Tuntematon')
	,[vuotta_kulunut_ylempi_amk_tutkinto_fi] = coalesce('Suoritettu '+[aikylamk_vuotta_kulunut]+' v. ennen aloitusta', 'Tuntematon')
	,[vuotta_kulunut_ylempi_kk_tutkinto_fi] = coalesce('Suoritettu '+[aikylkk_vuotta_kulunut]+' v. ennen aloitusta', 'Tuntematon')


  --SV
	,tilastovuosi_sv = f.tilv
	,koulutussektori_sv = d0.koulutussektori_sv
	,ikaryhma_sv = d1.ika_sv
	,ika_25_64_vuotta_sv = d2.kylla_ei_sv
	,sukupuoli_sv = d3.sukupuoli_sv
	,syntypera_sv = d4.syntypera_sv
	,asuinkunnan_kuntaryhma_sv = d6.kuntaryhma_sv
	,asuinkunnan_suuralue_sv = d7.suuralue_sv
	,paaasiallinen_toiminta_sv = d8.paaasiallinen_toiminta_versio2_sv
	,sosioekonominen_asema_sv = d9.sosioekonominen_asema_ryhma_sv
	,pienituloisuus_sv = case d10.kylla_ei when 'Kyllä' then 'Låginkomsttagare' when 'Ei' then 'Ej låginkomsttagare' else 'Information saknas' end
	,toimiala_sv = d11.toimiala_2008_sv
	,koulutusaste_taso_1_sv = 
		case 
			when f.kaste_t2_3 = '78' then 'Universitet, påbyggnadsutbildning (licentiat- och doktorsutbildning, specialiseringsutbildning för läkare)' 
			else d12.iscle2011_sv 
		end
	,koulutusaste_taso_2_sv = 
		case 
			when f.kaste_t2_3 = '78' then 'Universitet, påbyggnadsutbildning (licentiat- och doktorsutbildning, specialiseringsutbildning för läkare)' 
			else d12.Koulutusaste_taso2_sv 
		end
    ,koulutusala_taso_1_sv = d13.iscfibroad2013_sv
	,koulutusala_taso_2_sv = d13.iscfinarrow2013_sv
	,koulutusala_taso_3_sv = d13.iscfi2013_sv
	,koulutustyyppi_sv = d14.tutkintoon_johtamaton_koulutus_sv
	,tavoite_koulutuksessa_sv = d15.tutkinnon_tavoite_sv
	,tyovoimakoulutus_sv = d16.kylla_ei_sv
	,[korkein_aiempi_tutkinto_sv] = d30.tutkinto_sv
	,[aiempi_yo_tutkinto_sv] = d31.kylla_ei_sv
	,[aiempi_amm_perustutkinto_sv] = d32b.kylla_ei_sv
	,[aiempi_ammatti_erikoisammattitutkinto_sv] = d32c.kylla_ei_sv
	,[aiempi_amk_tutkinto_sv] = d33.kylla_ei_sv
	,[aiempi_alempi_kk_tutkinto_sv] = d34.kylla_ei_sv
	,[aiempi_ylempi_amk_tutkinto_sv] = d35.kylla_ei_sv
	,[aiempi_ylempi_kk_tutkinto_sv] = d36.kylla_ei_sv
	,[vuotta_kulunut_korkein_tutkinto_sv] = coalesce('Avlagd '+[korkein_aiempi_tutkinto_vuotta_kulunut]+' år före början', 'Information saknas')
	,[vuotta_kulunut_yo_tutkinto_sv] = coalesce('Avlagd '+[aikyo_vuotta_kulunut]+' år före början', 'Information saknas')
	,[vuotta_kulunut_amm_perustutkinto_sv] = coalesce('Avlagd '+[aikpt_vuotta_kulunut]+' år före början', 'Information saknas')
	,[vuotta_kulunut_ammatti_erikoisammattitutkinto_sv] = coalesce('Avlagd '+[aikateat_vuotta_kulunut]+' år före början', 'Information saknas')
	,[vuotta_kulunut_amk_tutkinto_sv] = coalesce('Avlagd '+[aikamk_vuotta_kulunut]+' år före början', 'Information saknas')
	,[vuotta_kulunut_alempi_kk_tutkinto_sv] = coalesce('Avlagd '+[aikalkk_vuotta_kulunut]+' år före början', 'Information saknas')
	,[vuotta_kulunut_ylempi_amk_tutkinto_sv] = coalesce('Avlagd '+[aikylamk_vuotta_kulunut]+' år före början', 'Information saknas')
	,[vuotta_kulunut_ylempi_kk_tutkinto_sv] = coalesce('Avlagd '+[aikylkk_vuotta_kulunut]+' år före början', 'Information saknas')


  --EN
	,tilastovuosi_en = f.tilv
	,koulutussektori_en = d0.koulutussektori_en
	,ikaryhma_en = d1.ika_en
	,ika_25_64_vuotta_en = d2.kylla_ei_en
	,sukupuoli_en = d3.sukupuoli_en
	,syntypera_en = d4.syntypera_en
	,asuinkunnan_kuntaryhma_en = d6.kuntaryhma_en
	,asuinkunnan_suuralue_en = d7.suuralue_en
	,paaasiallinen_toiminta_en = d8.paaasiallinen_toiminta_versio2_en
	,sosioekonominen_asema_en = d9.sosioekonominen_asema_ryhma_en
	,pienituloisuus_en = case d10.kylla_ei when 'Kyllä' then 'Low-income earner' when 'Ei' then 'Not low-income earner' else 'Missing data' end
	,toimiala_en = d11.toimiala_2008_en
	,koulutusaste_taso_1_en = 
		case 
			when f.kaste_t2_3 = '78' 
			  then 'Postgraduate education at universities (Licentiate''s and Doctor''s degrees, specialist training in medicine, dentistry, veterinary medicine)' 
			else d12.iscle2011_en 
		end
	,koulutusaste_taso_2_en = 
		case 
			when f.kaste_t2_3 = '78' 
			  then 'Postgraduate education at universities (Licentiate''s and Doctor''s degrees, specialist training in medicine, dentistry, veterinary medicine)' 
			else d12.Koulutusaste_taso2_en 
		end
    ,koulutusala_taso_1_en = d13.iscfibroad2013_en
	,koulutusala_taso_2_en = d13.iscfinarrow2013_en
	,koulutusala_taso_3_en = d13.iscfi2013_en
	,koulutustyyppi_en = d14.tutkintoon_johtamaton_koulutus_en
	,tavoite_koulutuksessa_en = d15.tutkinnon_tavoite_en
	,tyovoimakoulutus_en = d16.kylla_ei_en
	,[korkein_aiempi_tutkinto_en] = d30.tutkinto_en
	,[aiempi_yo_tutkinto_en] = d31.kylla_ei_en
	,[aiempi_amm_perustutkinto_en] = d32b.kylla_ei_en
	,[aiempi_ammatti_erikoisammattitutkinto_en] = d32c.kylla_ei_en
	,[aiempi_amk_tutkinto_en] = d33.kylla_ei_en
	,[aiempi_alempi_kk_tutkinto_en] = d34.kylla_ei_en
	,[aiempi_ylempi_amk_tutkinto_en] = d35.kylla_ei_en
	,[aiempi_ylempi_kk_tutkinto_en] = d36.kylla_ei_en
	,[vuotta_kulunut_korkein_tutkinto_en] = coalesce('Completed '+[korkein_aiempi_tutkinto_vuotta_kulunut]+' year(s) before start', 'Missing data')
	,[vuotta_kulunut_yo_tutkinto_en] = coalesce('Completed '+[aikyo_vuotta_kulunut]+' year(s) before start', 'Missing data')
	,[vuotta_kulunut_amm_perustutkinto_en] = coalesce('Completed '+[aikpt_vuotta_kulunut]+' year(s) before start', 'Missing data')
	,[vuotta_kulunut_ammatti_erikoisammattitutkinto_en] = coalesce('Completed '+[aikateat_vuotta_kulunut]+' year(s) before start', 'Missing data')
	,[vuotta_kulunut_amk_tutkinto_en] = coalesce('Completed '+[aikamk_vuotta_kulunut]+' year(s) before start', 'Missing data')
	,[vuotta_kulunut_alempi_kk_tutkinto_en] = coalesce('Completed '+[aikalkk_vuotta_kulunut]+' year(s) before start', 'Missing data')
	,[vuotta_kulunut_ylempi_amk_tutkinto_en] = coalesce('Completed '+[aikylamk_vuotta_kulunut]+' year(s) before start', 'Missing data')
	,[vuotta_kulunut_ylempi_kk_tutkinto_en] = coalesce('Completed '+[aikylkk_vuotta_kulunut]+' year(s) before start', 'Missing data')


  --KOODIT
	,koodit_paaasiallinen_toiminta = d8.paaasiallinen_toiminta_versio2_koodi
	,koodit_sosioekonominen_asema = d9.sosioekonominen_asema_koodi
	,koodit_toimiala = d11.toimiala_2008_koodi
	,koodit_koulutusaste_taso_1 = d12.iscle2011_koodi
	,koodit_koulutusaste_taso_2 = d12.Koulutusaste_taso2_koodi
	,koodit_koulutusala_taso_1 = d13.iscfi2013_koodi
	,koodit_koulutusala_taso_2 = d13.iscfinarrow2013_koodi
	,koodit_koulutusala_taso_3 = d13.iscfibroad2013_koodi
	,koodit_koulutustyyppi = d14.tutkintoon_johtamaton_koulutus_koodi


  --JARJESTYS
    ,jarjestys_koulutussektori = d0.jarjestys
  	,jarjestys_ikaryhma = coalesce(nullif(f.ikar8, '-1'), '99')
	,jarjestys_ika_25_64_vuotta = d2.jarjestys
	,jarjestys_sukupuoli = d3.jarjestys
	,jarjestys_syntypera = d4.jarjestys
	,jarjestys_asuinkunnan_kuntaryhma = d6.jarjestys
	,jarjestys_asuinkunnan_suuralue = d7.jarjestys_suuralue
	,jarjestys_paaasiallinen_toiminta = d8.jarjestys
	,jarjestys_sosioekonominen_asema = d9.jarjestys_ryhma
	,jarjestys_pienituloisuus = d10.jarjestys
	,jarjestys_toimiala = coalesce(nullif(d11.toimiala_2008_koodi, '-1'), 'Ö')
	,jarjestys_koulutusaste_taso_1 = d12.jarjestys_iscle2011
	,jarjestys_koulutusaste_taso_2 = d12.jarjestys_Koulutusaste_taso2
    ,jarjestys_koulutusala_taso_1 = d13.jarjestys_iscfibroad2013
	,jarjestys_koulutusala_taso_2 = d13.jarjestys_iscfinarrow2013
	,jarjestys_koulutusala_taso_3 = d13.jarjestys_iscfi2013
	,jarjestys_koulutustyyppi = d14.jarjestys
	,jarjestys_tavoite_koulutuksessa = d15.jarjestys
	,jarjestys_tyovoimakoulutus = d16.jarjestys
	,jarjestys_korkein_aiempi_tutkinto = /*case when d30.tutkinto_avain = 'eiper' then 99 else 99 -*/ d30.jarjestys --end
	,jarjestys_aiempi_yo_tutkinto = d31.jarjestys
	,jarjestys_aiempi_amm_perustutkinto = d32b.jarjestys
	,jarjestys_aiempi_ammatti_erikoisammattitutkinto = d32c.jarjestys
	,jarjestys_aiempi_amk_tutkinto = d33.jarjestys
	,jarjestys_aiempi_alempi_kk_tutkinto = d34.jarjestys
	,jarjestys_aiempi_ylempi_amk_tutkinto = d35.jarjestys
	,jarjestys_aiempi_ylempi_kk_tutkinto = d36.jarjestys


FROM [VipunenTK].[dbo].[f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat] f

LEFT JOIN dbo.d_koulutussektori d0 on d0.id = f.sektori_id
LEFT JOIN dbo.d_ika d1 on d1.id = f.ikar8_id
LEFT JOIN dbo.d_kylla_ei d2 on d2.id = f.ika_25_64_vuotta_id
LEFT JOIN dbo.d_sukupuoli d3 on d3.id = f.sp_id
LEFT JOIN dbo.d_syntypera d4 on d4.id = f.syntyp2_id
LEFT JOIN dbo.d_kuntaryhma d6 on d6.id = f.tilvaskunryh_id
LEFT JOIN dbo.d_alueluokitus d7 on d7.id = f.tilvaskunsuuraluer2_id
LEFT JOIN dbo.d_paaasiallinen_toiminta_versio2 d8 on d8.id = f.ptoim1r6e_id --r6 <-> r2 pl. varusmies- & siviilipalvelus
LEFT JOIN dbo.d_sosioekonominen_asema d9 on d9.id = f.sosee_id
LEFT JOIN dbo.d_kylla_ei d10 on d10.id = f.pientul_id
LEFT JOIN dbo.d_toimiala_2008 d11 on d11.id = f.tol2008_1_v2_id
LEFT JOIN dbo.d_koulutusluokitus d12 on d12.id = f.kaste_t2_3_id
LEFT JOIN dbo.d_koulutusluokitus d13 on d13.id = f.iscfi2013_id
LEFT JOIN dbo.d_tutkintoon_johtamaton_koulutus d14 on d14.id = f.eitutkjoht_id
LEFT JOIN dbo.d_tutkinnon_tavoite d15 on d15.id = f.tavoite_id
LEFT JOIN dbo.d_kylla_ei d16 on d16.id = f.tyov_id
LEFT JOIN dbo.d_tutkinto d30 on d30.id = f.korkein_aiempi_tutkinto_id
LEFT JOIN dbo.d_kylla_ei d31 on d31.id = f.aikyo_id
LEFT JOIN dbo.d_kylla_ei d32b on d32b.id = f.aikpt_id
LEFT JOIN dbo.d_kylla_ei d32c on d32c.id = f.aikateat_id
LEFT JOIN dbo.d_kylla_ei d33 on d33.id = f.aikamk_id
LEFT JOIN dbo.d_kylla_ei d34 on d34.id = f.aikalkk_id
LEFT JOIN dbo.d_kylla_ei d35 on d35.id = f.aikylamk_id
LEFT JOIN dbo.d_kylla_ei d36 on d36.id = f.aikylkk_id

GO
