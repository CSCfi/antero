USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet]    Script Date: 22.11.2024 10:04:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet]') AND type in (N'U'))
DROP TABLE [dw].[api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet]
GO

/****** Object:  Table [dw].[api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet]    Script Date: 22.11.2024 10:04:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet](
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [varchar](255) NULL,
	[hakukohde] [varchar](max) NULL,
	[hakutapa] [varchar](50) NULL,
	[hakutyyppi] [nvarchar](255) NULL,
	[valintatapajonon_tyyppi] [nvarchar](100) NULL,
	[koulutusaste_taso_1] [nvarchar](200) NULL,
	[koulutusaste_taso_2] [nvarchar](200) NULL,
	[koulutusala_taso_1] [nvarchar](200) NULL,
	[koulutusala_taso_2] [nvarchar](200) NULL,
	[koulutusala_taso_3] [nvarchar](200) NULL,
	[okm_ohjauksen_ala] [nvarchar](200) NULL,
	[koulutusala_2002] [nvarchar](200) NULL,
	[opintoala_2002] [nvarchar](200) NULL,
	[paaasiallinen_tutkinto_hakukohde] [nvarchar](200) NULL,
	[koulutuksen_kieli] [nvarchar](100) NULL,
	[maakunta_hakukohde] [nvarchar](200) NULL,
	[kunta_hakukohde] [nvarchar](200) NULL,
	[sektori] [nvarchar](60) NULL,
	[tutkinnon_aloitussykli] [nvarchar](100) NULL,
	[korkeakoulu] [nvarchar](500) NULL,
	[toimipiste] [nvarchar](500) NULL,
	[koodit_paaasiallinen_tutkinto_hakukohde] [varchar](6) NULL,
	[koodit_korkeakoulu] [varchar](20) NULL,
	[koodit_kunta_hakukohde] [varchar](20) NULL,
	[koodit_hakukohde] [varchar](255) NULL,
	[aloituspaikat_lkm] [int] NULL,
	[kaikki_hakijat_lkm] [int] NULL,
	[ensisijaiset_hakijat_lkm] [int] NULL,
	[valitut_lkm] [int] NULL,
	[paikan_vastaanottaneet_lkm] [int] NULL,
	[aloittaneet_lkm] [int] NULL,
	[alin_hyvaksytty_pistemaara] [decimal](12, 2) NULL,
	[ylin_hyvaksytty_pistemaara] [decimal](12, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

