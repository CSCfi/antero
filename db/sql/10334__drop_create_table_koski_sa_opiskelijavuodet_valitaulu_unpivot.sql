USE [Koski_SA]
GO

/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 29.10.2024 14:37:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijavuodet_valitaulu_unpivot]') AND type in (N'U'))
DROP TABLE [dbo].[opiskelijavuodet_valitaulu_unpivot]
GO

/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 29.10.2024 14:37:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[opiskelijavuodet_valitaulu_unpivot](
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
	[koulk] [varchar](50) NULL,
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
	[suorituksen_tyyppi] [int] NOT NULL,
	[suorituksen_kieli] [varchar](50) NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[alkamispaiva] [date] NULL,
	[tutkosaa_pienempi_tt] [char](2) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[hylkaamisen_peruste] [int] NULL,
	[hyvaksytaan] [int] NULL,
	[op_vuodet] [decimal](30, 20) NULL
) ON [PRIMARY]
GO
