USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_hoivaavustajat]    Script Date: 29.7.2025 17.59.35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_hoivaavustajat] AS

DROP TABLE IF EXISTS dw.f_koski_hoivaavustajat

SELECT
	tilastovuosi = t.vuosi
	,tilastokuukausi = t.kuukausi
	,t.tutkinnon_perusteiden_voimaantulo

	,master_oid
    ,[patevyys]
    ,[patevyys_kumulatiivinen]
    ,[patevyyden_opiskeluoikeus_voimassa]
    ,[tutkinto]
    ,[tutkinto_kumulatiivinen]

	,d_kalenteri_id = coalesce(d0a.id,-1)
	,d_kalenteri_patevyys_id = coalesce(d0b.id,-1)
	,d_kalenteri_tutkinto_id = coalesce(d0c.id,-1)
	,d_kalenteri_alkamisaika_oo_pat_id = coalesce(d0d.id,-1)
	,d_sukupuoli_id = coalesce(d1.id,-1)
	,d_ika_id = coalesce(d2.id,-1)
	,d_kieli_aidinkieli_id = coalesce(d3.id,-1)
	,d_maatjavaltiot2_kansalaisuus_id = coalesce(d4.id,-1)
	,d_alueluokitus_kotikunta_id = coalesce(d5.id,-1)

	,d_opintojen_rahoitus_id_oo_pat = coalesce(d14.id, -1)

	,d_amos_spl_jarjestaja_linkki_id_oo_pat = coalesce(jl_pat.id, -1)
	,d_organisaatioluokitus_oppilaitos_id_oo_pat = coalesce(d6b.id, -1)
	,d_organisaatioluokitus_koulutustoimija_id_tt_pat = coalesce(d7.id, -1)
	,d_organisaatioluokitus_oppilaitos_id_tt_pat = coalesce(d8.id, -1)
	,d_organisaatioluokitus_toimipiste_id_tt_pat = coalesce(d9.id, -1)
	,d_alueluokitus_koulutustoimija_id_oo_pat = coalesce(d10.id, -1)
	,d_alueluokitus_oppilaitos_id_oo_pat = coalesce(d10b.id, -1)
	,d_alueluokitus_koulutustoimija_id_tt_pat = coalesce(d11.id, -1)
	,d_alueluokitus_oppilaitos_id_tt_pat = coalesce(d12.id, -1)
	,d_alueluokitus_toimipiste_id_tt_pat = coalesce(d13.id, -1)
	,d_amos_spl_jarjestaja_linkki_id_oo_tutk = coalesce(jl_tutk.id, -1)
	,d_organisaatioluokitus_oppilaitos_id_oo_tutk = coalesce(d16b.id, -1)
	,d_organisaatioluokitus_koulutustoimija_id_tt_tutk = coalesce(d17.id, -1)
	,d_organisaatioluokitus_oppilaitos_id_tt_tutk = coalesce(d18.id, -1)
	,d_organisaatioluokitus_toimipiste_id_tt_tutk = coalesce(d19.id, -1)
	,d_alueluokitus_koulutustoimija_id_oo_tutk = coalesce(d20.id, -1)
	,d_alueluokitus_oppilaitos_id_oo_tutk = coalesce(d20b.id, -1)
	,d_alueluokitus_koulutustoimija_id_tt_tutk = coalesce(d21.id, -1)
	,d_alueluokitus_oppilaitos_id_tt_tutk = coalesce(d22.id, -1)
	,d_alueluokitus_toimipiste_id_tt_tutk = coalesce(d23.id, -1)
	
	,loadtime = GETDATE()
	,username = SUSER_SNAME()

INTO dw.f_koski_hoivaavustajat
	
FROM Koski_SA.dbo.hoivaavustajat_valitaulu t
LEFT JOIN dw.d_kalenteri d0a on d0a.kalenteri_avain = datefromparts(t.vuosi, t.kuukausi, 1)
LEFT JOIN dw.d_kalenteri d0b on d0b.kalenteri_avain = datefromparts(t.[patevyyden_saavuttamisvuosi], t.[patevyyden_saavuttamiskuukausi], 1)
LEFT JOIN dw.d_kalenteri d0c on d0c.kalenteri_avain = datefromparts(t.[tutkinnon_suorittamisvuosi], t.[tutkinnon_suorittamiskuukausi], 1)
LEFT JOIN dw.d_kalenteri d0d on d0d.kalenteri_avain = datefromparts(t.alkamisvuosi_oo_pat, t.alkamiskuukausi_oo_pat, 1)
LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = t.sukupuoli
LEFT JOIN dw.d_ika d2 on d2.ika_avain = t.ika
LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = t.aidinkieli
LEFT JOIN dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = t.kansalaisuus
LEFT JOIN dw.d_alueluokitus d5 on d5.kunta_koodi = t.kotikunta
--pat
LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_oid = t.koulutustoimija_oid_oo_pat
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl_pat on jl_pat.ytunnus_avain = d6.organisaatio_koodi
LEFT JOIN dw.d_organisaatioluokitus d6b on d6b.organisaatio_oid = t.oppilaitos_oid_oo_pat
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.organisaatio_oid = t.koulutustoimija_oid_tt_pat
LEFT JOIN dw.d_organisaatioluokitus d8 on d8.organisaatio_oid = t.oppilaitos_oid_tt_pat
LEFT JOIN dw.d_organisaatioluokitus d9 on d9.organisaatio_oid = t.toimipiste_oid_tt_pat
LEFT JOIN dw.d_alueluokitus d10 on d10.kunta_koodi = jl_pat.kunta_koodi
LEFT JOIN dw.d_alueluokitus d10b on d10b.kunta_koodi = d6b.kunta_koodi
LEFT JOIN dw.d_alueluokitus d11 on d11.kunta_koodi = d7.kunta_koodi
LEFT JOIN dw.d_alueluokitus d12 on d12.kunta_koodi = d8.kunta_koodi
LEFT JOIN dw.d_alueluokitus d13 on d13.kunta_koodi = d9.kunta_koodi
LEFT JOIN dw.d_opintojenrahoitus d14 on d14.koodi = t.opintojen_rahoitus_oo_pat
--tutk
LEFT JOIN dw.d_organisaatioluokitus d16 on d16.organisaatio_oid = t.koulutustoimija_oid_oo_tutk
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl_tutk on jl_tutk.ytunnus_avain = d16.organisaatio_koodi
LEFT JOIN dw.d_organisaatioluokitus d16b on d16b.organisaatio_oid = t.oppilaitos_oid_oo_tutk
LEFT JOIN dw.d_organisaatioluokitus d17 on d17.organisaatio_oid = t.koulutustoimija_oid_tt_tutk
LEFT JOIN dw.d_organisaatioluokitus d18 on d18.organisaatio_oid = t.oppilaitos_oid_tt_tutk
LEFT JOIN dw.d_organisaatioluokitus d19 on d19.organisaatio_oid = t.toimipiste_oid_tt_tutk
LEFT JOIN dw.d_alueluokitus d20 on d20.kunta_koodi = jl_tutk.kunta_koodi
LEFT JOIN dw.d_alueluokitus d20b on d20b.kunta_koodi = d16b.kunta_koodi
LEFT JOIN dw.d_alueluokitus d21 on d21.kunta_koodi = d17.kunta_koodi
LEFT JOIN dw.d_alueluokitus d22 on d22.kunta_koodi = d18.kunta_koodi
LEFT JOIN dw.d_alueluokitus d23 on d23.kunta_koodi = d19.kunta_koodi

GO
