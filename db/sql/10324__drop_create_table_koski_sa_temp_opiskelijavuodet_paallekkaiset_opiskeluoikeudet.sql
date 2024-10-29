USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 29.10.2024 14:00:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]
GO

/****** Object:  Table [sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 29.10.2024 14:00:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet](
	[alkupvm] [date] NULL,
	[oppija_oid] [varchar](50) NULL,
	[opiskeluoikeus_oid] [varchar](50) NOT NULL,
	[paallekkainen_opiskeluoikeus_oid] [varchar](100) NULL,
	[aiempi_koulutusmuoto] [varchar](100) NULL,
	[aiempi_tuva_jarjestamislupa] [varchar](100) NULL,
	[nyk_tila] [varchar](50) NULL,
	[alku] [date] NULL,
	[alku_tod] [date] NULL,
	[loppu] [date] NULL,
	[ed_paattyi] [date] NULL,
	[valiaikainen_keskeytys] [int] NOT NULL,
	[valiaikainen_keskeytys_alkanut] [datetime] NULL,
	[ed_valmistunut] [int] NOT NULL,
	[ed_paattynyt] [int] NULL,
	[sisaltyy_opiskeluoikeuteen] [int] NOT NULL,
	[rnk] [bigint] NULL
) ON [PRIMARY]
GO


