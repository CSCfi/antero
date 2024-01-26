USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]    Script Date: 22.12.2022 17:07:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF  NOT EXISTS (
	SELECT * 
	FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]') AND type in (N'U')
)

BEGIN

  CREATE TABLE [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty](
	[tilastovuosi] [int] NULL,
	[oo_alkamisajankohta] [varchar](33) NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_koulutussopimus_id] [int] NULL,
	[d_amm_sopimusjaksot_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_kalenteri_id] [bigint] NULL,
	[d_majoitus_id] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_kieli_suorituskieli_id] [bigint] NULL,
	[d_kytkin_muu_ammatillinen_id] [int] NULL,
	[oppisopimus_osuus] [varchar](13) NOT NULL,
	[koulutussopimus_osuus] [varchar](13) NOT NULL,
	[oppija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[d_ika_oo_alk_id] [int] NULL,
	[d_ika_oo_alk_tarkka_id] [int] NULL,
	[d_oo_aloitus_id] [bigint] NULL,
	[d_kytkin_oo_alkanut_kuussa_id] [int] NULL,
	[d_ika_opsoj_alk_id] [int] NULL,
	[d_ika_opsoj_alk_tarkka_id] [int] NULL,
	[d_opsoj_aloitus_id] [int] NULL,
	[opiskelijat] [int] NOT NULL,
	[uudet_opiskelijat] [int] NULL,
	[uudet_opiskelijat_rahoitus] [int] NULL,
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
	[valmentava_koodi] [int] NULL,
	[opiskelijat_netto] [int] NOT NULL,
	[tutkinnot] [int] NOT NULL,
	[opiskelijavuodet] [int] NOT NULL,
	[ryhma] [varchar](11) NOT NULL
 ) ON [PRIMARY]

END
