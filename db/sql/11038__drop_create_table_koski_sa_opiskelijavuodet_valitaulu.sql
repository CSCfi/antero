USE [Koski_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijavuodet_valitaulu]') AND type in (N'U'))
DROP TABLE [dbo].[opiskelijavuodet_valitaulu]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[opiskelijavuodet_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[tilv_date] [date] NULL,
	[master_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[osa_aikaisuus] [int] NOT NULL,
	[oppis] [varchar](50) NULL,
	[erityisopetus] [int] NOT NULL,
	[majoitus] [int] NOT NULL,
	[vankilaopetus] [varchar](50) NULL,
	[henkilostokoulutus] [int] NULL,
	[tyovoimakoulutus] [int] NOT NULL,
	[koulk] [char](6) NULL,
	[diaarinumero] [varchar](20) NULL,
	[koulk_pihvi] [char](6) NULL,
	[diaarinumero_pihvi] [varchar](20) NULL,
	[koulutusmuoto_pihvi] [varchar](100) NULL,
	[tunn_oid] [varchar](100) NULL,
	[jarj_oid] [varchar](100) NULL,
	[jarj_oid_hist] [varchar](100) NULL,
	[jarj_oid_pihvi] [varchar](100) NULL,
	[jarj_oid_pihvi_hist] [varchar](100) NULL,
	[toim_oid] [varchar](100) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[kustannusryhma_uusi] [varchar](50) NULL,
	[suorituksen_tyyppi] [varchar](250) NOT NULL,
	[suorituksen_kieli] [varchar](50) NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[maksuton] [int] NULL,
	[oikeutta_maksuttomuuteen_pidennetty] [int] NULL,
	[osaamisala] [varchar](50) NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[alkamispaiva] [date] NULL,
	[tutkosaa_pienempi_tt] [char](2) NULL,
	[opiskelijavuosi_lasna] [decimal](30, 20) NULL,
	[opiskelijavuosi_loma] [decimal](30, 20) NULL,
	[opiskelijavuosi_opva] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_loma] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_amm] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_tuva_lukio] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_lukio] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_sisaltyy_toiseen] [decimal](30, 20) NULL,
	[opiskelijavuosi_uusi] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_heinakuu] [decimal](30, 20) NULL
) ON [PRIMARY]
GO


