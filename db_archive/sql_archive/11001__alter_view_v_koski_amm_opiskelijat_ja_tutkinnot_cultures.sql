USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures]    Script Date: 30.7.2025 10.26.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures] AS

SELECT --top 1000
	
	[opiskeluoikeuden_alkamisajankohta] = oo_alkamisajankohta

	--fi
	,[tilastovuosi_fi] = f.tilastovuosi
	,[tilastokuukausi_fi] = d14.kuukausi_fi
	,[opiskeluoikeus_alkanut_tilastokuukauden_aikana_fi] = d33.kytkin_fi

	,[sukupuoli_fi] = d1.sukupuoli_fi
	,[aidinkieli_fi] = d2.kieliryhma2_fi
	,[ika_fi] = d3.ikaryhma6_fi
	,[ikaryhma_fi] = d3.ikaryhma3_fi
	,[ikaryhma2_fi] =
		case
			when d3.[ika_avain] <= 18 then d3.[ikaryhma2_fi]
			else 'yli 18-vuotiaat'
		end
	,[kansalaisuus_tarkka_fi] = d22.maatjavaltiot2_fi
	,[kansalaisuus_fi] = d22.maanosa1_fi
	,[kansalaisuus_maanosa_fi] = d22.maanosa0_fi
	,[kotikunta_nykyinen_fi] = d0.kunta_fi
	,[kotimaakunta_nykyinen_fi] = d0.maakunta_fi
	,[kotikunnan_hyvinvointialue_nykyinen_fi] = d0.hyvinvointialue_fi
	,[tutkintotyypin_ryhma_fi] = case when d24.kytkin_koodi = 1 then 'Muu ammatillinen koulutus' else d4.tutkintotyypin_ryhma_fi end
	,[tutkintotyyppi_fi] = 
		case 
			when valmentava_koodi = 1 then 'VALMA' 
			when valmentava_koodi = 2 then 'TELMA' 
			when valmentava_koodi = 3 then 'TUVA' 
			when d24.kytkin_koodi = 1 then 'Muu ammatillinen koulutus' 
			else d4.tutkintotyyppi_fi 
		end
	,[tutkinto_fi] = d4.koulutusluokitus_fi  
	,[koulutusala_taso_3_fi] = d4.koulutusalataso3_fi  
	,[koulutusala_taso_2_fi] = d4.koulutusalataso2_fi 
	,[koulutusala_taso_1_fi] = d4.koulutusalataso1_fi 
	,[osaamisala_fi] = d20.selite_fi
	,[tutkintonimike_fi] = d40.tutkintonimike_fi
	,[suorituskieli_fi] = d23.suorituskieli_ammatillinen_fi
	,[osa_aikaisuus_fi] = d16.kytkin_fi
	,[suorituksen_tyyppi_fi] = d17.selite_fi
	,[kustannusryhma_fi] = d18.selite_fi 
	,[rahoitusmuoto_fi] = d19.selite_fi
	,[koulutusvienti_fi] = d38.kytkin_fi
	,[hankintakoulutus_fi] = d39.kytkin_fi
	,[erityisopetus_fi] = d13.erityisopetus_ryhma_fi
	,[majoitus_fi] = d15.majoitus_nimi_fi
	,[oppisopimuskoulutus_fi] = d6a.kytkin_fi
	,[koulutussopimus_fi] = d6b.kytkin_fi 
	,[vankilaopetus_fi] = d7.kytkin_fi 
	,[henkilostokoulutus_fi] = d8.kytkin_fi 
	,[tyovoimakoulutus_fi] = d19b.kytkin_fi 

	,[oppilaitos_fi] = d5.organisaatio_fi
	,[koulutuksen_jarjestaja_fi] = d11.organisaatio_fi
	,[hankintakoulutuksen_jarjestaja_fi] = d11b.organisaatio_fi
	,[toimipiste_fi] = d21.organisaatio_fi
	,[oppilaitoksen_kunta_fi] = d10.kunta_fi
	,[oppilaitoksen_maakunta_fi] = d10.maakunta_fi
	,[oppilaitoksen_hyvinvointialue_fi] = d10.hyvinvointialue_fi
	,[toimipisteen_kunta_fi] = d34.kunta_fi
	,[toimipisteen_maakunta_fi] = d34.maakunta_fi
	,[toimipisteen_hyvinvointialue_fi] = d34.hyvinvointialue_fi
	,[oppilaitoksen_avi_fi] = d10.avi_fi
	,[oppilaitoksen_ely_fi] = d10.ely_fi 
	,[oppilaitoksen_opetuskieli_fi] = d5.oppilaitoksenopetuskieli_fi
	,[oppilaitostyyppi_fi] = d5.oppilaitostyyppi_fi
	,[koulutuksen_jarjestajan_kunta_fi] = d12.kunta_fi 
	,[koulutuksen_jarjestajan_maakunta_fi] = d12.maakunta_fi 
	,[koulutuksen_jarjestajan_hyvinvointialue_fi] = d12.hyvinvointialue_fi 
	,[koulutuksen_jarjestajan_ely_fi] = d12.ely_fi 
	,[koulutuksen_jarjestajan_avi_fi] = d12.avi_fi  
	,[koulutuksen_jarjestajan_omistajatyyppi_fi] = coalesce(ot_tk.koulutuksen_jarjestajan_omistajatyyppi, case when d11.organisaatio_fi like '% Oy' then 'Yksityinen' end)
	,[koulutuksen_jarjestajan_opetuskieli_fi] = coalesce(d37.opetuskieli_fi, 'Tieto puuttuu')

	,[oppisopimuksen_suoritusosuus_fi] = oppisopimus_osuus
	,[koulutussopimuksen_suoritusosuus_fi] = koulutussopimus_osuus
	,[oppisopimus_koulutussopimus_fi] = d26.selite_fi

	,[ika_opiskeluoikeuden_alkamisvuonna_fi] = d27.ikaryhma6_fi
	,[ika_opiskeluoikeuden_alkamishetkella_fi] = d28.ikaryhma6_fi
	,[ika_oppisopimusjakson_alkamisvuonna_fi] = case when d6a.kytkin_koodi <> '1' then 'Ei oppisopimusjaksoja' else d29.ikaryhma6_fi end
	,[ika_oppisopimusjakson_alkamishetkella_fi] = case when d6a.kytkin_koodi <> '1' then 'Ei oppisopimusjaksoja' else d30.ikaryhma6_fi end
	,[opiskeluoikeuden_alkamisvuosi_fi] = d31.vuosi
	,[opiskeluoikeuden_alkamiskuukausi_fi] = d31.kuukausi_fi
	,[oppisopimusjakson_alkamisvuosi_fi] = case when d6a.kytkin_koodi <> '1' then 'Ei oppisopimusjaksoja' else cast(d32.vuosi as nvarchar(20)) end
	,[oppisopimusjakson_alkamiskuukausi_fi] = case when d6a.kytkin_koodi <> '1' then 'Ei oppisopimusjaksoja' else d32.kuukausi_fi end

	--CSCVIPUNEN-3345 16.3.2023
	,[kotikunta_manner_suomessa_fi] = d35.kytkin_fi
	,[oppivelvollinen_1_8_2021_fi] = d36.kytkin_fi
	--CSCVIPUNEN-3345 16.3.2023

	,eronnut_fi = coalesce(d25b.keskeyttaminen_opiskelijan_toiminta_taso0_fi, 'Ei eronnut')
	,jatkoi_keskeytti_vaihtoi_fi = coalesce(d25b.keskeyttaminen_opiskelijan_toiminta_taso1_fi, 'Ei eronnut')
	,opiskelijan_tilanne_fi = coalesce(d25b.keskeyttaminen_opiskelijan_toiminta_fi, 'Ei eronnut')
	,jarjestys_opiskelijan_tilanne = coalesce(d25b.keskeyttaminen_opiskelijan_toiminta_jarjestys, 0)
	
	
	--sv
	,[tilastovuosi_sv] = f.tilastovuosi
	,[tilastokuukausi_sv] = d14.kuukausi_sv
	,[opiskeluoikeus_alkanut_tilastokuukauden_aikana_sv] = d33.kytkin_sv

	,[sukupuoli_sv] = d1.sukupuoli_sv
	,[aidinkieli_sv] = d2.kieliryhma2_sv
	,[ika_sv] = d3.ikaryhma6_sv
	,[ikaryhma_sv] = d3.ikaryhma3_sv
	,[ikaryhma2_sv] =
		case
			when d3.[ika_avain] <= 18 then d3.[ikaryhma2_sv]
			else 'över 18 år'
		end
	,[kansalaisuus_tarkka_sv] = d22.maatjavaltiot2_sv
	,[kansalaisuus_sv] = d22.maanosa1_sv
	,[kansalaisuus_maanosa_sv] = d22.maanosa0_sv
	,[kotikunta_nykyinen_sv] = d0.kunta_sv
	,[kotimaakunta_nykyinen_sv] = d0.maakunta_sv
	,[kotikunnan_hyvinvointialue_nykyinen_sv] = d0.hyvinvointialue_sv
	,[tutkintotyypin_ryhma_sv] = case when d24.kytkin_koodi = 1 then 'Övrig yrkesinriktad utbildning' else d4.tutkintotyypin_ryhma_sv end  
	,[tutkintotyyppi_sv] = 
		case 
			when valmentava_koodi = 1 then 'VALMA' 
			when valmentava_koodi = 2 then 'TELMA' 
			when valmentava_koodi = 3 then 'TUVA' 
			when d24.kytkin_koodi = 1 then 'Övrig yrkesinriktad utbildning' 
			else d4.tutkintotyyppi_sv 
		end
	,[tutkinto_sv] = d4.koulutusluokitus_sv  
	,[koulutusala_taso_3_sv] = d4.koulutusalataso3_sv  
	,[koulutusala_taso_2_sv] = d4.koulutusalataso2_sv 
	,[koulutusala_taso_1_sv] = d4.koulutusalataso1_sv 
	,[osaamisala_sv] = d20.selite_sv
	,[tutkintonimike_sv] = d40.tutkintonimike_sv
	,[suorituskieli_sv] = d23.suorituskieli_ammatillinen_sv
	,[osa_aikaisuus_sv] = d16.kytkin_sv
	,[suorituksen_tyyppi_sv] = d17.selite_sv
	,[kustannusryhma_sv] = d18.selite_sv 
	,[rahoitusmuoto_sv] = d19.selite_sv
	,[koulutusvienti_sv] = d38.kytkin_sv
	,[hankintakoulutus_sv] = d39.kytkin_sv
	,[erityisopetus_sv] = d13.erityisopetus_ryhma_sv
	,[majoitus_sv] = d15.majoitus_nimi_sv
	,[oppisopimuskoulutus_sv] = d6a.kytkin_sv
	,[koulutussopimus_sv] = d6b.kytkin_sv 
	,[vankilaopetus_sv] = d7.kytkin_sv 
	,[henkilostokoulutus_sv] = d8.kytkin_sv 
	,[tyovoimakoulutus_sv] = d19b.kytkin_sv 

	,[oppilaitos_sv] = d5.organisaatio_sv
	,[koulutuksen_jarjestaja_sv] = d11.organisaatio_sv
	,[hankintakoulutuksen_jarjestaja_sv] = d11b.organisaatio_sv
	,[toimipiste_sv] = d21.organisaatio_sv
	,[oppilaitoksen_kunta_sv] = d10.kunta_sv
	,[oppilaitoksen_maakunta_sv] = d10.maakunta_sv
	,[oppilaitoksen_hyvinvointialue_sv] = d10.hyvinvointialue_sv
	,[toimipisteen_kunta_sv] = d34.kunta_sv
	,[toimipisteen_maakunta_sv] = d34.maakunta_sv
	,[toimipisteen_hyvinvointialue_sv] = d34.hyvinvointialue_sv
	,[oppilaitoksen_avi_sv] = d10.avi_sv
	,[oppilaitoksen_ely_sv] = d10.ely_sv 
	,[oppilaitoksen_opetuskieli_sv] = d5.oppilaitoksenopetuskieli_sv
	,[oppilaitostyyppi_sv] = d5.oppilaitostyyppi_sv
	,[koulutuksen_jarjestajan_kunta_sv] = d12.kunta_sv 
	,[koulutuksen_jarjestajan_maakunta_sv] = d12.maakunta_sv 
	,[koulutuksen_jarjestajan_hyvinvointialue_sv] = d12.hyvinvointialue_sv 
	,[koulutuksen_jarjestajan_ely_sv] = d12.ely_sv 
	,[koulutuksen_jarjestajan_avi_sv] = d12.avi_sv  
	,[koulutuksen_jarjestajan_omistajatyyppi_sv] = coalesce(ot_tk.koulutuksen_jarjestajan_omistajatyyppi_sv, case when d11.organisaatio_fi like '% Oy' then 'Privat' end)
	,[koulutuksen_jarjestajan_opetuskieli_sv] = coalesce(d37.opetuskieli_sv, 'Information saknas')

	,[oppisopimuksen_suoritusosuus_sv] = coalesce(nullif(oppisopimus_osuus,'Tieto puuttuu'),'Information saknas')
	,[koulutussopimuksen_suoritusosuus_sv] = coalesce(nullif(koulutussopimus_osuus,'Tieto puuttuu'),'Information saknas')
	,[oppisopimus_koulutussopimus_sv] = d26.selite_sv

	,[ika_opiskeluoikeuden_alkamisvuonna_sv] = d27.ikaryhma6_sv
	,[ika_opiskeluoikeuden_alkamishetkella_sv] = d28.ikaryhma6_sv
	,[ika_oppisopimusjakson_alkamisvuonna_sv] = case when d6a.kytkin_koodi <> '1' then 'Ej läroavtalsperioder' else d29.ikaryhma6_sv end
	,[ika_oppisopimusjakson_alkamishetkella_sv] = case when d6a.kytkin_koodi <> '1' then 'Ej läroavtalsperioder' else d30.ikaryhma6_sv end
	,[opiskeluoikeuden_alkamisvuosi_sv] = d31.vuosi
	,[opiskeluoikeuden_alkamiskuukausi_sv] = d31.kuukausi_sv
	,[oppisopimusjakson_alkamisvuosi_sv] = case when d6a.kytkin_koodi <> '1' then 'Ej läroavtalsperioder' else cast(d32.vuosi as nvarchar(20)) end
	,[oppisopimusjakson_alkamiskuukausi_sv] = case when d6a.kytkin_koodi <> '1' then 'Ej läroavtalsperioder' else d32.kuukausi_sv end

	--CSCVIPUNEN-3345 16.3.2023
	,[kotikunta_manner_suomessa_sv] = d35.kytkin_sv
	,[oppivelvollinen_1_8_2021_sv] = d36.kytkin_sv
	--CSCVIPUNEN-3345 16.3.2023

	--en
	,[tilastovuosi_en] = f.tilastovuosi
	,[tilastokuukausi_en] = d14.kuukausi_en
	,[opiskeluoikeus_alkanut_tilastokuukauden_aikana_en] = d33.kytkin_en

	,[sukupuoli_en] = d1.sukupuoli_en
	,[aidinkieli_en] = d2.kieliryhma2_en
	,[ika_en] = d3.ikaryhma6_en
	,[ikaryhma_en] = d3.ikaryhma3_en
	,[ikaryhma2_en] =
		case
			when d3.[ika_avain] <= 18 then d3.[ikaryhma2_en]
			else 'over 18 years'
		end
	,[kansalaisuus_tarkka_en] = d22.maatjavaltiot2_en
	,[kansalaisuus_en] = d22.maanosa1_en
	,[kansalaisuus_maanosa_en] = d22.maanosa0_en
	,[kotikunta_nykyinen_en] = d0.kunta_en
	,[kotimaakunta_nykyinen_en] = d0.maakunta_en
	,[kotikunnan_hyvinvointialue_nykyinen_en] = d0.hyvinvointialue_en
	,[tutkintotyypin_ryhma_en] = case when d24.kytkin_koodi = 1 then 'Other vocational education' else d4.tutkintotyypin_ryhma_en end  
	,[tutkintotyyppi_en] = 
		case 
			when valmentava_koodi = 1 then 'VALMA' 
			when valmentava_koodi = 2 then 'TELMA' 
			when valmentava_koodi = 3 then 'TUVA' 
			when d24.kytkin_koodi = 1 then 'Other vocational education' 
			else d4.tutkintotyyppi_en 
		end
	,[tutkinto_en] = d4.koulutusluokitus_en  
	,[koulutusala_taso_3_en] = d4.koulutusalataso3_en  
	,[koulutusala_taso_2_en] = d4.koulutusalataso2_en 
	,[koulutusala_taso_1_en] = d4.koulutusalataso1_en 
	,[osaamisala_en] = d20.selite_en
	,[tutkintonimike_en] = d40.tutkintonimike_en
	,[suorituskieli_en] = d23.suorituskieli_ammatillinen_en
	,[osa_aikaisuus_en] = d16.kytkin_en
	,[suorituksen_tyyppi_en] = d17.selite_en
	,[kustannusryhma_en] = d18.selite_en 
	,[rahoitusmuoto_en] = d19.selite_en
	,[koulutusvienti_en] = d38.kytkin_en
	,[hankintakoulutus_en] = d39.kytkin_en
	,[erityisopetus_en] = d13.erityisopetus_ryhma_en
	,[majoitus_en] = d15.majoitus_nimi_en
	,[oppisopimuskoulutus_en] = d6a.kytkin_en
	,[koulutussopimus_en] = d6b.kytkin_en 
	,[vankilaopetus_en] = d7.kytkin_en 
	,[henkilostokoulutus_en] = d8.kytkin_en 
	,[tyovoimakoulutus_en] = d19b.kytkin_en 

	,[oppilaitos_en] = d5.organisaatio_en
	,[koulutuksen_jarjestaja_en] = d11.organisaatio_en
	,[hankintakoulutuksen_jarjestaja_en] = d11b.organisaatio_en
	,[toimipiste_en] = d21.organisaatio_en
	,[oppilaitoksen_kunta_en] = d10.kunta_en
	,[oppilaitoksen_maakunta_en] = d10.maakunta_en
	,[oppilaitoksen_hyvinvointialue_en] = d10.hyvinvointialue_en
	,[toimipisteen_kunta_en] = d34.kunta_en
	,[toimipisteen_maakunta_en] = d34.maakunta_en
	,[toimipisteen_hyvinvointialue_en] = d34.hyvinvointialue_en
	,[oppilaitoksen_avi_en] = d10.avi_en
	,[oppilaitoksen_ely_en] = d10.ely_en 
	,[oppilaitoksen_opetuskieli_en] = d5.oppilaitoksenopetuskieli_en
	,[oppilaitostyyppi_en] = d5.oppilaitostyyppi_en
	,[koulutuksen_jarjestajan_kunta_en] = d12.kunta_en 
	,[koulutuksen_jarjestajan_maakunta_en] = d12.maakunta_en 
	,[koulutuksen_jarjestajan_hyvinvointialue_en] = d12.hyvinvointialue_en 
	,[koulutuksen_jarjestajan_ely_en] = d12.ely_en 
	,[koulutuksen_jarjestajan_avi_en] = d12.avi_en  
	,[koulutuksen_jarjestajan_omistajatyyppi_en] = coalesce(ot_tk.koulutuksen_jarjestajan_omistajatyyppi_en, case when d11.organisaatio_fi like '% Oy' then 'Private' end)
	,[koulutuksen_jarjestajan_opetuskieli_en] = coalesce(d37.opetuskieli_en, 'Missing data')

	,[oppisopimuksen_suoritusosuus_en] = coalesce(nullif(oppisopimus_osuus,'Tieto puuttuu'),'Missing data')
	,[koulutussopimuksen_suoritusosuus_en] = coalesce(nullif(koulutussopimus_osuus,'Tieto puuttuu'),'Missing data')
	,[oppisopimus_koulutussopimus_en] = d26.selite_en

	,[ika_opiskeluoikeuden_alkamisvuonna_en] = d27.ikaryhma6_en
	,[ika_opiskeluoikeuden_alkamishetkella_en] = d28.ikaryhma6_en
	,[ika_oppisopimusjakson_alkamisvuonna_en] = case when d6a.kytkin_koodi <> '1' then 'No apprenticeship periods' else d29.ikaryhma6_en end
	,[ika_oppisopimusjakson_alkamishetkella_en] = case when d6a.kytkin_koodi <> '1' then 'No apprenticeship periods' else d30.ikaryhma6_en end
	,[opiskeluoikeuden_alkamisvuosi_en] = d31.vuosi
	,[opiskeluoikeuden_alkamiskuukausi_en] = d31.kuukausi_en
	,[oppisopimusjakson_alkamisvuosi_en] = case when d6a.kytkin_koodi <> '1' then 'No apprenticeship periods' else cast(d32.vuosi as nvarchar(20)) end
	,[oppisopimusjakson_alkamiskuukausi_en] = case when d6a.kytkin_koodi <> '1' then 'No apprenticeship periods' else d32.kuukausi_en end

	--CSCVIPUNEN-3345 16.3.2023
	,[kotikunta_manner_suomessa_en] = d35.kytkin_en
	,[oppivelvollinen_1_8_2021_en] = d36.kytkin_en
	--CSCVIPUNEN-3345 16.3.2023

	--Apusarakkeet
	,apusarake_oppija_oid = master_oid
	,apusarake_opiskeluoikeus_oid = opiskeluoikeus_oid
	,apusarake_pv_kk = DAY(EOMONTH(d14.paivays))
	,apusarake_ryhma = ryhma

	,apusarake_opiskelija = opiskelijat
	,apusarake_uusi_opiskelija = uudet_opiskelijat
	,apusarake_uusi_opiskelija_rahoitus = uudet_opiskelijat_rahoitus
	,apusarake_opiskelijat_netto = opiskelijat_netto
	,apusarake_tutkinnon_suorittanut = tutkinnot
	,apusarake_tutkinnon_suorittanut_todistus = tutkinnot_todistus
	,apusarake_eronnut_opiskelija = eronnut
    ,apusarake_jatkaa_kj = jatkaa_kj
    ,apusarake_jatkaa_oppilaitos = jatkaa_oppilaitos
    ,apusarake_jatkaa_tutkintotyyppi = jatkaa_tutkintotyyppi
    ,apusarake_jatkaa_ammatillinen = jatkaa_ammatillinen
    ,apusarake_jatkaa_yleissivistava = jatkaa_yleissivistava
    ,apusarake_jatkaa_valmentava = jatkaa_valmentava
    ,apusarake_jatkaa_lukio_valmentava = jatkaa_lukio_valmentava
    ,apusarake_jatkaa_amm_valmentava = jatkaa_amm_valmentava
    ,apusarake_jatkaa_muu_ammatillinen = jatkaa_muu_ammatillinen
	,apusarake_jatkaa_amm_tutkintokoulutus = jatkaa_amm_tutkintokoulutus
    ,apusarake_jatkaa_tutkinto_boo = jatkaa_tutkinto_boo
    ,apusarake_jatkaa_koulutusala_taso3_boo = jatkaa_koulutusala_taso3_boo
    ,apusarake_jatkaa_koulutusala_taso2_boo = jatkaa_koulutusala_taso2_boo
    ,apusarake_jatkaa_koulutusala_taso1_boo = jatkaa_koulutusala_taso1_boo
    ,apusarake_jatkaa_koulutusmuoto_boo = jatkaa_koulutusmuoto_boo
    ,apusarake_jatkaa_amm_yleissiv_boo = jatkaa_amm_yleissiv_boo
    ,apusarake_jatkaa_toinen_aste_boo = jatkaa_toinen_aste_boo
    ,apusarake_jatkaa_koulutusjarjestelma_boo = jatkaa_koulutusjarjestelma_boo

	--Koodit
	,[koodit_koulutuksen_jarjestaja] = d11.organisaatio_koodi 
	,[koodit_oppilaitos] = d5.organisaatio_koodi 
	,[koodit_tutkinto] = d4.koulutusluokitus_koodi
	,[koodit_osaamisala] = d20.koodi
	,[koodit_tutkintonimike] = d40.tutkintonimike_koodi
	,[koodit_oppisopimuskoulutus] = d6a.kytkin_koodi
	,[koodit_koulutussopimus] = d6b.kytkin_koodi

	--Järjestykset
	,d18.jarjestys_koodi as jarjestys_kustannusryhma
	,d19.jarjestys_koodi as jarjestys_rahoitusmuoto
	,d14.kuukausi as jarjestys_tilastokuukausi
	,d1.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli
	,d3.jarjestys_ikaryhma3 as jarjestys_ikaryhma
	,d3.jarjestys_ikaryhma6 as jarjestys_ika
	,jarjestys_ikaryhma2 =
		case
			when d3.[ika_avain] = -1 then 3
			when d3.[ika_avain] <= 18 then 1
			else 2
		 end
	,d2.jarjestys_kieliryhma2 as jarjestys_aidinkieli
	,d22.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus
	,d22.jarjestys_maanosa0_koodi as jarjestys_kansalaisuus_maanosa
	,d0.jarjestys_maakunta_koodi as jarjestys_kotimaakunta_nykyinen
	,d0.jarjestys_hyvinvointialue_koodi as jarjestys_kotikunnan_hyvinvointialue_nykyinen
	,d4.jarjestys_koulutusalataso1_koodi as jarjestys_koulutusala_taso1
	,d4.jarjestys_koulutusalataso2_koodi as jarjestys_koulutusala_taso2
	,d4.jarjestys_koulutusalataso3_koodi as jarjestys_koulutusala_taso3
	,d6a.jarjestys_kytkin_koodi as jarjestys_oppisopimuskoulutus
	,d6b.jarjestys_kytkin_koodi as jarjestys_koulutussopimus
	,d7.jarjestys_kytkin_koodi as jarjestys_vankila
	,d8.jarjestys_kytkin_koodi as jarjestys_henkilosto
	,d9.jarjestys_kytkin_koodi as jarjestys_tyovoima
	,left(d12.kunta_fi,3) as jarjestys_koulutuksen_jarjestajan_kunta
	,d12.jarjestys_maakunta_koodi as jarjestys_koulutuksen_jarjestajan_maakunta
	,d12.jarjestys_hyvinvointialue_koodi as jarjestys_koulutuksen_jarjestajan_hyvinvointialue
	,d12.jarjestys_avi_koodi as jarjestys_koulutuksen_jarjestajan_avi
	,d12.jarjestys_ely_koodi as jarjestys_koulutuksen_jarjestajan_ely
	,coalesce(ot_tk.koulutuksen_jarjestajan_omistajatyyppikoodi, case when d11.organisaatio_fi like '% Oy' then 1 end) as jarjestys_koulutuksen_jarjestajan_omistajatyyppi
	,d10.jarjestys_maakunta_koodi as jarjestys_oppilaitoksen_maakunta
	,d10.jarjestys_hyvinvointialue_koodi as jarjestys_oppilaitoksen_hyvinvointialue
	,d10.jarjestys_ely_koodi as jarjestys_oppilaitoksen_ely
	,d10.jarjestys_avi_koodi as jarjestys_oppilaitoksen_avi
	,d5.jarjestys_oppilaitoksenopetuskieli_koodi as jarjestys_oppilaitoksen_opetuskieli
	,d5.jarjestys_oppilaitostyyppi_koodi as jarjestys_oppilaitostyyppi
	,d13.jarjestys_erityisopetus_ryhma as jarjestys_erityisopetus
	,d15.jarjestys_majoitus_koodi as jarjestys_majoitus
	,case when d24.kytkin_koodi = 1 then '99' /*(select distinct jarjestys_tutkintotyypin_ryhma_koodi from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi='09')*/ else d4.jarjestys_tutkintotyypin_ryhma_koodi end as jarjestys_tutkintotyypin_ryhma
	,case 
		when valmentava_koodi = 1 then '96' 
		when valmentava_koodi = 2 then '97' 
		when valmentava_koodi = 3 then '98'
		when d24.kytkin_koodi = 1 then '99' /*(select distinct jarjestys_tutkintotyyppi_koodi from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi='09')*/ 
		else d4.jarjestys_tutkintotyyppi_koodi 
	end as jarjestys_tutkintotyyppi
	,d26.jarjestys_koodi as jarjestys_oppisopimus_koulutussopimus
	
	,d27.jarjestys_ikaryhma6 as jarjestys_ika_opiskeluoikeuden_alkamisvuonna
	,d28.jarjestys_ikaryhma6 as jarjestys_ika_opiskeluoikeuden_alkamishetkella
	,d29.jarjestys_ikaryhma6 as jarjestys_ika_oppisopimusjakson_alkamisvuonna
	,d30.jarjestys_ikaryhma6 as jarjestys_ika_oppisopimusjakson_alkamishetkella
	,d31.vuosi as jarjestys_opiskeluoikeuden_alkamisvuosi
	,d31.kuukausi as jarjestys_opiskeluoikeuden_alkamiskuukausi
	,d32.vuosi as jarjestys_oppisopimusjakson_alkamisvuosi
	,d32.kuukausi as jarjestys_oppisopimusjakson_alkamiskuukausi
	,case
		when d37.opetuskieli_koodi is null then 99
		when d37.opetuskieli_koodi = -1 then 99
		else d37.opetuskieli_koodi
	end as jarjestys_koulutuksen_jarjestajan_opetuskieli
	
