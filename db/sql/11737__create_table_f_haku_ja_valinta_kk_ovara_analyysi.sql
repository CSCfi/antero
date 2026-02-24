USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_kk_ovara_analyysi]    Script Date: 4.2.2026 10.52.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_kk_odw_analyysi]') AND type in (N'U'))
DROP TABLE [dw].[f_haku_ja_valinta_kk_odw_analyysi]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_kk_ovara_analyysi]') AND type in (N'U'))
DROP TABLE [dw].[f_haku_ja_valinta_kk_ovara_analyysi]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_kk_ovara_analyysi]    Script Date: 4.2.2026 10.52.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_kk_ovara_analyysi](
	[master_oid] [varchar](100) NULL,
	[hakemus_oid] [varchar](100) NULL,
	[hakukohde_oid] [varchar](255) NULL,
	[haku_oid] [nvarchar](255) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[sa_haku_ja_valinta_vuosikello_korkea_aste_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[ensikertalainen] [int] NULL,
	[aidosti_ensikertainen] [int] NULL,
	[toisen_asteen_koulutuksen_suoritusvuosi] [int] NULL,
	[hakutoive] [int] NULL,
	[valittu] [int] NULL,
	[vastaanottanut_paikan] [int] NULL,
	[Hakukerta] [bigint] NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]