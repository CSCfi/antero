USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijavuodet_painotetut_unpivot_uusi]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_opiskelijavuodet_painotetut_unpivot_uusi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_opiskelijavuodet_painotetut_unpivot_uusi](
	[generoitu] [int] NULL,
	[rahoituskausi] [nvarchar](24) NULL,
	[suorituskausi] [nvarchar](24) NULL,
	[tilastovuosi] [int] NULL,
	[d_kalenteri_tilastokuukausi_id] [int] NULL,
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
	[d_koulutusluokitus_tutk_osaa_pienempi_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_jarj_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_hist_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_majoitus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_kytkin_sisaopp_ov_ylittyy_id] [int] NULL,
	[d_kytkin_erityistuen_ov_ylittyy_id] [int] NULL,
	[d_kytkin_oppivelvollisuus_id] [int] NULL,
	[opv_som_max] [int] NULL,
	[opv_vet_max] [int] NULL,
	[opv_ei_maksuton_max] [int] NULL,
	[opv_ei_maksuton_kerroin] [decimal](30, 20) NULL,
	[d_amos_painotuksen_tyyppi_id] [int] NULL,
	[painotettu] [decimal](30, 20) NULL,
	[painottamaton] [decimal](30, 20) NULL,
	[hylatty] [decimal](30, 20) NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
GO
