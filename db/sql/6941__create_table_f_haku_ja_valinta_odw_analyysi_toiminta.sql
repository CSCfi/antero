USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_odw_analyysi_toiminta]    Script Date: 24.1.2023 15:08:34 ******/
DROP TABLE IF EXISTS [dw].[f_haku_ja_valinta_odw_analyysi_toiminta]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_odw_analyysi_toiminta]    Script Date: 24.1.2023 15:08:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_odw_analyysi_toiminta](
	[HenkiloOID] [varchar](255) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[Hakukerta] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[aidostiEnsikertalainen] [int] NOT NULL,
	[valittu] [int] NOT NULL,
	[valittu_hakukerralla] [int] NULL,
	[vastaanottanut_paikan_hakukerralla] [int] NULL,
	[hakenut_uudestaan] [int] NULL,
	[valittu_myohemmassa_haussa] [int] NULL,
	[vastaanottanut_paikan_myohemmassa_haussa] [int] NULL,
	[d_koulutusluokitus_vastaanottanut_paikan_id] [int] NULL,
	[d_organisaatioluokitus_vastaanottanut_paikan_id] [bigint] NULL,
	[koulutuksen_alkamisvuosi_vastaanottanut_paikan] [int] NULL,
	[hakenut_uudestaan_ero] [int] NULL,
	[valittu_ero] [int] NULL,
	[vastaanottanut_paikan_ero] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]