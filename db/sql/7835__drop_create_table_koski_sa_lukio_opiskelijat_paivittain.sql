USE [Koski_SA]
GO

/****** Object:  Table [dbo].[lukio_opiskelijat_paivittain]    Script Date: 6.7.2023 13:47:35 ******/
DROP TABLE IF EXISTS [dbo].[lukio_opiskelijat_paivittain]
GO

/****** Object:  Table [dbo].[lukio_opiskelijat_paivittain]    Script Date: 6.7.2023 13:47:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[lukio_opiskelijat_paivittain](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[paiva] [int] NULL,
	[oo_aloitusvuosi] [int] NULL,
	[oo_aloituskuukausi] [int] NULL,
	[oo_alkanut_kuussa] [int] NULL,
	[oo_alkanut_aikaisintaan] [int] NULL,
	[ika_ryhma] [varchar](3) NULL,
	[tavoitetutkinto] [varchar](100) NULL,
	[oppimaara] [varchar](100) NULL,
	[koulutus] [varchar](100) NULL,
	[kansalaisuus] [varchar](25) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[lkm] [int] NULL,
	[pv_kk] [int] NULL
) ON [PRIMARY]

GO


