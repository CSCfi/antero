USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]    Script Date: 30.7.2025 10.24.28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]    Script Date: 30.7.2025 10.24.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty](
	[tilastovuosi] [int] NULL,
	[oo_alkamisajankohta] [varchar](33) NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_hk_jarj_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_koulutussopimus_id] [int] NULL,
	[d_amm_sopimusjaksot_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_kalenteri_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_kytkin_koulutusvienti_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_tutkintonimike_id] [int] NULL,
	[d_kieli_suorituskieli_id] [int] NULL,
	[d_kytkin_muu_ammatillinen_id] [int] NULL,
	[oppisopimus_osuus] [varchar](13) NOT NULL,
	[koulutussopimus_osuus] [varchar](13) NOT NULL,
	[master_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[d_ika_oo_alk_id] [int] NULL,
	[d_ika_oo_alk_tarkka_id] [int] NULL,
	[d_oo_aloitus_id] [int] NULL,
	[d_kytkin_oo_alkanut_kuussa_id] [int] NULL,
	[d_ika_opsoj_alk_id] [int] NULL,
	[d_ika_opsoj_alk_tarkka_id] [int] NULL,
	[d_opsoj_aloitus_id] [int] NULL,
	[opiskelijat] [int] NOT NULL,
	[uudet_opiskelijat] [int] NULL,
	[uudet_opiskelijat_rahoitus] [int] NULL,
	[eronnut] [int] NULL,
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
	[d_keskeyttaminen_vaiheittainen_id] [int] NULL,
	[d_keskeyttaminen_opiskelijan_toiminta_id] [int] NULL,
	[valmentava_koodi] [int] NULL,
	[opiskelijat_netto] [float] NULL,
	[tutkinnot] [int] NULL,
	[opiskelijavuodet] [int] NULL,
	[ryhma] [varchar](50) NULL,
	[kotikunta_manner_suomessa] [int] NULL,
	[oppivelvollinen] [int] NULL,
	[tutkinnot_todistus] [int] NULL
) ON [PRIMARY]
GO


