USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_kk_odw_analyysi_yo_arvosanat]    Script Date: 25.1.2023 15:49:57 ******/
DROP TABLE IF EXISTS [dw].[f_haku_ja_valinta_kk_odw_analyysi_yo_arvosanat]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_kk_odw_analyysi_yo_arvosanat]    Script Date: 25.1.2023 15:49:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_kk_odw_analyysi_yo_arvosanat](
	[HenkiloOID] [varchar](255) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[HakutoiveNumero] [int] NULL,
	[Hakukerta] [int] NULL,
	[HakukohdeOID] [varchar](255) NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_organisaatioluokitus_id] [int] NULL,
	[valittu] [int] NOT NULL,
	[vastaanottanut_paikan] [int] NOT NULL,
	[yo_arvosanojen_keskiarvo] [float] NULL,
	[d_ytl_aine_id] [int] NULL,
	[d_ytl_aine_laajuus_id] [int] NULL,
	[yo_aineen_arvosana] [int] NULL,
	[valittu_haussa] [int] NULL,
	[vastaanottanut_paikan_haussa] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]


