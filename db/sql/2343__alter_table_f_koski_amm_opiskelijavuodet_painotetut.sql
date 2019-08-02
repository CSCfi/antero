USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 2.8.2019 11:58:36 ******/
DROP TABLE [dw].[f_koski_amm_opiskelijavuodet_painotetut]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 2.8.2019 11:58:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_amm_opiskelijavuodet_painotetut](
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
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [int] NULL,
	[opiskelijavuodet_painottamaton] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_yhteensa] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_pt] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_at_eat] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_valma_telma] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_opisk_valm_tukevat] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_muu] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_erityistuki] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_majoitus] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_henkilostokoulutus] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_tyovoimakoulutus] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_vankilaopetus] [decimal](20, 10) NULL,
	[opiskelijavuodet_hylatyt] [decimal](20, 10) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO


