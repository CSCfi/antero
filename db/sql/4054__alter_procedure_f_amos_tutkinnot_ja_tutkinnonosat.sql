USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 27.10.2020 17:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS


TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat] (
	 [Tilastovuosi]
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
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
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_toimipiste_id]
	,[d_kytkin_verrataan_lupatietoihin_id]
	,[d_kytkin_hankintakoulutus_id]
    ,[koko_tutkinto]
    ,[tutkinnon_osat]
    ,[osaamispisteet]
)

SELECT 
	 [Tilastovuosi] = tt.vuosi
	,d_kalenteri_id = coalesce(d9.id, -1)
	,d_kalenteri_alkamispaiva_id = coalesce(d9b.id, -1)
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
	,d_organisaatioluokitus_jarjestaja_hist_id = coalesce(d1e.id, -1)
	,d_organisaatioluokitus_jarjestaja_pihvi_id = coalesce(d1f.id, -1)
	,d_organisaatioluokitus_jarjestaja_pihvi_hist_id = coalesce(d1g.id, -1)
	,d_amos_spl_jarjestaja_linkki_id = coalesce(d1d.id, -1)
	,d_organisaatioluokitus_oppilaitos_id = coalesce(d1b.id, -1)
	,d_organisaatioluokitus_toimipiste_id = coalesce(d1c.id, -1)

	,d_kytkin_verrataan_lupatietoihin_id = coalesce(d14.id, -1)
	,d_kytkin_hankintakoulutus_id = coalesce(d15.id, -1)

    ,koko_tutkinto = count(distinct tutkinto)
    ,tutkinnon_osat = count(distinct tutkinnon_osa)
	,osaamispisteet = sum(coalesce(laajuus,0))

FROM  Koski_SA.dbo.tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty tt

LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = tt.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = tt.oppilaitos_oid
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
LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = (
	case 
		when (d2b.tutkintotyyppi_koodi = '02' and tt.alkamispaiva >= '2018-08-01') or (d2b.tutkintotyyppi_koodi in ('19','20') and tt.alkamispaiva >= '2019-01-01') then 1
		else 0 --tähän 1 jos vertailu halutaan tehdä kaikille opiskeluoikeuksille
	end
)
LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = (case when tt.koulutustoimija_oid_pihvi is null then 0 else 1 end)


GROUP BY 
	tt.vuosi
	,d1a.id
	,d1b.id
	,d1c.id
	,d1d.id
	,d1e.id
	,d1f.id
	,d1g.id
	,d2.id
	,d2b.id
	,d3.id
	,d4.id
	,d5.id
	,d7.id
	,d8.id
	,d9.id
	,d9b.id
	,d10.id
	,d11.id
	,d12.id
	,d13.id
	,d14.id
	,d15.id
	,diaarinumero
	
HAVING 
	   count(distinct tutkinto) > 0
    or count(distinct tutkinnon_osa) > 0
    or sum(coalesce(laajuus,0)) > 0	



