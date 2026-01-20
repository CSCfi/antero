USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijat]    Script Date: 30.7.2025 10.18.32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_amm_opiskelijat]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_amm_opiskelijat]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijat]    Script Date: 30.7.2025 10.18.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_amm_opiskelijat](
	[tilastovuosi] [int] NULL,
	[tilastopaiva_20_9] [int] NULL,
	[oo_alkamisajankohta] [varchar](33) NULL,
	[d_kalenteri_id] [bigint] NULL,
	[d_kalenteri_oo_id] [bigint] NULL,
	[d_kytkin_oo_alkanut_kuussa_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
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
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL,
	[d_organisaatioluokitus_hk_jarj_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_kytkin_koulutusvienti_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_tutkintonimike_id] [int] NULL,
	[d_kieli_suorituskieli_id] [bigint] NULL,
	[d_kytkin_muu_ammatillinen_id] [int] NULL,
	[master_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[uusi] [int] NULL,
	[uusi_rahoitus] [int] NULL,
	[eronnut] [int] NOT NULL,
	[jatkaa_kj] [int] NULL,
	[jatkaa_oppilaitos] [int] NULL,
	[jatkaa_tutkintotyyppi] [int] NULL,
	[jatkaa_ammatillinen] [int] NULL,
	[jatkaa_yleissivistava] [int] NULL,
	[jatkaa_valmentava] [int] NULL,
	[jatkaa_lukio_valmentava] [int] NULL,
	[jatkaa_amm_valmentava] [int] NULL,
	[jatkaa_muu_ammatillinen] [int] NULL,
	[jatkaa_amm_tutkintokoulutus] [int] NULL,
	[d_keskeyttaminen_vaiheittainen_id] [bigint] NULL,
	[d_keskeyttaminen_opiskelijan_toiminta_id] [bigint] NOT NULL,
	[valmentava_koodi] [int] NULL,
	[kotikunta_manner_suomessa] [int] NULL,
	[oppivelvollinen] [int] NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
GO


