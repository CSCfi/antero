USE [ANTERO]
GO

/****** Object:  Table [dw].[f_oiva_luvat_lukio]    Script Date: 27.8.2024 9:20:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_oiva_luvat_lukio]') AND type in (N'U'))
DROP TABLE [dw].[f_oiva_luvat_lukio]
GO

/****** Object:  Table [dw].[f_oiva_luvat_lukio]    Script Date: 27.8.2024 9:20:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_oiva_luvat_lukio](
	[d_kalenteri_tarkastelupaiva] [bigint] NULL,
	[d_kalenteri_luvan_alku_id] [bigint] NULL,
	[d_kalenteri_luvan_loppu_id] [bigint] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_alueluokitus_toiminta_alue_kunta_id] [int] NULL,
	[d_alueluokitus_toiminta_alue_maakunta_id] [int] NULL,
	[d_muutkoulutuksenjarjestamiseenliittyvatehdot_id] [int] NULL,
	[d_kieli_id] [bigint] NULL,
	[d_erityinen_koulutustehtava_id] [int] NULL,
	[d_opetuksen_jarjestamismuoto_id] [int] NULL
) ON [PRIMARY]
GO
