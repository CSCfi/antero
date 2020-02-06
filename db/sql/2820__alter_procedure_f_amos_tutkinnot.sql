USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 28.1.2020 16:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER procedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS


TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat] (
	 [Tilastovuosi]
    ,[d_kalenteri_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_koulutusluokitus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_kustannusryhma_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_erityisopetus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[koko_tutkinto]
    ,[tutkinnon_osat]
    ,[osaamispisteet]
)

SELECT 
	 [Tilastovuosi] = tt.vuosi
	,d_kalenteri_id = coalesce(d9.id, -1)
	,d_sukupuoli_id = coalesce(d11.id, -1)
	,d_kieli_aidinkieli_id = coalesce(d12.id, -1)
	,d_ika_id = coalesce(d13.id, -1)
	,d_koulutusluokitus_id = coalesce(d2b.id,d2.id, -1)
	
	,d_opintojenrahoitus_id = coalesce(d5.id, -1)
	,d_kustannusryhma_id = coalesce(d7.id, -1)
	,d_oppisopimuskoulutus_id = coalesce(d4.id, -1)
	,d_erityisopetus_id = coalesce(d3.id, -1)
	,d_kytkin_vankilaopetus_id = coalesce(d10.id, -1)
	,d_suorituksen_tyyppi_id = coalesce(d8.id, -1)

	,d_organisaatioluokitus_jarjestaja_id = coalesce(d1a.id, -1)
	,d_amos_spl_jarjestaja_linkki_id = coalesce(d1d.id, -1)
	,d_organisaatioluokitus_oppilaitos_id = coalesce(d1b.id, -1)
	,d_organisaatioluokitus_toimipiste_id = coalesce(d1c.id, -1)

    ,koko_tutkinto = count(distinct tutkinto)
    ,tutkinnon_osat = count(distinct tutkinnon_osa)
	,osaamispisteet = sum(coalesce(laajuus,0))

FROM  Koski_SA.dbo.tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty tt

LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = tt.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = tt.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.organisaatio_oid = tt.toimipiste_oid
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1d on d1d.oid_avain = tt.koulutustoimija_oid
LEFT JOIN dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = tt.tutkinto_koodi
LEFT JOIN dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = d2.uusi_eat_koodi
LEFT JOIN dw.d_erityisopetus d3 on d3.erityisopetus_koodi = tt.erityisopetus_koodi
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.koodi = tt.oppisopimus_koodi
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.koodi = tt.opintojen_rahoitus_koodi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.koodi = tt.kustannusryhma_koodi
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.koodi = tt.suorituksen_tyyppi_koodi
LEFT JOIN dw.d_kalenteri d9 on d9.kalenteri_avain = CONCAT(tt.vuosi,'-',right(CONCAT('00', tt.kuukausi),2),'-01')
LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi = tt.vankilaopetus_koodi
LEFT JOIN dw.d_sukupuoli d11 on d11.sukupuoli_koodi = tt.sukupuoli
LEFT JOIN dw.d_kieli d12 on d12.kieli_koodi = tt.aidinkieli
LEFT JOIN dw.d_ika d13 on d13.ika_avain = tt.ika


group by 
	 tt.vuosi
	,d1a.id
	,d1b.id
	,d1c.id
	,d1d.id
	,d2.id
	,d2b.id
	,d3.id
	,d4.id
	,d5.id
	,d7.id
	,d8.id
	,d9.id
	,d10.id
	,d11.id
	,d12.id
	,d13.id
	
HAVING 
	   count(distinct tutkinto) > 0
    OR count(distinct tutkinnon_osa) > 0
    OR sum(coalesce(laajuus,0)) > 0	

