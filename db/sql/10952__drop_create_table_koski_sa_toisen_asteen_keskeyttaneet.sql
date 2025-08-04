USE [Koski_SA]
GO

/****** Object:  Table [dbo].[toisen_asteen_keskeyttaneet]    Script Date: 30.7.2025 10.11.22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toisen_asteen_keskeyttaneet]') AND type in (N'U'))
DROP TABLE [dbo].[toisen_asteen_keskeyttaneet]
GO

/****** Object:  Table [dbo].[toisen_asteen_keskeyttaneet]    Script Date: 30.7.2025 10.11.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[toisen_asteen_keskeyttaneet](
	[master_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[viimeinen_lasna] [datetime] NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
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
	[jatkaa_oppimaara] [int] NULL,
	[vaihto_oppimaara] [int] NULL,
	[jatkaa_aikuistenops] [int] NULL,
	[jatkaa_nuortenops] [int] NULL,
	[jatkaa_lukioaine] [int] NULL,
	[jatkaa_lukio_ulkomainen] [int] NULL,
	[keskeyttaminen_vaiheittainen_koodi] [int] NULL
) ON [PRIMARY]
GO


