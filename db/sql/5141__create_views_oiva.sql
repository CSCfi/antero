USE [ANTERO]
GO
/****** Object:  View [dw].[v_oiva_luvat_amm_cultures]    Script Date: 22.11.2021 15:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_oiva_luvat_amm_cultures]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dw].[v_oiva_luvat_amm_cultures] AS


SELECT --TOP 1000
	 f.[tarkasteluvuosi]
	,[luvan_alkamisvuosi] = d5.vuosi
	
	--fi
	,[luvan_paattymisvuosi_fi] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''),''Ei päättynyt'')
	,[luvan_alkamiskuukausi_fi] = d5.kuukausi_fi
	,[luvan_paattymiskuukausi_fi] = coalesce(nullif(d6.kuukausi_fi,''Tieto puuttuu''),''Ei päättynyt'')
	,[lupa_voimassa_fi] = d14.kytkin_fi

	,[koulutuksen_jarjestaja_fi] = d1.organisaatio_fi
	,[koulutuksen_jarjestajan_kunta_fi] = d1a.kunta_fi
	,[koulutuksen_jarjestajan_maakunta_fi] = d1a.maakunta_fi
	,[toiminta_alueen_kunta_fi] = coalesce(nullif(d2.kunta_fi,''Tieto puuttuu''),''Ei määritelty'')
	,[toiminta_alueen_maakunta_fi] = coalesce(nullif(d2.maakunta_fi,''Tieto puuttuu''),''Ei määritelty'')
	,[toiminta_alueena_koko_maa_fi] = d11.kytkin_fi
	,[toiminta_alueena_koko_maakunta_fi] = d12.kytkin_fi
	,[tutkinto_fi] = coalesce(nullif(d3.koulutusluokitus_fi,''Tieto puuttuu''),''Ei määritelty'')
	,[osaamisala_fi] = d13.selite_fi
	,[koulutusala_taso_1_fi] = d3.koulutusalataso1_fi
	,[koulutusala_taso_2_fi] = d3.koulutusalataso2_fi
	,[koulutusala_taso_3_fi] = d3.koulutusalataso3_fi
	,[tutkintotyyppi_fi] = d3.tutkintotyyppi_fi
	,[osaamisala_rajoite_fi] = coalesce(nullif(d4.selite_fi,''Tieto puuttuu''),''Ei määritelty'')
	,[luvanmukaiset_koulutukset_fi] = coalesce(nullif(d9.selite_fi,''Tieto puuttuu''),''Ei määritelty'')
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_fi] = coalesce(nullif(d10.selite_fi,''Tieto puuttuu''),''Ei määritelty'')
	,[tutkintokieli1_fi] = coalesce(nullif(d8.kieli_fi,''Tieto puuttuu''), ''opetuskieli'')
	,[tutkintokieli2_fi] = coalesce(nullif(case d8b.kieli_fi when ''pohjoissaame'' then ''saame'' else d8b.kieli_fi end,''Tieto puuttuu''), ''ei määritelty'')
	,[opetuskieli_fi] = d7.selite_fi

	--sv
	,[luvan_paattymisvuosi_sv] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''),''Ej löpt ut'')
	,[luvan_alkamiskuukausi_sv] = d5.kuukausi_sv
	,[luvan_paattymiskuukausi_sv] = coalesce(nullif(d6.kuukausi_sv,''Information saknas''),''Ej löpt ut'')
	,[lupa_voimassa_sv] = d14.kytkin_sv

	,[koulutuksen_jarjestaja_sv] = d1.organisaatio_sv
	,[koulutuksen_jarjestajan_kunta_sv] = d1a.kunta_sv
	,[koulutuksen_jarjestajan_maakunta_sv] = d1a.maakunta_sv
	,[toiminta_alueen_kunta_sv] = coalesce(nullif(d2.kunta_sv,''Information saknas''),''Ej angivet'')
	,[toiminta_alueen_maakunta_sv] = coalesce(nullif(d2.maakunta_sv,''Information saknas''),''Ej angivet'')
	,[toiminta_alueena_koko_maa_sv] = d11.kytkin_sv
	,[toiminta_alueena_koko_maakunta_sv] = d12.kytkin_sv
	,[tutkinto_sv] = coalesce(nullif(d3.koulutusluokitus_sv,''Information saknas''),''Ej angivet'')
	,[osaamisala_sv] = d13.selite_sv
	,[koulutusala_taso_1_sv] = d3.koulutusalataso1_sv
	,[koulutusala_taso_2_sv] = d3.koulutusalataso2_sv
	,[koulutusala_taso_3_sv] = d3.koulutusalataso3_sv
	,[tutkintotyyppi_sv] = d3.tutkintotyyppi_sv
	,[osaamisala_rajoite_sv] = coalesce(nullif(d4.selite_sv,''Information saknas''), ''Ej angivet'')
	,[luvanmukaiset_koulutukset_sv] = coalesce(nullif(d9.selite_sv,''Information saknas''), ''Ej angivet'')
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_sv] = coalesce(nullif(d10.selite_sv,''Information saknas''), ''Ej angivet'')
	,[tutkintokieli1_sv] = coalesce(nullif(d8.kieli_sv,''Information saknas''), ''undervisningsspråk'')
	,[tutkintokieli2_sv] =  coalesce(nullif(d8b.kieli_sv,''Information saknas''),''ej angivet'')
	,[opetuskieli_sv] = d7.selite_sv

	--en
	,[luvan_paattymienuosi_en] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''),''Ej löpt ut'')
	,[luvan_alkamiskuukausi_en] = d5.kuukausi_en
	,[luvan_paattymiskuukausi_en] = coalesce(nullif(d6.kuukausi_en,''Information saknas''),''Ej löpt ut'')
	,[lupa_voimassa_en] = d14.kytkin_en

	,[koulutuksen_jarjestaja_en] = d1.organisaatio_en
	,[koulutuksen_jarjestajan_kunta_en] = d1a.kunta_en
	,[koulutuksen_jarjestajan_maakunta_en] = d1a.maakunta_en
	,[toiminta_alueen_kunta_en] = coalesce(nullif(d2.kunta_en,''Information saknas''),''Ej angivet'')
	,[toiminta_alueen_maakunta_en] = coalesce(nullif(d2.maakunta_en,''Information saknas''),''Ej angivet'')
	,[toiminta_alueena_koko_maa_en] = d11.kytkin_en
	,[toiminta_alueena_koko_maakunta_en] = d12.kytkin_en
	,[tutkinto_en] = coalesce(nullif(d3.koulutusluokitus_en,''Information saknas''),''Ej angivet'')
	,[osaamisala_en] = d13.selite_en
	,[koulutusala_taso_1_en] = d3.koulutusalataso1_en
	,[koulutusala_taso_2_en] = d3.koulutusalataso2_en
	,[koulutusala_taso_3_en] = d3.koulutusalataso3_en
	,[tutkintotyyppi_en] = d3.tutkintotyyppi_en
	,[osaamisala_rajoite_en] = coalesce(nullif(d4.selite_en,''Information saknas''), ''Ej angivet'')
	,[luvanmukaiset_koulutukset_en] = coalesce(nullif(d9.selite_en,''Information saknas''), ''Ej angivet'')
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_en] = coalesce(nullif(d10.selite_en,''Information saknas''), ''Ej angivet'')
	,[tutkintokieli1_en] = coalesce(nullif(d8.kieli_en,''Information saknas''), ''undervisningsspråk'')
	,[tutkintokieli2_en] =  coalesce(nullif(d8b.kieli_en,''Information saknas''),''ej angivet'')
	,[opetuskieli_en] = d7.selite_en

	--apusarakkeet
	,apusarake_opiskelijavuodet = opiskelijavuodet
	,apusarake_opiskelijavuodet_sisa = opiskelijavuodet_sisa
	,apusarake_opiskelijavuodet_vet = opiskelijavuodet_vet

	,[koodit_koulutuksen_jarjestaja] = d1.organisaatio_koodi
	,[koodit_tutkinto] = d3.koulutusluokitus_koodi
	,[koodit_osaamisala] = d13.koodi

	--jarjestys
	,[jarjestys_luvan_alkamiskuukausi] = d5.kuukausi
	,[jarjestys_luvan_paattymiskuukausi] = d6.kuukausi
	,[jarjestys_koulutuksen_jarjestajan_maakunta] = d1a.jarjestys_maakunta_koodi
	,[jarjestys_toiminta_alueen_maakunta] = d2.jarjestys_maakunta_koodi
	,[jarjestys_toiminta_alueen_kunta] = d2.jarjestys_kunta_koodi
	,[jarjestys_koulutusala_taso_1] = d3.jarjestys_koulutusalataso1_koodi
	,[jarjestys_koulutusala_taso_2] = d3.jarjestys_koulutusalataso2_koodi
	,[jarjestys_koulutusala_taso_3] = d3.jarjestys_koulutusalataso3_koodi
	,[jarjestys_tutkintotyyppi] = d3.jarjestys_tutkintotyyppi_koodi
	--,[jarjestys_osaamisala] = d13.jarjestys
	,[jarjestys_osaamisala_rajoite] = d4.jarjestys
	,[jarjestys_luvanmukaiset_koulutukset] = d9.jarjestys
	,[jarjestys_muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat] = d10.jarjestys
	,[jarjestys_tutkintokieli1] = d8.jarjestys_kieliryhma1
	,[jarjestys_tutkintokieli2] = d8b.jarjestys_kieliryhma1
	,[jarjestys_opetuskieli] = d7.jarjestys

FROM dw.f_oiva_luvat_amm f
LEFT JOIN dbo.translations_keys_as_columns k on 1=0
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_id
LEFT JOIN dw.d_alueluokitus d1a on d1a.kunta_koodi=d1.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_toiminta_alue_id
LEFT JOIN dw.d_koulutusluokitus d3 on d3.id=f.d_koulutusluokitus_tutkinto_id
LEFT JOIN dw.d_osaamisala d4 on d4.id=f.d_osaamisala_luvan_rajoite_id
LEFT JOIN dw.d_kalenteri d5 on d5.id=f.d_kalenteri_luvan_alku_id
LEFT JOIN dw.d_kalenteri d6 on d6.id=f.d_kalenteri_luvan_loppu_id
LEFT JOIN dw.d_oppilaitoksenopetuskieli d7 on d7.id=f.d_oppilaitoksenopetuskieli_id
LEFT JOIN dw.d_kieli d8 on d8.id=f.d_kieli_tutkinto_id
LEFT JOIN dw.d_kieli d8b on d8b.id=f.d_kieli_tutkinto_ja_opetus_id
LEFT JOIN dw.d_oivakoulutukset d9 on d9.id=f.d_oivakoulutukset_id
LEFT JOIN dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat d10 on d10.id=f.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_id
LEFT JOIN dw.d_kytkin d11 on d11.id=f.d_kytkin_toiminta_alue_koko_maa_id
LEFT JOIN dw.d_kytkin d12 on d12.id=f.d_kytkin_toiminta_alue_koko_maakunta_id
LEFT JOIN dw.d_osaamisala d13 on d13.id=f.d_osaamisala_tutkinto_id
LEFT JOIN dw.d_kytkin d14 on d14.id = f.d_kytkin_lupa_voimassa_id










' 
GO
/****** Object:  View [dw].[v_oiva_luvat_vst_cultures]    Script Date: 22.11.2021 15:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_oiva_luvat_vst_cultures]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dw].[v_oiva_luvat_vst_cultures] AS

SELECT
	 [tarkasteluvuosi] = f.[Tarkasteluvuosi]
	
	--fi
	,[luvan_alkamisvuosi_fi] = d5.vuosi
	,[luvan_alkamiskuukausi_fi] = d5.kuukausi_fi
	,[luvan_paattymisvuosi_fi] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''), ''Ei päättynyt'')
	,[luvan_paattymiskuukausi_fi] = case when d6.kuukausi != 99 then d6.kuukausi_fi else ''Ei päättynyt'' end
	,[lupa_voimassa_fi] = d11.kytkin_fi
	,[oppilaitoksen_yllapitaja_fi] = d1.organisaatio_fi
	,[oppilaitoksen_yllapitajan_kunta_fi] = d1a.kunta_fi
	,[oppilaitoksen_yllapitajan_maakunta_fi] = d1a.maakunta_fi
	,[opetuskieli_fi] = d3.kieli_fi
	,[oppilaitos_fi] = d4.organisaatio_fi
	,[oppilaitoksen_kunta_fi] = d2.kunta_fi
	,[oppilaitoksen_maakunta_fi] = d2.maakunta_fi
	,[erityinen_koulutustehtava_fi] = d7.selite_fi
	,[oppilaitostyyppi_fi] = coalesce(case when d10.koodi != -1 then d10.selite_fi end, left(d4.oppilaitostyyppi_fi, len(d4.oppilaitostyyppi_fi)-1))
	,[etaopetus_fi] = d8.selite_fi
	,[oppilaitoksen_alueellisuus_valtakunnallisuus_fi] = d9.selite_fi

	--sv
	,[luvan_alkamisvuosi_sv] = d5.vuosi
	,[luvan_alkamiskuukausi_sv] = d5.kuukausi_sv
	,[luvan_paattymisvuosi_sv] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''), ''Ej sluten'')
	,[luvan_paattymiskuukausi_sv] = case when d6.kuukausi != 99 then d6.kuukausi_sv else ''Ej sluten'' end
	,[lupa_voimassa_sv] = d11.kytkin_sv
	,[oppilaitoksen_yllapitaja_sv] = d1.organisaatio_sv
	,[oppilaitoksen_yllapitajan_kunta_sv] = d1a.kunta_sv
	,[oppilaitoksen_yllapitajan_maakunta_sv] = d1a.maakunta_sv
	,[opetuskieli_sv] = d3.kieli_sv
	,[oppilaitos_sv] = d4.organisaatio_sv
	,[oppilaitoksen_kunta_sv] = d2.kunta_sv
	,[oppilaitoksen_maakunta_sv] = d2.maakunta_sv
	,[erityinen_koulutustehtava_sv] = d7.selite_sv
	,[oppilaitostyyppi_sv] = coalesce(case when d10.koodi != -1 then d10.selite_sv end, left(d4.oppilaitostyyppi_sv, len(d4.oppilaitostyyppi_sv)-1))
	,[etaopetus_sv] = d8.selite_sv
	,[oppilaitoksen_alueellisuus_valtakunnallisuus_sv] = d9.selite_sv

	--en
	,[luvan_alkamisvuosi_en] = d5.vuosi
	,[luvan_alkamiskuukausi_en] = d5.kuukausi_en
	,[luvan_paattymisvuosi_en] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''), ''Not ended'')
	,[luvan_paattymiskuukausi_en] = case when d6.kuukausi != 99 then d6.kuukausi_en else ''Not ended'' end
	,[lupa_voimassa_en] = d11.kytkin_en
	,[oppilaitoksen_yllapitaja_en] = d1.organisaatio_en
	,[oppilaitoksen_yllapitajan_kunta_en] = d1a.kunta_en
	,[oppilaitoksen_yllapitajan_maakunta_en] = d1a.maakunta_en
	,[opetuskieli_en] = d3.kieli_en
	,[oppilaitos_en] = d4.organisaatio_en
	,[oppilaitoksen_kunta_en] = d2.kunta_en
	,[oppilaitoksen_maakunta_en] = d2.maakunta_en
	,[erityinen_koulutustehtava_en] = d7.selite_en
	,[oppilaitostyyppi_en] = coalesce(case when d10.koodi != -1 then d10.selite_en end, left(d4.oppilaitostyyppi_en, len(d4.oppilaitostyyppi_en)-1))
	,[etaopetus_en] = d8.selite_en
	,[oppilaitoksen_alueellisuus_valtakunnallisuus_en] = d9.selite_en

	--koodit
	,[koodit_oppilaitoksen_yllapitaja] = d1.organisaatio_koodi
	,[koodit_oppilaitos] = d4.organisaatio_koodi

	--järjestykset
	,[jarjestys_oppilaitoksen_yllapitajan_maakunta] = d1a.jarjestys_maakunta_koodi
	,[jarjestys_oppilaitoksen_maakunta] = d2.jarjestys_maakunta_koodi
	,[jarjestys_erityinen_koulutustehtava] = d7.jarjestys
	,[jarjestys_oppilaitostyyppi] = d10.jarjestys
	,[jarjestys_etaopetus] = d8.jarjestys
	,[jarjestys_oppilaitoksen_alueellisuus_valtakunnallisuus] = d9.jarjestys
	,[jarjestys_luvan_alkamiskuukausi] = d5.kuukausi
	,[jarjestys_luvan_paattymiskuukausi] = coalesce(nullif(d6.kuukausi,-1),99)

FROM dw.f_oiva_luvat_vst f

LEFT JOIN dbo.translations_keys_as_columns k on 1=0
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_alueluokitus d1a on d1a.kunta_koodi=d1.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_oppilaitos_id
LEFT JOIN dw.d_kieli d3 on d3.id=f.d_kieli_id
LEFT JOIN dw.d_organisaatioluokitus d4 on d4.id=f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_kalenteri d5 on d5.id=f.d_kalenteri_luvan_alku_id
LEFT JOIN dw.d_kalenteri d6 on d6.id=f.d_kalenteri_luvan_loppu_id
LEFT JOIN dw.d_vst_erityinen_koulutustehtava d7 on d7.id = f.d_vst_erityinen_koulutustehtava_id
LEFT JOIN dw.d_vst_etaopetus d8 on d8.id = f.d_vst_etaopetus_id
LEFT JOIN dw.d_vst_oppilaitoksen_alueellisuus_ja_valtakunnallisuus d9 on d9.id = f.d_vst_oppilaitoksen_alueellisuus_ja_valtakunnallisuus_id
LEFT JOIN dw.d_vst_tyypit d10 on d10.id = f.d_vst_tyypit_id
LEFT JOIN dw.d_kytkin d11 on d11.id = f.d_kytkin_lupa_voimassa_id

' 
