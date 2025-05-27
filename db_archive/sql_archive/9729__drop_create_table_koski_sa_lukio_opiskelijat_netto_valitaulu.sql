USE [Koski_SA]
GO

/****** Object:  Table [dbo].[lukio_opiskelijat_netto_valitaulu]    Script Date: 4.4.2024 11:40:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lukio_opiskelijat_netto_valitaulu]') AND type in (N'U'))
DROP TABLE [dbo].[lukio_opiskelijat_netto_valitaulu]
GO

/****** Object:  Table [dbo].[lukio_opiskelijat_netto_valitaulu]    Script Date: 4.4.2024 11:40:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[lukio_opiskelijat_netto_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[oppivelvollinen] [int] NOT NULL,
	[majoitus] [int] NOT NULL,
	[tavoitetutkinto] [nvarchar](255) NULL,
	[oppimaara] [varchar](255) NOT NULL,
	[koulutus] [nvarchar](255) NULL,
	[jarj_tavoitetutkinto] [int] NOT NULL,
	[jarj_koulutus] [int] NOT NULL,
	[suorituskieli_koodiarvo] [nvarchar](255) NULL,
	[toimipiste_oid] [varchar](255) NULL,
	[oppilaitos_oid] [varchar](255) NULL,
	[koulutustoimija_oid] [varchar](255) NULL,
	[ka] [numeric](25, 14) NULL
) ON [PRIMARY]
GO


