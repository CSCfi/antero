USE [ANTERO]
GO

/****** Object:  Table [dw].[f_oiva_luvat_lukio]    Script Date: 2.2.2024 11:03:29 ******/
DROP TABLE IF EXISTS [dw].[f_oiva_luvat_lukio]
GO

/****** Object:  Table [dw].[f_oiva_luvat_lukio]    Script Date: 2.2.2024 11:03:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_oiva_luvat_lukio](
	[tarkasteluvuosi] [int] NULL,
	[d_kalenteri_luvan_alku_id] [bigint] NULL,
	[d_kalenteri_luvan_loppu_id] [bigint] NULL,
	[tarkastelukuukausi] [int] NOT NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_alueluokitus_toiminta_alue_kunta_id] [int] NULL,
	[d_alueluokitus_toiminta_alue_maakunta_id] [int] NULL,
	[d_muutkoulutuksenjarjestamiseenliittyvatehdot_id] [int] NULL,
	[d_kieli_id] [bigint] NULL,
	[d_erityinen_koulutustehtava_id] [int] NULL,
	[d_opetuksen_jarjestamismuoto_id] [int] NULL
) ON [PRIMARY]

GO


