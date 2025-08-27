USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_arvo_yo_uraseuranta_taustatiedot]    Script Date: 24.2.2025 12.18.14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_yo_uraseuranta_taustatiedot]') AND type in (N'U'))
DROP TABLE [sa].[sa_arvo_yo_uraseuranta_taustatiedot]
GO

/****** Object:  Table [sa].[sa_arvo_yo_uraseuranta_taustatiedot]    Script Date: 24.2.2025 12.18.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_yo_uraseuranta_taustatiedot](
	[tunnus] [varchar](100) NULL,
	[ika_valmistuessa] [varchar](100) NULL,
	[sukupuoli] [varchar](100) NULL,
	[aidinkieli] [varchar](100) NULL,
	[kansalaisuus] [varchar](100) NULL,
	[asuinkunta_koodi] [varchar](100) NULL,
	[paaaine] [varchar](300) NULL,
	[arvosana] [varchar](100) NULL,
	[asteikko] [varchar](100) NULL,
	[valintavuosi] [datetime] NULL,
	[lasnaolo_lukukausia] [varchar](100) NULL,
	[kirjoilla_olo_kuukausia] [varchar](100) NULL,
	[tutkinto_koulutuskoodi] [varchar](100) NULL,
	[koulutusalakoodi] [varchar](100) NULL,
	[koulutustyyppi] [varchar](100) NULL,
	[opiskelupaikkakunta_koodi] [varchar](100) NULL,
	[rahoituslahde] [varchar](100) NULL,
	[Gen_vastaaja_id] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]