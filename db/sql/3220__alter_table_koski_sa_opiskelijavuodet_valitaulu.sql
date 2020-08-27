USE [Koski_SA]
GO

/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu]    Script Date: 23.8.2020 19:08:01 ******/
DROP TABLE [dbo].[opiskelijavuodet_valitaulu]
GO

/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu]    Script Date: 23.8.2020 19:08:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[opiskelijavuodet_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[tilv_date] [date] NULL,
	[oppija_oid] [varchar](100) NULL,
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
	[koulk_pihvi] [char](6) NULL,
	[tutkinnonosa_koodi] [varchar](250) NULL,
	[koulutusmuoto_pihvi] [varchar](100) NULL,
	[tunn_oid] [varchar](100) NULL,
	[jarj_oid] [varchar](100) NULL,
	[jarj_oid_hist] [varchar](100) NULL,
	[jarj_oid_pihvi] [varchar](100) NULL,
	[jarj_oid_pihvi_hist] [varchar](100) NULL,
	[toim_oid] [varchar](100) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[suorituksen_tyyppi] [varchar](250) NOT NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[alkamispaiva] [date] NULL,
	[opiskelijavuosi_lasna] [float] NULL,
	[opiskelijavuosi_loma] [float] NULL,
	[opiskelijavuosi_opva] [float] NULL,
	[hylatty_opiskelijavuosi_loma] [float] NULL,
	[hylatty_opiskelijavuosi_paallekkainen_amm] [float] NULL,
	[hylatty_opiskelijavuosi_paallekkainen_lukio] [float] NULL,
	[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus] [float] NULL,
	[hylatty_opiskelijavuosi_sisaltyy_toiseen] [float] NULL
) ON [PRIMARY]

GO
USE ANTERO