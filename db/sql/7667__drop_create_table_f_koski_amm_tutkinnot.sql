USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_amm_tutkinnot]    Script Date: 19.4.2023 16:08:07 ******/
DROP TABLE [dw].[f_koski_amm_tutkinnot]
GO

/****** Object:  Table [dw].[f_koski_amm_tutkinnot]    Script Date: 19.4.2023 16:08:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_amm_tutkinnot](
	[tilastovuosi] [int] NULL,
	[d_kalenteri_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
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
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_kytkin_koulutusvienti_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_kieli_suorituskieli_id] [int] NULL,
	[d_kytkin_muu_ammatillinen_id] [int] NULL,
	[valmentava_koodi] [int] NULL,
	[oppisopimus_osuus] [varchar](13) NOT NULL,
	[koulutussopimus_osuus] [varchar](13) NOT NULL,
	[oppija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]

GO


