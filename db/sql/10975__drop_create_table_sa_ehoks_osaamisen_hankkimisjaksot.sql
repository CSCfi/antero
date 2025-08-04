USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_ehoks_osaamisen_hankkimisjaksot]    Script Date: 30.7.2025 11.33.29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ehoks_osaamisen_hankkimisjaksot]') AND type in (N'U'))
DROP TABLE [sa].[sa_ehoks_osaamisen_hankkimisjaksot]
GO

/****** Object:  Table [sa].[sa_ehoks_osaamisen_hankkimisjaksot]    Script Date: 30.7.2025 11.33.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ehoks_osaamisen_hankkimisjaksot](
	[id] [int] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[sopimusmuoto] [varchar](100) NULL,
	[tutkinnon_osa_koodi] [varchar](100) NULL,
	[ytunnus] [varchar](100) NULL,
	[paivat_kaikki] [int] NULL,
	[paivat_tyopaikka] [int] NULL,
	[sopimusten_lkm_opiskeluoikeus_yritys] [int] NULL
) ON [PRIMARY]
GO


