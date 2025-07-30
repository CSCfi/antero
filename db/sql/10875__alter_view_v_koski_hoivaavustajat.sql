USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_hoivaavustajat]    Script Date: 29.7.2025 18.00.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_koski_hoivaavustajat] AS

SELECT 
	oppija_oid = master_oid
    ,[patevyys]
    ,[patevyys_kumulatiivinen]
    ,[patevyyden_opiskeluoikeus_voimassa]
    ,[tutkinto]
    ,[tutkinto_kumulatiivinen]

	,[Tilastovuosi] = f.tilastovuosi
	,[Tilastokuukausi] = d0a.kuukausi_fi
	,[Tutkinnon perusteiden voimaantulo] = f.tutkinnon_perusteiden_voimaantulo
	,[Pätevyyden saavuttamisvuosi] = d0b.vuosi
	,[Pätevyyden saavuttamiskuukausi] = d0b.kuukausi_fi
	,[Tutkinnon suorittamisvuosi] = coalesce(cast(nullif(d0c.vuosi, -1) as varchar), ' Tieto puuttuu')
	,[Tutkinnon suorittamiskuukausi] = d0c.kuukausi_fi
	,[Opiskeluoikeuden alkamisvuosi] = d0d.vuosi
	,[Opiskeluoikeuden alkamiskuukausi] = d0d.kuukausi_fi

	,[Opiskeluoikeus päättynyt] = case when patevyyden_opiskeluoikeus_voimassa = 0 then 'Opiskeluoikeus päättynyt' else 'Opiskeluoikeus ei päättynyt' end
	,[Tutkinto suoritettu] = case when tutkinto_kumulatiivinen = 1 then 'Tutkinto suoritettu' else 'Tutkinto ei suoritettu' end

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä] = d2.ika_fi
	,[Ikäryhmä] = d2.ikaryhma3_fi
	,[Äidinkieli] = d3.kieli_fi
	,[Äidinkieli (ryhmä)] = d3.kieliryhma1_fi
	,[Kansalaisuus] = d4.maatjavaltiot2_fi
	,[Kansalaisuus (ryhmä)] = d4.maanosa1_fi
	,[Kansalaisuus (maanosa)] = d4.maanosa0_fi
	,[Kotikunta] = d5.kunta_fi
	,[Kotimaakunta] = d5.maakunta_fi
	,[Kotikunnan hyvinvointialue] = d5.hyvinvointialue_fi

	,[Rahoitusmuoto (pätevyys)] = d14.selite_fi

  --org
	--pat
	,[Koul. järj. (pätevyys)] = jl_pat.nimi_amos_spl
	,[Koul. järj. kunta (pätevyys)] = d10.kunta_fi
	,[Koul. järj. maak. (pätevyys)] = d10.maakunta_fi
	,[Koul. järj. hyvinvointialue (pätevyys)] = d10.hyvinvointialue_fi
	,[Koul. järj. AVI (pätevyys)] = d10.avi_fi
	,[Koul. järj. ELY (pätevyys)] = d10.ely_fi

	,[Oppilaitos (pätevyys)] = d6b.organisaatio_fi
	,[Oppilaitoksen kunta (pätevyys)] = d10b.kunta_fi
	,[Oppilaitoksen maak. (pätevyys)] = d10b.maakunta_fi
	,[Oppilaitoksen hyvinvointialue (pätevyys)] = d10b.hyvinvointialue_fi
	,[Oppilaitoksen AVI (pätevyys)] = d10b.avi_fi
	,[Oppilaitoksen ELY (pätevyys)] = d10b.ely_fi

	,[Koul. järj. (pätevyys/todistus)] = d7.organisaatio_fi
	,[Koul. järj. kunta (pätevyys/todistus)] = d11.kunta_fi
	,[Koul. järj. maak. (pätevyys/todistus)] = d11.maakunta_fi
	,[Koul. järj. hyvinvointialue (pätevyys/todistus)] = d11.hyvinvointialue_fi
	,[Koul. järj. AVI (pätevyys/todistus)] = d11.avi_fi
	,[Koul. järj. ELY (pätevyys/todistus)] = d11.ely_fi	

	,[Oppilaitos (pätevyys/todistus)] = d8.organisaatio_fi
	,[Oppilaitoksen kunta (pätevyys/todistus)] = d12.kunta_fi
	,[Oppilaitoksen maak. (pätevyys/todistus)] = d12.maakunta_fi
	,[Oppilaitoksen hyvinvointialue (pätevyys/todistus)] = d12.hyvinvointialue_fi
	,[Oppilaitoksen AVI (pätevyys/todistus)] = d12.avi_fi
	,[Oppilaitoksen ELY (pätevyys/todistus)] = d12.ely_fi

	,[Toimipiste (pätevyys/todistus)] = d9.organisaatio_fi
	,[Toimipisteen kunta (pätevyys/todistus)] = d13.kunta_fi
	,[Toimipisteen maak. (pätevyys/todistus)] = d13.maakunta_fi
	,[Toimipisteen hyvinvointialue (pätevyys/todistus)] = d13.hyvinvointialue_fi
	,[Toimipisteen AVI (pätevyys/todistus)] = d13.avi_fi
	,[Toimipisteen ELY (pätevyys/todistus)] = d13.ely_fi

	--tutk
	,[Koul. järj. (tutkinto)] = jl_tutk.nimi_amos_spl
	,[Koul. järj. kunta (tutkinto)] = d20.kunta_fi
	,[Koul. järj. maak. (tutkinto)] = d20.maakunta_fi
	,[Koul. järj. hyvinvointialue (tutkinto)] = d20.hyvinvointialue_fi
	,[Koul. järj. AVI (tutkinto)] = d20.avi_fi
	,[Koul. järj. ELY (tutkinto)] = d20.ely_fi
	
	,[Oppilaitos (tutkinto)] = d16b.organisaatio_fi
	,[Oppilaitoksen kunta (tutkinto)] = d20b.kunta_fi
	,[Oppilaitoksen maak. (tutkinto)] = d20b.maakunta_fi
	,[Oppilaitoksen hyvinvointialue (tutkinto)] = d20b.hyvinvointialue_fi
	,[Oppilaitoksen AVI (tutkinto)] = d20b.avi_fi
	,[Oppilaitoksen ELY (tutkinto)] = d20b.ely_fi

	,[Koul. järj. (tutkinto/todistus)] = d17.organisaatio_fi
	,[Koul. järj. kunta (tutkinto/todistus)] = d21.kunta_fi
	,[Koul. järj. maak. (tutkinto/todistus)] = d21.maakunta_fi
	,[Koul. järj. hyvinvointialue (tutkinto/todistus)] = d21.hyvinvointialue_fi
	,[Koul. järj. AVI (tutkinto/todistus)] = d21.avi_fi
	,[Koul. järj. ELY (tutkinto/todistus)] = d21.ely_fi
	
	,[Oppilaitos (tutkinto/todistus)] = d18.organisaatio_fi
	,[Oppilaitoksen kunta (tutkinto/todistus)] = d22.kunta_fi
	,[Oppilaitoksen maak. (tutkinto/todistus)] = d22.maakunta_fi
	,[Oppilaitoksen hyvinvointialue (tutkinto/todistus)] = d22.hyvinvointialue_fi
	,[Oppilaitoksen AVI (tutkinto/todistus)] = d22.avi_fi
	,[Oppilaitoksen ELY (tutkinto/todistus)] = d22.ely_fi

	,[Toimipiste (tutkinto/todistus)] = d19.organisaatio_fi
	,[Toimipisteen kunta (tutkinto/todistus)] = d23.kunta_fi
	,[Toimipisteen maak. (tutkinto/todistus)] = d23.maakunta_fi
	,[Toimipisteen hyvinvointialue (tutkinto/todistus)] = d23.hyvinvointialue_fi
	,[Toimipisteen AVI (tutkinto/todistus)] = d23.avi_fi
	,[Toimipisteen ELY (tutkinto/todistus)] = d23.ely_fi

	--koodit
	,[Koodit Koul. järj. (pätevyys)] = coalesce(jl_pat.ytunnus_amos_spl, jl_pat.ytunnus_avain)
	,[Koodit Koul. järj. (pätevyys/todistus)] = d7.organisaatio_koodi
	,[Koodit Koul. järj. (tutkinto)] = coalesce(jl_tutk.ytunnus_amos_spl, jl_tutk.ytunnus_avain)
	,[Koodit Koul. järj. (tutkinto/todistus)] = d17.organisaatio_koodi

	--jarjestys
	,jarjestys_tilastokuukausi = d0a.kuukausi
	,jarjestys_patevyyden_saavuttamiskuukausi = d0b.kuukausi
	,jarjestys_tutkinnon_suorittamiskuukausi = d0c.kuukausi
	,jarjestys_opiskeluoikeuden_alkamiskuukausi = d0d.kuukausi
	,jarjestys_sukupuoli = d1.jarjestys_sukupuoli_koodi
	,d2.jarjestys_ika
	,jarjestys_ikaryhma = d2.jarjestys_ikaryhma3
	,jarjestys_aidinkieli_ryhma = d3.jarjestys_kieliryhma1
	,jarjestys_kansalaisuus_ryhma = d4.jarjestys_maanosa1_koodi
	,jarjestys_kansalaisuus_maanosa = d4.jarjestys_maanosa0_koodi
	,jarjestys_rahoitusmuoto_patevyys = d14.jarjestys_koodi
	,jarjestys_kotimaakunta = d5.jarjestys_maakunta_koodi
	,jarjestys_maakunta_kj_oo_pat = d10.jarjestys_maakunta_koodi
	,jarjestys_maakunta_ol_oo_pat = d10b.jarjestys_maakunta_koodi
	,jarjestys_maakunta_kj_tt_pat = d11.jarjestys_maakunta_koodi
	,jarjestys_maakunta_ol_tt_pat = d12.jarjestys_maakunta_koodi
	,jarjestys_maakunta_tp_tt_pat = d13.jarjestys_maakunta_koodi
	,jarjestys_maakunta_kj_oo_tutk = d20.jarjestys_maakunta_koodi
	,jarjestys_maakunta_ol_oo_tutk = d20b.jarjestys_maakunta_koodi
	,jarjestys_maakunta_kj_tt_tutk = d21.jarjestys_maakunta_koodi
	,jarjestys_maakunta_ol_tt_tutk = d22.jarjestys_maakunta_koodi
	,jarjestys_maakunta_tp_tt_tutk = d23.jarjestys_maakunta_koodi
	,jarjestys_kotikunnan_hyvinvointialue = d5.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_kj_oo_pat = d10.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_ol_oo_pat = d10b.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_kj_tt_pat = d11.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_ol_tt_pat = d12.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_tp_tt_pat = d13.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_kj_oo_tutk = d20.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_ol_oo_tutk = d20b.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_kj_tt_tutk = d21.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_ol_tt_tutk = d22.jarjestys_hyvinvointialue_koodi
	,jarjestys_hyvinvointialue_tp_tt_tutk = d23.jarjestys_hyvinvointialue_koodi

