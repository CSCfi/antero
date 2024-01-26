USE [ANTERO]
GO

/****** Object:  View [dw].[v_oiva_luvat_vst_cultures]    Script Date: 19.7.2023 10:24:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dw].[v_oiva_luvat_vst_cultures] AS

SELECT --TOP 1000
	 [tarkasteluvuosi] = f.[Tarkasteluvuosi]
	
	--fi
	,[luvan_alkamisvuosi_fi] = d5.vuosi
	,[luvan_alkamiskuukausi_fi] = d5.kuukausi_fi
	,[luvan_paattymisvuosi_fi] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'), 'Ei päättynyt')
	,[luvan_paattymiskuukausi_fi] = case when d6.kuukausi != 99 then d6.kuukausi_fi else 'Ei päättynyt' end
	,[lupa_voimassa_fi] = d11.kytkin_fi
	,[oppilaitoksen_yllapitaja_fi] = d1.organisaatio_fi
	,[oppilaitoksen_yllapitajan_kunta_fi] = d1a.kunta_fi
	,[oppilaitoksen_yllapitajan_maakunta_fi] = d1a.maakunta_fi
	,[oppilaitoksen_yllapitajan_hyvinvointialue_fi] = d1a.hyvinvointialue_fi
	,[opetuskieli_fi] = case d3.kieli_fi when 'pohjoissaame' then 'saame' else d3.kieli_fi end
	,[oppilaitos_fi] = d4.organisaatio_fi
	,[oppilaitoksen_kunta_fi] = d2.kunta_fi
	,[oppilaitoksen_maakunta_fi] = d2.maakunta_fi
	,[oppilaitoksen_hyvinvointialue_fi] = d2.hyvinvointialue_fi
	,[erityinen_koulutustehtava_fi] = d7.selite_fi
	,[oppilaitostyyppi_fi] = coalesce(case when d10.koodi != -1 then d10.selite_fi end, left(d4.oppilaitostyyppi_fi, len(d4.oppilaitostyyppi_fi)-1))
	,[etaopetus_fi] = d8.selite_fi
	,[oppilaitoksen_alueellisuus_valtakunnallisuus_fi] = d9.selite_fi

	--sv
	,[luvan_alkamisvuosi_sv] = d5.vuosi
	,[luvan_alkamiskuukausi_sv] = d5.kuukausi_sv
	,[luvan_paattymisvuosi_sv] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'), 'Ej sluten')
	,[luvan_paattymiskuukausi_sv] = case when d6.kuukausi != 99 then d6.kuukausi_sv else 'Ej sluten' end
	,[lupa_voimassa_sv] = d11.kytkin_sv
	,[oppilaitoksen_yllapitaja_sv] = d1.organisaatio_sv
	,[oppilaitoksen_yllapitajan_kunta_sv] = d1a.kunta_sv
	,[oppilaitoksen_yllapitajan_maakunta_sv] = d1a.maakunta_sv
	,[oppilaitoksen_yllapitajan_hyvinvointialue_sv] = d1a.hyvinvointialue_sv
	,[opetuskieli_sv] = case d3.kieli_fi when 'pohjoissaame' then 'samiska' else d3.kieli_sv end
	,[oppilaitos_sv] = d4.organisaatio_sv
	,[oppilaitoksen_kunta_sv] = d2.kunta_sv
	,[oppilaitoksen_maakunta_sv] = d2.maakunta_sv
	,[oppilaitoksen_hyvinvointialue_sv] = d2.hyvinvointialue_sv
	,[erityinen_koulutustehtava_sv] = d7.selite_sv
	,[oppilaitostyyppi_sv] = coalesce(case when d10.koodi != -1 then d10.selite_sv end, left(d4.oppilaitostyyppi_sv, len(d4.oppilaitostyyppi_sv)-1))
	,[etaopetus_sv] = d8.selite_sv
	,[oppilaitoksen_alueellisuus_valtakunnallisuus_sv] = d9.selite_sv

	--en
	,[luvan_alkamisvuosi_en] = d5.vuosi
	,[luvan_alkamiskuukausi_en] = d5.kuukausi_en
	,[luvan_paattymisvuosi_en] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'), 'Not ended')
	,[luvan_paattymiskuukausi_en] = case when d6.kuukausi != 99 then d6.kuukausi_en else 'Not ended' end
	,[lupa_voimassa_en] = d11.kytkin_en
	,[oppilaitoksen_yllapitaja_en] = d1.organisaatio_en
	,[oppilaitoksen_yllapitajan_kunta_en] = d1a.kunta_en
	,[oppilaitoksen_yllapitajan_maakunta_en] = d1a.maakunta_en
	,[oppilaitoksen_yllapitajan_hyvinvointialue_en] = d1a.hyvinvointialue_en
	,[opetuskieli_en] = case d3.kieli_fi when 'pohjoissaame' then 'Sami' else d3.kieli_en end
	,[oppilaitos_en] = d4.organisaatio_en
	,[oppilaitoksen_kunta_en] = d2.kunta_en
	,[oppilaitoksen_maakunta_en] = d2.maakunta_en
	,[oppilaitoksen_hyvinvointialue_en] = d2.hyvinvointialue_en
	,[erityinen_koulutustehtava_en] = d7.selite_en
	,[oppilaitostyyppi_en] = coalesce(case when d10.koodi != -1 then d10.selite_en end, left(d4.oppilaitostyyppi_en, len(d4.oppilaitostyyppi_en)-1))
	,[etaopetus_en] = d8.selite_en
	,[oppilaitoksen_alueellisuus_valtakunnallisuus_en] = d9.selite_en

	--koodit
	,[koodit_oppilaitoksen_yllapitaja] = d1.organisaatio_koodi
	,[koodit_oppilaitos] = d4.organisaatio_koodi

	--järjestykset
	,[jarjestys_oppilaitoksen_yllapitajan_maakunta] = d1a.jarjestys_maakunta_koodi
	,[jarjestys_oppilaitoksen_yllapitajan_hyvinvointialue] = d1a.jarjestys_hyvinvointialue_koodi
	,[jarjestys_oppilaitoksen_maakunta] = d2.jarjestys_maakunta_koodi
	,[jarjestys_oppilaitoksen_hyvinvointialue] = d2.jarjestys_hyvinvointialue_koodi
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


GO