FROM dw.f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty f
LEFt JOIN dw.d_alueluokitus d0 ON d0.id = f.d_alueluokitus_kotikunta_id
LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_kytkin d6a ON d6a.id = f.d_kytkin_oppisopimuskoulutus_id
LEFT JOIN dw.d_kytkin d6b ON d6b.id = f.d_kytkin_koulutussopimus_id
LEFT JOIN dw.d_kytkin d7 ON d7.id = f.d_kytkin_vankilaopetus_id
LEFT JOIN dw.d_kytkin d8 ON d8.id = f.d_kytkin_henkilostokoulutus_id
LEFT JOIN dw.d_kytkin d9 ON d9.id = f.d_kytkin_tyovoimakoulutus_id 
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_organisaatioluokitus d11b ON d11b.id = f.d_organisaatioluokitus_hk_jarj_id
LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
LEFT JOIN dw.d_erityisopetus d13 ON d13.id = f.d_erityisopetus_id
LEFT JOIN dw.d_kalenteri d14 ON d14.id = f.d_kalenteri_id
LEFT JOIN dw.d_majoitus d15 ON d15.id = f.d_majoitus_id
LEFT JOIN dw.d_kytkin d16 ON d16.id = f.d_osa_aikaisuus_id
LEFT JOIN dw.d_suorituksen_tyyppi d17 ON d17.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d18 ON d18.id = f.d_kustannusryhma_id
LEFT JOIN dw.d_opintojenrahoitus d19 ON d19.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_kytkin d19b ON d19b.kytkin_koodi = d19.tyovoimakoulutus
LEFT JOIN dw.d_osaamisala d20 ON d20.id = f.d_osaamisala_id 
LEFT JOIN dw.d_organisaatioluokitus d21 ON d21.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_maatjavaltiot2 d22 ON d22.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN dw.d_kieli d23 ON d23.id = f.d_kieli_suorituskieli_id
LEFT JOIN dw.d_kytkin d24 ON d24.id = f.d_kytkin_muu_ammatillinen_id
LEFT JOIN dw.d_keskeyttaminen_vaiheittainen d25 ON d25.id = f.d_keskeyttaminen_vaiheittainen_id
LEFT JOIN dw.d_keskeyttaminen_opiskelijan_toiminta d25b ON d25b.id = f.d_keskeyttaminen_opiskelijan_toiminta_id
LEFT JOIN dw.d_amm_sopimusjaksot d26 ON d26.id = f.d_amm_sopimusjaksot_id
LEFT JOIN dw.d_ika d27 on d27.id=f.d_ika_oo_alk_id
LEFT JOIN dw.d_ika d28 on d28.id=f.d_ika_oo_alk_tarkka_id
LEFT JOIN dw.d_ika d29 on d29.id=f.d_ika_opsoj_alk_id
LEFT JOIN dw.d_ika d30 on d30.id=f.d_ika_opsoj_alk_tarkka_id
LEFT JOIN dw.d_kalenteri d31 on d31.id=f.d_oo_aloitus_id
LEFT JOIN dw.d_kalenteri d32 on d32.id=f.d_opsoj_aloitus_id
LEFT JOIN dw.d_kytkin d33 ON d33.id = f.d_kytkin_oo_alkanut_kuussa_id
LEFT JOIN dw.d_alueluokitus d34 ON d34.kunta_koodi = d21.kunta_koodi 
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot ot_tk on ot_tk.oppilaitos_avain = d11.organisaatio_koodi
--CSCVIPUNEN-3345 16.3.2023
LEFT JOIN dw.d_kytkin d35 ON d35.kytkin_koodi = f.kotikunta_manner_suomessa
LEFT JOIN dw.d_kytkin d36 ON d36.kytkin_koodi = f.oppivelvollinen
--CSCVIPUNEN-3345 16.3.2023
LEFT JOIN dw.d_oiva_amm_jarjestaja_opetuskieli d37 ON d37.organisaatio_koodi = d11.organisaatio_koodi
--
LEFT JOIN dw.d_kytkin d38 ON d38.id = f.d_kytkin_koulutusvienti_id
LEFT JOIN dw.d_kytkin d39 ON d39.id = f.d_kytkin_hankintakoulutus_id
LEFT JOIN dw.d_tutkintonimike d40 ON d40.id = f.d_tutkintonimike_id 

GO