FROM dw.f_koski_hoivaavustajat f
LEFT JOIN dw.d_kalenteri d0a on d0a.id = f.d_kalenteri_id
LEFT JOIN dw.d_kalenteri d0b on d0b.id = f.d_kalenteri_patevyys_id
LEFT JOIN dw.d_kalenteri d0c on d0c.id = f.d_kalenteri_tutkinto_id
LEFT JOIN dw.d_kalenteri d0d on d0d.id = f.d_kalenteri_alkamisaika_oo_pat_id
LEFT JOIN dw.d_sukupuoli d1 on d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN dw.d_kieli d3 on d3.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_maatjavaltiot2 d4 on d4.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN dw.d_alueluokitus d5 on d5.id = f.d_alueluokitus_kotikunta_id 
--pat
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl_pat on jl_pat.id = f.d_amos_spl_jarjestaja_linkki_id_oo_pat
LEFT JOIN dw.d_organisaatioluokitus d6b on d6b.id = f.d_organisaatioluokitus_oppilaitos_id_oo_pat
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.id = f.d_organisaatioluokitus_koulutustoimija_id_tt_pat
LEFT JOIN dw.d_organisaatioluokitus d8 on d8.id = f.d_organisaatioluokitus_oppilaitos_id_tt_pat
LEFT JOIN dw.d_organisaatioluokitus d9 on d9.id = f.d_organisaatioluokitus_toimipiste_id_tt_pat
LEFT JOIN dw.d_alueluokitus d10 on d10.id = f.d_alueluokitus_koulutustoimija_id_oo_pat
LEFT JOIN dw.d_alueluokitus d10b on d10b.id = f.d_alueluokitus_oppilaitos_id_oo_pat
LEFT JOIN dw.d_alueluokitus d11 on d11.id = f.d_alueluokitus_koulutustoimija_id_tt_pat
LEFT JOIN dw.d_alueluokitus d12 on d12.id = f.d_alueluokitus_oppilaitos_id_tt_pat
LEFT JOIN dw.d_alueluokitus d13 on d13.id = f.d_alueluokitus_toimipiste_id_tt_pat
LEFT JOIN dw.d_opintojenrahoitus d14 on d14.id = f.d_opintojen_rahoitus_id_oo_pat
--tutk
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl_tutk on jl_tutk.id = f.d_amos_spl_jarjestaja_linkki_id_oo_tutk
LEFT JOIN dw.d_organisaatioluokitus d16b on d16b.id = f.d_organisaatioluokitus_oppilaitos_id_oo_tutk
LEFT JOIN dw.d_organisaatioluokitus d17 on d17.id = f.d_organisaatioluokitus_koulutustoimija_id_tt_tutk
LEFT JOIN dw.d_organisaatioluokitus d18 on d18.id = f.d_organisaatioluokitus_oppilaitos_id_tt_tutk
LEFT JOIN dw.d_organisaatioluokitus d19 on d19.id = f.d_organisaatioluokitus_toimipiste_id_tt_tutk
LEFT JOIN dw.d_alueluokitus d20 on d20.id = f.d_alueluokitus_koulutustoimija_id_oo_tutk
LEFT JOIN dw.d_alueluokitus d20b on d20b.id = f.d_alueluokitus_oppilaitos_id_oo_tutk
LEFT JOIN dw.d_alueluokitus d21 on d21.id = f.d_alueluokitus_koulutustoimija_id_tt_tutk
LEFT JOIN dw.d_alueluokitus d22 on d22.id = f.d_alueluokitus_oppilaitos_id_tt_tutk
LEFT JOIN dw.d_alueluokitus d23 on d23.id = f.d_alueluokitus_toimipiste_id_tt_tutk

GO
