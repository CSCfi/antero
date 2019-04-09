USE [ANTERO]
GO
/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 3.4.2019 13:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_amm_opiskelijavuodet_painotetut]') AND type in (N'U'))
BEGIN
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
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
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
	[opiskelijavuodet_painotettu_vankilaopetus] [decimal](20, 10) NULL
) ON [PRIMARY]
END
