USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut_uusi]    Script Date: 15.9.2020 8:30:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_opiskelijavuodet_painotetut_uusi](
	[tilastovuosi] [int] NULL,
	[d_kalenteri_tilastokuukausi_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_jarj_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_hist_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_majoitus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_kytkin_sisaopp_ov_ylittyy_id] [int] NULL,
	[d_kytkin_erityistuen_ov_ylittyy_id] [int] NULL,
	[opiskelijavuodet_painottamaton] [float] NULL,
	[opiskelijavuodet_painotettu_yhteensa] [float] NULL,
	[opiskelijavuodet_painotettu_pt] [float] NULL,
	[opiskelijavuodet_painotettu_at_eat] [float] NULL,
	[opiskelijavuodet_painotettu_valma_telma] [float] NULL,
	[opiskelijavuodet_painotettu_opisk_valm_tukevat] [float] NULL,
	[opiskelijavuodet_painotettu_muu] [float] NULL,
	[opiskelijavuodet_painotettu_erityistuki] [float] NULL,
	[opiskelijavuodet_painotettu_erityistuki_hyv] [float] NULL,
	[opiskelijavuodet_painotettu_majoitus] [float] NULL,
	[opiskelijavuodet_painotettu_majoitus_hyv] [float] NULL,
	[opiskelijavuodet_painotettu_henkilostokoulutus] [float] NULL,
	[opiskelijavuodet_painotettu_tyovoimakoulutus] [float] NULL,
	[opiskelijavuodet_painotettu_vankilaopetus] [float] NULL,
	[opiskelijavuodet_hylatyt] [float] NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO


