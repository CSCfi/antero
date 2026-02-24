USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat]    Script Date: 4.2.2026 10.54.37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat]') AND type in (N'U'))
DROP TABLE [dw].[f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_kk_odw_analyysi_yo_arvosanat]') AND type in (N'U'))
DROP TABLE [dw].[f_haku_ja_valinta_kk_odw_analyysi_yo_arvosanat]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat]    Script Date: 4.2.2026 10.54.37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat](
	[master_oid] [varchar](100) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[hakutoive] [int] NULL,
	[hakukerta] [bigint] NULL,
	[hakukohde_oid] [varchar](255) NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[valittu] [int] NULL,
	[vastaanottanut_paikan] [int] NULL,
	[yo_arvosanojen_keskiarvo] [float] NULL,
	[d_ytl_aine_id] [int] NULL,
	[d_ytl_aine_laajuus_id] [int] NULL,
	[yo_aineen_arvosana] [int] NULL,
	[valittu_haussa] [int] NULL,
	[vastaanottanut_paikan_haussa] [int] NULL,
	[loadtime] [date] NULL
) ON [PRIMARY]