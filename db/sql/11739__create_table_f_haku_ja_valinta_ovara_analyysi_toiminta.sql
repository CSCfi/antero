USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_ovara_analyysi_toiminta]    Script Date: 4.2.2026 10.55.50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_ovara_analyysi_toiminta]') AND type in (N'U'))
DROP TABLE [dw].[f_haku_ja_valinta_ovara_analyysi_toiminta]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_odw_analyysi_toiminta]') AND type in (N'U'))
DROP TABLE [dw].[f_haku_ja_valinta_odw_analyysi_toiminta]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_ovara_analyysi_toiminta]    Script Date: 4.2.2026 10.55.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_ovara_analyysi_toiminta](
	[master_oid] [varchar](100) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[Hakukerta] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[aidosti_ensikertainen] [int] NULL,
	[valittu] [int] NULL,
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
	[vastaanottanut_paikan_ero] [int] NULL,
	[loadtime] [date] NULL
) ON [PRIMARY]