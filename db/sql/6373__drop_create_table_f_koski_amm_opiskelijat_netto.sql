USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijat_netto]    Script Date: 2.9.2022 10:12:23 ******/
DROP TABLE [dw].[f_koski_amm_opiskelijat_netto]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijat_netto]    Script Date: 2.9.2022 10:12:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_amm_opiskelijat_netto](
	[tilastovuosi] [int] NULL,
	[d_kalenteri_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_koulutussopimus_id] [int] NULL,
	[d_amm_sopimusjaksot_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_kieli_suorituskieli_id] [bigint] NULL,
	[d_kytkin_muu_ammatillinen_id] [int] NULL,
	[d_ika_oo_alk_id] [bigint] NULL,
	[d_ika_oo_alk_tarkka_id] [bigint] NULL,
	[d_ika_opsoj_alk_id] [bigint] NULL,
	[d_ika_opsoj_alk_tarkka_id] [bigint] NULL,
	[d_oo_aloitus_id] [bigint] NULL,
	[d_opsoj_aloitus_id] [bigint] NULL,
	[valmentava_koodi] [int] NULL,
	[uudet_opiskelijat] [float] NULL,
	[opiskelijat] [float] NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]

GO


