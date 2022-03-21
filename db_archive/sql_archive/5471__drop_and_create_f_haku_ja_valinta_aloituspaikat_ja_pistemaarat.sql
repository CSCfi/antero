USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]    Script Date: 21.1.2022 16:33:11 ******/
DROP TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]    Script Date: 21.1.2022 16:33:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat](
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_haku_id] [int] NULL,
	[d_hakuaika_id] [int] NULL,
	[d_hakuaika_kouta_id] [int] NULL,
	[d_hakukohde_id] [int] NULL,
	[d_organisaatio_koulutuksen_jarjestaja_id] [int] NULL,
	[d_organisaatio_oppilaitos_id] [int] NULL,
	[d_organisaatio_toimipiste_id] [int] NULL,
	[d_alueluokitus_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_hakukohde_id] [int] NULL,
	[d_koulutustyyppi_id] [int] NULL,
	[d_kieli_koulutus_id] [int] NULL,
	[d_opintojen_laajuus_id] [int] NULL,
	[d_pohjakoulutusvaatimus_id] [int] NULL,
	[aloituspaikat] [int] NULL,
	[valintojen_aloituspaikat] [int] NULL,
	[ensikertalaisten_aloituspaikat] [int] NULL,
	[alin_laskettuvalintapistemaara] [decimal](18, 2) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](59) NULL,
	[username] [varchar](50) NULL,
	[d_tutkinnon_aloitussykli_kk_id] [int] NULL,
	[d_tutkinnon_taso_kk_id] [int] NULL
) ON [PRIMARY]

GO




USE [ANTERO]