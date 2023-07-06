USE [Koski_SA]
GO

/****** Object:  Table [dbo].[amm_opiskelijat_paivittain]    Script Date: 6.7.2023 13:46:52 ******/
DROP TABLE IF EXISTS [dbo].[amm_opiskelijat_paivittain]
GO

/****** Object:  Table [dbo].[amm_opiskelijat_paivittain]    Script Date: 6.7.2023 13:46:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[amm_opiskelijat_paivittain](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[paiva] [int] NULL,
	[oo_aloitusvuosi] [int] NULL,
	[oo_aloituskuukausi] [int] NULL,
	[oo_alkanut_kuussa] [int] NULL,
	[oo_alkanut_aikaisintaan] [int] NULL,
	[ika_ryhma] [varchar](3) NULL,
	[kansalaisuus] [varchar](25) NULL,
	[suorituksen_tyyppi] [int] NULL,
	[tutkintotyyppi] [varchar](500) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[lkm] [int] NULL,
	[pv_kk] [int] NULL
) ON [PRIMARY]

GO


