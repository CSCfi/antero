USE [ANTERO]
GO

/****** Object:  Table [dw].[f_oiva_luvat_vst]    Script Date: 2.9.2024 10:38:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_oiva_luvat_vst]') AND type in (N'U'))
DROP TABLE [dw].[f_oiva_luvat_vst]
GO

/****** Object:  Table [dw].[f_oiva_luvat_vst]    Script Date: 2.9.2024 10:38:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_oiva_luvat_vst](
	[tarkasteluvuosi] [int] NULL,
	[d_kalenteri_luvan_alku_id] [bigint] NULL,
	[d_kalenteri_luvan_loppu_id] [bigint] NULL,
	[tarkastelukuukausi] [int] NOT NULL,
	[d_organisaatioluokitus_jarjestaja_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_kieli_id] [bigint] NULL,
	[d_vst_tyypit_id] [int] NULL,
	[d_vst_etaopetus_id] [int] NULL,
	[d_vst_oppilaitoksen_alueellisuus_ja_valtakunnallisuus_id] [int] NULL,
	[d_vst_erityinen_koulutustehtava_id] [int] NULL,
	[vsterityinenkoulutustehtava_selite] [nvarchar](200) NULL,
	[vstetaopetus_selite] [nvarchar](200) NULL,
	[vstoppilaitoksenalueellisuusjavaltakunnallisuus_selite] [nvarchar](200) NULL,
	[vsttyypit_selite] [nvarchar](200) NULL
) ON [PRIMARY]