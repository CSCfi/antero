USE [ANTERO]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut]    Script Date: 10.2.2020 17:38:17 ******/
DROP TABLE [dw].[f_amos_opiskelijavuodet_painotetut]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet]    Script Date: 10.2.2020 17:38:17 ******/
DROP TABLE [dw].[f_amos_opiskelijavuodet]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet]    Script Date: 10.2.2020 17:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_amos_opiskelijavuodet](
	[vuosi] [int] NULL,
	[d_kalenteri_id] [int] NULL,
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
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [nchar](10) NULL,
	[opiskelijavuodet] [float] NULL,
	[opiskelijavuodet_hylatyt] [float] NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut]    Script Date: 10.2.2020 17:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_amos_opiskelijavuodet_painotetut](
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
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [int] NULL,
	[opiskelijavuodet_painottamaton] [float] NULL,
	[opiskelijavuodet_painotettu_yhteensa] [float] NULL,
	[opiskelijavuodet_painotettu_pt] [float] NULL,
	[opiskelijavuodet_painotettu_at_eat] [float] NULL,
	[opiskelijavuodet_painotettu_valma_telma] [float] NULL,
	[opiskelijavuodet_painotettu_opisk_valm_tukevat] [float] NULL,
	[opiskelijavuodet_painotettu_muu] [float] NULL,
	[opiskelijavuodet_painotettu_erityistuki] [float] NULL,
	[opiskelijavuodet_painotettu_majoitus] [float] NULL,
	[opiskelijavuodet_painotettu_henkilostokoulutus] [float] NULL,
	[opiskelijavuodet_painotettu_tyovoimakoulutus] [float] NULL,
	[opiskelijavuodet_painotettu_vankilaopetus] [float] NULL,
	[opiskelijavuodet_hylatyt] [float] NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]
