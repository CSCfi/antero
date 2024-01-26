USE [ANTERO]
GO


/****** Object:  Table [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]    Script Date: 2.2.2023 19:32:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


if (@@SERVERNAME = 'DWIPVIPUSQL16') --ajo käynnissä testissä
begin 

/****** Object:  Table [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]    Script Date: 2.2.2023 19:32:25 ******/
DROP TABLE [dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]
--GO

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
	[d_ika_oo_alk_id] [bigint] NULL,
	[d_ika_oo_alk_tarkka_id] [bigint] NULL,
	[d_oo_aloitus_id] [bigint] NULL,
	[d_kytkin_oo_alkanut_kuussa_id] [int] NOT NULL,
	[d_ika_opsoj_alk_id] [bigint] NULL,
	[d_ika_opsoj_alk_tarkka_id] [bigint] NULL,
	[d_opsoj_aloitus_id] [bigint] NULL,
	[opiskelijat] [int] NOT NULL,
	[uudet_opiskelijat] [int] NOT NULL,
	[uudet_opiskelijat_rahoitus] [int] NOT NULL,
	[eronnut] [int] NOT NULL,
	[jatkaa_kj] [int] NOT NULL,
	[jatkaa_oppilaitos] [int] NOT NULL,
	[jatkaa_tutkintotyyppi] [int] NOT NULL,
	[jatkaa_ammatillinen] [int] NOT NULL,
	[jatkaa_yleissivistava] [int] NOT NULL,
	[jatkaa_valmentava] [int] NOT NULL,
	[jatkaa_lukio_valmentava] [int] NOT NULL,
	[jatkaa_amm_valmentava] [int] NOT NULL,
	[jatkaa_muu_ammatillinen] [int] NOT NULL,
	[jatkaa_amm_tutkintokoulutus] [int] NOT NULL,
	[d_keskeyttaminen_vaiheittainen_id] [int] NOT NULL,
	[valmentava_koodi] [int] NULL,
	[opiskelijat_netto] [float] NULL,
	[tutkinnot] [int] NOT NULL,
	[opiskelijavuodet] [int] NOT NULL,
	[ryhma] [varchar](50) NULL
) ON [PRIMARY]

end