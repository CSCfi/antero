USE [AnteroAPI]
GO

/****** Object:  Table [api].[perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet]    Script Date: 17.11.2025 12.56.52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[api].[perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet]') AND type in (N'U'))
DROP TABLE [api].[perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet]
GO

/****** Object:  Table [api].[perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet]    Script Date: 17.11.2025 12.56.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet](
	[defaultorder] [bigint] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [varchar](255) NULL,
	[haku] [nvarchar](500) NULL,
	[hakukohde] [varchar](max) NULL,
	[hakutapa] [nvarchar](255) NULL,
	[koulutusaste_taso_1] [nvarchar](300) NULL,
	[koulutusaste_taso_2] [nvarchar](300) NULL,
	[koulutusala_taso_1] [nvarchar](300) NULL,
	[koulutusala_taso_2] [nvarchar](300) NULL,
	[koulutusala_taso_3] [nvarchar](300) NULL,
	[tutkinto_hakukohde] [nvarchar](300) NULL,
	[koulutuksen_kieli] [nvarchar](100) NULL,
	[maakunta_hakukohde] [nvarchar](200) NULL,
	[kunta_hakukohde] [nvarchar](200) NULL,
	[koulutuksen_jarjestaja] [nvarchar](500) NULL,
	[oppilaitos] [nvarchar](500) NULL,
	[toimipiste] [nvarchar](500) NULL,
	[koodit_tutkinto_hakukohde] [varchar](6) NULL,
	[koodit_kunta_hakukohde] [varchar](3) NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](100) NULL,
	[koodit_oppilaitos] [varchar](100) NULL,
	[koodit_hakukohde] [varchar] (300) NULL,
	[aloituspaikat_lkm] [int] NULL,
	[kaikki_hakijat_lkm] [int] NULL,
	[ensisijaiset_hakijat_lkm] [int] NULL,
	[valitut_lkm] [int] NULL,
	[paikan_vastaanottaneet_lkm] [int] NULL,
	[aloittaneet_lkm] [int] NULL,
	[tietojoukko_paivitetty_pvm] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

