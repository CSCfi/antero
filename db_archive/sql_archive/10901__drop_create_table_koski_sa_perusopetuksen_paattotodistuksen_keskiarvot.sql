USE [Koski_SA]
GO

/****** Object:  Table [sa].[perusopetuksen_paattotodistuksen_keskiarvot]    Script Date: 29.7.2025 15.37.20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[perusopetuksen_paattotodistuksen_keskiarvot]') AND type in (N'U'))
DROP TABLE [sa].[perusopetuksen_paattotodistuksen_keskiarvot]
GO

/****** Object:  Table [sa].[perusopetuksen_paattotodistuksen_keskiarvot]    Script Date: 29.7.2025 15.37.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[perusopetuksen_paattotodistuksen_keskiarvot](
	[master_oid] [varchar](50) NULL,
	[vahvistus_paiva] [datetime] NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[opiskelee_toiminta_alueittain] [int] NULL,
	[oppiaineita_yksilollistetty_lkm] [int] NULL,
	[keskiarvo_lahde] [varchar](5) NOT NULL,
	[keskiarvo] [decimal](10, 5) NULL,
	[keskiarvo_lukuaineet] [decimal](10, 5) NULL,
	[keskiarvo_mukautettu] [decimal](10, 5) NULL,
	[keskiarvo_lukuaineet_mukautettu] [decimal](10, 5) NULL,
	[keskiarvo_kategoria] [int] NULL,
	[keskiarvo_kategoria_lukuaineet] [int] NULL,
	[keskiarvo_kategoria_mukautettu] [int] NULL,
	[keskiarvo_kategoria_lukuaineet_mukautettu] [int] NULL,
	[oppiaineita_yksilollistetty_lukuaineet_ka] [int] NULL,
	[oppiaineita_lukuaineet_ka] [int] NULL,
	[yksilollistaminen] [varchar](50) NULL,
	[rnk] [bigint] NULL,
	[rnk_suorituksen_tyyppi] [bigint] NULL
) ON [PRIMARY]
GO


