USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_ehoks_osaamisen_hankkimisjaksot_netto]    Script Date: 11.1.2023 12:14:03 ******/
DROP TABLE IF EXISTS [sa].[sa_ehoks_osaamisen_hankkimisjaksot_netto]
GO
/****** Object:  Table [sa].[sa_ehoks_osaamisen_hankkimisjaksot_netto]    Script Date: 11.1.2023 12:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ehoks_osaamisen_hankkimisjaksot_netto]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_ehoks_osaamisen_hankkimisjaksot_netto](
	[vuosi] [int] NOT NULL,
	[ehoks_id] [int] NOT NULL,
	[opiskeluoikeus_oid] [varchar](100) NOT NULL,
	[neljannes] [nvarchar](1) NOT NULL,
	[neljannes_paivat] [numeric](17, 6) NOT NULL,
	[osaamisen_hankkimistapa_koodi] [varchar](100) NOT NULL,
	[tyopaikan_ytunnus] [varchar](9) NULL,
	[paivat] [decimal](18, 6) NOT NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
END