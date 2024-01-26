USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_kk_odw_analyysi]    Script Date: 24.1.2023 15:06:05 ******/
DROP TABLE IF EXISTS [dw].[f_haku_ja_valinta_kk_odw_analyysi]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_kk_odw_analyysi]    Script Date: 24.1.2023 15:06:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_kk_odw_analyysi](
	[HenkiloOID] [varchar](255) NULL,
	[HakemusOid] [varchar](255) NULL,
	[HakukohdeOID] [varchar](255) NULL,
	[HakuOid] [varchar](255) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[sa_haku_ja_valinta_vuosikello_korkea_aste_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[Ensikertalainen] [int] NULL,
	[ToisenAsteenKoulutuksenSuoritusvuosi] [int] NULL,
	[HakutoiveNumero] [int] NULL,
	[valittu] [int] NOT NULL,
	[vastaanottanut_paikan] [int] NOT NULL,
	[HakuaikaAlku] [varchar](255) NULL,
	[HakuaikaLoppu] [varchar](255) NULL,
	[Hakukerta] [bigint] NULL,
	[aidostiEnsikertalainen] [int] NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]