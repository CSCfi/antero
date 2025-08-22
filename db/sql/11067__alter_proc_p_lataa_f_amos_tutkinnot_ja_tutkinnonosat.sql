USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 9.5.2025 10.34.59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS

TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat] (
	[Tilastovuosi]
	,suorituskausi
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
	,perusopetuksen_suoritusvuosi
	,d_opintojen_kulku_keskiarvot_keskiarvoluokka_id
    ,[d_koulutusluokitus_id]
    ,[d_opintojenrahoitus_id]
	,d_maksuttomuus_id
    ,[d_kustannusryhma_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_erityisopetus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_osaamisala_id]
	,[d_kieli_suoritus_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_oppilaitos_pihvi_id]
    ,[d_organisaatioluokitus_toimipiste_id]
	,[d_kytkin_verrataan_lupatietoihin_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
    ,[koko_tutkinto]
    ,[tutkinnon_osat]
    ,[osaamispisteet]
)

SELECT 
	[Tilastovuosi] = tt.vuosi
	,suorituskausi = d9.rahoituskausi_amm
	,d_kalenteri_id = coalesce(d9.id, -1)
	,d_kalenteri_alkamispaiva_id = coalesce(d9b.id, -1)
	,d_sukupuoli_id = coalesce(d11.id, -1)
	,d_kieli_aidinkieli_id = coalesce(d12.id, -1)
	,d_ika_id = coalesce(d13.id, -1)
	,perusopetuksen_suoritusvuosi
	,d_opintojen_kulku_keskiarvot_keskiarvoluokka_id = coalesce(d22.id, -1)
	,d_koulutusluokitus_id = coalesce(d2b.id,d2.id, -1)
	,d_opintojenrahoitus_id = coalesce(d5.id, -1)
	,d_maksuttomuus_id = coalesce(d21.id, -1)
	,d_kustannusryhma_id = coalesce(d7.id, -1)
	,d_oppisopimuskoulutus_id = coalesce(d4.id, -1)
	,d_erityisopetus_id = coalesce(d3.id, -1)
	,d_kytkin_vankilaopetus_id = coalesce(d10.id, -1)
	,d_suorituksen_tyyppi_id = coalesce(d8.id, -1)
	,d_osaamisala_id = coalesce(d20.id, -1)
	,d_kieli_suoritus_id = coalesce(d16.id, -1)

	,d_organisaatioluokitus_jarjestaja_id = coalesce(d1a.id, -1)
	,d_organisaatioluokitus_jarjestaja_hist_id = coalesce(d1e.id, -1)
	,d_organisaatioluokitus_jarjestaja_pihvi_id = coalesce(d1f.id, -1)
	,d_organisaatioluokitus_jarjestaja_pihvi_hist_id = coalesce(d1g.id, -1)
	,d_amos_spl_jarjestaja_linkki_id = coalesce(d1d.id, -1)
	,d_organisaatioluokitus_oppilaitos_id = coalesce(d1b.id, -1)
	,d_organisaatioluokitus_oppilaitos_pihvi_id = coalesce(d1bb.id, -1)
	,d_organisaatioluokitus_toimipiste_id = coalesce(d1c.id, -1)

	,d_kytkin_verrataan_lupatietoihin_id = coalesce(d14.id, -1)
	,d_kytkin_hankintakoulutus_id = coalesce(d15.id, -1)

	,d_amos_luvaton_koulutus = coalesce(d17.id, -1)
	,d_amos_luvaton_korotustekija = coalesce(d18.id, -1)
	,d_kieli_suoritus_luvanmukainen_id = coalesce(d19.id, -1)

    ,koko_tutkinto = tt.tutkinnot
    ,tutkinnon_osat = tt.tutkinnon_osat
	,osaamispisteet = tt.osaamispisteet
	
FROM Koski_SA.dbo.tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat tt
LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = tt.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = tt.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d1bb on d1bb.organisaatio_oid = tt.oppilaitos_oid_pihvi
LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.organisaatio_oid = tt.toimipiste_oid
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1d on d1d.oid_avain = tt.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1e on d1e.organisaatio_oid = tt.koulutustoimija_oid_hist
LEFT JOIN dw.d_organisaatioluokitus d1f on d1f.organisaatio_oid = tt.koulutustoimija_oid_pihvi
LEFT JOIN dw.d_organisaatioluokitus d1g on d1g.organisaatio_oid = tt.koulutustoimija_oid_pihvi_hist
LEFT JOIN dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = tt.tutkinto_koodi
LEFT JOIN dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = coalesce(d2.uusi_eat_koodi,d2.koulutusluokitus_koodi)
LEFT JOIN dw.d_erityisopetus d3 on d3.erityisopetus_koodi = tt.erityisopetus_koodi
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.koodi = tt.oppisopimus_koodi
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.koodi = tt.opintojen_rahoitus_koodi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.koodi = tt.kustannusryhma_koodi
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.koodi = tt.suorituksen_tyyppi_koodi
LEFT JOIN dw.d_kalenteri d9 on d9.kalenteri_avain = concat(tt.vuosi,'-',right(concat('00', tt.kuukausi),2),'-01')
LEFT JOIN dw.d_kalenteri d9b on d9b.kalenteri_avain = tt.alkamispaiva
LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi = tt.vankilaopetus_koodi
LEFT JOIN dw.d_sukupuoli d11 on d11.sukupuoli_koodi = tt.sukupuoli
LEFT JOIN dw.d_kieli d12 on d12.kieli_koodi = tt.aidinkieli
LEFT JOIN dw.d_ika d13 on d13.ika_avain = tt.ika
LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = tt.verrataan_lupatietoihin
LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = (case when tt.koulutustoimija_oid_pihvi is null then 0 else 1 end)
LEFT JOIN dw.d_kieli d16 on d16.kieli_koodi = tt.suorituskieli_koodiarvo
LEFT JOIN dw.d_amos_luvaton_koulutus d17 on d17.koodi = tt.lupa_koulutus
LEFT JOIN dw.d_amos_luvaton_korotustekija d18 on d18.koodi = tt.lupa_korotustekija
LEFT JOIN dw.d_kieli d19 on d19.kieli_koodi = tt.lupa_suorituskieli
LEFT JOIN dw.d_osaamisala d20 ON d20.koodi = tt.osaamisala_koodiarvo
LEFT JOIN dw.d_kytkin d21 on d21.kytkin_koodi = tt.maksuttomuus
LEFT JOIN dw.d_opintojen_kulku_keskiarvot d22 ON d22.keskiarvo_koodi = tt.keskiarvoluokka and d22.tyyppi = 'keskiarvo'

GO
