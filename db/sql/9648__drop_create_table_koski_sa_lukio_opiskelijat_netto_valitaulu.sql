USE [Koski_SA]
GO

/****** Object:  Table [dbo].[lukio_opiskelijat_netto_valitaulu]    Script Date: 22.2.2024 16:09:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lukio_opiskelijat_netto_valitaulu]') AND type in (N'U'))
DROP TABLE [dbo].[lukio_opiskelijat_netto_valitaulu]
GO

/****** Object:  Table [dbo].[lukio_opiskelijat_netto_valitaulu]    Script Date: 22.2.2024 16:09:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[lukio_opiskelijat_netto_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](2) NULL,
	[ika] [varchar](3) NULL,
	[kansalaisuus] [varchar](25) NULL,
	[majoitus] [int] NULL,
	[tavoitetutkinto] [varchar](100) NULL,
	[oppimaara] [varchar](100) NULL,
	[koulutus] [varchar](100) NULL,
	[jarj_tavoitetutkinto] [int] NULL,
	[jarj_koulutus] [int] NULL,
	[suorituskieli_koodiarvo] [char](2) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[oppivelvollinen] [int] NULL,
	[ka] [numeric](25, 14) NULL
) ON [PRIMARY]
GO

USE [ANTERO]