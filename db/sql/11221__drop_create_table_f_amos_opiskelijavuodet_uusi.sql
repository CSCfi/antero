USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijavuodet_uusi]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_opiskelijavuodet_uusi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_opiskelijavuodet_uusi](
	[generoitu] [int] NULL,
	[paivays] [date] NULL,
	[varainhoitovuosi] [int] NULL,
	[rahoituskausi] [nvarchar](24) NULL,
	[vuosi] [int] NULL,
	[suorituskausi] [nvarchar](24) NULL,
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_alkamispaiva_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_amos_pohjakoulutus_toisen_asteen_pohjakoulutus_2018_id] [int] NULL,
	[d_amos_pohjakoulutus_toisen_asteen_tutkinto_2018_id] [int] NULL,
	[maksuttomuus] [int] NULL,
	[maksuttomuus_simulointi] [int] NULL,
	[maksuttomuus_koski] [int] NULL,
	[perusopetuksen_suoritusvuosi] [int] NULL,
	[keskiarvo_lahde] [varchar](50) NULL,
	[d_opintojen_kulku_keskiarvot_keskiarvoluokka_id] [int] NULL,
	[yksilollistaminen] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_koulutusluokitus_pihvi_id] [int] NULL,
	[d_koulutusluokitus_tutk_osaa_pienempi_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_jarj_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_hist_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_kustannusryhma_uusi_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [nchar](10) NULL,
	[d_kytkin_verrataan_lupatietoihin_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_majoitus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[opiskelijavuodet] [decimal](30, 20) NULL,
	[opiskelijavuodet_hylatyt] [decimal](30, 20) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]
GO
