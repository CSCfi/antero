USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet]    Script Date: 2.8.2019 11:56:45 ******/
DROP TABLE [dw].[f_koski_amm_opiskelijavuodet]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet]    Script Date: 2.8.2019 11:56:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_amm_opiskelijavuodet](
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
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [nchar](10) NULL,
	[opiskelijavuodet] [decimal](20, 10) NULL,
	[opiskelijavuodet_hylatyt] [decimal](20, 10) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO


