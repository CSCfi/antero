USE [Koski_SA]
GO
/****** Object:  Table [sa].[opiskelijavuodet_valitaulu]    Script Date: 17.9.2019 16:23:40 ******/
DROP TABLE IF EXISTS [sa].[opiskelijavuodet_valitaulu]
GO
/****** Object:  Table [sa].[opiskelijavuodet_valitaulu]    Script Date: 17.9.2019 16:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[opiskelijavuodet_valitaulu]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[opiskelijavuodet_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[tilv_date] [date] NULL,
	[oppija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
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
	[koulk] [varchar](50) NULL,
	[tunn_oid] [varchar](max) NULL,
	[jarj_oid] [varchar](max) NULL,
	[toim_oid] [varchar](100) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[suorituksen_tyyppi] [int] NOT NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[opiskelijavuosi_lasna] [decimal](20, 10) NULL,
	[opiskelijavuosi_loma] [decimal](20, 10) NULL,
	[opiskelijavuosi_opva] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_loma] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_amm] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_lukio] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_sisaltyy_toiseen] [decimal](20, 10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
USE ANTERO